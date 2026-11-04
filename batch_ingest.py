import os
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
import pymupdf

sys.stdout.reconfigure(encoding="utf-8")

from database import init_db, get_ingested_files, get_slot_counts
from extractor import extract_exam_from_pdf

GRADE10_DIR = r"C:\Users\hungp\Downloads\Grade10"


def find_sub_exams_in_bo_de_lan_2(pdf_path: str):
    doc = pymupdf.open(pdf_path)
    valid_starts = []
    for pg in range(len(doc)):
        txt = doc[pg].get_text("text")
        if (
            "ĐỀ BÀI" in txt
            or "ĐỀ THAM KHẢO" in txt
            or "KỲ THI TUYỂN SINH" in txt
        ) and ("Câu I" in txt or "Bài I" in txt or "Bài 1" in txt):
            if "HƯỚNG DẪN" not in txt.upper() and "LỜI GIẢI" not in txt.upper():
                if not valid_starts or pg - valid_starts[-1] >= 4:
                    valid_starts.append(pg)
    total_pages = len(doc)
    doc.close()

    tasks = []
    for idx, pg in enumerate(valid_starts, start=1):
        next_pg = valid_starts[idx] if idx < len(valid_starts) else total_pages
        key = f"BoDeHaNoiLan2_De_{idx:02d}_trang_{pg+1}.pdf"
        hint = f"Bộ đề thi thử Hà Nội Lần 2 - Đề số {idx} (Trang {pg+1})"
        tasks.append(
            {
                "pdf_path": pdf_path,
                "start_page": pg,
                "num_exam_pages": 2,
                "rubric_end_page": min(pg + 6, next_pg),
                "custom_key": key,
                "custom_title_hint": hint,
                "run_pass2_qa": False,
            }
        )
    return tasks


def main():
    init_db()
    already_ingested = get_ingested_files()
    print(f"Hiện đã có {len(already_ingested)} đề trong DB: {get_slot_counts()}", flush=True)

    # 1. Standalone exam PDFs
    standalone_files = [
        "de-thi-thu-toan-vao-lop-10-lan-1-nam-2027-2028-truong-thcs-chuong-my-1-ha-noi.pdf",
        "de-thi-thu-toan-vao-lop-10-lan-3-nam-2025-phong-gddt-ung-hoa-ha-noi.pdf",
        "de-thi-thu-vao-lop-10-mon-toan-chung-nam-2025-lan-2-truong-chuyen-dhsp-ha-noi.pdf",
        "de-thi-thu-vao-lop-10-mon-toan-nam-2025-2026-lan-4-phong-gd-dt-chuong-my-ha-noi.pdf",
        "de-thi-thu-vao-lop-10-mon-toan-nam-2025-truong-thpt-soc-son-ha-noi.pdf",
        "de-tuyen-sinh-lop-10-chuyen-mon-toan-chuyen-nam-2026-2027-so-gddt-vinh-long.pdf",
    ]

    all_tasks = []
    for fname in standalone_files:
        if fname not in already_ingested:
            p = os.path.join(GRADE10_DIR, fname)
            if os.path.exists(p):
                all_tasks.append(
                    {
                        "pdf_path": p,
                        "start_page": 0,
                        "num_exam_pages": 2,
                        "rubric_end_page": None,
                        "custom_key": fname,
                        "custom_title_hint": None,
                        "run_pass2_qa": True,
                    }
                )

    # 2. Sub-exams inside "bỘ ĐỀ THI THỬ VÀO LỚP 10 HÀ NỘI LẦN 2.pdf"
    bo_de_lan_2_path = os.path.join(
        GRADE10_DIR, "bỘ ĐỀ THI THỬ VÀO LỚP 10 HÀ NỘI LẦN 2.pdf"
    )
    if os.path.exists(bo_de_lan_2_path):
        sub_tasks = find_sub_exams_in_bo_de_lan_2(bo_de_lan_2_path)
        for st in sub_tasks:
            if st["custom_key"] not in already_ingested:
                all_tasks.append(st)

    print(f"Tổng số đề cần nạp tiếp: {len(all_tasks)}", flush=True)
    if not all_tasks:
        print("Tất cả đề đã được nạp!", flush=True)
        return

    def worker(task_info):
        key = task_info["custom_key"]
        try:
            res = extract_exam_from_pdf(
                pdf_path=task_info["pdf_path"],
                start_page=task_info["start_page"],
                num_exam_pages=task_info["num_exam_pages"],
                rubric_end_page=task_info["rubric_end_page"],
                custom_key=key,
                custom_title_hint=task_info["custom_title_hint"],
                run_pass2_qa=task_info["run_pass2_qa"],
            )
            return (True, key, res)
        except Exception as e:
            return (False, key, str(e))

    done_count = 0
    total = len(all_tasks)
    t_start = time.time()

    with ThreadPoolExecutor(max_workers=4) as pool:
        futures = [pool.submit(worker, t) for t in all_tasks]
        for fut in as_completed(futures):
            ok, key, info = fut.result()
            done_count += 1
            elapsed_total = round(time.time() - t_start, 1)
            if ok:
                print(
                    f"[{done_count}/{total} | {elapsed_total}s] ✅ {key} -> {info['school_name']} ({info['questions_count']} câu, {info['elapsed_seconds']}s)",
                    flush=True,
                )
            else:
                print(
                    f"[{done_count}/{total} | {elapsed_total}s] ❌ {key} -> LỖI: {info}",
                    flush=True,
                )

    print("\n=== HOÀN TẤT NẠP BỘ ĐỀ ===", flush=True)
    print("Số câu hỏi theo từng vị trí:", get_slot_counts(), flush=True)


if __name__ == "__main__":
    main()
