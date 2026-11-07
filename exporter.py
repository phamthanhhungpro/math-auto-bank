import io
import os
import re
from typing import Dict, Any, List, Optional
from docx import Document
from docx.shared import Pt, Inches, Cm
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT
from docx.oxml import parse_xml
from docx.oxml.ns import nsdecls
import latex2mathml.converter
import mathml2omml

BASE_DIR = os.path.dirname(os.path.abspath(__file__))


def latex_to_omml_element(latex_str: str):
    """Converts a LaTeX math string to an lxml OXML element (<m:oMath>) for python-docx."""
    try:
        clean_latex = latex_str.strip()
        # Replace common Vietnamese math notations that latex2mathml might not know
        clean_latex = clean_latex.replace(r"\widehat", r"\hat")
        mathml_output = latex2mathml.converter.convert(clean_latex)
        omml_output = mathml2omml.convert(mathml_output)
        # Inject Office Math namespace so parse_xml succeeds
        if "xmlns:m=" not in omml_output:
            omml_output = omml_output.replace(
                "<m:oMath>",
                f'<m:oMath {nsdecls("m")}>',
                1,
            )
        return parse_xml(omml_output)
    except Exception:
        return None


def add_mixed_text_to_paragraph(paragraph, text: str, bold_prefix: str = ""):
    """Adds text containing $...$ LaTeX inline formulas to a python-docx paragraph."""
    if bold_prefix:
        r_pre = paragraph.add_run(bold_prefix)
        r_pre.bold = True
        r_pre.font.name = "Times New Roman"
        r_pre.font.size = Pt(12)

    # Split by $$...$$ or $...$
    tokens = re.split(r"(\$\$[\s\S]+?\$\$|\$[^\$]+?\$)", text)
    for tok in tokens:
        if not tok:
            continue
        if (tok.startswith("$$") and tok.endswith("$$")) or (
            tok.startswith("$") and tok.endswith("$")
        ):
            inner = tok.strip("$").strip()
            omml_el = latex_to_omml_element(inner)
            if omml_el is not None:
                paragraph._p.append(omml_el)
            else:
                r = paragraph.add_run(inner)
                r.italic = True
                r.font.name = "Times New Roman"
                r.font.size = Pt(12)
        else:
            # Strip leftover simple HTML tags if any
            clean_txt = re.sub(r"</?(?:b|i|u|p|br|div|span)[^>]*>", "", tok)
            r = paragraph.add_run(clean_txt)
            r.font.name = "Times New Roman"
            r.font.size = Pt(12)


def add_html_table_to_doc(doc: Document, table_html: str):
    """Parses a simple HTML <table> and renders it as a bordered Word table."""
    rows_html = re.findall(r"<tr[^>]*>([\s\S]*?)</tr>", table_html, flags=re.IGNORECASE)
    if not rows_html:
        return
    parsed_rows = []
    max_cols = 0
    for r_html in rows_html:
        cells = re.findall(
            r"<t[dh][^>]*>([\s\S]*?)</t[dh]>", r_html, flags=re.IGNORECASE
        )
        cleaned_cells = [re.sub(r"<[^>]+>", "", c).strip() for c in cells]
        if cleaned_cells:
            parsed_rows.append(cleaned_cells)
            max_cols = max(max_cols, len(cleaned_cells))

    if not parsed_rows or max_cols == 0:
        return

    tbl = doc.add_table(rows=len(parsed_rows), cols=max_cols)
    tbl.style = "Table Grid"
    tbl.alignment = WD_TABLE_ALIGNMENT.CENTER
    for r_idx, row_data in enumerate(parsed_rows):
        for c_idx, cell_val in enumerate(row_data):
            if c_idx < max_cols:
                cell_p = tbl.cell(r_idx, c_idx).paragraphs[0]
                cell_p.alignment = WD_ALIGN_PARAGRAPH.CENTER
                add_mixed_text_to_paragraph(cell_p, cell_val)


def add_figure_to_doc(doc: Document, figure_path: Optional[str]):
    if not figure_path:
        return
    rel_path = figure_path.lstrip("/")
    abs_fig = os.path.join(BASE_DIR, rel_path.replace("/", os.sep))
    if os.path.exists(abs_fig):
        p_img = doc.add_paragraph()
        p_img.alignment = WD_ALIGN_PARAGRAPH.CENTER
        run_img = p_img.add_run()
        run_img.add_picture(abs_fig, width=Inches(2.8))


def convert_markdown_tables_to_html(text: str) -> str:
    if not text or "|" not in text:
        return text
    pattern = r"(?:^|\n)([ \t]*\|[^\n]+\|[ \t]*\n[ \t]*\|(?:\s*:?-+:?\s*\|)+\s*(?:\n[ \t]*\|[^\n]+\|[ \t]*)+)"
    def repl(match):
        lines = [ln.strip() for ln in match.group(1).strip().split("\n") if ln.strip()]
        if len(lines) < 2:
            return match.group(0)
        sep_idx = -1
        for i, ln in enumerate(lines):
            if re.match(r"^\|(?:\s*:?-+:?\s*\|)+$", ln):
                sep_idx = i
                break
        if sep_idx == -1:
            return match.group(0)
        html = ['<table border="1" style="border-collapse: collapse; text-align: center; margin: 8px auto;">']
        for i, ln in enumerate(lines):
            if i == sep_idx:
                continue
            is_header = (i < sep_idx)
            tag = "th" if is_header else "td"
            raw = ln.strip("|")
            cells = [c.strip() for c in raw.split("|")]
            html.append("<tr>" + "".join(f"<{tag}>{c}</{tag}>" for c in cells) + "</tr>")
        html.append("</table>")
        return "\n" + "".join(html) + "\n"

    return re.sub(pattern, repl, text)


def render_question_block(doc: Document, content: str, prefix: str = "", figure_path: Optional[str] = None):
    """Renders question text (with HTML tables, {{FIGURE}}, and $...$ math) into doc."""
    content = convert_markdown_tables_to_html(content)
    figure_rendered = False
    # Split content by <table>...</table> or {{FIGURE}}
    parts = re.split(r"(<table[\s\S]*?</table>|\{\{FIGURE\}\})", content, flags=re.IGNORECASE)
    first_line_done = False

    for part in parts:
        if not part.strip():
            continue
        if part.strip() == "{{FIGURE}}":
            add_figure_to_doc(doc, figure_path)
            figure_rendered = True
        elif part.strip().lower().startswith("<table"):
            add_html_table_to_doc(doc, part)
        else:
            lines = [ln.strip() for ln in part.strip().split("\n") if ln.strip()]
            for ln in lines:
                p = doc.add_paragraph()
                p.paragraph_format.space_before = Pt(2)
                p.paragraph_format.space_after = Pt(3)
                p.paragraph_format.line_spacing = 1.15
                if not first_line_done and prefix:
                    add_mixed_text_to_paragraph(p, ln, bold_prefix=prefix)
                    first_line_done = True
                else:
                    add_mixed_text_to_paragraph(p, ln)
                    first_line_done = True

    if figure_path and not figure_rendered:
        add_figure_to_doc(doc, figure_path)


def build_exam_docx(
    questions_by_slot: Dict[str, Optional[Dict[str, Any]]],
    header_info: Dict[str, str],
    include_solutions: bool = True,
    grade: int = 9,
) -> bytes:
    from database import get_structure, normalize_grade

    grade = normalize_grade(grade)
    doc = Document()

    # Configure page margins (A4 compact exam layout)
    for section in doc.sections:
        section.page_width = Cm(21.0)
        section.page_height = Cm(29.7)
        section.top_margin = Cm(1.5)
        section.bottom_margin = Cm(1.5)
        section.left_margin = Cm(2.0)
        section.right_margin = Cm(1.5)

    # Header Table
    hdr_table = doc.add_table(rows=1, cols=2)
    hdr_table.alignment = WD_TABLE_ALIGNMENT.CENTER
    left_cell = hdr_table.cell(0, 0).paragraphs[0]
    left_cell.alignment = WD_ALIGN_PARAGRAPH.CENTER
    r1 = left_cell.add_run(
        f"{header_info.get('org_name', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO')}\n"
    )
    r1.bold = True
    r1.font.name = "Times New Roman"
    r1.font.size = Pt(11)
    r2 = left_cell.add_run(f"{header_info.get('school_name', 'ĐỀ THI TỔNG HỢP')}\n")
    r2.bold = True
    r2.font.name = "Times New Roman"
    r2.font.size = Pt(11)
    r3 = left_cell.add_run(
        f"Mã đề: {header_info.get('exam_code', '101')} — (Đề gồm 02 trang)"
    )
    r3.italic = True
    r3.font.name = "Times New Roman"
    r3.font.size = Pt(10)

    right_cell = hdr_table.cell(0, 1).paragraphs[0]
    right_cell.alignment = WD_ALIGN_PARAGRAPH.CENTER
    r4 = right_cell.add_run(
        f"{header_info.get('exam_title', 'KỲ THI TUYỂN SINH VÀO LỚP 10 THPT')}\n"
    )
    r4.bold = True
    r4.font.name = "Times New Roman"
    r4.font.size = Pt(11)
    r5 = right_cell.add_run(
        f"Môn thi: TOÁN — Năm học: {header_info.get('academic_year', '2026 - 2027')}\n"
    )
    r5.bold = True
    r5.font.name = "Times New Roman"
    r5.font.size = Pt(11)
    r6 = right_cell.add_run(
        f"Thời gian làm bài: {header_info.get('duration', '120 phút')}"
    )
    r6.italic = True
    r6.font.name = "Times New Roman"
    r6.font.size = Pt(10)

    doc.add_paragraph()

    # Structure of the exam (depends on the grade: Toán 9 = 5 bài, Toán 6-8 = Trắc nghiệm + Tự luận)
    exam_sections = [
        (sec["title"], [(s["code"], s["prefix"]) for s in sec["slots"]])
        for sec in get_structure(grade)
    ]

    for section_title, slots in exam_sections:
        p_sec = doc.add_paragraph()
        p_sec.paragraph_format.space_before = Pt(6)
        p_sec.paragraph_format.space_after = Pt(2)
        r_sec = p_sec.add_run(section_title)
        r_sec.bold = True
        r_sec.font.name = "Times New Roman"
        r_sec.font.size = Pt(12)

        for slot_code, prefix in slots:
            q = questions_by_slot.get(slot_code)
            if not q:
                continue
            render_question_block(
                doc,
                q.get("content", ""),
                prefix=prefix,
                figure_path=q.get("figure_path"),
            )

    # Footer
    p_end = doc.add_paragraph()
    p_end.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p_end.paragraph_format.space_before = Pt(12)
    r_end = p_end.add_run("-------------------- HẾT --------------------\n")
    r_end.bold = True
    r_end.font.name = "Times New Roman"
    r_end.font.size = Pt(11)
    r_note = p_end.add_run("Cán bộ coi thi không giải thích gì thêm.")
    r_note.italic = True
    r_note.font.name = "Times New Roman"
    r_note.font.size = Pt(10)

    # Solutions & Source Matrix on next page
    if include_solutions:
        doc.add_page_break()
        p_sol_hdr = doc.add_paragraph()
        p_sol_hdr.alignment = WD_ALIGN_PARAGRAPH.CENTER
        r_sh = p_sol_hdr.add_run("BẢNG MA TRẬN NGUỒN & HƯỚNG DẪN GIẢI TÓM TẮT")
        r_sh.bold = True
        r_sh.font.name = "Times New Roman"
        r_sh.font.size = Pt(13)

        for section_title, slots in exam_sections:
            for slot_code, _ in slots:
                q = questions_by_slot.get(slot_code)
                if not q:
                    continue
                p_item = doc.add_paragraph()
                p_item.paragraph_format.space_before = Pt(4)
                p_item.paragraph_format.space_after = Pt(2)
                meta_prefix = f"[{slot_code} | {q.get('sub_topic', '')} | Nguồn: {q.get('source_name', '')}]: "
                sol_text = q.get("solution") or "Chưa có tóm tắt lời giải."
                add_mixed_text_to_paragraph(p_item, sol_text, bold_prefix=meta_prefix)

    buf = io.BytesIO()
    doc.save(buf)
    return buf.getvalue()
