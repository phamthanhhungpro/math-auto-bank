import os
import re
import json
import time
import base64
import urllib.request
from typing import Dict, Any, List, Optional
import pymupdf

from database import save_extracted_exam

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
FIGURES_DIR = os.path.join(BASE_DIR, "static", "figures")
os.makedirs(FIGURES_DIR, exist_ok=True)

DEFAULT_API_URL = "http://167.254.240.67:9920/v1/chat/completions"
DEFAULT_MODEL = "gemini-3.8-flash-low"
DEFAULT_API_KEY = "test"


def parse_latex_json(raw_text: str) -> Dict[str, Any]:
    text = raw_text.strip()
    if text.startswith("```"):
        text = re.sub(r"^```(?:json)?\s*", "", text)
        text = re.sub(r"\s*```$", "", text)
    text = text.strip()

    # 1. Escape single backslashes before LaTeX commands that start with b, f, n, r, t
    text = re.sub(
        r"(?<!\\)\\(frac|forall|times|triangle|tan|theta|text|textbf|textit|to|right|Rightarrow|rho|neq|notin|nabla|ni|begin|binom|bar|boxed|beta|bigcup|bigcap)\b",
        r"\\\\\1",
        text,
    )
    # 2. Escape any remaining single backslash not followed by valid JSON escape chars
    text = re.sub(r'(?<!\\)\\(?![/\"\\bfnrtu])', r"\\\\", text)

    return json.loads(text, strict=False)


def crop_figure(
    doc: pymupdf.Document,
    page_idx: int,
    box_2d: List[float],
    out_filename: str,
    dpi: int = 220,
    pad: int = 3,
) -> Optional[str]:
    if page_idx is None or page_idx < 0 or page_idx >= len(doc):
        return None
    if not box_2d or len(box_2d) != 4:
        return None

    ymin, xmin, ymax, xmax = box_2d
    ymin = max(0, ymin - pad)
    xmin = max(0, xmin - pad)
    ymax = min(1000, ymax + pad)
    xmax = min(1000, xmax + pad)

    if ymax <= ymin or xmax <= xmin:
        return None

    page = doc[page_idx]
    rect = page.rect
    crop_rect = pymupdf.Rect(
        rect.x0 + (xmin / 1000.0) * rect.width,
        rect.y0 + (ymin / 1000.0) * rect.height,
        rect.x0 + (xmax / 1000.0) * rect.width,
        rect.y0 + (ymax / 1000.0) * rect.height,
    )
    pix = page.get_pixmap(dpi=dpi, clip=crop_rect)
    out_path = os.path.join(FIGURES_DIR, out_filename)
    pix.save(out_path)
    return f"/static/figures/{out_filename}"


def extract_exam_from_pdf(
    pdf_path: str,
    api_url: str = DEFAULT_API_URL,
    model: str = DEFAULT_MODEL,
    api_key: str = DEFAULT_API_KEY,
    start_page: int = 0,
    num_exam_pages: int = 2,
    rubric_end_page: Optional[int] = None,
    custom_key: Optional[str] = None,
    custom_title_hint: Optional[str] = None,
    run_pass2_qa: bool = True,
) -> Dict[str, Any]:
    filename = custom_key or os.path.basename(pdf_path)
    safe_stem = re.sub(r"[^a-zA-Z0-9_-]", "_", os.path.splitext(filename)[0])[:55]

    doc = pymupdf.open(pdf_path)
    end_exam_page = min(start_page + num_exam_pages, len(doc))

    page_b64_list = []
    for p in range(start_page, end_exam_page):
        pix = doc[p].get_pixmap(dpi=130)
        b64 = base64.b64encode(pix.tobytes("jpeg", jpg_quality=85)).decode("utf-8")
        page_b64_list.append((p, b64))

    # Grab raw rubric text from solution pages after the exam pages
    max_rubric_pg = rubric_end_page if rubric_end_page is not None else min(end_exam_page + 5, len(doc))
    rubric_text_parts = []
    for p in range(end_exam_page, min(max_rubric_pg, len(doc))):
        txt = doc[p].get_text("text").strip()
        if txt:
            rubric_text_parts.append(f"[Trang giải {p+1}]:\n{txt[:1400]}")
    rubric_context = "\n\n".join(rubric_text_parts)[:3800]

    prompt = r"""Bạn là hệ thống AI chuyên bóc tách và Kiểm định Chất lượng (QA) Ngân hàng Đề thi Toán vào lớp 10 THPT (cấu trúc chuẩn Hà Nội gồm 5 bài lớn, 9 vị trí câu hỏi).
Từ hình ảnh 2 trang đề thi (Trang 0 và Trang 1) và văn bản hướng dẫn chấm đính kèm (nếu có), hãy trích xuất thông tin đề thi và đầy đủ 9 vị trí câu hỏi theo định dạng JSON dưới đây:

{
  "school_name": "Tên Sở / Phòng GD&ĐT / Trường ban hành đề (VD: Sở GD&ĐT Hà Nội, THCS Cầu Giấy, Phòng GD&ĐT Chương Mỹ...)",
  "exam_title": "Tên kỳ thi (VD: Đề chính thức vào 10, Đề thi thử lần 3...)",
  "academic_year": "Năm học (VD: 2025 - 2026)",
  "questions": [
    {
      "slot": "Mã vị trí, bắt buộc thuộc 1 trong 9 mã: I.1, I.2, II, III.1, III.2, III.3, IV.1, IV.2, V",
      "sub_topic": "Nhãn dạng toán ngắn gọn (VD: Bảng tần số ghép nhóm, Biểu đồ cột, Xác suất, Rút gọn căn thức, Lãi suất ngân hàng, Chuyển động, Năng suất - Công việc, Hệ thức Vi-ét, Hình trụ - Hình nón, Đường tròn nội tiếp, Cực trị thực tế...)",
      "content": "Nội dung câu hỏi hoàn chỉnh đã qua chuẩn hóa QA.",
      "figure_page": 0 hoặc 1 (chỉ số 0 cho ảnh trang đầu, 1 cho ảnh trang hai nếu câu hỏi có hình vẽ/biểu đồ; hoặc null nếu không có hình vẽ),
      "figure_box_2d": [ymin, xmin, ymax, xmax] (tọa độ chuẩn hóa từ 0 đến 1000 bao quanh RIÊNG phần biểu đồ/hình vẽ minh họa, lấy trọn vẹn cả nhãn số liệu ở mép hình như '25 km', '12 cm' nhưng KHÔNG chạm vào dòng chữ đề bài phía trên/dưới; hoặc null nếu không có hình vẽ),
      "solution": "Tóm tắt lời giải và đáp số ngắn gọn, rõ ràng (viết công thức bằng LaTeX $...$) cho câu hỏi này."
    }
  ]
}

QUY TẮC CHUẨN HÓA & QA BẮT BUỘC CHO TRƯỜNG "content":
1. **Không lặp nhãn đầu câu**: Tuyệt đối KHÔNG ghi các nhãn đầu mục như 'Câu I (1,5 điểm)', 'Bài 1.', '1)', '2)' ở đầu câu của slot (vì hệ thống trộn đề sẽ tự động đánh số lại). Giữ nguyên các ý nhỏ bên trong câu (như a), b), c) hoặc 1), 2), 3) của Bài II), mỗi ý nhỏ xuống dòng '\n' rõ ràng.
2. **Quy chuẩn Công thức LaTeX & Văn bản**:
   - Mọi biểu thức đại số, phương trình, biến số ($x, y, A, B, P$), phân số ($\frac{3}{4}$), căn thức ($\sqrt{x}$), hình học ($\triangle ABC$, $\widehat{EMH} = 90^\circ$, $AB \perp CD$, $(O; R)$) viết chuẩn LaTeX trong dấu `$...$`.
   - CÁC KHOẢNG SỐ GHÉP NHÓM như `[40; 50)`, `[80; 90)`, `[150; 155)` PHẢI viết ở dạng chữ thường `[80; 90)`, TUYỆT ĐỐI KHÔNG bọc trong `$[80; 90)$` để tránh lệch phông chữ ngoặc vuông/tròn.
   - Các con số đếm thông thường và đơn vị trong câu văn (như `50 học sinh`, `6 quả bóng`, `70%`, `12 cm`, `25 km`, `3 500 000 đồng`) viết dạng chữ thường, KHÔNG bọc trong `$50$` hay `$12\text{cm}$`.
3. **Vị trí đặt Hình vẽ / Biểu đồ (`{{FIGURE}}`)**:
   - Nếu câu hỏi có hình vẽ hoặc biểu đồ (`figure_box_2d` khác null), BẮT BUỘC chèn tag `{{FIGURE}}` trên một dòng riêng ngay tại vị trí của hình (ví dụ ở câu `I.1` hoặc `IV.1`: đặt `{{FIGURE}}` ngay sau câu dẫn giới thiệu biểu đồ/hình vẽ và TRƯỚC ý `a)`).
4. **Bảng số liệu (`<table>`)**:
   - Nếu câu hỏi có BẢNG SỐ LIỆU (như bảng tần số ở `I.1`), hãy chuyển bảng đó thành thẻ `<table border="1"><tr>...</tr></table>` HTML chuẩn viết gọn trên 1 dòng duy nhất (không xuống dòng `\n` bên trong thẻ `<table>...</table>`), và đặt `figure_box_2d = null`.

Chỉ trả về đúng 1 JSON object hợp lệ, không giải thích gì thêm."""

    content_parts: List[Dict[str, Any]] = [{"type": "text", "text": prompt}]
    if custom_title_hint:
        content_parts.append({"type": "text", "text": f"Gợi ý tên đề: {custom_title_hint}"})

    for rel_idx, (_, b64) in enumerate(page_b64_list):
        content_parts.append({"type": "text", "text": f"--- ẢNH ĐỀ THI TRANG {rel_idx} ---"})
        content_parts.append(
            {"type": "image_url", "image_url": {"url": f"data:image/jpeg;base64,{b64}"}}
        )

    if rubric_context:
        content_parts.append(
            {
                "type": "text",
                "text": f"--- VĂN BẢN HƯỚNG DẪN CHẤM THAM KHẢO ---\n{rubric_context}",
            }
        )

    t0 = time.time()
    models_to_try = [model] + [
        m for m in ["gemini-3.8-flash-low", "gemini-3-flash", "gemini-2.5-flash"] if m != model
    ]
    last_err = None
    resp_data = None
    for m_try in models_to_try:
        payload = {
            "model": m_try,
            "messages": [{"role": "user", "content": content_parts}],
            "temperature": 0.1,
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
            with urllib.request.urlopen(req, timeout=70) as resp:
                resp_data = json.loads(resp.read().decode("utf-8"))
                break
        except Exception as e:
            last_err = e
            continue

    if resp_data is None:
        doc.close()
        raise RuntimeError(f"Gọi AI endpoint thất bại: {last_err}")

    raw_content = resp_data["choices"][0]["message"]["content"]
    parsed = parse_latex_json(raw_content)

    school_name = parsed.get("school_name") or filename
    exam_title = parsed.get("exam_title") or "Đề thi vào lớp 10"
    if custom_title_hint and custom_title_hint not in school_name:
        school_name = f"{school_name} - {custom_title_hint}"
    academic_year = parsed.get("academic_year") or "2025 - 2026"
    questions_raw = parsed.get("questions", [])

    processed_questions = []
    for idx, q in enumerate(questions_raw):
        slot = q.get("slot", f"Q{idx+1}")
        fig_rel_page = q.get("figure_page")
        fig_box = q.get("figure_box_2d")
        fig_url = None
        if (
            fig_rel_page is not None
            and fig_box
            and isinstance(fig_box, list)
            and len(fig_box) == 4
        ):
            abs_page = start_page + int(fig_rel_page)
            fig_filename = f"{safe_stem}_{slot.replace('.', '_')}_{int(time.time()*1000)%1000000}.png"
            fig_url = crop_figure(doc, abs_page, fig_box, fig_filename)

        # Clean up any multi-line HTML tables and interval notations
        content_clean = q.get("content", "").strip()
        content_clean = re.sub(
            r"<table[\s\S]*?</table>",
            lambda m: re.sub(r"\s*\n\s*", " ", m.group(0)),
            content_clean,
            flags=re.IGNORECASE,
        )
        content_clean = re.sub(r"\$\s*(\[[^\$\]]+?\))\s*\$", r"\1", content_clean)

        processed_questions.append(
            {
                "slot": slot,
                "sub_topic": q.get("sub_topic", ""),
                "content": content_clean,
                "figure_page": fig_rel_page,
                "figure_box_2d": fig_box,
                "figure_path": fig_url,
                "solution": q.get("solution", "").strip(),
            }
        )

    qa_fixes = []
    if run_pass2_qa and start_page == 0:
        try:
            from qa_reviewer import qa_and_fix_exam_questions

            qa_out = qa_and_fix_exam_questions(
                pdf_path=pdf_path,
                draft_questions=processed_questions,
                doc=doc,
                api_url=api_url,
                model=model,
                api_key=api_key,
            )
            if qa_out.get("questions"):
                processed_questions = qa_out["questions"]
                qa_fixes = qa_out.get("qa_fixes_summary", [])
        except Exception as qa_err:
            print("Warning: Pass-2 QA error:", qa_err)

    doc.close()
    elapsed = round(time.time() - t0, 1)

    exam_id = save_extracted_exam(
        filename=filename,
        school_name=school_name,
        exam_title=exam_title,
        academic_year=academic_year,
        questions=processed_questions,
    )

    return {
        "exam_id": exam_id,
        "filename": filename,
        "school_name": school_name,
        "exam_title": exam_title,
        "academic_year": academic_year,
        "questions_count": len(processed_questions),
        "qa_fixes_summary": qa_fixes,
        "elapsed_seconds": elapsed,
    }
