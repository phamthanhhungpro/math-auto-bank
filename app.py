import os
import json
import base64
import urllib.request
import urllib.parse
from typing import Dict, Any, Optional, List
from fastapi import FastAPI, HTTPException, Request
from fastapi.responses import HTMLResponse, Response, RedirectResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel

from database import (
    init_db,
    EXAM_SLOTS,
    get_ingested_files,
    get_slot_counts,
    get_questions_by_slot,
    get_question_by_id,
    update_question,
    create_question,
    delete_question,
    delete_exam,
    mix_exam,
    swap_question_in_slot,
    save_mixed_exam_record,
    get_saved_exams,
    delete_saved_exam,
    authenticate_local_user,
    register_local_user,
    authenticate_or_create_google_user,
    get_user_by_id,
    get_all_users,
    update_user_role,
    get_setting,
    set_setting,
)
from extractor import (
    extract_exam_from_pdf,
    DEFAULT_API_URL,
    DEFAULT_MODEL,
    DEFAULT_API_KEY,
)
from qa_reviewer import run_qa_on_existing_exam
from exporter import build_exam_docx

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
STATIC_DIR = os.path.join(BASE_DIR, "static")
TEMPLATES_DIR = os.path.join(BASE_DIR, "templates")
GRADE10_DIR = r"C:\Users\hungp\Downloads\Grade10"

os.makedirs(os.path.join(STATIC_DIR, "figures"), exist_ok=True)
os.makedirs(TEMPLATES_DIR, exist_ok=True)

init_db()

app = FastAPI(title="MathBank 10 - Ngân Hàng & Trộn Đề Toán 10")
app.mount("/static", StaticFiles(directory=STATIC_DIR), name="static")


def create_session_token(user: Dict[str, Any]) -> str:
    payload = {
        "id": user["id"],
        "email": user["email"],
        "name": user["name"],
        "role": user["role"],
        "avatar": user.get("avatar") or "",
    }
    raw = json.dumps(payload, ensure_ascii=False).encode("utf-8")
    return "mb10." + base64.b64encode(raw).decode("ascii")


def get_current_user(request: Request) -> Optional[Dict[str, Any]]:
    auth = request.headers.get("Authorization") or ""
    if not auth.startswith("Bearer mb10."):
        return None
    try:
        b64 = auth[len("Bearer mb10.") :]
        payload = json.loads(base64.b64decode(b64).decode("utf-8"))
        db_user = get_user_by_id(int(payload["id"]))
        return db_user or payload
    except Exception:
        return None


def require_admin(request: Request) -> Dict[str, Any]:
    u = get_current_user(request)
    if not u or u.get("role") != "admin":
        raise HTTPException(
            status_code=403, detail="Cần quyền Quản trị viên (Admin) để thực hiện thao tác này"
        )
    return u


class LoginRequest(BaseModel):
    username: Optional[str] = None
    email: Optional[str] = None
    password: str


class RegisterRequest(BaseModel):
    name: str
    email: str
    password: str


class GoogleAuthRequest(BaseModel):
    access_token: Optional[str] = None
    credential: Optional[str] = None
    email: Optional[str] = None
    name: Optional[str] = None
    avatar: Optional[str] = None


class RoleUpdateRequest(BaseModel):
    role: str


class IngestRequest(BaseModel):
    filename: str
    api_url: str = DEFAULT_API_URL
    model: str = DEFAULT_MODEL
    api_key: str = DEFAULT_API_KEY


class QARequest(BaseModel):
    exam_id: int
    api_url: str = DEFAULT_API_URL
    model: str = DEFAULT_MODEL
    api_key: str = DEFAULT_API_KEY


class MixRequest(BaseModel):
    exclude_ids: List[int] = []


class SwapRequest(BaseModel):
    slot: str
    current_id: Optional[int] = None


class QuestionUpsertRequest(BaseModel):
    slot: str
    sub_topic: str = ""
    content: str
    solution: str = ""
    source_name: Optional[str] = None


class SaveExamRequest(BaseModel):
    exam_code: str = "101"
    title: str = "Đề thi vào 10"
    header_info: Dict[str, Any]
    slot_question_ids: Dict[str, Optional[int]]


class ExportDocxRequest(BaseModel):
    slot_question_ids: Dict[str, Optional[int]]
    custom_questions: Optional[Dict[str, Any]] = None
    org_name: str = "SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI"
    school_name: str = "ĐỀ THI CHÍNH THỨC"
    exam_title: str = "KỲ THI TUYỂN SINH VÀO LỚP 10 THPT"
    academic_year: str = "2026 - 2027"
    exam_code: str = "101"
    duration: str = "120 phút"
    include_solutions: bool = True


@app.get("/", response_class=HTMLResponse)
def index():
    html_path = os.path.join(TEMPLATES_DIR, "index.html")
    with open(html_path, "r", encoding="utf-8") as f:
        return f.read()


@app.get("/api/auth/me")
def api_auth_me(request: Request):
    return {"user": get_current_user(request)}


@app.post("/api/auth/login")
def api_auth_login(req: LoginRequest):
    ident = req.username or req.email or ""
    user = authenticate_local_user(ident, req.password)
    if not user:
        raise HTTPException(status_code=401, detail="Tài khoản hoặc mật khẩu không chính xác")
    return {"ok": True, "token": create_session_token(user), "user": user}


@app.post("/api/auth/register")
def api_auth_register(req: RegisterRequest):
    if not req.email or "@" not in req.email:
        raise HTTPException(status_code=400, detail="Vui lòng nhập địa chỉ email hợp lệ")
    if len(req.password or "") < 6:
        raise HTTPException(status_code=400, detail="Mật khẩu phải có ít nhất 6 ký tự")
    user = register_local_user(req.name, req.email, req.password)
    if not user:
        raise HTTPException(status_code=409, detail="Email này đã được đăng ký tài khoản")
    return {"ok": True, "token": create_session_token(user), "user": user}


@app.post("/api/auth/google")
def api_auth_google(req: GoogleAuthRequest):
    email = ""
    name = ""
    avatar = ""
    if req.access_token:
        url = "https://www.googleapis.com/oauth2/v3/userinfo"
        try:
            r = urllib.request.Request(url, headers={"Authorization": f"Bearer {req.access_token}"})
            with urllib.request.urlopen(r, timeout=10) as resp:
                gdata = json.loads(resp.read().decode("utf-8"))
                email = (gdata.get("email") or "").lower()
                name = gdata.get("name") or email.split("@")[0]
                avatar = gdata.get("picture") or ""
        except Exception:
            raise HTTPException(status_code=401, detail="Access Token Google không hợp lệ")
    elif req.credential:
        url = f"https://oauth2.googleapis.com/tokeninfo?id_token={req.credential}"
        try:
            with urllib.request.urlopen(url, timeout=10) as resp:
                gdata = json.loads(resp.read().decode("utf-8"))
                email = (gdata.get("email") or "").lower()
                name = gdata.get("name") or email.split("@")[0]
                avatar = gdata.get("picture") or ""
        except Exception:
            raise HTTPException(status_code=401, detail="Token Google không hợp lệ")
    elif req.email:
        email = req.email.strip().lower()
        name = (req.name or email.split("@")[0]).strip()
        avatar = req.avatar or ""

    if not email or "@" not in email:
        raise HTTPException(status_code=400, detail="Email Google không hợp lệ")

    user = authenticate_or_create_google_user(email=email, name=name, avatar=avatar)
    return {"ok": True, "token": create_session_token(user), "user": user}


@app.get("/api/auth/google/config")
def api_auth_google_config():
    client_id = os.environ.get("GOOGLE_CLIENT_ID") or get_setting("google_client_id", "")
    return {"configured": bool(client_id), "client_id": client_id}


@app.post("/api/settings/google-oauth")
def api_save_google_oauth(req: Dict[str, str], request: Request):
    require_admin(request)
    client_id = req.get("client_id", "").strip()
    client_secret = req.get("client_secret", "").strip()
    if client_id:
        set_setting("google_client_id", client_id)
    if client_secret:
        set_setting("google_client_secret", client_secret)
    return {"ok": True, "configured": bool(client_id and client_secret)}


@app.get("/api/auth/google/login")
def api_auth_google_login(request: Request):
    client_id = os.environ.get("GOOGLE_CLIENT_ID") or get_setting("google_client_id", "")
    if not client_id:
        return RedirectResponse(url="/?oauth_error=missing_client_id", status_code=302)
    redirect_uri = str(request.base_url).rstrip("/") + "/api/auth/google/callback"
    params = urllib.parse.urlencode({
        "client_id": client_id,
        "redirect_uri": redirect_uri,
        "response_type": "code",
        "scope": "openid email profile",
        "access_type": "offline",
        "prompt": "select_account",
    })
    return RedirectResponse(url=f"https://accounts.google.com/o/oauth2/v2/auth?{params}", status_code=302)


@app.get("/api/auth/google/callback")
def api_auth_google_callback(request: Request, code: Optional[str] = None, error: Optional[str] = None):
    if error or not code:
        return RedirectResponse(url=f"/?oauth_error={error or 'no_code'}", status_code=302)
    client_id = os.environ.get("GOOGLE_CLIENT_ID") or get_setting("google_client_id", "")
    client_secret = os.environ.get("GOOGLE_CLIENT_SECRET") or get_setting("google_client_secret", "")
    redirect_uri = str(request.base_url).rstrip("/") + "/api/auth/google/callback"

    token_url = "https://oauth2.googleapis.com/token"
    data = urllib.parse.urlencode({
        "code": code,
        "client_id": client_id,
        "client_secret": client_secret,
        "redirect_uri": redirect_uri,
        "grant_type": "authorization_code",
    }).encode("utf-8")
    req = urllib.request.Request(token_url, data=data, method="POST")
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            token_data = json.loads(resp.read().decode("utf-8"))
    except Exception:
        return RedirectResponse(url="/?oauth_error=token_exchange_failed", status_code=302)

    access_token = token_data.get("access_token")
    userinfo_url = "https://www.googleapis.com/oauth2/v3/userinfo"
    u_req = urllib.request.Request(userinfo_url, headers={"Authorization": f"Bearer {access_token}"})
    try:
        with urllib.request.urlopen(u_req, timeout=15) as resp:
            gdata = json.loads(resp.read().decode("utf-8"))
    except Exception:
        return RedirectResponse(url="/?oauth_error=userinfo_failed", status_code=302)

    email = (gdata.get("email") or "").lower()
    name = gdata.get("name") or email.split("@")[0]
    avatar = gdata.get("picture") or ""

    user = authenticate_or_create_google_user(email=email, name=name, avatar=avatar)
    token = create_session_token(user)
    return RedirectResponse(url=f"/?google_token={token}", status_code=302)



@app.get("/api/admin/users")
def api_admin_list_users(request: Request):
    require_admin(request)
    return {"users": get_all_users()}


@app.put("/api/admin/users/{uid}/role")
def api_admin_update_role(uid: int, req: RoleUpdateRequest, request: Request):
    require_admin(request)
    updated = update_user_role(uid, req.role)
    if not updated:
        raise HTTPException(status_code=404, detail="Không tìm thấy người dùng")
    return {"ok": True, "user": updated}


@app.get("/api/status")
def api_status():
    ingested = get_ingested_files()
    slot_counts = get_slot_counts()

    pdf_files = []
    if os.path.exists(GRADE10_DIR):
        all_files = [f for f in os.listdir(GRADE10_DIR) if f.lower().endswith(".pdf")]
        all_files.sort(
            key=lambda x: (
                0 if x.startswith(("de-tuyen-sinh", "de-thi-thu")) else 1,
                x.lower(),
            )
        )
        for fname in all_files:
            info = ingested.get(fname)
            pdf_files.append(
                {
                    "filename": fname,
                    "is_exam_file": fname.startswith(("de-tuyen-sinh", "de-thi-thu")),
                    "ingested": info is not None,
                    "exam_id": info["id"] if info else None,
                    "school_name": info["school_name"] if info else None,
                    "academic_year": info["academic_year"] if info else None,
                    "question_count": info["question_count"] if info else 0,
                    "ingested_at": info["ingested_at"] if info else None,
                }
            )

    existing_fnames = {f["filename"] for f in pdf_files}
    for k, info in ingested.items():
        if k not in existing_fnames:
            pdf_files.insert(
                0,
                {
                    "filename": k,
                    "is_exam_file": True,
                    "ingested": True,
                    "exam_id": info["id"],
                    "school_name": info["school_name"],
                    "academic_year": info["academic_year"],
                    "question_count": info["question_count"],
                    "ingested_at": info["ingested_at"],
                },
            )

    return {
        "slots": EXAM_SLOTS,
        "slot_counts": slot_counts,
        "total_questions": sum(slot_counts.values()),
        "total_ingested_exams": len(ingested),
        "saved_exams_count": len(get_saved_exams()),
        "pdf_files": pdf_files,
        "default_endpoint": {
            "api_url": DEFAULT_API_URL,
            "model": DEFAULT_MODEL,
            "api_key": DEFAULT_API_KEY,
        },
    }


@app.get("/api/questions")
def api_questions(slot: Optional[str] = None):
    return {"questions": get_questions_by_slot(slot)}


@app.post("/api/questions")
def api_create_question(req: QuestionUpsertRequest, request: Request):
    require_admin(request)
    q = create_question(
        slot=req.slot,
        sub_topic=req.sub_topic,
        content=req.content,
        solution=req.solution,
        source_name=req.source_name or "Tự soạn",
    )
    return {"ok": True, "question": q}


@app.put("/api/questions/{qid}")
def api_update_question(qid: int, req: QuestionUpsertRequest, request: Request):
    require_admin(request)
    q = update_question(
        qid=qid,
        slot=req.slot,
        sub_topic=req.sub_topic,
        content=req.content,
        solution=req.solution,
        source_name=req.source_name,
    )
    if not q:
        raise HTTPException(status_code=404, detail="Không tìm thấy câu hỏi")
    return {"ok": True, "question": q}


@app.delete("/api/questions/{qid}")
def api_delete_question(qid: int, request: Request):
    require_admin(request)
    ok = delete_question(qid)
    if not ok:
        raise HTTPException(status_code=404, detail="Không tìm thấy câu hỏi")
    return {"ok": True}


@app.delete("/api/exams/{exam_id}")
def api_delete_exam(exam_id: int, request: Request):
    require_admin(request)
    ok = delete_exam(exam_id)
    if not ok:
        raise HTTPException(status_code=404, detail="Không tìm thấy đề")
    return {"ok": True}


@app.post("/api/ingest")
def api_ingest(req: IngestRequest, request: Request):
    require_admin(request)
    pdf_path = os.path.join(GRADE10_DIR, req.filename)
    if not os.path.exists(pdf_path):
        raise HTTPException(status_code=404, detail=f"Không tìm thấy file {req.filename}")
    try:
        res = extract_exam_from_pdf(
            pdf_path=pdf_path,
            api_url=req.api_url,
            model=req.model,
            api_key=req.api_key,
        )
        return {"ok": True, "result": res}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/qa-exam")
def api_qa_exam(req: QARequest, request: Request):
    require_admin(request)
    try:
        res = run_qa_on_existing_exam(
            exam_id=req.exam_id,
            api_url=req.api_url,
            model=req.model,
            api_key=req.api_key,
        )
        return {"ok": True, "result": res}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/mix")
def api_mix(req: Optional[MixRequest] = None):
    exclude = req.exclude_ids if req else []
    mixed = mix_exam(exclude_ids=exclude)
    return {"ok": True, "exam": mixed}


@app.post("/api/swap")
def api_swap(req: SwapRequest):
    q = swap_question_in_slot(req.slot, req.current_id)
    if not q:
        raise HTTPException(status_code=404, detail=f"Chưa có câu hỏi cho vị trí {req.slot}")
    return {"ok": True, "question": q}


@app.get("/api/saved-exams")
def api_list_saved_exams():
    return {"saved_exams": get_saved_exams()}


@app.post("/api/saved-exams")
def api_save_exam(req: SaveExamRequest):
    rec = save_mixed_exam_record(
        exam_code=req.exam_code,
        title=req.title,
        header_info=req.header_info,
        slot_question_ids=req.slot_question_ids,
    )
    return {"ok": True, "saved_exam": rec}


@app.delete("/api/saved-exams/{sid}")
def api_delete_saved_exam(sid: int):
    ok = delete_saved_exam(sid)
    if not ok:
        raise HTTPException(status_code=404, detail="Không tìm thấy đề đã lưu")
    return {"ok": True}


@app.post("/api/export-docx")
def api_export_docx(req: ExportDocxRequest):
    questions_by_slot: Dict[str, Optional[Dict[str, Any]]] = {}
    custom = req.custom_questions or {}
    for slot_code, qid in req.slot_question_ids.items():
        if slot_code in custom and custom[slot_code]:
            questions_by_slot[slot_code] = custom[slot_code]
        elif qid is not None:
            questions_by_slot[slot_code] = get_question_by_id(int(qid))
        else:
            questions_by_slot[slot_code] = None

    header_info = {
        "org_name": req.org_name,
        "school_name": req.school_name,
        "exam_title": req.exam_title,
        "academic_year": req.academic_year,
        "exam_code": req.exam_code,
        "duration": req.duration,
    }
    docx_bytes = build_exam_docx(
        questions_by_slot=questions_by_slot,
        header_info=header_info,
        include_solutions=req.include_solutions,
    )
    filename = f"De_Toan_10_Ma_{req.exam_code}.docx"
    return Response(
        content=docx_bytes,
        media_type="application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        headers={"Content-Disposition": f'attachment; filename="{filename}"'},
    )
