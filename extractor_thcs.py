"""Bulk extractor for Toan THCS (grades 6-8) exam PDFs.

Each PDF is rendered to page images and sent to the vision model. The structured result
is written to <out_dir>/<grade>/<stem>.json so the run is resumable and decoupled from the DB.
Use ingest_thcs.py afterwards to import the JSON files into exam_bank.db.
"""
import argparse
import base64
import hashlib
import json
import os
import re
import sys
import threading
import time
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import Any, Dict, List, Optional

import pymupdf

from extractor import parse_latex_json, DEFAULT_API_URL, DEFAULT_API_KEY

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
FIGURES_DIR = os.path.join(BASE_DIR, "static", "figures")
os.makedirs(FIGURES_DIR, exist_ok=True)

DEFAULT_MODEL = "gemini-3.8-flash-medium"
FALLBACK_MODELS = ["gemini-3.8-flash-high", "gemini-3-flash", "gemini-2.5-flash"]
MAX_PAGES = 10
PAGE_DPI = 105

TERM_LABELS = {
    "giua_hk1": "Giữa học kì 1",
    "cuoi_hk1": "Cuối học kì 1",
    "giua_hk2": "Giữa học kì 2",
    "cuoi_hk2": "Cuối học kì 2",
}

PROMPT = r"""Bạn là hệ thống AI chuyên bóc tách Ngân hàng đề thi TOÁN THCS (lớp {grade}, chương trình GDPT 2018) từ file PDF/ảnh scan.
Dưới đây là các trang của một tài liệu (đánh số trang từ 0). Tài liệu có thể gồm: đề thi, đáp án/hướng dẫn chấm, bảng ma trận - đặc tả, hoặc đề cương ôn tập.

Gợi ý từ tên file: kỳ thi = "{term_label}", năm học = "{year_hint}", tên file = "{filename}".

NHIỆM VỤ: trả về DUY NHẤT một JSON object hợp lệ theo mẫu:
{{
  "doc_type": "de_thi" | "de_cuong" | "khong_hop_le",
  "term": "giua_hk1" | "cuoi_hk1" | "giua_hk2" | "cuoi_hk2" | "khac",
  "school_name": "Tên trường / Phòng GD&ĐT ban hành (VD: THCS Ái Mộ - Hà Nội)",
  "exam_title": "Tên bài kiểm tra (VD: Đề kiểm tra Cuối học kì I Toán 6)",
  "academic_year": "VD: 2025 - 2026",
  "questions": [
    {{
      "qtype": "tn" | "tl",
      "qkind": "mcq" | "tf" | "short" | "essay",
      "slot": "TN" | "TL.1" | "TL.2" | "TL.3" | "TL.4" | "TL.5",
      "sub_topic": "Nhãn dạng toán ngắn gọn theo bài học (VD: Phép cộng số nguyên, Ước chung lớn nhất, Hằng đẳng thức, Định lí Thalès, Tam giác cân...)",
      "content": "Nội dung câu hỏi hoàn chỉnh.",
      "answer": "Đáp án ngắn (tn: A/B/C/D hoặc kết quả; tl: kết quả cuối cùng). Để chuỗi rỗng nếu không có.",
      "solution": "Lời giải / hướng dẫn chấm ngắn gọn. Để chuỗi rỗng nếu tài liệu không có đáp án.",
      "figure_page": số trang (từ 0) chứa hình vẽ của câu này hoặc null,
      "figure_box_2d": [ymin, xmin, ymax, xmax] chuẩn hóa 0-1000 bao quanh RIÊNG hình vẽ/biểu đồ (lấy cả nhãn trên hình, KHÔNG lấn vào chữ đề bài) hoặc null
    }}
  ]
}}

PHÂN LOẠI doc_type:
- "de_thi": có đề kiểm tra/khảo sát hoàn chỉnh. CHỈ lấy câu hỏi của ĐỀ THI THẬT (bỏ qua bảng ma trận, bảng đặc tả, hướng dẫn chấm chỉ dùng để lấy lời giải).
- "de_cuong": đề cương / tài liệu ôn tập gồm nhiều bài tập. Chọn tối đa 15 bài tập tiêu biểu, đa dạng dạng toán, có thể làm độc lập.
- "khong_hop_le": không có câu hỏi toán nào đọc được (chỉ có ma trận, trang trắng, quảng cáo...). Khi đó "questions" = [].

QUY TẮC GÁN "slot" cho từng câu:
- Câu trắc nghiệm (nhiều lựa chọn A/B/C/D, đúng-sai, trả lời ngắn): qtype="tn", slot="TN". qkind="mcq" cho nhiều lựa chọn, "tf" cho đúng/sai, "short" cho trả lời ngắn.
- Câu tự luận: qtype="tl", qkind="essay", và slot theo VAI TRÒ của bài trong đề:
  * "TL.1": tính toán / thực hiện phép tính / rút gọn / biến đổi biểu thức, phân tích đa thức.
  * "TL.2": tìm x / giải phương trình, bất phương trình, hệ phương trình, bài toán tìm số.
  * "TL.3": bài toán thực tế / toán có lời văn / thống kê - xác suất.
  * "TL.4": hình học (vẽ hình, chứng minh, tính độ dài, góc, diện tích).
  * "TL.5": vận dụng cao (bất đẳng thức, cực trị, chứng minh nâng cao).
  Mỗi ý nhỏ a), b), c) của cùng một bài PHẢI nằm trong cùng một câu (cùng slot), mỗi ý xuống dòng "\n".

QUY TẮC "content":
1. KHÔNG ghi nhãn đầu câu như "Câu 1.", "Bài 2 (1,5 điểm):", "Câu 3 (0,5đ)". Giữ nguyên các ý a), b), c).
2. Câu trắc nghiệm mcq: viết đề bài, rồi MỖI phương án xuống dòng riêng: "A. ...\nB. ...\nC. ...\nD. ..." (giữ chữ cái A/B/C/D).
3. Toàn bộ công thức toán dùng LaTeX trong $...$ (phân số $\frac{{a}}{{b}}$, căn $\sqrt{{x}}$, lũy thừa $x^2$, góc $\widehat{{ABC}}$, tam giác $\triangle ABC$, tập số $\mathbb{{N}}, \mathbb{{Z}}$, $\in$, $\notin$, $\le$, $\ge$, $\ne$, $\cdot$, $\parallel$, $\perp$...). Các khoảng số ghép nhóm như [40; 50) viết chữ thường, KHÔNG bọc trong $.
4. Số đếm và đơn vị trong câu văn (50 học sinh, 12 cm, 3 500 000 đồng) viết chữ thường, KHÔNG bọc trong $.
5. Bảng số liệu: chuyển thành một thẻ HTML duy nhất trên 1 dòng: <table border="1"><tr><th>..</th>..</tr><tr><td>..</td>..</tr></table> (không xuống dòng trong thẻ), figure_box_2d = null.
6. Nếu câu có hình vẽ/biểu đồ: chèn thẻ {{{{FIGURE}}}} trên một dòng riêng ngay tại vị trí hình (sau câu dẫn, trước ý a) hoặc trước các phương án), đồng thời điền figure_page và figure_box_2d. Câu hình học tự luận chỉ yêu cầu "vẽ hình" mà đề không có sẵn hình thì KHÔNG cần figure.
7. Chép ĐÚNG NGUYÊN VĂN, không tự bịa số liệu. Nếu một câu bị mờ/cắt không đọc được đầy đủ thì BỎ QUA câu đó.
8. Đáp án/lời giải chỉ lấy từ phần đáp án có trong tài liệu; nếu tài liệu không có đáp án thì để "answer" và "solution" là chuỗi rỗng (KHÔNG tự giải).

Chỉ trả về JSON, không giải thích."""


def sha1_file(path: str) -> str:
    h = hashlib.sha1()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def guess_term(filename: str) -> str:
    low = filename.lower()
    if re.search(r"giua-(hoc-)?k(i|y)-?(1|i)\b|giua-(hoc-)?k(i|y)-1", low):
        return "giua_hk1"
    if re.search(r"giua-(hoc-)?k(i|y)-?2|giua-(hoc-)?k(i|y)-ii", low):
        return "giua_hk2"
    if re.search(r"cuoi-(hoc-)?k(i|y)-?1|hk1|hoc-k(i|y)-1|k(i|y)-1", low):
        return "cuoi_hk1"
    if re.search(r"cuoi-(hoc-)?k(i|y)-?2|hk2|hoc-k(i|y)-2|k(i|y)-2", low):
        return "cuoi_hk2"
    return "khac"


def guess_year(filename: str) -> str:
    m = re.search(r"(20\d{2})-(20\d{2})", filename)
    return f"{m.group(1)} - {m.group(2)}" if m else ""


def call_model(content_parts: List[Dict[str, Any]], model: str, api_url: str, api_key: str) -> Dict[str, Any]:
    models = [model] + [m for m in FALLBACK_MODELS if m != model]
    last_err: Optional[Exception] = None
    for m in models:
        payload = {
            "model": m,
            "messages": [{"role": "user", "content": content_parts}],
            "temperature": 0.1,
        }
        req = urllib.request.Request(
            api_url,
            data=json.dumps(payload).encode("utf-8"),
            headers={"Content-Type": "application/json", "Authorization": f"Bearer {api_key}"},
        )
        for attempt in range(3):
            try:
                with urllib.request.urlopen(req, timeout=240) as resp:
                    data = json.loads(resp.read().decode("utf-8"))
                raw = data["choices"][0]["message"]["content"]
                return {"model": m, "parsed": parse_latex_json(raw)}
            except urllib.error.HTTPError as e:
                last_err = e
                if e.code in (401, 403):
                    # Model/account không khả dụng: chuyển model khác, không retry.
                    break
                time.sleep(4 + attempt * 6)
            except Exception as e:  # noqa: BLE001
                last_err = e
                time.sleep(3 + attempt * 4)
    raise RuntimeError(f"AI endpoint failed: {last_err}")


def crop_figure(doc: pymupdf.Document, page_idx: int, box: List[float], out_name: str, dpi: int = 170, pad: int = 4) -> Optional[str]:
    if page_idx is None or page_idx < 0 or page_idx >= len(doc) or not box or len(box) != 4:
        return None
    ymin, xmin, ymax, xmax = [float(v) for v in box]
    ymin, xmin = max(0, ymin - pad), max(0, xmin - pad)
    ymax, xmax = min(1000, ymax + pad), min(1000, xmax + pad)
    if ymax - ymin < 25 or xmax - xmin < 25:
        return None
    page = doc[page_idx]
    r = page.rect
    clip = pymupdf.Rect(
        r.x0 + xmin / 1000 * r.width, r.y0 + ymin / 1000 * r.height,
        r.x0 + xmax / 1000 * r.width, r.y0 + ymax / 1000 * r.height,
    )
    pix = page.get_pixmap(dpi=dpi, clip=clip)
    pix.save(os.path.join(FIGURES_DIR, out_name))
    return f"/static/figures/{out_name}"


def clean_content(text: str) -> str:
    text = (text or "").strip()
    text = re.sub(
        r"<table[\s\S]*?</table>",
        lambda m: re.sub(r"\s*\n\s*", " ", m.group(0)),
        text,
        flags=re.IGNORECASE,
    )
    text = re.sub(r"\$\s*(\[[^\$\]]+?\))\s*\$", r"\1", text)
    text = re.sub(r"^\s*(Câu|Bài)\s*\d+[\.\:\)]?\s*(\([^)]*\))?\s*[\.\:]?\s*", "", text)
    return text.strip()


VALID_SLOTS = {"TN", "TL.1", "TL.2", "TL.3", "TL.4", "TL.5"}


def extract_one(pdf_path: str, grade: str, out_dir: str, model: str, api_url: str, api_key: str) -> Dict[str, Any]:
    filename = os.path.basename(pdf_path)
    stem = os.path.splitext(filename)[0]
    safe_stem = re.sub(r"[^a-zA-Z0-9_-]", "_", stem)[:48]
    term_hint = guess_term(filename)
    year_hint = guess_year(filename)

    doc = pymupdf.open(pdf_path)
    total_pages = len(doc)
    n_pages = min(total_pages, MAX_PAGES)
    parts: List[Dict[str, Any]] = [
        {
            "type": "text",
            "text": PROMPT.format(
                grade=grade,
                term_label=TERM_LABELS.get(term_hint, "chưa rõ"),
                year_hint=year_hint or "chưa rõ",
                filename=filename,
            ),
        }
    ]
    for p in range(n_pages):
        pix = doc[p].get_pixmap(dpi=PAGE_DPI)
        b64 = base64.b64encode(pix.tobytes("jpeg", jpg_quality=80)).decode("utf-8")
        parts.append({"type": "text", "text": f"--- TRANG {p} ---"})
        parts.append({"type": "image_url", "image_url": {"url": f"data:image/jpeg;base64,{b64}"}})

    t0 = time.time()
    res = call_model(parts, model, api_url, api_key)
    parsed = res["parsed"]

    questions: List[Dict[str, Any]] = []
    seen_content = set()
    for idx, q in enumerate(parsed.get("questions") or []):
        content = clean_content(q.get("content", ""))
        slot = str(q.get("slot", "")).strip()
        if slot not in VALID_SLOTS or len(content) < 12:
            continue
        key = re.sub(r"\W+", "", content.lower())[:120]
        if key in seen_content:
            continue
        seen_content.add(key)
        fig_url = None
        fp, fb = q.get("figure_page"), q.get("figure_box_2d")
        if fp is not None and isinstance(fb, list) and len(fb) == 4:
            try:
                name = f"thcs{grade}_{safe_stem}_{slot.replace('.', '_')}_{idx}.png"
                fig_url = crop_figure(doc, int(fp), fb, name)
            except Exception:  # noqa: BLE001
                fig_url = None
        if "{{FIGURE}}" in content and not fig_url:
            content = re.sub(r"\n?\{\{FIGURE\}\}\n?", "\n", content).strip()
        questions.append(
            {
                "qtype": "tn" if slot == "TN" else "tl",
                "qkind": q.get("qkind") or ("mcq" if slot == "TN" else "essay"),
                "slot": slot,
                "sub_topic": (q.get("sub_topic") or "").strip()[:80],
                "content": content,
                "answer": (q.get("answer") or "").strip(),
                "solution": (q.get("solution") or "").strip(),
                "figure_path": fig_url,
            }
        )
    doc.close()

    term = parsed.get("term") if parsed.get("term") in TERM_LABELS else term_hint
    if term_hint in TERM_LABELS:
        term = term_hint
    result = {
        "source_file": filename,
        "grade": int(grade),
        "doc_type": parsed.get("doc_type") or "de_thi",
        "term": term,
        "school_name": (parsed.get("school_name") or "").strip(),
        "exam_title": (parsed.get("exam_title") or "").strip(),
        "academic_year": (parsed.get("academic_year") or year_hint or "").strip(),
        "model": res["model"],
        "pages_total": total_pages,
        "pages_sent": n_pages,
        "elapsed": round(time.time() - t0, 1),
        "questions": questions,
    }
    os.makedirs(os.path.join(out_dir, grade), exist_ok=True)
    with open(os.path.join(out_dir, grade, stem + ".json"), "w", encoding="utf-8") as f:
        json.dump(result, f, ensure_ascii=False, indent=1)
    return result


def collect_files(root: str, grades: List[str]) -> List[Dict[str, str]]:
    base = os.path.join(root, os.listdir(root)[0]) if not os.path.isdir(os.path.join(root, grades[0])) else root
    items, seen = [], set()
    for g in grades:
        d = os.path.join(base, g)
        for f in sorted(os.listdir(d)):
            if not f.lower().endswith(".pdf"):
                continue
            p = os.path.join(d, f)
            h = sha1_file(p)
            if h in seen:
                continue
            seen.add(h)
            items.append({"grade": g, "path": p, "file": f})
    return items


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", default=r"C:\Users\hungp\Downloads\ToanTHCS")
    ap.add_argument("--out", default=r"C:\Users\hungp\Downloads\ToanTHCS_out")
    ap.add_argument("--grades", default="6,7,8")
    ap.add_argument("--only", default="", help="comma separated substrings of filenames (pilot)")
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--workers", type=int, default=4)
    ap.add_argument("--model", default=DEFAULT_MODEL)
    ap.add_argument("--api-url", default=DEFAULT_API_URL)
    ap.add_argument("--api-key", default=DEFAULT_API_KEY)
    args = ap.parse_args()
    sys.stdout.reconfigure(encoding="utf-8")

    items = collect_files(args.root, args.grades.split(","))
    if args.only:
        subs = [s.strip() for s in args.only.split(",") if s.strip()]
        items = [i for i in items if any(s in i["file"] for s in subs)]
    todo = []
    for it in items:
        out_json = os.path.join(args.out, it["grade"], os.path.splitext(it["file"])[0] + ".json")
        if not os.path.exists(out_json):
            todo.append(it)
    if args.limit:
        todo = todo[: args.limit]
    print(f"files total={len(items)} todo={len(todo)}", flush=True)

    lock = threading.Lock()
    done = {"ok": 0, "err": 0}

    def run(it):
        try:
            r = extract_one(it["path"], it["grade"], args.out, args.model, args.api_url, args.api_key)
            with lock:
                done["ok"] += 1
                print(f"[OK {done['ok']+done['err']}/{len(todo)}] {it['grade']} {it['file']} -> {r['doc_type']} q={len(r['questions'])} {r['elapsed']}s", flush=True)
        except Exception as e:  # noqa: BLE001
            with lock:
                done["err"] += 1
                print(f"[ERR {done['ok']+done['err']}/{len(todo)}] {it['grade']} {it['file']}: {e}", flush=True)

    with ThreadPoolExecutor(max_workers=args.workers) as ex:
        futs = [ex.submit(run, it) for it in todo]
        for _ in as_completed(futs):
            pass
    print("DONE", done, flush=True)


if __name__ == "__main__":
    main()
