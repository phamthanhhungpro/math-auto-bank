"""Import extractor_thcs JSON results into exam_bank.db (grades 6-8).

Re-runnable: all previously imported THCS exams (filename like 'thcs<grade>/...') are removed first.
"""
import argparse
import glob
import json
import os
import re
import sys

from database import init_db, get_conn, save_extracted_exam

TERMS = {"giua_hk1", "cuoi_hk1", "giua_hk2", "cuoi_hk2"}


def norm_key(text: str) -> str:
    t = re.sub(r"\{\{FIGURE\}\}", "", text or "")
    t = re.sub(r"<[^>]+>", " ", t)
    return re.sub(r"[\W_]+", "", t.lower())[:220]


def build_solution(q: dict) -> str:
    ans = (q.get("answer") or "").strip()
    sol = (q.get("solution") or "").strip()
    if q.get("slot") == "TN":
        if ans and sol:
            return f"Đáp án: {ans}. {sol}" if not sol.lower().startswith("đáp án") else sol
        if ans:
            return f"Đáp án: {ans}"
        return sol
    return sol or ans


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--src", default=r"C:\Users\hungp\Downloads\ToanTHCS_out")
    args = ap.parse_args()
    sys.stdout.reconfigure(encoding="utf-8")
    init_db()

    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT id FROM exams WHERE filename LIKE 'thcs%/%'")
    old_ids = [r["id"] for r in cur.fetchall()]
    for eid in old_ids:
        cur.execute("DELETE FROM questions WHERE exam_id = ?", (eid,))
        cur.execute("DELETE FROM exams WHERE id = ?", (eid,))
    conn.commit()
    conn.close()
    print(f"removed previous THCS exams: {len(old_ids)}")

    files = sorted(glob.glob(os.path.join(args.src, "*", "*.json")))
    seen = {}
    stats = {"files": 0, "imported": 0, "skipped_empty": 0, "q": 0, "dup_q": 0}
    for path in files:
        d = json.load(open(path, encoding="utf-8"))
        stats["files"] += 1
        if d.get("doc_type") == "khong_hop_le" or not d.get("questions"):
            stats["skipped_empty"] += 1
            continue
        grade = int(d["grade"])
        is_cuong = d.get("doc_type") == "de_cuong"
        term = d.get("term")
        category = "chuyen_de" if (is_cuong or term not in TERMS) else term

        questions = []
        for q in d["questions"]:
            # Bỏ câu "trả lời ngắn" gộp nhiều ý a), b), c)... rời rạc (không dùng được như 1 câu độc lập)
            if (
                q.get("slot") == "TN"
                and q.get("qkind") == "short"
                and re.search(r"(^|\n)\s*b\)", q.get("content", ""))
            ):
                stats["dup_q"] += 1
                continue
            key = (grade, q["slot"], norm_key(q["content"]))
            if key in seen:
                stats["dup_q"] += 1
                continue
            seen[key] = True
            questions.append(
                {
                    "slot": q["slot"],
                    "sub_topic": q.get("sub_topic", ""),
                    "content": q["content"],
                    "figure_path": q.get("figure_path"),
                    "solution": build_solution(q),
                    "qkind": q.get("qkind", ""),
                }
            )
        if not questions:
            stats["skipped_empty"] += 1
            continue
        school = d.get("school_name") or "Trường THCS"
        title = d.get("exam_title") or (
            f"Đề cương Toán {grade}" if is_cuong else f"Đề kiểm tra Toán {grade}"
        )
        save_extracted_exam(
            filename=f"thcs{grade}/{d['source_file']}",
            school_name=school,
            exam_title=title,
            academic_year=d.get("academic_year") or "",
            questions=questions,
            category=category,
            grade=grade,
            doc_type=d.get("doc_type") or "de_thi",
        )
        stats["imported"] += 1
        stats["q"] += len(questions)
    print(stats)


if __name__ == "__main__":
    main()
