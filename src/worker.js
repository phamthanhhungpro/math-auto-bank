import { INITIAL_SEED } from "./seed_data.js";

const EXAM_SLOTS = [
  { code: "I.1", group: "Bài I (1,5 điểm)", label: "Thống kê (Bảng / Biểu đồ)", points: "0,75 - 1,0đ" },
  { code: "I.2", group: "Bài I (1,5 điểm)", label: "Xác suất của biến cố", points: "0,5 - 0,75đ" },
  { code: "II", group: "Bài II (1,5 điểm)", label: "Rút gọn căn thức & Bài toán phụ", points: "1,5đ" },
  { code: "III.1", group: "Bài III (2,5 điểm)", label: "Giải toán lập PT / HPT (Dạng 1)", points: "1,0đ" },
  { code: "III.2", group: "Bài III (2,5 điểm)", label: "Giải toán lập PT / HPT / BPT (Dạng 2)", points: "1,0đ" },
  { code: "III.3", group: "Bài III (2,5 điểm)", label: "Phương trình bậc hai & Vi-ét", points: "0,5đ" },
  { code: "IV.1", group: "Bài IV (4,0 điểm)", label: "Hình học không gian thực tế", points: "1,0đ" },
  { code: "IV.2", group: "Bài IV (4,0 điểm)", label: "Hình học phẳng (Đường tròn)", points: "3,0đ" },
  { code: "V", group: "Bài V (0,5 điểm)", label: "Toán thực tế vận dụng cao / Cực trị", points: "0,5đ" },
];

const EXAM_SECTIONS = [
  { title: "Bài I (1,5 điểm)", slots: [{ code: "I.1", prefix: "1) " }, { code: "I.2", prefix: "2) " }] },
  { title: "Bài II (1,5 điểm)", slots: [{ code: "II", prefix: "" }] },
  { title: "Bài III (2,5 điểm)", slots: [{ code: "III.1", prefix: "1) " }, { code: "III.2", prefix: "2) " }, { code: "III.3", prefix: "3) " }] },
  { title: "Bài IV (4,0 điểm)", slots: [{ code: "IV.1", prefix: "1) " }, { code: "IV.2", prefix: "2) " }] },
  { title: "Bài V (0,5 điểm)", slots: [{ code: "V", prefix: "" }] },
];

const SEEDED_USERS = [
  {
    id: 1,
    email: "thanhhungsky98@gmail.com",
    username: "admin",
    password: "admin123",
    name: "Quản trị viên",
    role: "admin",
    provider: "local",
    avatar: "",
    created_at: "2026-11-04 08:00",
  },
];

const ADMIN_EMAILS = new Set(["thanhhungsky98@gmail.com"]);

let memoryState = null;

function ensureSeededUsers(usersList) {
  const removedEmails = new Set(["giaovien@mathbank.vn", "admin@mathbank.vn"]);
  const list = Array.isArray(usersList)
    ? usersList.filter((u) => !removedEmails.has(String(u.email || "").toLowerCase()))
    : [];
  for (const su of SEEDED_USERS) {
    if (!list.some((u) => u.email.toLowerCase() === su.email.toLowerCase())) {
      list.push({ ...su });
    }
  }
  return list;
}

async function getState(env) {
  if (memoryState) return memoryState;
  if (env.KV) {
    try {
      const stored = await env.KV.get("BANK_STATE_V2", "json");
      if (stored && Array.isArray(stored.questions)) {
        stored.users = ensureSeededUsers(stored.users);
        if (!Array.isArray(stored.saved_exams)) stored.saved_exams = [];
        memoryState = stored;
        return memoryState;
      }
      // Fallback check V1
      const storedV1 = await env.KV.get("BANK_STATE_V1", "json");
      if (storedV1 && Array.isArray(storedV1.questions)) {
        storedV1.users = ensureSeededUsers(storedV1.users);
        if (!Array.isArray(storedV1.saved_exams)) storedV1.saved_exams = [];
        memoryState = storedV1;
        return memoryState;
      }
    } catch (_) {}
  }
  memoryState = {
    exams: [...INITIAL_SEED.exams],
    questions: [...INITIAL_SEED.questions],
    saved_exams: [],
    users: ensureSeededUsers([]),
  };
  return memoryState;
}

async function persistState(env, state) {
  memoryState = state;
  if (env.KV) {
    await env.KV.put("BANK_STATE_V2", JSON.stringify(state));
  }
}

function jsonResponse(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Content-Type, Authorization",
      "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
    },
  });
}

function nowFormatted() {
  const d = new Date();
  return d.toISOString().replace("T", " ").slice(0, 16);
}

// Simple stateless token encoding/verification
function createSessionToken(user) {
  const payload = {
    id: user.id,
    email: user.email,
    name: user.name,
    role: user.role,
    avatar: user.avatar || "",
    exp: Date.now() + 1000 * 60 * 60 * 24 * 14, // 14 days
  };
  const jsonStr = JSON.stringify(payload);
  const bytes = new TextEncoder().encode(jsonStr);
  let bin = "";
  for (let i = 0; i < bytes.length; i++) bin += String.fromCharCode(bytes[i]);
  return "mb10." + btoa(bin);
}

function parseSessionToken(request, state) {
  const auth = request.headers.get("Authorization") || "";
  if (!auth.startsWith("Bearer mb10.")) return null;
  try {
    const b64 = auth.slice("Bearer mb10.".length);
    const bin = atob(b64);
    const bytes = new Uint8Array(bin.length);
    for (let i = 0; i < bin.length; i++) bytes[i] = bin.charCodeAt(i);
    const payload = JSON.parse(new TextDecoder().decode(bytes));
    if (payload.exp && payload.exp < Date.now()) return null;
    // Lookup latest role from state.users
    if (state && Array.isArray(state.users)) {
      const dbUser = state.users.find(
        (u) => u.id === payload.id || u.email.toLowerCase() === String(payload.email || "").toLowerCase()
      );
      if (dbUser) {
        return {
          id: dbUser.id,
          email: dbUser.email,
          name: dbUser.name,
          role: dbUser.role,
          avatar: dbUser.avatar || "",
        };
      }
    }
    return payload;
  } catch (_) {
    return null;
  }
}

// ============================================================================
// NATIVE MICROSOFT WORD OMML EQUATION CONVERTER (LaTeX -> <m:oMath>)
// ============================================================================

function xmlEscape(str) {
  return String(str || "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

const LATEX_SYMBOLS = {
  "\\cdot": "⋅",
  "\\times": "×",
  "\\div": "÷",
  "\\pm": "±",
  "\\mp": "∓",
  "\\le": "≤",
  "\\leq": "≤",
  "\\ge": "≥",
  "\\geq": "≥",
  "\\ne": "≠",
  "\\neq": "≠",
  "\\approx": "≈",
  "\\equiv": "≡",
  "\\sim": "∽",
  "\\backsim": "∽",
  "\\cong": "≅",
  "\\propto": "∝",
  "\\infty": "∞",
  "\\partial": "∂",
  "\\nabla": "∇",
  "\\forall": "∀",
  "\\exists": "∃",
  "\\emptyset": "∅",
  "\\varnothing": "∅",
  "\\in": "∈",
  "\\notin": "∉",
  "\\ni": "∋",
  "\\subset": "⊂",
  "\\subseteq": "⊆",
  "\\supset": "⊃",
  "\\supseteq": "⊇",
  "\\cup": "∪",
  "\\cap": "∩",
  "\\setminus": "∖",
  "\\Rightarrow": "⇒",
  "\\implies": "⇒",
  "\\Leftrightarrow": "⇔",
  "\\iff": "⇔",
  "\\rightarrow": "→",
  "\\to": "→",
  "\\leftarrow": "←",
  "\\leftrightarrow": "↔",
  "\\mapsto": "↦",
  "\\uparrow": "↑",
  "\\downarrow": "↓",
  "\\perp": "⊥",
  "\\parallel": "∥",
  "\\angle": "∠",
  "\\triangle": "△",
  "\\square": "□",
  "\\circ": "°",
  "\\dots": "…",
  "\\ldots": "…",
  "\\cdots": "⋯",
  "\\vdots": "⋮",
  "\\ddots": "⋱",
  "\\alpha": "α",
  "\\beta": "β",
  "\\gamma": "γ",
  "\\delta": "δ",
  "\\epsilon": "ϵ",
  "\\varepsilon": "ε",
  "\\zeta": "ζ",
  "\\eta": "η",
  "\\theta": "θ",
  "\\vartheta": "ϑ",
  "\\iota": "ι",
  "\\kappa": "κ",
  "\\lambda": "λ",
  "\\mu": "μ",
  "\\nu": "ν",
  "\\xi": "ξ",
  "\\pi": "π",
  "\\rho": "ρ",
  "\\sigma": "σ",
  "\\tau": "τ",
  "\\upsilon": "υ",
  "\\phi": "ϕ",
  "\\varphi": "φ",
  "\\chi": "χ",
  "\\psi": "ψ",
  "\\omega": "ω",
  "\\Gamma": "Γ",
  "\\Delta": "Δ",
  "\\Theta": "Θ",
  "\\Lambda": "Λ",
  "\\Xi": "Ξ",
  "\\Pi": "Π",
  "\\Sigma": "Σ",
  "\\Upsilon": "Υ",
  "\\Phi": "Φ",
  "\\Psi": "Ψ",
  "\\Omega": "Ω",
  "\\ell": "ℓ",
  "\\sin": "sin",
  "\\cos": "cos",
  "\\tan": "tan",
  "\\cot": "cot",
  "\\arcsin": "arcsin",
  "\\arccos": "arccos",
  "\\arctan": "arctan",
  "\\ln": "ln",
  "\\log": "log",
  "\\min": "min",
  "\\max": "max",
  "\\lim": "lim",
  "\\{": "{",
  "\\}": "}",
  "\\%": "%",
  "\\&": "&",
  "\\_": "_",
  "\\,": " ",
  "\\;": " ",
  "\\:": " ",
  "\\!": "",
  "\\quad": "  ",
  "\\qquad": "    ",
};

const MATHBB_MAP = {
  R: "ℝ",
  N: "ℕ",
  Z: "ℤ",
  Q: "ℚ",
  C: "ℂ",
};

function makeMathRun(text, isNormalText = false) {
  if (!text) return "";
  const rPr = isNormalText ? "<m:rPr><m:nor/></m:rPr>" : "";
  return `<m:r>${rPr}<m:t xml:space="preserve">${xmlEscape(text)}</m:t></m:r>`;
}

function skipSpaces(s, pos) {
  while (pos < s.length && /\s/.test(s[pos])) pos++;
  return pos;
}

function readBracedGroup(s, pos) {
  pos = skipSpaces(s, pos);
  if (pos >= s.length) return { content: "", nextPos: pos };
  if (s[pos] === "{") {
    let depth = 1;
    let i = pos + 1;
    while (i < s.length && depth > 0) {
      if (s[i] === "\\" && i + 1 < s.length) {
        i += 2;
        continue;
      }
      if (s[i] === "{") depth++;
      else if (s[i] === "}") depth--;
      i++;
    }
    return { content: s.slice(pos + 1, i - 1), nextPos: i };
  }
  if (s[pos] === "\\") {
    const m = s.slice(pos).match(/^\\[a-zA-Z]+|^\\./);
    if (m) {
      return { content: m[0], nextPos: pos + m[0].length };
    }
  }
  return { content: s[pos], nextPos: pos + 1 };
}

function readBracketGroup(s, pos) {
  pos = skipSpaces(s, pos);
  if (pos >= s.length || s[pos] !== "[") return null;
  let depth = 1;
  let i = pos + 1;
  while (i < s.length && depth > 0) {
    if (s[i] === "[") depth++;
    else if (s[i] === "]") depth--;
    i++;
  }
  return { content: s.slice(pos + 1, i - 1), nextPos: i };
}

function parseSingleAtom(s, pos) {
  pos = skipSpaces(s, pos);
  if (pos >= s.length) return { xml: "", nextPos: pos };

  // 1. Check \begin{cases} / \begin{aligned} / \begin{array} / \begin{matrix}
  if (s.startsWith("\\begin{", pos)) {
    const envMatch = s.slice(pos).match(/^\\begin\{(cases|aligned|array|matrix|pmatrix|bmatrix)\}/);
    if (envMatch) {
      const envName = envMatch[1];
      const endTag = `\\end{${envName}}`;
      let bodyStart = pos + envMatch[0].length;
      // If array has column spec like {l} or {cc}, skip it
      if (envName === "array" && s[skipSpaces(s, bodyStart)] === "{") {
        const colSpec = readBracedGroup(s, bodyStart);
        bodyStart = colSpec.nextPos;
      }
      const endIdx = s.indexOf(endTag, bodyStart);
      if (endIdx !== -1) {
        const body = s.slice(bodyStart, endIdx);
        const rows = body
          .split(/\\\\/)
          .map((r) => r.replace(/&/g, " ").trim())
          .filter(Boolean);
        const eqRows = rows.map((r) => `<m:e>${parseLatexToOmmlNodes(r)}</m:e>`).join("");
        const eqArr = `<m:eqArr>${eqRows || `<m:e>${makeMathRun(" ")}</m:e>`}</m:eqArr>`;
        const xml =
          envName === "cases"
            ? `<m:d><m:dPr><m:begChr m:val="{"/><m:endChr m:val=""/></m:dPr><m:e>${eqArr}</m:e></m:d>`
            : eqArr;
        return { xml, nextPos: endIdx + endTag.length };
      }
    }
  }

  // 2. Braced group {...}
  if (s[pos] === "{") {
    const grp = readBracedGroup(s, pos);
    return { xml: parseLatexToOmmlNodes(grp.content), nextPos: grp.nextPos };
  }

  // 3. LaTeX command \...
  if (s[pos] === "\\") {
    const cmdMatch = s.slice(pos).match(/^\\[a-zA-Z]+|^\\./);
    if (cmdMatch) {
      const cmd = cmdMatch[0];
      let nextPos = pos + cmd.length;

      // Ignore sizing/delimiter modifiers \left, \right, \big, \Big, \displaystyle
      if (
        cmd === "\\left" ||
        cmd === "\\right" ||
        cmd === "\\big" ||
        cmd === "\\Big" ||
        cmd === "\\bigg" ||
        cmd === "\\Bigg" ||
        cmd === "\\displaystyle" ||
        cmd === "\\textstyle"
      ) {
        nextPos = skipSpaces(s, nextPos);
        if (cmd === "\\right" && s[nextPos] === ".") {
          return { xml: "", nextPos: nextPos + 1 };
        }
        return parseSingleAtom(s, nextPos);
      }

      // Fractions \frac{a}{b}, \dfrac{a}{b}, \tfrac{a}{b}
      if (cmd === "\\frac" || cmd === "\\dfrac" || cmd === "\\tfrac") {
        const num = readBracedGroup(s, nextPos);
        const den = readBracedGroup(s, num.nextPos);
        const numXml = parseLatexToOmmlNodes(num.content) || makeMathRun(" ");
        const denXml = parseLatexToOmmlNodes(den.content) || makeMathRun(" ");
        return {
          xml: `<m:f><m:num>${numXml}</m:num><m:den>${denXml}</m:den></m:f>`,
          nextPos: den.nextPos,
        };
      }

      // Roots \sqrt{x} or \sqrt[n]{x}
      if (cmd === "\\sqrt") {
        const optDeg = readBracketGroup(s, nextPos);
        if (optDeg) {
          const rad = readBracedGroup(s, optDeg.nextPos);
          const degXml = parseLatexToOmmlNodes(optDeg.content) || makeMathRun(" ");
          const radXml = parseLatexToOmmlNodes(rad.content) || makeMathRun(" ");
          return {
            xml: `<m:rad><m:deg>${degXml}</m:deg><m:e>${radXml}</m:e></m:rad>`,
            nextPos: rad.nextPos,
          };
        } else {
          const rad = readBracedGroup(s, nextPos);
          const radXml = parseLatexToOmmlNodes(rad.content) || makeMathRun(" ");
          return {
            xml: `<m:rad><m:radPr><m:degHide m:val="1"/></m:radPr><m:deg/><m:e>${radXml}</m:e></m:rad>`,
            nextPos: rad.nextPos,
          };
        }
      }

      // Accents: \widehat{ABC}, \hat{x}, \vec{a}, \overrightarrow{AB}
      if (cmd === "\\widehat" || cmd === "\\hat") {
        const inner = readBracedGroup(s, nextPos);
        const innerXml = parseLatexToOmmlNodes(inner.content) || makeMathRun(" ");
        return {
          xml: `<m:acc><m:accPr><m:chr m:val="&#x0302;"/></m:accPr><m:e>${innerXml}</m:e></m:acc>`,
          nextPos: inner.nextPos,
        };
      }
      if (cmd === "\\vec" || cmd === "\\overrightarrow") {
        const inner = readBracedGroup(s, nextPos);
        const innerXml = parseLatexToOmmlNodes(inner.content) || makeMathRun(" ");
        return {
          xml: `<m:acc><m:accPr><m:chr m:val="&#x20D7;"/></m:accPr><m:e>${innerXml}</m:e></m:acc>`,
          nextPos: inner.nextPos,
        };
      }
      if (cmd === "\\overline" || cmd === "\\bar") {
        const inner = readBracedGroup(s, nextPos);
        const innerXml = parseLatexToOmmlNodes(inner.content) || makeMathRun(" ");
        return {
          xml: `<m:bar><m:barPr><m:pos m:val="top"/></m:barPr><m:e>${innerXml}</m:e></m:bar>`,
          nextPos: inner.nextPos,
        };
      }

      // Normal text inside math: \text{...}, \mathrm{...}, \textbf{...}
      if (cmd === "\\text" || cmd === "\\mathrm" || cmd === "\\textbf" || cmd === "\\textit") {
        const inner = readBracedGroup(s, nextPos);
        return {
          xml: makeMathRun(inner.content, true),
          nextPos: inner.nextPos,
        };
      }

      // Blackboard bold \mathbb{R}
      if (cmd === "\\mathbb") {
        const inner = readBracedGroup(s, nextPos);
        const ch = MATHBB_MAP[inner.content.trim()] || inner.content.trim();
        return {
          xml: makeMathRun(ch),
          nextPos: inner.nextPos,
        };
      }

      // Known symbol
      if (cmd in LATEX_SYMBOLS) {
        const sym = LATEX_SYMBOLS[cmd];
        const isFunc = ["sin", "cos", "tan", "cot", "ln", "log", "min", "max", "lim"].includes(sym);
        return {
          xml: sym ? makeMathRun(sym, isFunc) : "",
          nextPos,
        };
      }

      // Unknown command fallback: strip leading slash
      return {
        xml: makeMathRun(cmd.slice(1)),
        nextPos,
      };
    }
  }

  // 4. Single character atom
  const ch = s[pos];
  if (ch === "}") {
    return { xml: "", nextPos: pos + 1 };
  }
  return {
    xml: makeMathRun(ch),
    nextPos: pos + 1,
  };
}

function parseLatexToOmmlNodes(s) {
  let pos = 0;
  let outXml = "";

  while (pos < s.length) {
    pos = skipSpaces(s, pos);
    if (pos >= s.length) break;

    // Stray ^ or _ without base
    if (s[pos] === "^" || s[pos] === "_") {
      const op = s[pos];
      const grp = readBracedGroup(s, pos + 1);
      const subOrSupXml = parseLatexToOmmlNodes(grp.content) || makeMathRun(" ");
      if (op === "^") {
        outXml += `<m:sSup><m:e>${makeMathRun(" ")}</m:e><m:sup>${subOrSupXml}</m:sup></m:sSup>`;
      } else {
        outXml += `<m:sSub><m:e>${makeMathRun(" ")}</m:e><m:sub>${subOrSupXml}</m:sub></m:sSub>`;
      }
      pos = grp.nextPos;
      continue;
    }

    const atom = parseSingleAtom(s, pos);
    let baseXml = atom.xml;
    pos = atom.nextPos;

    // Check if followed by ^ or _
    let subXml = null;
    let supXml = null;

    while (pos < s.length) {
      const p = skipSpaces(s, pos);
      if (p < s.length && s[p] === "^" && supXml === null) {
        const grp = readBracedGroup(s, p + 1);
        supXml = parseLatexToOmmlNodes(grp.content) || makeMathRun(" ");
        pos = grp.nextPos;
      } else if (p < s.length && s[p] === "_" && subXml === null) {
        const grp = readBracedGroup(s, p + 1);
        subXml = parseLatexToOmmlNodes(grp.content) || makeMathRun(" ");
        pos = grp.nextPos;
      } else {
        break;
      }
    }

    const safeBase = baseXml || makeMathRun(" ");
    if (subXml !== null && supXml !== null) {
      outXml += `<m:sSubSup><m:e>${safeBase}</m:e><m:sub>${subXml}</m:sub><m:sup>${supXml}</m:sup></m:sSubSup>`;
    } else if (supXml !== null) {
      outXml += `<m:sSup><m:e>${safeBase}</m:e><m:sup>${supXml}</m:sup></m:sSup>`;
    } else if (subXml !== null) {
      outXml += `<m:sSub><m:e>${safeBase}</m:e><m:sub>${subXml}</m:sub></m:sSub>`;
    } else {
      outXml += baseXml;
    }
  }

  return outXml;
}

function latexToOmml(latexStr) {
  const cleaned = String(latexStr || "").trim();
  if (!cleaned) return "";
  const innerNodes = parseLatexToOmmlNodes(cleaned);
  if (!innerNodes) return "";
  return `<m:oMath>${innerNodes}</m:oMath>`;
}

// ============================================================================
// DOCX BUILDER WITH NATIVE OMML EQUATIONS + IMAGES + TABLES
// ============================================================================

const CRC_TABLE = (() => {
  const table = new Uint32Array(256);
  for (let i = 0; i < 256; i++) {
    let c = i;
    for (let k = 0; k < 8; k++) {
      c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1;
    }
    table[i] = c >>> 0;
  }
  return table;
})();

function crc32(bytes) {
  let crc = 0xffffffff;
  for (let i = 0; i < bytes.length; i++) {
    crc = CRC_TABLE[(crc ^ bytes[i]) & 0xff] ^ (crc >>> 8);
  }
  return (crc ^ 0xffffffff) >>> 0;
}

function createZip(files) {
  const encoder = new TextEncoder();
  const localParts = [];
  const centralParts = [];
  let offset = 0;

  for (const file of files) {
    const nameBytes = encoder.encode(file.name);
    const dataBytes = file.data instanceof Uint8Array ? file.data : encoder.encode(file.data);
    const crc = crc32(dataBytes);
    const size = dataBytes.length;

    const localHeader = new Uint8Array(30 + nameBytes.length);
    const lv = new DataView(localHeader.buffer);
    lv.setUint32(0, 0x04034b50, true);
    lv.setUint16(4, 20, true);
    lv.setUint16(6, 0x0800, true);
    lv.setUint16(8, 0, true);
    lv.setUint16(10, 0, true);
    lv.setUint16(12, 0x2100, true);
    lv.setUint32(14, crc, true);
    lv.setUint32(18, size, true);
    lv.setUint32(22, size, true);
    lv.setUint16(26, nameBytes.length, true);
    lv.setUint16(28, 0, true);
    localHeader.set(nameBytes, 30);

    const centralHeader = new Uint8Array(46 + nameBytes.length);
    const cv = new DataView(centralHeader.buffer);
    cv.setUint32(0, 0x02014b50, true);
    cv.setUint16(4, 20, true);
    cv.setUint16(6, 20, true);
    cv.setUint16(8, 0x0800, true);
    cv.setUint16(10, 0, true);
    cv.setUint16(12, 0, true);
    cv.setUint16(14, 0x2100, true);
    cv.setUint32(16, crc, true);
    cv.setUint32(20, size, true);
    cv.setUint32(24, size, true);
    cv.setUint16(28, nameBytes.length, true);
    cv.setUint16(30, 0, true);
    cv.setUint16(32, 0, true);
    cv.setUint16(34, 0, true);
    cv.setUint16(36, 0, true);
    cv.setUint32(38, 0, true);
    cv.setUint32(42, offset, true);
    centralHeader.set(nameBytes, 46);

    localParts.push(localHeader, dataBytes);
    centralParts.push(centralHeader);
    offset += localHeader.length + dataBytes.length;
  }

  let centralSize = 0;
  for (const cp of centralParts) centralSize += cp.length;

  const eocd = new Uint8Array(22);
  const ev = new DataView(eocd.buffer);
  ev.setUint32(0, 0x06054b50, true);
  ev.setUint16(4, 0, true);
  ev.setUint16(6, 0, true);
  ev.setUint16(8, files.length, true);
  ev.setUint16(10, files.length, true);
  ev.setUint32(12, centralSize, true);
  ev.setUint32(16, offset, true);
  ev.setUint16(20, 0, true);

  const totalSize = offset + centralSize + 22;
  const out = new Uint8Array(totalSize);
  let pos = 0;
  for (const p of localParts) {
    out.set(p, pos);
    pos += p.length;
  }
  for (const p of centralParts) {
    out.set(p, pos);
    pos += p.length;
  }
  out.set(eocd, pos);
  return out;
}

function makeTextRunXml(text, opts = {}) {
  if (!text) return "";
  const bold = opts.bold ? "<w:b/>" : "";
  const italic = opts.italic ? "<w:i/>" : "";
  const sz = opts.sz || 26;
  return `<w:r><w:rPr><w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:cs="Times New Roman"/>${bold}${italic}<w:sz w:val="${sz}"/><w:szCs w:val="${sz}"/></w:rPr><w:t xml:space="preserve">${xmlEscape(text)}</w:t></w:r>`;
}

function makeRichParagraphXml(text, opts = {}) {
  const align = opts.align ? `<w:jc w:val="${opts.align}"/>` : `<w:jc w:val="both"/>`;
  const sz = opts.sz || 26;
  let innerXml = "";

  if (opts.prefix) {
    innerXml += makeTextRunXml(opts.prefix, { bold: true, sz });
  }

  // Unwrap half-open intervals like $[80; 90)$ to plain text
  const cleaned = String(text || "").replace(/\$\s*(\[[^\$\]]+?\))\s*\$/g, "$1");
  const segments = cleaned.split(/(\$\$[\s\S]+?\$\$|\$[^\$]+?\$)/g);

  for (const seg of segments) {
    if (!seg) continue;
    if (seg.startsWith("$$") && seg.endsWith("$$") && seg.length > 4) {
      const mathXml = latexToOmml(seg.slice(2, -2));
      innerXml += mathXml || makeTextRunXml(seg.slice(2, -2), opts);
    } else if (seg.startsWith("$") && seg.endsWith("$") && seg.length > 2) {
      const mathXml = latexToOmml(seg.slice(1, -1));
      innerXml += mathXml || makeTextRunXml(seg.slice(1, -1), opts);
    } else {
      innerXml += makeTextRunXml(seg, opts);
    }
  }

  return `<w:p><w:pPr><w:spacing w:before="40" w:after="60" w:line="276" w:lineRule="auto"/>${align}</w:pPr>${innerXml}</w:p>`;
}

function makeTableXml(htmlTable) {
  const trMatches = [...htmlTable.matchAll(/<tr[^>]*>([\s\S]*?)<\/tr>/gi)];
  if (!trMatches.length) return "";
  let rowsXml = "";
  for (const tr of trMatches) {
    const cells = [...tr[1].matchAll(/<(td|th)[^>]*>([\s\S]*?)<\/\1>/gi)];
    if (!cells.length) continue;
    let cellsXml = "";
    for (const c of cells) {
      const isTh = c[1].toLowerCase() === "th";
      const cellText = c[2].replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim();
      cellsXml += `<w:tc><w:tcPr><w:tcBorders><w:top w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:left w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:right w:val="single" w:sz="4" w:space="0" w:color="000000"/></w:tcBorders></w:tcPr>${makeRichParagraphXml(cellText, { align: "center", bold: isTh, sz: 24 })}</w:tc>`;
    }
    rowsXml += `<w:tr>${cellsXml}</w:tr>`;
  }
  return `<w:tbl><w:tblPr><w:jc w:val="center"/><w:tblBorders><w:top w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:left w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:right w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:insideH w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:insideV w:val="single" w:sz="4" w:space="0" w:color="000000"/></w:tblBorders></w:tblPr>${rowsXml}</w:tbl>`;
}

function makeImageDrawingXml(relId, docPrId) {
  const cx = 2400000;
  const cy = 1650000;
  return `<w:p><w:pPr><w:jc w:val="center"/></w:pPr><w:r><w:drawing><wp:inline distT="0" distB="0" distL="0" distR="0"><wp:extent cx="${cx}" cy="${cy}"/><wp:docPr id="${docPrId}" name="Picture ${docPrId}"/><a:graphic xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"><a:graphicData uri="http://schemas.openxmlformats.org/drawingml/2006/picture"><pic:pic xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"><pic:nvPicPr><pic:cNvPr id="${docPrId}" name="image${docPrId}.png"/><pic:cNvPicPr/></pic:nvPicPr><pic:blipFill><a:blip r:embed="${relId}"/><a:stretch><a:fillRect/></a:stretch></pic:blipFill><pic:spPr><a:xfrm><a:off x="0" y="0"/><a:ext cx="${cx}" cy="${cy}"/></a:xfrm><a:prstGeom prst="rect"><a:avLst/></a:prstGeom></pic:spPr></pic:pic></a:graphicData></a:graphic></wp:inline></w:drawing></w:r></w:p>`;
}

async function buildDocxBytes(questionsBySlot, headerInfo, includeSolutions, env, reqUrl) {
  const mediaFiles = [];
  const relEntries = [];
  let bodyXml = "";
  let imgCounter = 1;

  bodyXml += makeRichParagraphXml(`${headerInfo.org_name} — ${headerInfo.school_name}`, { align: "center", bold: true, sz: 24 });
  bodyXml += makeRichParagraphXml(`${headerInfo.exam_title} (Năm học ${headerInfo.academic_year})`, { align: "center", bold: true, sz: 26 });
  bodyXml += makeRichParagraphXml(`Môn: TOÁN — Mã đề: ${headerInfo.exam_code} — Thời gian: ${headerInfo.duration}`, { align: "center", italic: true, sz: 22 });

  for (const sec of EXAM_SECTIONS) {
    bodyXml += makeRichParagraphXml(sec.title, { bold: true, sz: 26 });
    for (const slotObj of sec.slots) {
      const q = questionsBySlot[slotObj.code];
      if (!q) continue;

      let imgRelId = null;
      if (q.figure_path) {
        try {
          let imgBytes = null;
          if (q.figure_path.startsWith("data:image/")) {
            const b64 = q.figure_path.split(",")[1];
            const binStr = atob(b64);
            imgBytes = new Uint8Array(binStr.length);
            for (let i = 0; i < binStr.length; i++) imgBytes[i] = binStr.charCodeAt(i);
          } else {
            const assetUrl = new URL(q.figure_path, reqUrl);
            const assetResp = env.ASSETS
              ? await env.ASSETS.fetch(new Request(assetUrl))
              : await fetch(assetUrl);
            if (assetResp && assetResp.ok) {
              imgBytes = new Uint8Array(await assetResp.arrayBuffer());
            }
          }
          if (imgBytes && imgBytes.length > 0) {
            const imgName = `image${imgCounter}.png`;
            imgRelId = `rIdImg${imgCounter}`;
            mediaFiles.push({ name: `word/media/${imgName}`, data: imgBytes });
            relEntries.push(`<Relationship Id="${imgRelId}" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/image" Target="media/${imgName}"/>`);
            imgCounter++;
          }
        } catch (_) {}
      }

      const parts = String(q.content || "").split(/(<table[\s\S]*?<\/table>|\{\{FIGURE\}\})/i);
      let firstLine = true;
      let figRendered = false;

      for (const part of parts) {
        if (!part || !part.trim()) continue;
        const trimmed = part.trim();
        if (trimmed === "{{FIGURE}}") {
          if (imgRelId) {
            bodyXml += makeImageDrawingXml(imgRelId, imgCounter + 100);
            figRendered = true;
          }
        } else if (trimmed.toLowerCase().startsWith("<table")) {
          bodyXml += makeTableXml(trimmed);
        } else {
          const lines = trimmed.split("\n");
          for (const ln of lines) {
            const t = ln.trim();
            if (!t) continue;
            bodyXml += makeRichParagraphXml(t, { prefix: firstLine ? slotObj.prefix : "" });
            firstLine = false;
          }
        }
      }

      if (imgRelId && !figRendered) {
        bodyXml += makeImageDrawingXml(imgRelId, imgCounter + 200);
      }
    }
  }

  bodyXml += makeRichParagraphXml("-------------------- HẾT --------------------", { align: "center", bold: true, sz: 24 });

  if (includeSolutions) {
    bodyXml += `<w:p><w:r><w:br w:type="page"/></w:r></w:p>`;
    bodyXml += makeRichParagraphXml(`ĐÁP ÁN & HƯỚNG DẪN CHẤM — MÃ ĐỀ ${headerInfo.exam_code}`, { align: "center", bold: true, sz: 26 });
    for (const s of EXAM_SLOTS) {
      const q = questionsBySlot[s.code];
      if (!q) continue;
      const sol = q.solution || "Xem lời giải chi tiết.";
      bodyXml += makeRichParagraphXml(`[${q.source_name}] ${sol}`, { prefix: `Câu ${s.code}: ` });
    }
  }

  const contentTypesXml = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Default Extension="png" ContentType="image/png"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
</Types>`;

  const rootRelsXml = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>`;

  const docRelsXml = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  ${relEntries.join("\n  ")}
</Relationships>`;

  const documentXml = `<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
            xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
            xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
            xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing">
  <w:body>
    ${bodyXml}
    <w:sectPr>
      <w:pgSz w:w="11906" w:h="16838"/>
      <w:pgMar w:top="1020" w:right="1020" w:bottom="1020" w:left="1134"/>
    </w:sectPr>
  </w:body>
</w:document>`;

  const zipEntries = [
    { name: "[Content_Types].xml", data: contentTypesXml },
    { name: "_rels/.rels", data: rootRelsXml },
    { name: "word/_rels/document.xml.rels", data: docRelsXml },
    { name: "word/document.xml", data: documentXml },
    ...mediaFiles,
  ];

  return createZip(zipEntries);
}

// ============================================================================
// WORKER FETCH HANDLER
// ============================================================================

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const path = url.pathname;
    const method = request.method;

    if (method === "OPTIONS") {
      return jsonResponse({ ok: true });
    }

    try {
      if (path.startsWith("/api/")) {
        const state = await getState(env);
        const currentUser = parseSessionToken(request, state);

        // --- AUTH ENDPOINTS ---
        if (path === "/api/auth/me" && method === "GET") {
          return jsonResponse({ user: currentUser });
        }

        if (path === "/api/auth/login" && method === "POST") {
          const body = await request.json();
          const identifier = String(body.username || body.email || "").trim().toLowerCase();
          const password = String(body.password || "").trim();

          const found = state.users.find(
            (u) =>
              (u.email.toLowerCase() === identifier || (u.username && u.username.toLowerCase() === identifier)) &&
              u.password === password
          );
          if (!found) {
            return jsonResponse({ detail: "Tài khoản hoặc mật khẩu không chính xác" }, 401);
          }
          const userPublic = {
            id: found.id,
            email: found.email,
            name: found.name,
            role: found.role,
            avatar: found.avatar || "",
          };
          return jsonResponse({
            ok: true,
            token: createSessionToken(userPublic),
            user: userPublic,
          });
        }

        if (path === "/api/auth/register" && method === "POST") {
          const body = await request.json();
          const email = String(body.email || "").trim().toLowerCase();
          const name = String(body.name || "").trim() || email.split("@")[0];
          const password = String(body.password || "").trim();

          if (!email || !email.includes("@")) {
            return jsonResponse({ detail: "Vui lòng nhập địa chỉ email hợp lệ" }, 400);
          }
          if (password.length < 6) {
            return jsonResponse({ detail: "Mật khẩu phải có ít nhất 6 ký tự" }, 400);
          }
          const exists = state.users.some((u) => u.email.toLowerCase() === email);
          if (exists) {
            return jsonResponse({ detail: "Email này đã được đăng ký tài khoản" }, 409);
          }
          const maxId = state.users.reduce((m, u) => Math.max(m, u.id || 0), 0);
          const role = ADMIN_EMAILS.has(email) ? "admin" : "user";
          const newUser = {
            id: maxId + 1,
            email,
            username: email.split("@")[0],
            password,
            name,
            role,
            provider: "local",
            avatar: "",
            created_at: nowFormatted(),
          };
          state.users.push(newUser);
          await persistState(env, state);

          const userPublic = {
            id: newUser.id,
            email: newUser.email,
            name: newUser.name,
            role: newUser.role,
            avatar: "",
          };
          return jsonResponse({
            ok: true,
            token: createSessionToken(userPublic),
            user: userPublic,
          });
        }

        if (path === "/api/auth/google" && method === "POST") {
          const body = await request.json();
          let email = "";
          let name = "";
          let avatar = "";

          if (body.credential) {
            // Verify real Google ID Token via Google tokeninfo endpoint
            const gResp = await fetch(
              `https://oauth2.googleapis.com/tokeninfo?id_token=${encodeURIComponent(body.credential)}`
            );
            if (!gResp.ok) {
              return jsonResponse({ detail: "Token Google không hợp lệ" }, 401);
            }
            const gData = await gResp.json();
            email = String(gData.email || "").toLowerCase();
            name = gData.name || email.split("@")[0];
            avatar = gData.picture || "";
          } else if (body.email) {
            email = String(body.email || "").trim().toLowerCase();
            name = String(body.name || email.split("@")[0]).trim();
            avatar = body.avatar || "";
          }

          if (!email || !email.includes("@")) {
            return jsonResponse({ detail: "Email Google không hợp lệ" }, 400);
          }

          let userRecord = state.users.find((u) => u.email.toLowerCase() === email);
          if (!userRecord) {
            const maxId = state.users.reduce((m, u) => Math.max(m, u.id || 0), 0);
            const assignedRole = ADMIN_EMAILS.has(email) ? "admin" : "user";
            userRecord = {
              id: maxId + 1,
              email,
              username: email.split("@")[0],
              password: "",
              name,
              role: assignedRole,
              provider: "google",
              avatar,
              created_at: nowFormatted(),
            };
            state.users.push(userRecord);
            await persistState(env, state);
          } else {
            if (name && !userRecord.name) userRecord.name = name;
            if (avatar) userRecord.avatar = avatar;
            if (ADMIN_EMAILS.has(email)) userRecord.role = "admin";
          }

          const userPublic = {
            id: userRecord.id,
            email: userRecord.email,
            name: userRecord.name,
            role: userRecord.role,
            avatar: userRecord.avatar || "",
          };
          return jsonResponse({
            ok: true,
            token: createSessionToken(userPublic),
            user: userPublic,
          });
        }

        // --- ADMIN USERS MANAGEMENT ---
        if (path === "/api/admin/users" && method === "GET") {
          if (!currentUser || currentUser.role !== "admin") {
            return jsonResponse({ detail: "Chỉ Admin mới có quyền truy cập" }, 403);
          }
          const safeUsers = state.users.map((u) => ({
            id: u.id,
            email: u.email,
            name: u.name,
            role: u.role,
            provider: u.provider || "local",
            created_at: u.created_at || "",
          }));
          return jsonResponse({ users: safeUsers });
        }

        if (path.startsWith("/api/admin/users/") && method === "PUT") {
          if (!currentUser || currentUser.role !== "admin") {
            return jsonResponse({ detail: "Chỉ Admin mới có quyền phân quyền" }, 403);
          }
          const uid = Number(path.split("/")[4]);
          const body = await request.json();
          const target = state.users.find((u) => u.id === uid);
          if (!target) return jsonResponse({ detail: "Không tìm thấy người dùng" }, 404);
          target.role = body.role === "admin" ? "admin" : "user";
          await persistState(env, state);
          return jsonResponse({ ok: true, user: { id: target.id, email: target.email, name: target.name, role: target.role } });
        }

        // 1. GET /api/status
        if (path === "/api/status" && method === "GET") {
          const slotCounts = {};
          for (const s of EXAM_SLOTS) slotCounts[s.code] = 0;
          const examQCounts = {};
          for (const q of state.questions) {
            slotCounts[q.slot] = (slotCounts[q.slot] || 0) + 1;
            if (q.exam_id) examQCounts[q.exam_id] = (examQCounts[q.exam_id] || 0) + 1;
          }

          const pdfFiles = [...state.exams]
            .sort((a, b) => b.id - a.id)
            .map((e) => ({
              filename: e.filename,
              ingested: true,
              school_name: e.school_name,
              academic_year: e.academic_year,
              ingested_at: e.ingested_at,
              question_count: examQCounts[e.id] || 0,
              exam_id: e.id,
            }));

          return jsonResponse({
            slots: EXAM_SLOTS,
            slot_counts: slotCounts,
            total_questions: state.questions.length,
            total_pdf_files: pdfFiles.length,
            total_ingested_exams: state.exams.length,
            saved_exams_count: (state.saved_exams || []).length,
            pdf_files: pdfFiles,
          });
        }

        // 2. GET /api/questions
        if (path === "/api/questions" && method === "GET") {
          const slot = url.searchParams.get("slot");
          const search = (url.searchParams.get("search") || "").trim().toLowerCase();
          let list = [...state.questions].sort((a, b) => b.id - a.id);
          if (slot) list = list.filter((q) => q.slot === slot);
          if (search) {
            list = list.filter(
              (q) =>
                String(q.content || "").toLowerCase().includes(search) ||
                String(q.sub_topic || "").toLowerCase().includes(search) ||
                String(q.source_name || "").toLowerCase().includes(search)
            );
          }
          return jsonResponse({ questions: list });
        }

        // 3. POST /api/questions (Admin only)
        if (path === "/api/questions" && method === "POST") {
          if (!currentUser || currentUser.role !== "admin") {
            return jsonResponse({ detail: "Cần quyền Quản trị viên (Admin) để thêm câu hỏi vào ngân hàng chung" }, 403);
          }
          const body = await request.json();
          const maxId = state.questions.reduce((m, q) => Math.max(m, q.id || 0), 0);
          const created = {
            id: maxId + 1,
            exam_id: null,
            slot: body.slot || "I.1",
            sub_topic: body.sub_topic || "",
            content: body.content || "",
            figure_path: null,
            solution: body.solution || "",
            source_name: body.source_name || "Tự soạn",
          };
          state.questions.push(created);
          await persistState(env, state);
          return jsonResponse({ ok: true, question: created });
        }

        // 4. PUT or DELETE /api/questions/:id (Admin only)
        if (path.startsWith("/api/questions/")) {
          if (!currentUser || currentUser.role !== "admin") {
            return jsonResponse({ detail: "Cần quyền Quản trị viên (Admin) để sửa/xóa câu hỏi gốc" }, 403);
          }
          const qid = Number(path.split("/").pop());
          if (method === "PUT") {
            const body = await request.json();
            const idx = state.questions.findIndex((q) => q.id === qid);
            if (idx === -1) return jsonResponse({ detail: "Không tìm thấy câu hỏi" }, 404);
            state.questions[idx] = {
              ...state.questions[idx],
              slot: body.slot || state.questions[idx].slot,
              sub_topic: body.sub_topic ?? state.questions[idx].sub_topic,
              content: body.content ?? state.questions[idx].content,
              solution: body.solution ?? state.questions[idx].solution,
              source_name: body.source_name ?? state.questions[idx].source_name,
            };
            await persistState(env, state);
            return jsonResponse({ ok: true, question: state.questions[idx] });
          }
          if (method === "DELETE") {
            state.questions = state.questions.filter((q) => q.id !== qid);
            await persistState(env, state);
            return jsonResponse({ ok: true });
          }
        }

        // 5. DELETE /api/exams/:id (Admin only)
        if (path.startsWith("/api/exams/") && method === "DELETE") {
          if (!currentUser || currentUser.role !== "admin") {
            return jsonResponse({ detail: "Chỉ Admin mới có quyền xóa đề gốc" }, 403);
          }
          const examId = Number(path.split("/").pop());
          state.questions = state.questions.filter((q) => q.exam_id !== examId);
          state.exams = state.exams.filter((e) => e.id !== examId);
          await persistState(env, state);
          return jsonResponse({ ok: true });
        }

        // 6. POST /api/mix
        if (path === "/api/mix" && method === "POST") {
          let excludeIds = [];
          try {
            const body = await request.json();
            excludeIds = body.exclude_ids || [];
          } catch (_) {}
          const excludeSet = new Set(excludeIds.map(Number));

          const bySlot = {};
          for (const q of state.questions) {
            if (!bySlot[q.slot]) bySlot[q.slot] = [];
            bySlot[q.slot].push(q);
          }

          const selected = {};
          const usedExamCounts = {};

          for (const s of EXAM_SLOTS) {
            const code = s.code;
            const candidates = bySlot[code] || [];
            if (!candidates.length) {
              selected[code] = null;
              continue;
            }
            const nonExcluded = candidates.filter((c) => !excludeSet.has(c.id));
            const pool = [...(nonExcluded.length ? nonExcluded : candidates)];

            const iii1Topic =
              code === "III.2" && selected["III.1"]
                ? String(selected["III.1"].sub_topic || "").trim().toLowerCase()
                : null;

            pool.sort((a, b) => {
              const penA = iii1Topic && String(a.sub_topic || "").trim().toLowerCase() === iii1Topic ? 10 : 0;
              const penB = iii1Topic && String(b.sub_topic || "").trim().toLowerCase() === iii1Topic ? 10 : 0;
              if (penA !== penB) return penA - penB;
              const useA = usedExamCounts[a.exam_id || 0] || 0;
              const useB = usedExamCounts[b.exam_id || 0] || 0;
              if (useA !== useB) return useA - useB;
              return Math.random() - 0.5;
            });

            const chosen = pool[0];
            selected[code] = chosen;
            const ek = chosen.exam_id || 0;
            usedExamCounts[ek] = (usedExamCounts[ek] || 0) + 1;
          }

          return jsonResponse({ ok: true, exam: selected });
        }

        // 7. POST /api/swap
        if (path === "/api/swap" && method === "POST") {
          const body = await request.json();
          const candidates = state.questions.filter((q) => q.slot === body.slot);
          if (!candidates.length) return jsonResponse({ detail: "Không có câu hỏi" }, 404);
          const others = candidates.filter((q) => q.id !== body.current_id);
          const pool = others.length ? others : candidates;
          const chosen = pool[Math.floor(Math.random() * pool.length)];
          return jsonResponse({ ok: true, question: chosen });
        }

        // 8. Saved Exams CRUD
        if (path === "/api/saved-exams" && method === "GET") {
          const list = [...(state.saved_exams || [])].sort((a, b) => b.id - a.id);
          return jsonResponse({ saved_exams: list });
        }

        if (path === "/api/saved-exams" && method === "POST") {
          const body = await request.json();
          if (!state.saved_exams) state.saved_exams = [];
          const maxId = state.saved_exams.reduce((m, r) => Math.max(m, r.id || 0), 0);
          const rec = {
            id: maxId + 1,
            exam_code: body.exam_code || "101",
            title: body.title || "Đề lưu",
            header: body.header_info || {},
            slot_question_ids: body.slot_question_ids || {},
            created_by: currentUser ? currentUser.email : "guest",
            created_at: nowFormatted(),
          };
          state.saved_exams.push(rec);
          await persistState(env, state);
          return jsonResponse({ ok: true, saved_exam: rec });
        }

        if (path.startsWith("/api/saved-exams/") && method === "DELETE") {
          const sid = Number(path.split("/").pop());
          state.saved_exams = (state.saved_exams || []).filter((r) => r.id !== sid);
          await persistState(env, state);
          return jsonResponse({ ok: true });
        }

        // 9. POST /api/qa-exam (Admin only)
        if (path === "/api/qa-exam" && method === "POST") {
          if (!currentUser || currentUser.role !== "admin") {
            return jsonResponse({ detail: "Chỉ Admin mới có quyền chạy QA" }, 403);
          }
          const body = await request.json();
          const exam = state.exams.find((e) => e.id === Number(body.exam_id));
          if (!exam) return jsonResponse({ detail: "Không tìm thấy đề" }, 404);
          let fixedCount = 0;
          for (const q of state.questions) {
            if (q.exam_id === exam.id) {
              const cleaned = String(q.content || "").replace(/\$\s*(\[[^\$\]]+?\))\s*\$/g, "$1");
              if (cleaned !== q.content) {
                q.content = cleaned;
                fixedCount++;
              }
            }
          }
          if (fixedCount > 0) await persistState(env, state);
          return jsonResponse({
            ok: true,
            result: {
              exam_id: exam.id,
              school_name: exam.school_name,
              qa_fixes_summary: [`Đã chuẩn hóa LaTeX & khoảng nửa mở (${fixedCount} chỉnh sửa)`],
              elapsed_seconds: 0.2,
            },
          });
        }

        // 10. POST /api/export-docx
        if (path === "/api/export-docx" && method === "POST") {
          const body = await request.json();
          const slotIds = body.slot_question_ids || {};
          const customQuestions = body.custom_questions || {};
          const questionsBySlot = {};

          for (const [slotCode, qId] of Object.entries(slotIds)) {
            if (customQuestions[slotCode]) {
              questionsBySlot[slotCode] = customQuestions[slotCode];
            } else if (qId) {
              questionsBySlot[slotCode] = state.questions.find((q) => q.id === Number(qId)) || null;
            } else {
              questionsBySlot[slotCode] = null;
            }
          }

          const headerInfo = {
            org_name: body.org_name || "SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI",
            school_name: body.school_name || "ĐỀ THI CHÍNH THỨC",
            exam_title: body.exam_title || "KỲ THI TUYỂN SINH VÀO LỚP 10 THPT",
            academic_year: body.academic_year || "2026 - 2027",
            exam_code: body.exam_code || "101",
            duration: body.duration || "120 phút",
          };

          const docxBytes = await buildDocxBytes(
            questionsBySlot,
            headerInfo,
            body.include_solutions !== false,
            env,
            request.url
          );

          return new Response(docxBytes, {
            status: 200,
            headers: {
              "Content-Type": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
              "Content-Disposition": `attachment; filename="De_Toan_10_Ma_${headerInfo.exam_code}.docx"`,
            },
          });
        }
      }

      if (env.ASSETS) {
        return env.ASSETS.fetch(request);
      }
      return new Response("Not Found", { status: 404 });
    } catch (err) {
      return jsonResponse({ detail: err.message || "Internal Server Error" }, 500);
    }
  },
};
