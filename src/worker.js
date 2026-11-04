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

let memoryState = null;

async function getState(env) {
  if (memoryState) return memoryState;
  if (env.KV) {
    try {
      const stored = await env.KV.get("BANK_STATE_V1", "json");
      if (stored && Array.isArray(stored.questions)) {
        memoryState = stored;
        return memoryState;
      }
    } catch (_) {}
  }
  memoryState = {
    exams: [...INITIAL_SEED.exams],
    questions: [...INITIAL_SEED.questions],
    saved_exams: [],
  };
  return memoryState;
}

async function persistState(env, state) {
  memoryState = state;
  if (env.KV) {
    await env.KV.put("BANK_STATE_V1", JSON.stringify(state));
  }
}

function jsonResponse(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*",
    },
  });
}

function nowFormatted() {
  const d = new Date();
  return d.toISOString().replace("T", " ").slice(0, 16);
}

// --- Minimal Uncompressed ZIP Builder for .docx ---
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

function xmlEscape(str) {
  return String(str || "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

function latexToReadableText(str) {
  if (!str) return "";
  let s = str.replace(/\$\s*(\[[^\$\]]+?\))\s*\$/g, "$1");
  s = s.replace(/\$\$([\s\S]*?)\$\$/g, "$1").replace(/\$([^\$]+?)\$/g, "$1");
  s = s
    .replace(/\\frac\{([^{}]+)\}\{([^{}]+)\}/g, "($1)/($2)")
    .replace(/\\sqrt\{([^{}]+)\}/g, "√($1)")
    .replace(/\\sqrt\s*([a-zA-Z0-9])/g, "√$1")
    .replace(/\\Delta/g, "Δ")
    .replace(/\\pi/g, "π")
    .replace(/\\alpha/g, "α")
    .replace(/\\beta/g, "β")
    .replace(/\\gamma/g, "γ")
    .replace(/\\le\b|\\leq\b/g, "≤")
    .replace(/\\ge\b|\\geq\b/g, "≥")
    .replace(/\\ne\b|\\neq\b/g, "≠")
    .replace(/\\approx\b/g, "≈")
    .replace(/\\pm\b/g, "±")
    .replace(/\\cdot\b/g, "·")
    .replace(/\\times\b/g, "×")
    .replace(/\\div\b/g, ":")
    .replace(/\\infty\b/g, "∞")
    .replace(/\\perp\b/g, "⊥")
    .replace(/\\parallel\b/g, "∥")
    .replace(/\\angle\b|\\widehat\b/g, "∠")
    .replace(/\\triangle\b/g, "△")
    .replace(/\\in\b/g, "∈")
    .replace(/\\subset\b/g, "⊂")
    .replace(/\\cup\b/g, "∪")
    .replace(/\\cap\b/g, "∩")
    .replace(/\\Rightarrow\b/g, "⇒")
    .replace(/\\Leftrightarrow\b/g, "⇔")
    .replace(/\^\{2\}|\^2\b/g, "²")
    .replace(/\^\{3\}|\^3\b/g, "³")
    .replace(/\^\{0\}|\^\\circ/g, "°")
    .replace(/\\left|\\right/g, "")
    .replace(/\\text\{([^{}]*)\}/g, "$1")
    .replace(/\{([^{}]*)\}/g, "$1");
  return s;
}

function makeParagraphXml(text, opts = {}) {
  const align = opts.align ? `<w:jc w:val="${opts.align}"/>` : `<w:jc w:val="both"/>`;
  const bold = opts.bold ? "<w:b/>" : "";
  const italic = opts.italic ? "<w:i/>" : "";
  const sz = opts.sz || 26;
  const prefixXml = opts.prefix
    ? `<w:r><w:rPr><w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"/><w:b/><w:sz w:val="${sz}"/></w:rPr><w:t xml:space="preserve">${xmlEscape(opts.prefix)}</w:t></w:r>`
    : "";
  return `<w:p><w:pPr><w:spacing w:before="40" w:after="60" w:line="276" w:lineRule="auto"/>${align}</w:pPr>${prefixXml}<w:r><w:rPr><w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"/>${bold}${italic}<w:sz w:val="${sz}"/></w:rPr><w:t xml:space="preserve">${xmlEscape(text)}</w:t></w:r></w:p>`;
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
      const cellText = latexToReadableText(c[2].replace(/<[^>]+>/g, " ").replace(/\s+/g, " ").trim());
      cellsXml += `<w:tc><w:tcPr><w:tcBorders><w:top w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:left w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:bottom w:val="single" w:sz="4" w:space="0" w:color="000000"/><w:right w:val="single" w:sz="4" w:space="0" w:color="000000"/></w:tcBorders></w:tcPr>${makeParagraphXml(cellText, { align: "center", bold: isTh, sz: 24 })}</w:tc>`;
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

  bodyXml += makeParagraphXml(`${headerInfo.org_name} — ${headerInfo.school_name}`, { align: "center", bold: true, sz: 24 });
  bodyXml += makeParagraphXml(`${headerInfo.exam_title} (Năm học ${headerInfo.academic_year})`, { align: "center", bold: true, sz: 26 });
  bodyXml += makeParagraphXml(`Môn: TOÁN — Mã đề: ${headerInfo.exam_code} — Thời gian: ${headerInfo.duration}`, { align: "center", italic: true, sz: 22 });

  for (const sec of EXAM_SECTIONS) {
    bodyXml += makeParagraphXml(sec.title, { bold: true, sz: 26 });
    for (const slotObj of sec.slots) {
      const q = questionsBySlot[slotObj.code];
      if (!q) continue;

      let imgRelId = null;
      if (q.figure_path && env.ASSETS) {
        try {
          let imgBytes = null;
          if (q.figure_path.startsWith("data:image/")) {
            const b64 = q.figure_path.split(",")[1];
            const binStr = atob(b64);
            imgBytes = new Uint8Array(binStr.length);
            for (let i = 0; i < binStr.length; i++) imgBytes[i] = binStr.charCodeAt(i);
          } else {
            const assetUrl = new URL(q.figure_path, reqUrl);
            const assetResp = await env.ASSETS.fetch(new Request(assetUrl));
            if (assetResp.ok) {
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
            const readable = latexToReadableText(t);
            bodyXml += makeParagraphXml(readable, { prefix: firstLine ? slotObj.prefix : "" });
            firstLine = false;
          }
        }
      }

      if (imgRelId && !figRendered) {
        bodyXml += makeImageDrawingXml(imgRelId, imgCounter + 200);
      }
    }
  }

  bodyXml += makeParagraphXml("-------------------- HẾT --------------------", { align: "center", bold: true, sz: 24 });

  if (includeSolutions) {
    bodyXml += `<w:p><w:r><w:br w:type="page"/></w:r></w:p>`;
    bodyXml += makeParagraphXml(`ĐÁP ÁN & HƯỚNG DẪN CHẤM — MÃ ĐỀ ${headerInfo.exam_code}`, { align: "center", bold: true, sz: 26 });
    for (const s of EXAM_SLOTS) {
      const q = questionsBySlot[s.code];
      if (!q) continue;
      const sol = latexToReadableText(q.solution || "Xem lời giải chi tiết.");
      bodyXml += makeParagraphXml(`[${q.source_name}] ${sol}`, { prefix: `Câu ${s.code}: ` });
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

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const path = url.pathname;
    const method = request.method;

    try {
      if (path.startsWith("/api/")) {
        const state = await getState(env);

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

        // 3. POST /api/questions
        if (path === "/api/questions" && method === "POST") {
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

        // 4. PUT or DELETE /api/questions/:id
        if (path.startsWith("/api/questions/")) {
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

        // 5. DELETE /api/exams/:id
        if (path.startsWith("/api/exams/") && method === "DELETE") {
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

        // 9. POST /api/qa-exam
        if (path === "/api/qa-exam" && method === "POST") {
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
          const questionsBySlot = {};

          for (const [slotCode, qId] of Object.entries(slotIds)) {
            if (qId) {
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
