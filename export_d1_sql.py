import os
import sqlite3


def export_to_d1_sql():
    os.makedirs("migrations", exist_ok=True)
    conn = sqlite3.connect("exam_bank.db")
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    lines = [
        "DROP TABLE IF EXISTS questions;",
        "DROP TABLE IF EXISTS exams;",
        "CREATE TABLE IF NOT EXISTS exams (id INTEGER PRIMARY KEY AUTOINCREMENT, filename TEXT UNIQUE, school_name TEXT, exam_title TEXT, academic_year TEXT, ingested_at TEXT);",
        "CREATE TABLE IF NOT EXISTS questions (id INTEGER PRIMARY KEY AUTOINCREMENT, exam_id INTEGER, slot TEXT, sub_topic TEXT, content TEXT, figure_path TEXT, solution TEXT, source_name TEXT);",
        "CREATE INDEX IF NOT EXISTS idx_questions_slot ON questions(slot);",
        "CREATE TABLE IF NOT EXISTS saved_exams (id INTEGER PRIMARY KEY AUTOINCREMENT, exam_code TEXT, title TEXT, header_json TEXT, slot_question_ids_json TEXT, created_at TEXT);",
    ]

    def esc(val):
        if val is None:
            return "NULL"
        if isinstance(val, (int, float)):
            return str(val)
        s_raw = str(val).replace("'", "''")
        return f"'{s_raw}'"

    cur.execute("SELECT * FROM exams ORDER BY id")
    exams = cur.fetchall()
    for r in exams:
        lines.append(
            f"INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES ({esc(r['id'])}, {esc(r['filename'])}, {esc(r['school_name'])}, {esc(r['exam_title'])}, {esc(r['academic_year'])}, {esc(r['ingested_at'])});"
        )

    cur.execute("SELECT * FROM questions ORDER BY id")
    questions = cur.fetchall()
    for r in questions:
        lines.append(
            f"INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES ({esc(r['id'])}, {esc(r['exam_id'])}, {esc(r['slot'])}, {esc(r['sub_topic'])}, {esc(r['content'])}, {esc(r['figure_path'])}, {esc(r['solution'])}, {esc(r['source_name'])});"
        )

    out_path = os.path.join("migrations", "0001_init.sql")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

    print(f"Exported {len(exams)} exams and {len(questions)} questions to {out_path}")


if __name__ == "__main__":
    export_to_d1_sql()
