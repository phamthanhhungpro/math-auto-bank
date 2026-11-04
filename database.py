import os
import json
import random
import sqlite3
from datetime import datetime
from typing import List, Dict, Optional, Any

DB_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "exam_bank.db")

EXAM_SLOTS = [
    {"code": "I.1", "group": "Bài I (1,5 điểm)", "label": "Thống kê (Bảng / Biểu đồ)", "points": "0,75 - 1,0đ"},
    {"code": "I.2", "group": "Bài I (1,5 điểm)", "label": "Xác suất của biến cố", "points": "0,5 - 0,75đ"},
    {"code": "II", "group": "Bài II (1,5 điểm)", "label": "Rút gọn căn thức & Bài toán phụ", "points": "1,5đ"},
    {"code": "III.1", "group": "Bài III (2,5 điểm)", "label": "Giải toán lập PT / HPT (Dạng 1)", "points": "1,0đ"},
    {"code": "III.2", "group": "Bài III (2,5 điểm)", "label": "Giải toán lập PT / HPT / BPT (Dạng 2)", "points": "1,0đ"},
    {"code": "III.3", "group": "Bài III (2,5 điểm)", "label": "Phương trình bậc hai & Vi-ét", "points": "0,5đ"},
    {"code": "IV.1", "group": "Bài IV (4,0 điểm)", "label": "Hình học không gian thực tế", "points": "1,0đ"},
    {"code": "IV.2", "group": "Bài IV (4,0 điểm)", "label": "Hình học phẳng (Đường tròn)", "points": "3,0đ"},
    {"code": "V", "group": "Bài V (0,5 điểm)", "label": "Toán thực tế vận dụng cao / Cực trị", "points": "0,5đ"},
]


def get_conn():
    conn = sqlite3.connect(DB_PATH, timeout=30.0)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA journal_mode=WAL;")
    return conn


def init_db():
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("""
        CREATE TABLE IF NOT EXISTS exams (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            filename TEXT UNIQUE,
            school_name TEXT,
            exam_title TEXT,
            academic_year TEXT,
            ingested_at TEXT
        )
    """)
    cur.execute("""
        CREATE TABLE IF NOT EXISTS questions (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            exam_id INTEGER,
            slot TEXT,
            sub_topic TEXT,
            content TEXT,
            figure_path TEXT,
            solution TEXT,
            source_name TEXT,
            FOREIGN KEY (exam_id) REFERENCES exams(id) ON DELETE CASCADE
        )
    """)
    cur.execute("""
        CREATE TABLE IF NOT EXISTS saved_exams (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            exam_code TEXT,
            title TEXT,
            header_json TEXT,
            slot_question_ids_json TEXT,
            created_at TEXT
        )
    """)
    cur.execute("""
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE,
            username TEXT,
            password TEXT,
            name TEXT,
            role TEXT DEFAULT 'user',
            provider TEXT DEFAULT 'local',
            avatar TEXT DEFAULT '',
            created_at TEXT
        )
    """)
    # Seed default Admin and User accounts
    now = datetime.now().strftime("%Y-%m-%d %H:%M")
    seeded = [
        ("thanhhungsky98@gmail.com", "admin", "admin123", "Hung Pham Thanh", "admin", "google"),
        ("admin@mathbank.vn", "admin@mathbank.vn", "admin123", "Quản trị viên Hệ thống", "admin", "local"),
        ("giaovien@mathbank.vn", "giaovien", "123456", "Cô Nguyễn Thị Lan (Giáo viên)", "user", "local"),
    ]
    for email, uname, pwd, name, role, prov in seeded:
        cur.execute(
            """
            INSERT OR IGNORE INTO users (email, username, password, name, role, provider, created_at)
            VALUES (?, ?, ?, ?, ?, ?, ?)
            """,
            (email, uname, pwd, name, role, prov, now),
        )
    conn.commit()
    conn.close()


def save_extracted_exam(
    filename: str,
    school_name: str,
    exam_title: str,
    academic_year: str,
    questions: List[Dict[str, Any]],
) -> int:
    conn = get_conn()
    cur = conn.cursor()
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    cur.execute("SELECT id FROM exams WHERE filename = ?", (filename,))
    existing = cur.fetchone()
    if existing:
        cur.execute("DELETE FROM questions WHERE exam_id = ?", (existing["id"],))
        cur.execute("DELETE FROM exams WHERE id = ?", (existing["id"],))

    cur.execute(
        """
        INSERT INTO exams (filename, school_name, exam_title, academic_year, ingested_at)
        VALUES (?, ?, ?, ?, ?)
        """,
        (filename, school_name, exam_title, academic_year, now),
    )
    exam_id = cur.lastrowid
    source_name = f"{school_name} ({academic_year})" if academic_year else school_name

    for q in questions:
        cur.execute(
            """
            INSERT INTO questions (exam_id, slot, sub_topic, content, figure_path, solution, source_name)
            VALUES (?, ?, ?, ?, ?, ?, ?)
            """,
            (
                exam_id,
                q.get("slot", ""),
                q.get("sub_topic", ""),
                q.get("content", ""),
                q.get("figure_path"),
                q.get("solution", ""),
                source_name,
            ),
        )

    conn.commit()
    conn.close()
    return exam_id


def delete_exam(exam_id: int) -> bool:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("DELETE FROM questions WHERE exam_id = ?", (exam_id,))
    cur.execute("DELETE FROM exams WHERE id = ?", (exam_id,))
    deleted = cur.rowcount > 0
    conn.commit()
    conn.close()
    return deleted


def get_ingested_files() -> Dict[str, Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("""
        SELECT e.*, COUNT(q.id) as question_count
        FROM exams e
        LEFT JOIN questions q ON e.id = q.exam_id
        GROUP BY e.id
        ORDER BY e.id DESC
    """)
    rows = [dict(r) for r in cur.fetchall()]
    conn.close()
    return {r["filename"]: r for r in rows}


def get_slot_counts() -> Dict[str, int]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT slot, COUNT(*) as cnt FROM questions GROUP BY slot")
    counts = {r["slot"]: r["cnt"] for r in cur.fetchall()}
    conn.close()
    return {s["code"]: counts.get(s["code"], 0) for s in EXAM_SLOTS}


def get_questions_by_slot(slot: Optional[str] = None) -> List[Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    if slot:
        cur.execute(
            "SELECT * FROM questions WHERE slot = ? ORDER BY id DESC", (slot,)
        )
    else:
        cur.execute("SELECT * FROM questions ORDER BY slot, id DESC")
    rows = [dict(r) for r in cur.fetchall()]
    conn.close()
    return rows


def get_question_by_id(qid: int) -> Optional[Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT * FROM questions WHERE id = ?", (qid,))
    row = cur.fetchone()
    conn.close()
    return dict(row) if row else None


def update_question(
    qid: int,
    slot: str,
    sub_topic: str,
    content: str,
    solution: str,
    source_name: Optional[str] = None,
) -> Optional[Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    if source_name is not None:
        cur.execute(
            """
            UPDATE questions
            SET slot = ?, sub_topic = ?, content = ?, solution = ?, source_name = ?
            WHERE id = ?
            """,
            (slot, sub_topic, content, solution, source_name, qid),
        )
    else:
        cur.execute(
            """
            UPDATE questions
            SET slot = ?, sub_topic = ?, content = ?, solution = ?
            WHERE id = ?
            """,
            (slot, sub_topic, content, solution, qid),
        )
    conn.commit()
    conn.close()
    return get_question_by_id(qid)


def create_question(
    slot: str,
    sub_topic: str,
    content: str,
    solution: str = "",
    source_name: str = "Tự soạn",
) -> Dict[str, Any]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute(
        """
        INSERT INTO questions (exam_id, slot, sub_topic, content, figure_path, solution, source_name)
        VALUES (NULL, ?, ?, ?, NULL, ?, ?)
        """,
        (slot, sub_topic, content, solution, source_name),
    )
    new_id = cur.lastrowid
    conn.commit()
    conn.close()
    return get_question_by_id(new_id)


def delete_question(qid: int) -> bool:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("DELETE FROM questions WHERE id = ?", (qid,))
    deleted = cur.rowcount > 0
    conn.commit()
    conn.close()
    return deleted


def mix_exam(exclude_ids: Optional[List[int]] = None) -> Dict[str, Any]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT * FROM questions")
    all_q = [dict(r) for r in cur.fetchall()]
    conn.close()

    exclude_set = set(exclude_ids or [])
    by_slot: Dict[str, List[Dict[str, Any]]] = {}
    for q in all_q:
        by_slot.setdefault(q["slot"], []).append(q)

    used_exam_counts: Dict[int, int] = {}
    selected: Dict[str, Optional[Dict[str, Any]]] = {}

    for slot_info in EXAM_SLOTS:
        code = slot_info["code"]
        candidates = by_slot.get(code, [])
        if not candidates:
            selected[code] = None
            continue

        # Prefer questions not in exclude_set if alternative exists
        non_excluded = [c for c in candidates if c["id"] not in exclude_set]
        pool = list(non_excluded if non_excluded else candidates)
        random.shuffle(pool)

        iii1_topic = None
        if code == "III.2" and selected.get("III.1"):
            iii1_topic = (selected["III.1"].get("sub_topic") or "").strip().lower()

        def score_candidate(c: Dict[str, Any]):
            exam_id_key = c.get("exam_id") or 0
            exam_usage = used_exam_counts.get(exam_id_key, 0)
            topic_penalty = 0
            if iii1_topic and (c.get("sub_topic") or "").strip().lower() == iii1_topic:
                topic_penalty = 10
            return (topic_penalty, exam_usage, random.random())

        pool.sort(key=score_candidate)
        chosen = pool[0]
        selected[code] = chosen
        exam_id_key = chosen.get("exam_id") or 0
        used_exam_counts[exam_id_key] = used_exam_counts.get(exam_id_key, 0) + 1

    return selected


def swap_question_in_slot(slot: str, current_id: Optional[int] = None) -> Optional[Dict[str, Any]]:
    candidates = get_questions_by_slot(slot)
    if not candidates:
        return None
    others = [c for c in candidates if c["id"] != current_id]
    if not others:
        return candidates[0]
    return random.choice(others)


def save_mixed_exam_record(
    exam_code: str,
    title: str,
    header_info: Dict[str, Any],
    slot_question_ids: Dict[str, Optional[int]],
) -> Dict[str, Any]:
    conn = get_conn()
    cur = conn.cursor()
    now = datetime.now().strftime("%Y-%m-%d %H:%M")
    cur.execute(
        """
        INSERT INTO saved_exams (exam_code, title, header_json, slot_question_ids_json, created_at)
        VALUES (?, ?, ?, ?, ?)
        """,
        (
            exam_code,
            title,
            json.dumps(header_info, ensure_ascii=False),
            json.dumps(slot_question_ids, ensure_ascii=False),
            now,
        ),
    )
    new_id = cur.lastrowid
    conn.commit()
    conn.close()
    return get_saved_exam_by_id(new_id)


def get_saved_exams() -> List[Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT * FROM saved_exams ORDER BY id DESC")
    rows = [dict(r) for r in cur.fetchall()]
    conn.close()
    result = []
    for r in rows:
        r["header"] = json.loads(r["header_json"] or "{}")
        r["slot_question_ids"] = json.loads(r["slot_question_ids_json"] or "{}")
        result.append(r)
    return result


def get_saved_exam_by_id(sid: int) -> Optional[Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT * FROM saved_exams WHERE id = ?", (sid,))
    row = cur.fetchone()
    conn.close()
    if not row:
        return None
    r = dict(row)
    r["header"] = json.loads(r["header_json"] or "{}")
    r["slot_question_ids"] = json.loads(r["slot_question_ids_json"] or "{}")
    return r


def delete_saved_exam(sid: int) -> bool:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("DELETE FROM saved_exams WHERE id = ?", (sid,))
    deleted = cur.rowcount > 0
    conn.commit()
    conn.close()
    return deleted


ADMIN_EMAILS = {"thanhhungsky98@gmail.com", "admin@mathbank.vn"}


def authenticate_local_user(identifier: str, password: str) -> Optional[Dict[str, Any]]:
    ident = (identifier or "").strip().lower()
    pwd = (password or "").strip()
    conn = get_conn()
    cur = conn.cursor()
    cur.execute(
        "SELECT id, email, username, name, role, provider, avatar FROM users WHERE (LOWER(email) = ? OR LOWER(username) = ?) AND password = ?",
        (ident, ident, pwd),
    )
    row = cur.fetchone()
    conn.close()
    return dict(row) if row else None


def authenticate_or_create_google_user(email: str, name: str, avatar: str = "") -> Dict[str, Any]:
    clean_email = (email or "").strip().lower()
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT id, email, username, name, role, provider, avatar FROM users WHERE LOWER(email) = ?", (clean_email,))
    row = cur.fetchone()
    if row:
        u = dict(row)
        if clean_email in ADMIN_EMAILS and u["role"] != "admin":
            cur.execute("UPDATE users SET role = 'admin' WHERE id = ?", (u["id"],))
            conn.commit()
            u["role"] = "admin"
        conn.close()
        return u

    role = "admin" if clean_email in ADMIN_EMAILS else "user"
    now = datetime.now().strftime("%Y-%m-%d %H:%M")
    uname = clean_email.split("@")[0]
    cur.execute(
        """
        INSERT INTO users (email, username, password, name, role, provider, avatar, created_at)
        VALUES (?, ?, '', ?, ?, 'google', ?, ?)
        """,
        (clean_email, uname, name or uname, role, avatar or "", now),
    )
    new_id = cur.lastrowid
    conn.commit()
    cur.execute("SELECT id, email, username, name, role, provider, avatar FROM users WHERE id = ?", (new_id,))
    created = dict(cur.fetchone())
    conn.close()
    return created


def get_user_by_id(uid: int) -> Optional[Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT id, email, username, name, role, provider, avatar FROM users WHERE id = ?", (uid,))
    row = cur.fetchone()
    conn.close()
    return dict(row) if row else None


def get_all_users() -> List[Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT id, email, username, name, role, provider, avatar, created_at FROM users ORDER BY id ASC")
    rows = [dict(r) for r in cur.fetchall()]
    conn.close()
    return rows


def update_user_role(uid: int, role: str) -> Optional[Dict[str, Any]]:
    new_role = "admin" if role == "admin" else "user"
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("UPDATE users SET role = ? WHERE id = ?", (new_role, uid))
    conn.commit()
    conn.close()
    return get_user_by_id(uid)

