"""Export THCS (grade 6-8) question banks from exam_bank.db into static JSON assets for the Cloudflare deployment.

Outputs:
  public/data/grade-{6,7,8}.json   -> {"exams": [...], "questions": [...]}
  public/data/index.json           -> {"6": {"questions": n, "exams": m}, ...}
  public/static/figures/thcs*.png  -> copied from static/figures
"""
import json
import os
import shutil
import sqlite3
import sys

sys.stdout.reconfigure(encoding="utf-8")
BASE = os.path.dirname(os.path.abspath(__file__))
conn = sqlite3.connect(os.path.join(BASE, "exam_bank.db"))
conn.row_factory = sqlite3.Row
cur = conn.cursor()

out_dir = os.path.join(BASE, "public", "data")
os.makedirs(out_dir, exist_ok=True)
fig_src = os.path.join(BASE, "static", "figures")
fig_dst = os.path.join(BASE, "public", "static", "figures")
os.makedirs(fig_dst, exist_ok=True)

index = {}
used_figs = set()
for grade in (6, 7, 8):
    exams = [
        dict(r)
        for r in cur.execute(
            "SELECT id, filename, school_name, exam_title, academic_year, category, ingested_at, doc_type FROM exams WHERE grade = ? ORDER BY id",
            (grade,),
        )
    ]
    questions = []
    for r in cur.execute(
        """
        SELECT q.id, q.exam_id, q.slot, q.sub_topic, q.content, q.figure_path, q.solution, q.source_name,
               q.qkind, coalesce(e.category, 'chuyen_de') AS category
        FROM questions q LEFT JOIN exams e ON q.exam_id = e.id
        WHERE q.grade = ? ORDER BY q.id
        """,
        (grade,),
    ):
        d = dict(r)
        d["grade"] = grade
        if d.get("figure_path"):
            used_figs.add(os.path.basename(d["figure_path"]))
        questions.append(d)
    counts = {}
    for e in exams:
        counts[e["id"]] = 0
    for q in questions:
        if q["exam_id"] in counts:
            counts[q["exam_id"]] += 1
    for e in exams:
        e["question_count"] = counts[e["id"]]
    with open(os.path.join(out_dir, f"grade-{grade}.json"), "w", encoding="utf-8") as f:
        json.dump({"exams": exams, "questions": questions}, f, ensure_ascii=False, separators=(",", ":"))
    index[str(grade)] = {"questions": len(questions), "exams": len(exams)}
    size = os.path.getsize(os.path.join(out_dir, f"grade-{grade}.json")) / 1024
    print(f"grade {grade}: {len(exams)} exams, {len(questions)} questions, {size:.0f} KB")

with open(os.path.join(out_dir, "index.json"), "w", encoding="utf-8") as f:
    json.dump(index, f)

def optimize_png(path: str) -> None:
    """Giảm dung lượng ảnh hình vẽ (palette 96 màu) - bỏ qua nếu đã tối ưu."""
    try:
        from PIL import Image

        im = Image.open(path)
        if im.mode == "P":
            return
        q = im.convert("RGB").quantize(colors=96, method=Image.Quantize.MEDIANCUT, dither=Image.Dither.NONE)
        q.save(path, "PNG", optimize=True)
    except Exception as e:  # noqa: BLE001
        print("optimize skipped", path, e)


copied = 0
for name in sorted(used_figs):
    src = os.path.join(fig_src, name)
    if os.path.exists(src):
        optimize_png(src)
        shutil.copy2(src, os.path.join(fig_dst, name))
        copied += 1
print(f"figures copied: {copied} / {len(used_figs)} referenced")
