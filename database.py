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

GRADES = [
    {"grade": 6, "label": "Lớp 6", "subtitle": "Toán 6 · Chương trình GDPT 2018"},
    {"grade": 7, "label": "Lớp 7", "subtitle": "Toán 7 · Chương trình GDPT 2018"},
    {"grade": 8, "label": "Lớp 8", "subtitle": "Toán 8 · Chương trình GDPT 2018"},
    {"grade": 9, "label": "Lớp 9", "subtitle": "Toán 9 · Ôn thi vào lớp 10"},
]
DEFAULT_GRADE = 9
THCS_TN_COUNT = 8

# Cấu trúc đề chuẩn Toán 6-7-8: Phần I Trắc nghiệm + Phần II Tự luận (Bài 1-5).
# "code" là vị trí trên tờ đề, "bank" là mã nhóm câu hỏi trong ngân hàng (các câu TN dùng chung 1 nhóm).
THCS_SECTIONS = [
    {
        "title": "PHẦN I. TRẮC NGHIỆM (2,0 điểm)",
        "slots": [
            {
                "code": f"TN.{i}",
                "bank": "TN",
                "prefix": f"Câu {i}. ",
                "label": "Trắc nghiệm khách quan",
                "points": "0,25đ",
            }
            for i in range(1, THCS_TN_COUNT + 1)
        ],
    },
    {
        "title": "PHẦN II. TỰ LUẬN (8,0 điểm)",
        "slots": [
            {"code": "TL.1", "bank": "TL.1", "prefix": "Bài 1. ", "label": "Tính toán / Biến đổi biểu thức", "points": "2,0đ"},
            {"code": "TL.2", "bank": "TL.2", "prefix": "Bài 2. ", "label": "Tìm x / Giải phương trình", "points": "2,0đ"},
            {"code": "TL.3", "bank": "TL.3", "prefix": "Bài 3. ", "label": "Toán thực tế / Bài toán có lời văn", "points": "1,5đ"},
            {"code": "TL.4", "bank": "TL.4", "prefix": "Bài 4. ", "label": "Hình học", "points": "2,0đ"},
            {"code": "TL.5", "bank": "TL.5", "prefix": "Bài 5. ", "label": "Vận dụng cao", "points": "0,5đ"},
        ],
    },
]

G9_SECTIONS = [
    {"title": "Bài I (1,5 điểm)", "slots": [("I.1", "1) "), ("I.2", "2) ")]},
    {"title": "Bài II (1,5 điểm)", "slots": [("II", "")]},
    {"title": "Bài III (2,5 điểm)", "slots": [("III.1", "1) "), ("III.2", "2) "), ("III.3", "3) ")]},
    {"title": "Bài IV (4,0 điểm)", "slots": [("IV.1", "1) "), ("IV.2", "2) ")]},
    {"title": "Bài V (0,5 điểm)", "slots": [("V", "")]},
]


def normalize_grade(grade: Any) -> int:
    try:
        g = int(grade)
    except (TypeError, ValueError):
        return DEFAULT_GRADE
    return g if g in {x["grade"] for x in GRADES} else DEFAULT_GRADE


def get_structure(grade: Any = DEFAULT_GRADE) -> List[Dict[str, Any]]:
    """Cấu trúc đề (sections -> slots) theo khối lớp. Mỗi slot có code/bank/prefix/label/points."""
    g = normalize_grade(grade)
    if g != 9:
        return THCS_SECTIONS
    by_code = {s["code"]: s for s in EXAM_SLOTS}
    sections = []
    for sec in G9_SECTIONS:
        slots = []
        for code, prefix in sec["slots"]:
            info = by_code[code]
            slots.append(
                {"code": code, "bank": code, "prefix": prefix, "label": info["label"], "points": info["points"]}
            )
        sections.append({"title": sec["title"], "slots": slots})
    return sections


def get_slot_defs(grade: Any = DEFAULT_GRADE) -> List[Dict[str, Any]]:
    return [s for sec in get_structure(grade) for s in sec["slots"]]


def get_bank_slot_defs(grade: Any = DEFAULT_GRADE) -> List[Dict[str, Any]]:
    """Danh sách nhóm câu hỏi trong ngân hàng (TN gộp 1 nhóm) dùng cho thống kê / bộ lọc."""
    g = normalize_grade(grade)
    if g != 9:
        return [
            {"code": "TN", "group": "Phần I. Trắc nghiệm", "label": "Trắc nghiệm khách quan", "points": "0,25đ/câu"},
            {"code": "TL.1", "group": "Phần II. Tự luận", "label": "Bài 1 · Tính toán / Biến đổi biểu thức", "points": "2,0đ"},
            {"code": "TL.2", "group": "Phần II. Tự luận", "label": "Bài 2 · Tìm x / Giải phương trình", "points": "2,0đ"},
            {"code": "TL.3", "group": "Phần II. Tự luận", "label": "Bài 3 · Toán thực tế / Có lời văn", "points": "1,5đ"},
            {"code": "TL.4", "group": "Phần II. Tự luận", "label": "Bài 4 · Hình học", "points": "2,0đ"},
            {"code": "TL.5", "group": "Phần II. Tự luận", "label": "Bài 5 · Vận dụng cao", "points": "0,5đ"},
        ]
    return EXAM_SLOTS


# Mô tả loại đề theo từng khối (dùng khi người dùng chọn khối 6/7/8).
THCS_CATEGORY_OVERRIDES = {
    "giua_hk1": {"default_title": "ĐỀ KIỂM TRA GIỮA HỌC KÌ 1", "default_duration": "90 phút"},
    "cuoi_hk1": {"default_title": "ĐỀ KIỂM TRA CUỐI HỌC KÌ 1", "default_duration": "90 phút"},
    "giua_hk2": {"default_title": "ĐỀ KIỂM TRA GIỮA HỌC KÌ 2", "default_duration": "90 phút"},
    "cuoi_hk2": {"default_title": "ĐỀ KIỂM TRA CUỐI HỌC KÌ 2", "default_duration": "90 phút"},
    "chuyen_de": {"default_title": "ĐỀ ÔN TẬP THEO ĐỀ CƯƠNG", "default_duration": "90 phút"},
}
THCS_CATEGORY_IDS = ["all", "giua_hk1", "cuoi_hk1", "giua_hk2", "cuoi_hk2", "chuyen_de"]

EXAM_CATEGORIES = [
    {
        "id": "all",
        "title": "Tất cả kỳ thi & Chuyên đề",
        "short_title": "Tất cả",
        "badge": "Toàn diện",
        "badge_color": "gray",
        "icon": "layers",
        "default_duration": "120 phút",
        "default_title": "ĐỀ THI MÔN TOÁN 9 — TỔNG HỢP",
        "description": "Kho toàn diện 140 đề thi và chuyên đề Toán 9 từ các trường trọng điểm."
    },
    {
        "id": "vao_10",
        "title": "Tuyển sinh vào Lớp 10 THPT",
        "short_title": "Tuyển sinh 10",
        "badge": "Vào 10",
        "badge_color": "navy",
        "icon": "award",
        "default_duration": "120 phút",
        "default_title": "ĐỀ THI TUYỂN SINH VÀO LỚP 10 THPT",
        "description": "Cấu trúc chuẩn 5 bài 10,0 điểm bám sát đề thi chính thức Sở GD&ĐT Hà Nội."
    },
    {
        "id": "giua_hk1",
        "title": "Khảo sát Giữa Học Kì 1",
        "short_title": "Giữa HK1",
        "badge": "Giữa HK1",
        "badge_color": "amber",
        "icon": "clipboard-check",
        "default_duration": "90 phút",
        "default_title": "ĐỀ KHẢO SÁT CHẤT LƯỢNG GIỮA HỌC KÌ 1 — MÔN TOÁN 9",
        "description": "Nội dung trọng tâm: Căn bậc hai, rút gọn biểu thức và Hệ thức lượng trong tam giác vuông."
    },
    {
        "id": "cuoi_hk1",
        "title": "Kiểm tra Cuối Học Kì 1",
        "short_title": "Cuối HK1",
        "badge": "Cuối HK1",
        "badge_color": "teal",
        "icon": "book-marked",
        "default_duration": "90 phút",
        "default_title": "ĐỀ KIỂM TRA ĐÁNH GIÁ CUỐI HỌC KÌ 1 — MÔN TOÁN 9",
        "description": "Nội dung toàn diện HK1: Căn thức, Hàm số bậc nhất và Đường tròn (tiếp tuyến, dây cung)."
    },
    {
        "id": "giua_hk2",
        "title": "Khảo sát Giữa Học Kì 2",
        "short_title": "Giữa HK2",
        "badge": "Giữa HK2",
        "badge_color": "amber",
        "icon": "calendar-check",
        "default_duration": "90 phút",
        "default_title": "ĐỀ KHẢO SÁT CHẤT LƯỢNG GIỮA HỌC KÌ 2 — MÔN TOÁN 9",
        "description": "Nội dung trọng tâm: Hệ phương trình bậc nhất hai ẩn, Giải bài toán bằng cách lập hệ PT và Góc với đường tròn."
    },
    {
        "id": "cuoi_hk2",
        "title": "Kiểm tra Cuối Học Kì 2",
        "short_title": "Cuối HK2",
        "badge": "Cuối HK2",
        "badge_color": "teal",
        "icon": "graduation-cap",
        "default_duration": "90 phút",
        "default_title": "ĐỀ KIỂM TRA ĐÁNH GIÁ CUỐI HỌC KÌ 2 — MÔN TOÁN 9",
        "description": "Nội dung tổng hợp HK2: Phương trình bậc hai, Định lý Vi-ét, Tứ giác nội tiếp và Hình không gian thực tế."
    },
    {
        "id": "chuyen_de",
        "title": "Chuyên đề Ôn thi Trọng tâm",
        "short_title": "Chuyên đề",
        "badge": "Chuyên đề",
        "badge_color": "indigo",
        "icon": "sparkles",
        "default_duration": "90 phút",
        "default_title": "CHUYÊN ĐỀ ÔN THI TOÁN 9 TRỌNG TÂM",
        "description": "Các chuyên đề rèn luyện nâng cao: Bất đẳng thức Min/Max, Mô hình hình học phẳng và Toán thực tế."
    }
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
    cur.execute("""
        CREATE TABLE IF NOT EXISTS settings (
            key TEXT PRIMARY KEY,
            value TEXT
        )
    """)

    def _ensure_column(table: str, column: str, ddl: str):
        cols = [r[1] for r in cur.execute(f"PRAGMA table_info({table})").fetchall()]
        if column not in cols:
            cur.execute(f"ALTER TABLE {table} ADD COLUMN {column} {ddl}")

    _ensure_column("exams", "category", "TEXT DEFAULT 'vao_10'")
    _ensure_column("exams", "grade", "INTEGER DEFAULT 9")
    _ensure_column("exams", "doc_type", "TEXT DEFAULT 'de_thi'")
    _ensure_column("questions", "grade", "INTEGER DEFAULT 9")
    _ensure_column("questions", "qkind", "TEXT DEFAULT ''")
    cur.execute("CREATE INDEX IF NOT EXISTS idx_questions_grade_slot ON questions(grade, slot)")
    cur.execute("CREATE INDEX IF NOT EXISTS idx_exams_grade_cat ON exams(grade, category)")
    # Seed single default Admin account in database only
    now = datetime.now().strftime("%Y-%m-%d %H:%M")
    cur.execute("DELETE FROM users WHERE email IN ('giaovien@mathbank.vn', 'admin@mathbank.vn')")
    seeded = [
        ("thanhhungsky98@gmail.com", "admin", "admin123", "Quản trị viên", "admin", "local"),
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
    category: Optional[str] = None,
    grade: int = DEFAULT_GRADE,
    doc_type: str = "de_thi",
) -> int:
    conn = get_conn()
    cur = conn.cursor()
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    grade = normalize_grade(grade)

    cur.execute("SELECT id FROM exams WHERE filename = ?", (filename,))
    existing = cur.fetchone()
    if existing:
        cur.execute("DELETE FROM questions WHERE exam_id = ?", (existing["id"],))
        cur.execute("DELETE FROM exams WHERE id = ?", (existing["id"],))

    cur.execute(
        """
        INSERT INTO exams (filename, school_name, exam_title, academic_year, ingested_at, category, grade, doc_type)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """,
        (filename, school_name, exam_title, academic_year, now, category or "vao_10", grade, doc_type),
    )
    exam_id = cur.lastrowid
    source_name = f"{school_name} ({academic_year})" if academic_year else school_name

    for q in questions:
        cur.execute(
            """
            INSERT INTO questions (exam_id, slot, sub_topic, content, figure_path, solution, source_name, grade, qkind)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """,
            (
                exam_id,
                q.get("slot", ""),
                q.get("sub_topic", ""),
                q.get("content", ""),
                q.get("figure_path"),
                q.get("solution", ""),
                source_name,
                grade,
                q.get("qkind", ""),
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


def get_categories(grade: Any = None) -> List[Dict[str, Any]]:
    g = normalize_grade(grade) if grade is not None else None
    conn = get_conn()
    cur = conn.cursor()
    if g is None:
        cur.execute("SELECT category, COUNT(*) as cnt FROM exams GROUP BY category")
    else:
        cur.execute("SELECT category, COUNT(*) as cnt FROM exams WHERE grade = ? GROUP BY category", (g,))
    counts = {r["category"]: r["cnt"] for r in cur.fetchall()}
    total = sum(counts.values())
    conn.close()

    result = []
    for cat in EXAM_CATEGORIES:
        if g is not None and g != 9 and cat["id"] not in THCS_CATEGORY_IDS:
            continue
        item = dict(cat)
        if g is not None and g != 9:
            item["default_title"] = _thcs_title(cat["id"], g)
            item["description"] = _thcs_description(cat["id"], g)
            item["default_duration"] = THCS_CATEGORY_OVERRIDES.get(cat["id"], {}).get(
                "default_duration", "90 phút"
            )
        if item["id"] == "all":
            item["count"] = total
        else:
            item["count"] = counts.get(item["id"], 0)
        result.append(item)
    return result


def _thcs_title(cat_id: str, grade: int) -> str:
    if cat_id == "all":
        return f"ĐỀ KIỂM TRA MÔN TOÁN {grade} — TỔNG HỢP"
    base = THCS_CATEGORY_OVERRIDES.get(cat_id, {}).get("default_title", "ĐỀ KIỂM TRA")
    return f"{base} — MÔN TOÁN {grade}"


def _thcs_description(cat_id: str, grade: int) -> str:
    texts = {
        "all": f"Toàn bộ kho đề kiểm tra Toán {grade} từ nhiều trường THCS trên cả nước.",
        "giua_hk1": f"Đề khảo sát giữa học kì 1 môn Toán {grade} bám sát chương trình GDPT 2018.",
        "cuoi_hk1": f"Đề kiểm tra cuối học kì 1 môn Toán {grade}: trắc nghiệm kết hợp tự luận.",
        "giua_hk2": f"Đề khảo sát giữa học kì 2 môn Toán {grade} theo cấu trúc mới.",
        "cuoi_hk2": f"Đề kiểm tra cuối học kì 2 môn Toán {grade}: tổng hợp kiến thức cả năm.",
        "chuyen_de": f"Bài tập ôn tập trích từ đề cương Toán {grade} của các trường.",
    }
    return texts.get(cat_id, "")


def get_ingested_files(category: Optional[str] = None, grade: Any = None) -> Dict[str, Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    query = """
        SELECT e.*, COUNT(q.id) as question_count
        FROM exams e
        LEFT JOIN questions q ON e.id = q.exam_id
    """
    params = []
    conds = []
    if category and category != "all":
        conds.append("e.category = ?")
        params.append(category)
    if grade is not None:
        conds.append("e.grade = ?")
        params.append(normalize_grade(grade))
    if conds:
        query += " WHERE " + " AND ".join(conds)
    query += " GROUP BY e.id ORDER BY e.id DESC"
    cur.execute(query, params)
    rows = [dict(r) for r in cur.fetchall()]
    conn.close()
    return {r["filename"]: r for r in rows}


def get_slot_counts(grade: Any = DEFAULT_GRADE, category: Optional[str] = None) -> Dict[str, int]:
    g = normalize_grade(grade)
    conn = get_conn()
    cur = conn.cursor()
    query = "SELECT q.slot as slot, COUNT(*) as cnt FROM questions q LEFT JOIN exams e ON q.exam_id = e.id WHERE q.grade = ?"
    params: List[Any] = [g]
    if category and category != "all":
        query += " AND e.category = ?"
        params.append(category)
    query += " GROUP BY q.slot"
    cur.execute(query, params)
    counts = {r["slot"]: r["cnt"] for r in cur.fetchall()}
    conn.close()
    return {s["code"]: counts.get(s["code"], 0) for s in get_bank_slot_defs(g)}


def get_questions_by_slot(
    slot: Optional[str] = None, category: Optional[str] = None, grade: Any = None
) -> List[Dict[str, Any]]:
    conn = get_conn()
    cur = conn.cursor()
    query = """
        SELECT q.*, e.category, e.school_name as exam_school, e.exam_title, e.academic_year
        FROM questions q
        LEFT JOIN exams e ON q.exam_id = e.id
    """
    conditions = []
    params = []
    if grade is not None:
        conditions.append("q.grade = ?")
        params.append(normalize_grade(grade))
    if slot:
        conditions.append("q.slot = ?")
        params.append(slot)
    if category and category != "all":
        conditions.append("e.category = ?")
        params.append(category)
    if conditions:
        query += " WHERE " + " AND ".join(conditions)
    query += " ORDER BY q.slot, q.id DESC"
    cur.execute(query, params)
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
    grade: Any = DEFAULT_GRADE,
) -> Dict[str, Any]:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute(
        """
        INSERT INTO questions (exam_id, slot, sub_topic, content, figure_path, solution, source_name, grade)
        VALUES (NULL, ?, ?, ?, NULL, ?, ?, ?)
        """,
        (slot, sub_topic, content, solution, source_name, normalize_grade(grade)),
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


def mix_exam(
    exclude_ids: Optional[List[int]] = None,
    category: Optional[str] = None,
    grade: Any = DEFAULT_GRADE,
) -> Dict[str, Any]:
    g = normalize_grade(grade)
    conn = get_conn()
    cur = conn.cursor()
    cur.execute(
        """
        SELECT q.*, coalesce(e.category, 'vao_10') as category
        FROM questions q
        LEFT JOIN exams e ON q.exam_id = e.id
        WHERE q.grade = ?
        """,
        (g,),
    )
    all_q = [dict(r) for r in cur.fetchall()]
    conn.close()

    exclude_set = set(exclude_ids or [])
    by_bank: Dict[str, List[Dict[str, Any]]] = {}
    for q in all_q:
        by_bank.setdefault(q["slot"], []).append(q)

    used_exam_counts: Dict[int, int] = {}
    used_topics: Dict[str, int] = {}
    chosen_ids = set()
    selected: Dict[str, Optional[Dict[str, Any]]] = {}

    for slot_info in get_slot_defs(g):
        code = slot_info["code"]
        bank = slot_info.get("bank", code)
        candidates = [c for c in by_bank.get(bank, []) if c["id"] not in chosen_ids]
        if not candidates:
            selected[code] = None
            continue

        # Phần trắc nghiệm: ưu tiên câu nhiều lựa chọn A/B/C/D (Đúng/Sai, trả lời ngắn chỉ chọn thủ công)
        if bank == "TN":
            mcq_only = [c for c in candidates if (c.get("qkind") or "mcq") == "mcq"]
            if mcq_only:
                candidates = mcq_only

        # If a category is requested and has items in this slot, filter to it
        matching = candidates
        if category and category != "all":
            in_cat = [c for c in candidates if c.get("category") == category]
            if in_cat:
                matching = in_cat

        # Prefer questions not in exclude_set if alternative exists
        non_excluded = [c for c in matching if c["id"] not in exclude_set]
        pool = list(non_excluded if non_excluded else matching)
        random.shuffle(pool)

        iii1_topic = None
        if code == "III.2" and selected.get("III.1"):
            iii1_topic = (selected["III.1"].get("sub_topic") or "").strip().lower()

        def score_candidate(c: Dict[str, Any]):
            exam_id_key = c.get("exam_id") or 0
            exam_usage = used_exam_counts.get(exam_id_key, 0)
            topic_key = (c.get("sub_topic") or "").strip().lower()
            topic_penalty = 0
            if iii1_topic and topic_key == iii1_topic:
                topic_penalty = 10
            # Đề THCS: tránh lặp cùng một dạng toán trong 1 đề
            repeat_topic = used_topics.get(topic_key, 0) if (g != 9 and topic_key) else 0
            return (topic_penalty, repeat_topic, exam_usage, random.random())

        pool.sort(key=score_candidate)
        chosen = pool[0]
        selected[code] = chosen
        chosen_ids.add(chosen["id"])
        exam_id_key = chosen.get("exam_id") or 0
        used_exam_counts[exam_id_key] = used_exam_counts.get(exam_id_key, 0) + 1
        tk = (chosen.get("sub_topic") or "").strip().lower()
        if tk:
            used_topics[tk] = used_topics.get(tk, 0) + 1

    return selected


def swap_question_in_slot(
    slot: str,
    current_id: Optional[int] = None,
    category: Optional[str] = None,
    grade: Any = DEFAULT_GRADE,
) -> Optional[Dict[str, Any]]:
    candidates = get_questions_by_slot(slot, category=category, grade=grade)
    if not candidates and category and category != "all":
        candidates = get_questions_by_slot(slot, grade=grade)
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


def register_local_user(name: str, email: str, password: str) -> Optional[Dict[str, Any]]:
    clean_email = (email or "").strip().lower()
    clean_name = (name or "").strip() or clean_email.split("@")[0]
    pwd = (password or "").strip()
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT id FROM users WHERE LOWER(email) = ?", (clean_email,))
    if cur.fetchone():
        conn.close()
        return None
    role = "admin" if clean_email in ADMIN_EMAILS else "user"
    now = datetime.now().strftime("%Y-%m-%d %H:%M")
    uname = clean_email.split("@")[0]
    cur.execute(
        """
        INSERT INTO users (email, username, password, name, role, provider, avatar, created_at)
        VALUES (?, ?, ?, ?, ?, 'local', '', ?)
        """,
        (clean_email, uname, pwd, clean_name, role, now),
    )
    new_id = cur.lastrowid
    conn.commit()
    cur.execute("SELECT id, email, username, name, role, provider, avatar FROM users WHERE id = ?", (new_id,))
    created = dict(cur.fetchone())
    conn.close()
    return created


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


def get_setting(key: str, default: str = "") -> str:
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT value FROM settings WHERE key = ?", (key,))
    row = cur.fetchone()
    conn.close()
    return row["value"] if row else default


def set_setting(key: str, value: str):
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("INSERT OR REPLACE INTO settings (key, value) VALUES (?, ?)", (key, value))
    conn.commit()
    conn.close()


