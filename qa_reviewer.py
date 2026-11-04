import os
import json
import time
import base64
import urllib.request
from typing import Dict, Any, List, Optional
import pymupdf

from database import get_conn, EXAM_SLOTS
from extractor import (
    parse_latex_json,
    crop_figure,
    DEFAULT_API_URL,
    DEFAULT_MODEL,
    DEFAULT_API_KEY,
)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
GRADE10_DIR = r"C:\Users\hungp\Downloads\Grade10"


def call_llm_json(
    content_parts: List[Dict[str, Any]],
    api_url: str = DEFAULT_API_URL,
    model: str = DEFAULT_MODEL,
    api_key: str = DEFAULT_API_KEY,
) -> Dict[str, Any]:
    models_to_try = [model] + [
        m
        for m in ["gemini-3.8-flash-low", "gemini-3-flash", "gemini-2.5-flash"]
        if m != model
    ]
    last_err = None
    for m_try in models_to_try:
        payload = {
            "model": m_try,
            "messages": [{"role": "user", "content": content_parts}],
            "temperature": 0.0,
        }
        req = urllib.request.Request(
            api_url,
            data=json.dumps(payload).encode("utf-8"),
            headers={
                "Content-Type": "application/json",
                "Authorization": f"Bearer {api_key}",
            },
        )
        try:
            with urllib.request.urlopen(req, timeout=75) as resp:
                resp_data = json.loads(resp.read().decode("utf-8"))
                raw_content = resp_data["choices"][0]["message"]["content"]
                return parse_latex_json(raw_content)
        except Exception as e:
            last_err = e
            continue
    raise RuntimeError(f"LLM QA call failed: {last_err}")


def qa_and_fix_exam_questions(
    pdf_path: str,
    draft_questions: List[Dict[str, Any]],
    doc: Optional[pymupdf.Document] = None,
    start_page: int = 0,
    api_url: str = DEFAULT_API_URL,
    model: str = DEFAULT_MODEL,
    api_key: str = DEFAULT_API_KEY,
) -> Dict[str, Any]:
    """
    Pass-2 QA & Self-Correction using the Vision LLM endpoint:
    1. Compares extracted questions against the original PDF page images.
    2. Inspects cropped figures (if any) to check if text/numbers were clipped at edges (e.g. '25 km' -> '5 km')
       or if text lines from below/above bled into the crop, and returns corrected figure_box_2d.
    3. Fixes LaTeX formatting, unit spacing, interval notation, HTML tables, and inserts {{FIGURE}} at the exact right position.
    """
    close_doc = False
    if doc is None:
        doc = pymupdf.open(pdf_path)
        close_doc = True

    end_exam_page = min(start_page + 2, len(doc))
    page_b64_list = []
    for p in range(start_page, end_exam_page):
        pix = doc[p].get_pixmap(dpi=130)
        b64 = base64.b64encode(pix.tobytes("jpeg", jpg_quality=85)).decode("utf-8")
        page_b64_list.append(b64)

    # Prepare simplified draft for QA inspection
    draft_for_qa = []
    cropped_Attachments = []
    for q in draft_questions:
        slot = q.get("slot", "")
        fig_path = q.get("figure_path")
        has_crop = False
        if fig_path:
            abs_fig = os.path.join(BASE_DIR, fig_path.lstrip("/").replace("/", os.sep))
            if os.path.exists(abs_fig):
                with open(abs_fig, "rb") as f:
                    b64_crop = base64.b64encode(f.read()).decode("utf-8")
                cropped_Attachments.append((slot, b64_crop))
                has_crop = True

        draft_for_qa.append(
            {
                "slot": slot,
                "sub_topic": q.get("sub_topic", ""),
                "content": q.get("content", ""),
                "figure_page": q.get("figure_page"),
                "figure_box_2d": q.get("figure_box_2d"),
                "has_cropped_image": has_crop,
                "solution": q.get("solution", ""),
            }
        )

    qa_prompt = r"""Bạn là Chuyên gia Kiểm định Chất lượng (QA) Đề thi Toán vào lớp 10.
Dưới đây là:
1. Ảnh gốc của Trang 0 và Trang 1 đề thi PDF.
2. Các ảnh hình minh họa vừa được cắt tự động (nếu có).
3. Bản nháp JSON 9 câu hỏi vừa bóc tách từ bước 1.

NHIỆM VỤ CỦA BẠN: Rà soát từng câu hỏi đối chiếu với Ảnh đề gốc và SỬA TOÀN BỘ CÁC LỖI SAU:

1. **Lỗi Ký hiệu Toán học, Khoảng số & Đơn vị đo**:
   - Các khoảng ghép nhóm như [40; 50), [80; 90), [150; 155) PHẢI viết ở dạng văn bản thường `[80; 90)` (KHÔNG bọc trong dấu `$[80; 90)$` vì dấu ngoặc vuông kết hợp ngoặc tròn trong LaTeX khi đứng cạnh chữ tiếng Việt bị lệch font và mất thẩm mỹ).
   - Các con số thông thường đứng độc lập trong lời văn (như "50 học sinh", "6 quả bóng", "25 bông hoa", "70%", "3 500 000 đồng") phải viết dạng chữ thường, KHÔNG bọc trong `$50$` hay `$70\%$`. Chỉ bọc `$...$` cho BIỂU THỨC ĐẠI SỐ, PHƯƠNG TRÌNH, BIẾN SỐ ($x, y, A, B, P$), PHÂN SỐ ($\frac{3}{4}$), CĂN THỨC ($\sqrt{x}$), HÌNH HỌC ($\triangle ABC$, $\widehat{EMH} = 90^\circ$, $AB \perp CD$, $(O; R)$).
   - Không viết dính số và đơn vị trong công thức như `$5\text{m}$` hay `$12\text{cm}$` — hãy viết ngoài LaTeX là `5 cm`, `12 cm`, `15 km`, hoặc `$15\text{ cm}^2$`.
   - Kiểm tra kỹ không để sót ký hiệu góc $\widehat{...}$, độ $^\circ$, song song $\parallel$, vuông góc $\perp$, tam giác $\triangle$.

2. **Lỗi Vị trí Hình vẽ / Biểu đồ (`{{FIGURE}}`)**:
   - Với các câu có hình vẽ hoặc biểu đồ (đặc biệt là câu `I.1` có biểu đồ cột trước các ý `a)`, `b)`, hoặc câu `IV.1` có hình trụ/nón trước các ý `a)`, `b)`): BẮT BUỘC chèn tag `{{FIGURE}}` trên một dòng riêng ngay sau câu dẫn giới thiệu biểu đồ/hình vẽ và TRƯỚC ý `a)`!
   - Với câu `V` có hình minh họa cho phần giả thiết: đặt `{{FIGURE}}` ở cuối câu hỏi.

3. **Lỗi Cắt Hình vẽ (`figure_box_2d`)**:
   - Hãy nhìn kỹ các ảnh cắt đính kèm (`ẢNH CẮT HIỆN TẠI CỦA SLOT ...`):
     * Nếu ảnh cắt bị MẤT CHỮ/SỐ ở mép (ví dụ `25 km` bị cắt mất số `2` thành `5 km`, hoặc mất tên đỉnh $A, B, C$, mất nhãn trục biểu đồ) $\rightarrow$ Hãy mở rộng tọa độ `figure_box_2d: [ymin, xmin, ymax, xmax]` (hệ 0-1000 trên trang gốc) ra phía bị mất.
     * Nếu ảnh cắt bị DÍNH DÒNG CHỮ ĐỀ BÀI ở mép trên/dưới (ví dụ dính nửa dòng chữ `a) Tính tần số...` ở đáy biểu đồ) $\rightarrow$ Hãy thu hẹp `ymax` hoặc `ymin` lại để loại bỏ chữ thừa.
     * Nếu hình cắt đã đẹp và đầy đủ, giữ nguyên `figure_box_2d` (hoặc đặt `needs_recrop: false`).

4. **Lỗi Bảng HTML (`<table>`)**:
   - Nếu câu hỏi có bảng số liệu (như bảng tần số ghép nhóm ở `I.1`), phải viết thẻ `<table border="1"><tr>...</tr></table>` gọn trên 1 dòng duy nhất (không chứa ký tự xuống dòng `\n` bên trong thẻ `<table>...</table>`) và các khoảng `[140; 145)` trong bảng không bọc `$...$`.

5. **Lỗi Đánh số đầu câu & Thiếu ý**:
   - Tuyệt đối không để sót tiền tố `Bài I.`, `Câu 1.`, `1)`, `2)` ở đầu câu hỏi (trừ các ý con `1), 2), 3)` thuộc Bài II hoặc `a), b), c)` bên trong câu).
   - Đảm bảo xuống dòng `\n` trước mỗi ý nhỏ `a)`, `b)`, `c)` hoặc `1)`, `2)`, `3)`.

Hãy trả về JSON hợp lệ theo đúng cấu trúc:
{
  "qa_fixes_summary": ["Danh sách ngắn gọn các lỗi đã phát hiện và sửa trong đề này"],
  "questions": [
    {
      "slot": "I.1",
      "sub_topic": "...",
      "content": "Nội dung đã được QA sửa lỗi hoàn chỉnh (có chứa {{FIGURE}} nếu câu có hình vẽ/biểu đồ)",
      "figure_page": 0 hoặc 1 hoặc null,
      "figure_box_2d": [ymin, xmin, ymax, xmax] hoặc null,
      "needs_recrop": true hoặc false (đặt true nếu cần cắt lại hình theo figure_box_2d mới),
      "solution": "Lời giải tóm tắt đã chuẩn hóa LaTeX"
    }
  ]
}
Chỉ trả về JSON object hợp lệ."""

    content_parts: List[Dict[str, Any]] = [{"type": "text", "text": qa_prompt}]
    for idx, b64 in enumerate(page_b64_list):
        content_parts.append({"type": "text", "text": f"--- ẢNH ĐỀ GỐC TRANG {idx} ---"})
        content_parts.append(
            {"type": "image_url", "image_url": {"url": f"data:image/jpeg;base64,{b64}"}}
        )

    for slot_code, b64_crop in cropped_Attachments:
        content_parts.append(
            {"type": "text", "text": f"--- ẢNH CẮT HIỆN TẠI CỦA SLOT {slot_code} ---"}
        )
        content_parts.append(
            {
                "type": "image_url",
                "image_url": {"url": f"data:image/png;base64,{b64_crop}"},
            }
        )

    content_parts.append(
        {
            "type": "text",
            "text": f"--- BẢN NHÁP JSON CẦN QA & SỬA LỖI ---\n{json.dumps(draft_for_qa, ensure_ascii=False, indent=2)}",
        }
    )

    qa_result = call_llm_json(content_parts, api_url=api_url, model=model, api_key=api_key)
    qa_questions = qa_result.get("questions", [])
    fixes_summary = qa_result.get("qa_fixes_summary", [])

    filename = os.path.basename(pdf_path)
    import re
    safe_stem = re.sub(r"[^a-zA-Z0-9_-]", "_", os.path.splitext(filename)[0])[:50]

    # Map original figure paths by slot
    orig_by_slot = {q.get("slot"): q for q in draft_questions}

    final_questions = []
    for q_qa in qa_questions:
        slot = q_qa.get("slot", "")
        orig_q = orig_by_slot.get(slot, {})
        fig_url = orig_q.get("figure_path")

        needs_recrop = q_qa.get("needs_recrop", False)
        fig_page = q_qa.get("figure_page")
        fig_box = q_qa.get("figure_box_2d")

        if (needs_recrop or not fig_url) and fig_page is not None and fig_box and len(fig_box) == 4:
            fig_filename = f"{safe_stem}_{slot.replace('.', '_')}_qa_{int(time.time())}.png"
            # Use exact box from QA (padding=2 instead of 8 so we don't bleed into adjacent lines)
            ymin, xmin, ymax, xmax = fig_box
            ymin = max(0, ymin - 2)
            xmin = max(0, xmin - 2)
            ymax = min(1000, ymax + 2)
            xmax = min(1000, xmax + 2)
            abs_page = start_page + int(fig_page)
            page = doc[abs_page]
            rect = page.rect
            crop_rect = pymupdf.Rect(
                rect.x0 + (xmin / 1000.0) * rect.width,
                rect.y0 + (ymin / 1000.0) * rect.height,
                rect.x0 + (xmax / 1000.0) * rect.width,
                rect.y0 + (ymax / 1000.0) * rect.height,
            )
            pix = page.get_pixmap(dpi=220, clip=crop_rect)
            out_path = os.path.join(BASE_DIR, "static", "figures", fig_filename)
            pix.save(out_path)
            fig_url = f"/static/figures/{fig_filename}"

        # Clean up any multi-line HTML tables so they stay on a single line
        content_fixed = q_qa.get("content", "").strip()
        content_fixed = re.sub(
            r"<table[\s\S]*?</table>",
            lambda m: re.sub(r"\s*\n\s*", " ", m.group(0)),
            content_fixed,
            flags=re.IGNORECASE,
        )

        final_questions.append(
            {
                "slot": slot,
                "sub_topic": q_qa.get("sub_topic") or orig_q.get("sub_topic", ""),
                "content": content_fixed,
                "figure_path": fig_url,
                "solution": (q_qa.get("solution") or orig_q.get("solution", "")).strip(),
            }
        )

    if close_doc:
        doc.close()

    return {
        "questions": final_questions,
        "qa_fixes_summary": fixes_summary,
    }


def run_qa_on_existing_exam(
    exam_id: int,
    api_url: str = DEFAULT_API_URL,
    model: str = DEFAULT_MODEL,
    api_key: str = DEFAULT_API_KEY,
) -> Dict[str, Any]:
    """Runs Pass-2 Vision + Text QA on an already-ingested exam in SQLite and updates its questions."""
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT * FROM exams WHERE id = ?", (exam_id,))
    exam_row = cur.fetchone()
    if not exam_row:
        conn.close()
        raise ValueError(f"Exam id {exam_id} not found")

    exam = dict(exam_row)
    cur.execute("SELECT * FROM questions WHERE exam_id = ? ORDER BY id", (exam_id,))
    q_rows = [dict(r) for r in cur.fetchall()]
    conn.close()

    import re
    fname = exam["filename"]
    start_page = 0
    m_sub = re.match(r"^BoDeHaNoiLan2_De_\d+_trang_(\d+)\.pdf$", fname)
    if m_sub:
        pdf_path = os.path.join(
            GRADE10_DIR, "bỘ ĐỀ THI THỬ VÀO LỚP 10 HÀ NỘI LẦN 2.pdf"
        )
        start_page = int(m_sub.group(1)) - 1
    else:
        pdf_path = os.path.join(GRADE10_DIR, fname)

    if not os.path.exists(pdf_path):
        raise FileNotFoundError(f"PDF not found: {pdf_path}")

    t0 = time.time()
    qa_out = qa_and_fix_exam_questions(
        pdf_path=pdf_path,
        draft_questions=q_rows,
        start_page=start_page,
        api_url=api_url,
        model=model,
        api_key=api_key,
    )
    elapsed = round(time.time() - t0, 1)

    # Update questions in SQLite preserving question IDs where slots match
    conn = get_conn()
    cur = conn.cursor()
    existing_by_slot = {r["slot"]: r["id"] for r in q_rows}
    updated_count = 0
    for q_fixed in qa_out["questions"]:
        slot = q_fixed["slot"]
        qid = existing_by_slot.get(slot)
        if qid:
            cur.execute(
                """
                UPDATE questions
                SET sub_topic = ?, content = ?, figure_path = ?, solution = ?
                WHERE id = ?
                """,
                (
                    q_fixed["sub_topic"],
                    q_fixed["content"],
                    q_fixed["figure_path"],
                    q_fixed["solution"],
                    qid,
                ),
            )
            updated_count += 1
    conn.commit()
    conn.close()

    return {
        "exam_id": exam_id,
        "filename": exam["filename"],
        "school_name": exam["school_name"],
        "updated_questions": updated_count,
        "qa_fixes_summary": qa_out["qa_fixes_summary"],
        "elapsed_seconds": elapsed,
    }
