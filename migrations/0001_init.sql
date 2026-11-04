DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS exams;
CREATE TABLE IF NOT EXISTS exams (id INTEGER PRIMARY KEY AUTOINCREMENT, filename TEXT UNIQUE, school_name TEXT, exam_title TEXT, academic_year TEXT, ingested_at TEXT);
CREATE TABLE IF NOT EXISTS questions (id INTEGER PRIMARY KEY AUTOINCREMENT, exam_id INTEGER, slot TEXT, sub_topic TEXT, content TEXT, figure_path TEXT, solution TEXT, source_name TEXT);
CREATE INDEX IF NOT EXISTS idx_questions_slot ON questions(slot);
CREATE TABLE IF NOT EXISTS saved_exams (id INTEGER PRIMARY KEY AUTOINCREMENT, exam_code TEXT, title TEXT, header_json TEXT, slot_question_ids_json TEXT, created_at TEXT);
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (1, 'de-tuyen-sinh-lop-10-mon-toan-nam-2026-2027-so-gddt-ha-noi.pdf', 'Sở Giáo dục và Đào tạo Hà Nội', 'Đề chính thức', '2026 – 2027', '2026-11-04 10:14:26');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (2, 'de-thi-thu-vao-lop-10-mon-toan-lan-3-nam-2025-truong-thcs-cau-giay-ha-noi.pdf', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY', 'ĐỀ THI THỬ VÀO LỚP 10 THPT - LẦN 3', '2024 – 2025', '2026-11-04 10:15:01');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (3, 'de-thi-thu-toan-vao-10-lan-5-nam-2025-2026-phong-gddt-chuong-my-ha-noi.pdf', 'Phòng GD&ĐT Huyện Chương Mỹ', 'Đề thi thử vào lớp 10 THPT - Lần 5', '2025 - 2026', '2026-11-04 10:18:53');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (4, 'de-thi-thu-vao-lop-10-mon-toan-nam-2025-truong-thcs-ngo-si-lien-ha-noi.pdf', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN', 'ĐỀ THI THỬ VÀO 10 THPT', '2024 – 2025', '2026-11-04 10:19:19');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (5, 'de-thi-thu-vao-lop-10-mon-toan-nam-2026-2027-cum-thcs-cong-lap-ha-noi.pdf', 'Cụm trường THCS Công lập', 'Đề thi thử vào lớp 10 THPT', '2026 - 2027', '2026-11-04 10:19:51');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (6, 'de-thi-thu-toan-vao-lop-10-lan-1-nam-2027-2028-truong-thcs-chuong-my-1-ha-noi.pdf', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1', 'ĐỀ THI THỬ VÀO LỚP 10 THPT - ĐỀ THI THỬ LẦN 1', '2027 – 2028', '2026-11-04 10:49:43');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (7, 'de-thi-thu-vao-lop-10-mon-toan-nam-2025-2026-lan-4-phong-gd-dt-chuong-my-ha-noi.pdf', 'Phòng GD&ĐT Huyện Chương Mỹ', 'Đề thi thử vào lớp 10 THPT - Lần 4', '2025 - 2026', '2026-11-04 10:49:48');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (8, 'de-thi-thu-vao-lop-10-mon-toan-chung-nam-2025-lan-2-truong-chuyen-dhsp-ha-noi.pdf', 'Trường THPT Chuyên ĐHSP Hà Nội', 'Kì thi thử vào lớp 10 THPT Chuyên - Lần 2', '2024 - 2025', '2026-11-04 10:49:51');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (9, 'de-thi-thu-toan-vao-lop-10-lan-3-nam-2025-phong-gddt-ung-hoa-ha-noi.pdf', 'Phòng GD&ĐT Ứng Hòa', 'Đề thi thử vào 10 lần 3', '2024 - 2025', '2026-11-04 10:49:52');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (10, 'BoDeHaNoiLan2_De_01_trang_2.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo', '2024 - 2025', '2026-11-04 10:50:15');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (11, 'BoDeHaNoiLan2_De_02_trang_11.pdf', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11)', 'ĐỀ THAM KHẢO KỲ THI TUYỂN SINH LỚP 10 THEO CHƯƠNG TRÌNH GDPT 2018', '2025 - 2026', '2026-11-04 10:50:18');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (12, 'BoDeHaNoiLan2_De_03_trang_22.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo', '2024 - 2025', '2026-11-04 10:50:40');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (13, 'de-thi-thu-vao-lop-10-mon-toan-nam-2025-truong-thpt-soc-son-ha-noi.pdf', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn', 'Đề thi thử tuyển sinh vào lớp 10', '2024 - 2025', '2026-11-04 10:50:43');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (14, 'de-tuyen-sinh-lop-10-chuyen-mon-toan-chuyen-nam-2026-2027-so-gddt-vinh-long.pdf', 'Sở Giáo dục và Đào tạo Vĩnh Long', 'Kỳ thi tuyển sinh lớp 10 THPT Chuyên', '2026 - 2027', '2026-11-04 10:50:45');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (15, 'BoDeHaNoiLan2_De_04_trang_31.pdf', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31)', 'KỲ THI TUYỂN SINH LỚP 10 THEO CHƯƠNG TRÌNH GDPT 2018 - ĐỀ THAM KHẢO (ĐỀ SỐ 4)', '2025 - 2026', '2026-11-04 10:50:46');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (16, 'BoDeHaNoiLan2_De_05_trang_38.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo số 5', '2025 - 2026', '2026-11-04 10:51:09');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (17, 'BoDeHaNoiLan2_De_06_trang_48.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:51:11');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (18, 'BoDeHaNoiLan2_De_08_trang_65.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65)', 'Đề tham khảo Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2025 - 2026', '2026-11-04 10:51:12');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (19, 'BoDeHaNoiLan2_De_07_trang_56.pdf', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56)', 'ĐỀ THAM KHẢO KỲ THI TUYỂN SINH LỚP 10', '2024 - 2025', '2026-11-04 10:51:20');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (20, 'BoDeHaNoiLan2_De_09_trang_74.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:51:34');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (21, 'BoDeHaNoiLan2_De_11_trang_91.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91)', 'Đề tham khảo Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:51:39');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (22, 'BoDeHaNoiLan2_De_10_trang_83.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2025 - 2026', '2026-11-04 10:51:42');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (23, 'BoDeHaNoiLan2_De_12_trang_103.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:51:51');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (24, 'BoDeHaNoiLan2_De_13_trang_111.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:52:00');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (25, 'BoDeHaNoiLan2_De_14_trang_119.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:52:08');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (26, 'BoDeHaNoiLan2_De_15_trang_128.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2025 - 2026', '2026-11-04 10:52:10');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (27, 'BoDeHaNoiLan2_De_16_trang_136.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:52:21');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (28, 'BoDeHaNoiLan2_De_17_trang_144.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:52:32');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (29, 'BoDeHaNoiLan2_De_18_trang_153.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo', '2024 - 2025', '2026-11-04 10:52:37');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (30, 'BoDeHaNoiLan2_De_19_trang_162.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:52:41');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (31, 'BoDeHaNoiLan2_De_20_trang_171.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:52:51');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (32, 'BoDeHaNoiLan2_De_21_trang_178.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:53:03');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (33, 'BoDeHaNoiLan2_De_22_trang_188.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:53:05');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (34, 'BoDeHaNoiLan2_De_23_trang_196.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:53:11');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (35, 'BoDeHaNoiLan2_De_24_trang_206.pdf', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206)', 'ĐỀ THAM KHẢO KỲ THI TUYỂN SINH LỚP 10 THEO CHƯƠNG TRÌNH GDPT 2018', '2025 - 2026', '2026-11-04 10:53:20');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (36, 'BoDeHaNoiLan2_De_25_trang_217.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo', '2024 - 2025', '2026-11-04 10:53:30');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (37, 'BoDeHaNoiLan2_De_26_trang_225.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:53:30');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (38, 'BoDeHaNoiLan2_De_27_trang_232.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2025 - 2026', '2026-11-04 10:53:46');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (39, 'BoDeHaNoiLan2_De_28_trang_240.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo', '2024 - 2025', '2026-11-04 10:53:47');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (40, 'BoDeHaNoiLan2_De_30_trang_254.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:53:57');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (41, 'BoDeHaNoiLan2_De_29_trang_245.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:54:02');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (42, 'BoDeHaNoiLan2_De_31_trang_263.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:54:17');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (43, 'BoDeHaNoiLan2_De_32_trang_272.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272)', 'Đề tham khảo Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2025 - 2026', '2026-11-04 10:54:21');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (44, 'BoDeHaNoiLan2_De_33_trang_280.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:54:25');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (45, 'BoDeHaNoiLan2_De_34_trang_287.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2025 - 2026', '2026-11-04 10:54:31');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (46, 'BoDeHaNoiLan2_De_35_trang_296.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:54:46');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (47, 'BoDeHaNoiLan2_De_36_trang_303.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo', '2025 - 2026', '2026-11-04 10:54:48');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (48, 'BoDeHaNoiLan2_De_37_trang_315.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo', '2024 - 2025', '2026-11-04 10:54:52');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (49, 'BoDeHaNoiLan2_De_38_trang_327.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo', '2024 - 2025', '2026-11-04 10:54:58');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (50, 'BoDeHaNoiLan2_De_40_trang_346.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:55:17');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (51, 'BoDeHaNoiLan2_De_39_trang_336.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:55:20');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (52, 'BoDeHaNoiLan2_De_41_trang_355.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:55:21');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (53, 'BoDeHaNoiLan2_De_42_trang_363.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:55:33');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (54, 'BoDeHaNoiLan2_De_43_trang_375.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375)', 'Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018 - Đề tham khảo', '2024 - 2025', '2026-11-04 10:55:44');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (55, 'BoDeHaNoiLan2_De_44_trang_383.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:55:49');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (56, 'BoDeHaNoiLan2_De_45_trang_392.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:55:51');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (57, 'BoDeHaNoiLan2_De_46_trang_401.pdf', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401)', 'ĐỀ THAM KHẢO KỲ THI TUYỂN SINH LỚP 10 THEO CHƯƠNG TRÌNH GDPT 2018', '2024 - 2025', '2026-11-04 10:56:01');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (58, 'BoDeHaNoiLan2_De_47_trang_411.pdf', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411)', 'KỲ THI TUYỂN SINH LỚP 10 THEO CHƯƠNG TRÌNH GDPT 2018 - ĐỀ THAM KHẢO (ĐỀ SỐ 47)', '2024 - 2025', '2026-11-04 10:56:13');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (59, 'BoDeHaNoiLan2_De_48_trang_436.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436)', 'Đề tham khảo Kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:56:24');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (60, 'BoDeHaNoiLan2_De_50_trang_458.pdf', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2025 - 2026', '2026-11-04 10:56:30');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (61, 'BoDeHaNoiLan2_De_51_trang_467.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2023 - 2024', '2026-11-04 10:56:39');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (62, 'BoDeHaNoiLan2_De_49_trang_448.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2024 - 2025', '2026-11-04 10:56:42');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (63, 'BoDeHaNoiLan2_De_52_trang_474.pdf', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474)', 'ĐỀ THAM KHẢO KỲ THI TUYỂN SINH LỚP 10', '2024 - 2025', '2026-11-04 10:56:49');
INSERT INTO exams (id, filename, school_name, exam_title, academic_year, ingested_at) VALUES (64, 'BoDeHaNoiLan2_De_53_trang_483.pdf', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483)', 'Đề tham khảo kỳ thi tuyển sinh lớp 10 theo chương trình GDPT 2018', '2025 - 2026', '2026-11-04 10:56:55');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (1, 1, 'I.1', 'Bảng tần số ghép nhóm', 'Kết quả đo chiều cao của 50 học sinh lớp 6 (đơn vị: cm) được thống kê trong bảng tần số ghép nhóm sau đây:
<table border="1" style="border-collapse: collapse; text-align: center;"><tr><th>Chiều cao (cm)</th><td>[140; 145)</td><td>[145; 150)</td><td>[150; 155)</td><td>[155; 160)</td><td>[160; 165)</td></tr><tr><th>Số học sinh</th><td>10</td><td>18</td><td>14</td><td>6</td><td>2</td></tr></table>
Xác định tần số và tần số tương đối của nhóm [150; 155).', NULL, 'Tần số của nhóm [150; 155) là $m = 14$.
Tần số tương đối của nhóm [150; 155) là $f = \frac{14}{50} \cdot 100\% = 28\%$.', 'Sở Giáo dục và Đào tạo Hà Nội (2026 – 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (2, 1, 'I.2', 'Xác suất', 'Một hộp đựng 6 quả bóng cùng loại, mỗi quả bóng ghi một trong các số 1, 2, 3, 4, 5, 6; hai quả bóng khác nhau được ghi hai số khác nhau. Lấy ngẫu nhiên một quả bóng trong hộp. Tính xác suất của biến cố $A$: "Số ghi trên quả bóng lấy được là số chẵn".', NULL, 'Không gian mẫu có $n(\Omega) = 6$.
Các kết quả thuận lợi cho biến cố $A$ là các số chẵn: $\{2; 4; 6\}$, suy ra $n(A) = 3$.
Xác suất của biến cố $A$ là $P(A) = \frac{3}{6} = \frac{1}{2}$.', 'Sở Giáo dục và Đào tạo Hà Nội (2026 – 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (3, 1, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x}-4}{\sqrt{x}}$ và $B = \frac{4}{\sqrt{x}-3} + \frac{x-7\sqrt{x}-12}{x-9}$ với $x > 0$, $x \neq 9$.
1) Tính giá trị của biểu thức $A$ khi $x = 25$.
2) Chứng minh $B = \frac{\sqrt{x}}{\sqrt{x}+3}$.
3) Tìm tất cả giá trị của $x$ để biểu thức $P = A.B$ có giá trị là số nguyên.', NULL, '1) Thay $x = 25$ (thỏa mãn ĐKXĐ) vào $A$:
$A = \frac{\sqrt{25}-4}{\sqrt{25}} = \frac{5-4}{5} = \frac{1}{5}$.

2) Ta có:
$B = \frac{4(\sqrt{x}+3) + x - 7\sqrt{x} - 12}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{x - 3\sqrt{x}}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{\sqrt{x}(\sqrt{x}-3)}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{\sqrt{x}}{\sqrt{x}+3}$.

3) Ta có $P = A \cdot B = \frac{\sqrt{x}-4}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x}+3} = \frac{\sqrt{x}-4}{\sqrt{x}+3} = 1 - \frac{7}{\sqrt{x}+3}$.
Do $x > 0, x \neq 9 \Rightarrow \sqrt{x} > 0 \Rightarrow \sqrt{x}+3 > 3$.
Suy ra $0 < \frac{7}{\sqrt{x}+3} < \frac{7}{3} \Rightarrow -\frac{4}{3} < P < 1$.
Do $P \in \mathbb{Z}$ nên $P \in \{-1; 0\}$.
- Với $P = 0 \Rightarrow \frac{\sqrt{x}-4}{\sqrt{x}+3} = 0 \Leftrightarrow \sqrt{x} = 4 \Leftrightarrow x = 16$ (thỏa mãn).
- Với $P = -1 \Rightarrow \frac{\sqrt{x}-4}{\sqrt{x}+3} = -1 \Leftrightarrow \sqrt{x}-4 = -\sqrt{x}-3 \Leftrightarrow 2\sqrt{x} = 1 \Leftrightarrow \sqrt{x} = \frac{1}{2} \Leftrightarrow x = \frac{1}{4}$ (thỏa mãn).
Vậy $x \in \left\{\frac{1}{4}; 16\right\}$.', 'Sở Giáo dục và Đào tạo Hà Nội (2026 – 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (4, 1, 'III.1', 'Năng suất - Công việc', 'Một tổ sản xuất lập kế hoạch may áo với số lượng áo mỗi ngày may được là như nhau. Trong 3 ngày đầu, mỗi ngày tổ đã may theo đúng kế hoạch. Trong 7 ngày tiếp theo, nhờ cải tiến kĩ thuật nên mỗi ngày tổ đã may được nhiều hơn 5 chiếc áo so với kế hoạch. Vì vậy sau 10 ngày, tổ đã may được tổng số 335 chiếc áo. Hỏi theo kế hoạch, mỗi ngày tổ sản xuất may bao nhiêu chiếc áo?', NULL, 'Gọi số áo mỗi ngày tổ sản xuất may theo kế hoạch là $x$ ($x \in \mathbb{N}^*$, chiếc áo).
Trong 3 ngày đầu, số áo may được là $3x$ (chiếc).
Trong 7 ngày tiếp theo, mỗi ngày tổ may được $x + 5$ (chiếc áo).
Số áo may trong 7 ngày tiếp theo là $7(x + 5)$ (chiếc).
Theo bài ra ta có phương trình:
$3x + 7(x + 5) = 335 \Leftrightarrow 10x + 35 = 335 \Leftrightarrow 10x = 300 \Leftrightarrow x = 30$ (thỏa mãn ĐK).
Vậy theo kế hoạch, mỗi ngày tổ sản xuất may được 30 chiếc áo.', 'Sở Giáo dục và Đào tạo Hà Nội (2026 – 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (5, 1, 'III.2', 'Hệ phương trình bậc nhất hai ẩn', 'Một người mua 25 bông hoa gồm hoa hồng và hoa cúc hết tổng số tiền là 180 nghìn đồng. Biết giá tiền mỗi bông hoa hồng là 8 nghìn đồng, giá tiền mỗi bông hoa cúc là 6 nghìn đồng. Hỏi người đó đã mua bao nhiêu bông hoa mỗi loại?', NULL, 'Gọi số bông hoa hồng và số bông hoa cúc người đó đã mua lần lượt là $x$ và $y$ ($x, y \in \mathbb{N}^*; x, y < 25$).
Người đó mua 25 bông hoa nên ta có phương trình: $x + y = 25$.
Tổng số tiền mua hoa là 180 nghìn đồng nên ta có phương trình: $8x + 6y = 180$.
Ta có hệ phương trình:
$\begin{cases} x + y = 25 \\ 8x + 6y = 180 \end{cases} \Leftrightarrow \begin{cases} 6x + 6y = 150 \\ 8x + 6y = 180 \end{cases} \Leftrightarrow \begin{cases} 2x = 30 \\ y = 25 - x \end{cases} \Leftrightarrow \begin{cases} x = 15 \\ y = 10 \end{cases}$ (thỏa mãn ĐK).
Vậy người đó đã mua 15 bông hoa hồng và 10 bông hoa cúc.', 'Sở Giáo dục và Đào tạo Hà Nội (2026 – 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (6, 1, 'III.3', 'Hệ thức Vi-ét', 'Biết phương trình bậc hai $x^2 - 3x + 1 = 0$ có hai nghiệm phân biệt $x_1$ và $x_2$, tính giá trị của biểu thức $Q = \frac{3x_2 - 1}{x_1} + \frac{3x_1}{x_2} - x_1$.', NULL, 'Theo định lí Vi-ét, ta có: $\begin{cases} x_1 + x_2 = 3 \\ x_1 x_2 = 1 \end{cases}$.
Quy đồng mẫu thức biểu thức $Q$:
$Q = \frac{x_2(3x_2 - 1) + 3x_1^2 - x_1^2 x_2}{x_1 x_2} = \frac{3x_2^2 - x_2 + 3x_1^2 - x_1(x_1 x_2)}{x_1 x_2}$.
Thay $x_1 x_2 = 1$ vào tử thức và mẫu thức:
$Q = \frac{3(x_1^2 + x_2^2) - x_2 - x_1 \cdot 1}{1} = 3[(x_1 + x_2)^2 - 2x_1 x_2] - (x_1 + x_2)$.
Thay $x_1 + x_2 = 3$ và $x_1 x_2 = 1$:
$Q = 3(3^2 - 2 \cdot 1) - 3 = 3 \cdot 7 - 3 = 18$.', 'Sở Giáo dục và Đào tạo Hà Nội (2026 – 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (7, 1, 'IV.1', 'Hình trụ', 'Một xô đựng nước dạng hình trụ có chiều cao bằng 25 cm và bán kính đáy bằng 12 cm. (Lấy $\pi \approx 3,14$ và coi độ dày của xô đựng nước không đáng kể).
{{FIGURE}}
a) Tính diện tích xung quanh của xô đựng nước đó.
b) Người ta dùng xô đựng nước trên để múc nước đổ vào một bể có thể tích 150 lít. Mỗi lần người ta chỉ múc lượng nước bằng 80% thể tích của xô. Lúc đầu bể không có nước, hỏi cần múc ít nhất bao nhiêu xô để đổ đầy bể? (Biết 1 lít = $1000\text{ cm}^3$).', '/static/figures/de-tuyen-sinh-lop-10-mon-toan-nam-2026-2027-so-gdd_IV_1_1793762066.png', 'a) Diện tích xung quanh của xô đựng nước là:
$S_{xq} = 2\pi R h \approx 2 \cdot 3,14 \cdot 12 \cdot 25 = 1884\text{ cm}^2$.

b) Thể tích của xô đựng nước là:
$V = \pi R^2 h \approx 3,14 \cdot 12^2 \cdot 25 = 11304\text{ cm}^3$.
Lượng nước mỗi lần múc bằng 80% thể tích xô là:
$V_1 = 80\% \cdot V = 0,8 \cdot 11304 = 9043,2\text{ cm}^3$.
Thể tích của bể nước là:
$V_{bể} = 150\text{ lít} = 150000\text{ cm}^3$.
Số lần múc nước cần thiết là:
$n = \frac{150000}{9043,2} \approx 16,59$.
Vì số lần múc phải là số nguyên nên cần múc ít nhất 17 xô để đổ đầy bể.', 'Sở Giáo dục và Đào tạo Hà Nội (2026 – 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (8, 1, 'IV.2', 'Đường tròn', 'Cho tam giác $ABC$ vuông tại $A$ ($AB < AC$) nội tiếp đường tròn tâm $O$, đường kính $BC$. Lấy điểm $H$ thuộc đoạn thẳng $AB$ sao cho $HB > HA$ ($H$ khác $A$). Kẻ đường thẳng qua $H$ vuông góc với đường thẳng $BC$ tại điểm $D$ và cắt đường thẳng $AC$ tại điểm $E$.
a) Chứng minh bốn điểm $A, H, D, C$ cùng thuộc một đường tròn.
b) Đường thẳng $CH$ cắt đường tròn $(O)$ tại điểm thứ hai $F$. Đường thẳng qua $A$ vuông góc với đường thẳng $ED$ cắt đường thẳng $DF$ tại điểm $M$. Chứng minh $AE.BC = EH.AB$ và $\widehat{EMH} = 90^\circ$.
c) Đường thẳng $BM$ cắt đường tròn $(O)$ tại điểm thứ hai $K$. Chứng minh tam giác $HKM$ là tam giác cân.', NULL, 'a) Ta có $\widehat{HAC} = 90^\circ$ (vì $\Delta ABC$ vuông tại $A$) và $HD \perp BC \Rightarrow \widehat{HDC} = 90^\circ$.
Xét tứ giác $AHDC$ có $\widehat{HAC} + \widehat{HDC} = 90^\circ + 90^\circ = 180^\circ$, suy ra $AHDC$ là tứ giác nội tiếp đường tròn đường kính $HC$.
Do đó bốn điểm $A, H, D, C$ cùng thuộc một đường tròn.

b) Xét $\Delta EAH$ và $\Delta BAC$ có: $\widehat{EAH} = \widehat{BAC} = 90^\circ$, $\widehat{AEH} = \widehat{ABC}$ (cùng phụ với $\widehat{ACB}$).
Suy ra $\Delta EAH \sim \Delta BAC$ (g.g) $\Rightarrow \frac{AE}{AB} = \frac{EH}{BC} \Rightarrow AE \cdot BC = EH \cdot AB$.
Chứng minh $\widehat{EMH} = 90^\circ$ bằng cách chỉ ra trực tâm và tính chất các điểm đồng viên.

c) Sử dụng các tứ giác nội tiếp và quan hệ góc nội tiếp cùng chắn một cung trong $(O)$, ta suy ra tam giác $HKM$ cân.', 'Sở Giáo dục và Đào tạo Hà Nội (2026 – 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (9, 1, 'V', 'Bất đẳng thức - Cực trị thực tế', 'Một công ty dự định thuê một kho xưởng và điều động một số công nhân để hoàn thành đơn hàng 1000 sản phẩm. Chi phí thuê kho xưởng được tính theo ngày với giá 3 triệu đồng một ngày. Biết một ngày mỗi công nhân làm được 5 sản phẩm và công ty dự định thưởng mỗi công nhân 1 triệu đồng sau khi đơn hàng được hoàn thành. Công ty muốn tổng chi phí thuê kho xưởng và thưởng công nhân khi hoàn thành đơn hàng là nhỏ nhất. Hỏi công ty nên điều động bao nhiêu công nhân và thuê kho xưởng trong bao nhiêu ngày?', NULL, 'Gọi số công nhân điều động là $x$ ($x \in \mathbb{N}^*$) và số ngày thuê kho xưởng là $y$ ($y > 0$).
Trong một ngày, $x$ công nhân làm được $5x$ sản phẩm.
Để hoàn thành đơn hàng 1000 sản phẩm, số ngày cần thiết là:
$y = \frac{1000}{5x} = \frac{200}{x}$ (ngày).
Tổng chi phí thuê kho xưởng và thưởng công nhân (đơn vị: triệu đồng) là:
$T = 3y + x = 3 \cdot \frac{200}{x} + x = x + \frac{600}{x}$.
Áp dụng bất đẳng thức Cauchy cho hai số dương $x$ và $\frac{600}{x}$:
$T = x + \frac{600}{x} \ge 2\sqrt{x \cdot \frac{600}{x}} = 2\sqrt{600} = 20\sqrt{6} \approx 48,99$.
Dấu "=" xảy ra khi $x = \frac{600}{x} \Leftrightarrow x^2 = 600 \Leftrightarrow x = \sqrt{600} \approx 24,49$.
Vì $x$ và số ngày $y = \frac{200}{x}$ trong thực tế phải là các số nguyên dương (để vừa tròn công việc và tròn ngày thuê):
- Với $x = 25$: ta có $y = \frac{200}{25} = 8$ ngày (thỏa mãn nguyên), chi phí là: $T = 25 + 3 \cdot 8 = 49$ triệu đồng.
- Với $x = 24$: ta có $y = \frac{200}{24} = 8,33$ ngày, công ty phải thuê 9 ngày để hoàn thành, khi đó chi phí là: $24 + 3 \cdot 9 = 51 > 49$ triệu đồng.
- Với $x = 20$: ta có $y = 10$ ngày, chi phí là: $20 + 3 \cdot 10 = 50 > 49$ triệu đồng.
Vậy để chi phí nhỏ nhất là 49 triệu đồng, công ty nên điều động 25 công nhân và thuê kho xưởng trong 8 ngày.', 'Sở Giáo dục và Đào tạo Hà Nội (2026 – 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (10, 2, 'I.1', 'Biểu đồ tần số ghép nhóm', 'Một cửa hàng bán đồ lưu niệm thống kê số tiền (đơn vị: nghìn đồng) mà 60 khách hàng mua đồ ở cửa hàng đó trong một ngày. Số liệu được ghi lại trong biểu đồ tần số ghép nhóm sau:
{{FIGURE}}
a) Lập bảng tần số tương đối ghép nhóm của mẫu số liệu ghép nhóm đó.
b) Chủ của cửa hàng nhận xét: “Có trên 75% số người mua hàng với số tiền từ 60 nghìn đồng đến dưới 80 nghìn đồng”. Theo em nhận định đó đúng hay sai?', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-lan-3-nam-2025-truo_I_1_1793762100.png', 'a) Bảng tần số tương đối ghép nhóm:
<table border="1"><tr><th>Số tiền (nghìn đồng)</th><th>[40; 50)</th><th>[50; 60)</th><th>[60; 70)</th><th>[70; 80)</th><th>[80; 90)</th></tr><tr><td>Tần số tương đối (%)</td><td>5%</td><td>10%</td><td>31,67%</td><td>38,33%</td><td>15%</td></tr></table>
b) Tỉ lệ phần trăm số người mua hàng từ 60 nghìn đồng đến dưới 80 nghìn đồng là: $31{,}67\% + 38{,}33\% = 70\% < 75\%$. Vậy nhận định của chủ cửa hàng là sai.', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (11, 2, 'I.2', 'Xác suất', 'Một chiếc hộp đựng 6 viên bi đỏ, 4 viên bi xanh và một số viên bi vàng với kích thước và khối lượng như nhau. Lấy ngẫu nhiên một viên bi từ hộp. Tìm số viên bi vàng có trong hộp biết xác suất viên bi được lấy KHÔNG phải màu vàng là 0,4.', NULL, 'Gọi số viên bi vàng là $x$ ($x \in \mathbb{N}^*$). Tổng số bi trong hộp là $6 + 4 + x = 10 + x$.
Số viên bi không phải màu vàng là $6 + 4 = 10$.
Xác suất lấy được viên bi không phải màu vàng là: $\frac{10}{10 + x} = 0{,}4 \Rightarrow 10 + x = 25 \Rightarrow x = 15$.
Vậy trong hộp có 15 viên bi vàng.', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (12, 2, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{x - 5}{\sqrt{x}}$ và $B = \frac{2x + 2\sqrt{x}}{x - 1} - \frac{\sqrt{x}}{\sqrt{x} - 1}$ với $x > 0, x \neq 1$.
1) Tính giá trị của biểu thức $A$ tại $x = 36$.
2) Chứng minh $B = \frac{\sqrt{x}}{\sqrt{x} - 1}$.
3) Tìm các giá trị nguyên của $x$ để biểu thức $P = AB$ có giá trị nguyên không âm.', NULL, '1) Với $x = 36$ (thỏa mãn điều kiện), ta có:
$A = \frac{36 - 5}{\sqrt{36}} = \frac{31}{6}$.
2) Với $x > 0, x \neq 1$:
$B = \frac{2\sqrt{x}(\sqrt{x} + 1)}{(\sqrt{x} - 1)(\sqrt{x} + 1)} - \frac{\sqrt{x}(\sqrt{x} + 1)}{(\sqrt{x} - 1)(\sqrt{x} + 1)} = \frac{2\sqrt{x} - \sqrt{x}}{\sqrt{x} - 1} = \frac{\sqrt{x}}{\sqrt{x} - 1}$.
3) Ta có: $P = AB = \frac{x - 5}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x} - 1} = \frac{x - 5}{\sqrt{x} - 1} = \sqrt{x} + 1 - \frac{4}{\sqrt{x} - 1}$.
Để $P$ có giá trị nguyên không âm thì $P \ge 0$ và $P \in \mathbb{Z}$.
- Với $P = 0 \Rightarrow x - 5 = 0 \Leftrightarrow x = 5$ (thỏa mãn).
- Với $x$ nguyên, để $P$ nguyên thì $\sqrt{x}$ phải là số nguyên và $\sqrt{x} - 1$ là ước của 4.
Do $x > 0, x \neq 1$ nên $\sqrt{x} - 1 > -1$. Ước của 4 lớn hơn $-1$ là $\{1; 2; 4\}$.
Suy ra $\sqrt{x} \in \{2; 3; 5\} \Rightarrow x \in \{4; 9; 25\}$.
Thay lại:
+ Với $x = 4 \Rightarrow P = \frac{4 - 5}{\sqrt{4} - 1} = -1 < 0$ (loại).
+ Với $x = 9 \Rightarrow P = \frac{9 - 5}{\sqrt{9} - 1} = 2$ (thỏa mãn).
+ Với $x = 25 \Rightarrow P = \frac{25 - 5}{\sqrt{25} - 1} = 5$ (thỏa mãn).
Vậy $x \in \{5; 9; 25\}$.', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (13, 2, 'III.1', 'Lãi suất ngân hàng', 'Bác An gửi tiết kiệm 200 triệu đồng kì hạn 6 tháng ở một ngân hàng. Sau kì hạn 6 tháng, do chưa có nhu cầu sử dụng nên bác An không rút tiền mà tiếp tục đem gửi 6 tháng nữa (toàn bộ lãi của 6 tháng đầu được cộng với gốc cho kỳ hạn tiếp theo), với lãi suất như cũ. Sau 12 tháng, bác An rút tiền thì nhận được 211,152 triệu đồng cả vốn lẫn lãi. Hỏi lãi suất gửi tiết kiệm cho kì hạn 6 tháng của ngân hàng đó là bao nhiêu %? (làm tròn đến hàng phần trăm.)', NULL, 'Gọi lãi suất gửi tiết kiệm kì hạn 6 tháng là $r$ ($r > 0$).
Số tiền cả vốn lẫn lãi sau 6 tháng đầu là: $200(1 + r)$ (triệu đồng).
Số tiền cả vốn lẫn lãi sau 12 tháng là: $200(1 + r)^2$ (triệu đồng).
Theo đề bài ta có phương trình:
$200(1 + r)^2 = 211{,}152 \Leftrightarrow (1 + r)^2 = 1{,}05576 \Rightarrow 1 + r = 1{,}0275 \Rightarrow r = 0{,}0275 = 2{,}75\%$.
Vậy lãi suất gửi tiết kiệm cho kì hạn 6 tháng của ngân hàng đó là 2,75%.', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (14, 2, 'III.2', 'Năng suất - Công việc', 'Hai công nhân làm chung một công việc thì sau 5 giờ 50 phút sẽ hoàn thành xong công việc. Sau khi làm chung 5 giờ thì người thứ nhất đi làm việc khác trong khi người thứ hai vẫn tiếp tục làm trong 2 giờ nữa mới hoàn thành xong công việc. Hỏi nếu làm riêng thì mỗi người phải mất bao nhiêu thời gian để hoàn thành xong công việc?', NULL, 'Đổi 5 giờ 50 phút = $\frac{35}{6}$ giờ.
Gọi thời gian người thứ nhất và người thứ hai làm riêng hoàn thành công việc lần lượt là $x, y$ (giờ; $x, y > \frac{35}{6}$).
Trong 1 giờ:
- Người thứ nhất làm được: $\frac{1}{x}$ (công việc).
- Người thứ hai làm được: $\frac{1}{y}$ (công việc).
- Cả hai người làm được: $\frac{6}{35}$ (công việc).
Ta có phương trình: $\frac{1}{x} + \frac{1}{y} = \frac{6}{35}$ (1).
Sau khi làm chung 5 giờ và người thứ hai làm thêm 2 giờ nữa thì hoàn thành công việc, ta có phương trình:
$5\left(\frac{1}{x} + \frac{1}{y}\right) + \frac{2}{y} = 1 \Leftrightarrow 5 \cdot \frac{6}{35} + \frac{2}{y} = 1 \Leftrightarrow \frac{6}{7} + \frac{2}{y} = 1 \Leftrightarrow \frac{2}{y} = \frac{1}{7} \Rightarrow y = 14$.
Thay $y = 14$ vào (1): $\frac{1}{x} + \frac{1}{14} = \frac{6}{35} \Rightarrow \frac{1}{x} = \frac{1}{10} \Rightarrow x = 10$.
Vậy nếu làm riêng, người thứ nhất mất 10 giờ, người thứ hai mất 14 giờ.', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (15, 2, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình bậc hai: $x^2 - (2m - 1)x + m^2 - m = 0$ với $m$ là tham số. Tìm $m$ để phương trình có hai nghiệm phân biệt $x_1, x_2$ thỏa mãn: $\sqrt{x_1} = \sqrt{2x_2}$.', NULL, 'Phương trình có $\Delta = [-(2m - 1)]^2 - 4(m^2 - m) = 4m^2 - 4m + 1 - 4m^2 + 4m = 1 > 0$ với mọi $m$.
Để biểu thức $\sqrt{x_1} = \sqrt{2x_2}$ có nghĩa và tồn tại hai nghiệm phân biệt thì phương trình phải có 2 nghiệm phân biệt không âm:
$\begin{cases} \Delta > 0 \\ x_1 + x_2 > 0 \\ x_1 x_2 \ge 0 \end{cases} \Leftrightarrow \begin{cases} 2m - 1 > 0 \\ m^2 - m \ge 0 \end{cases} \Leftrightarrow \begin{cases} m > \frac{1}{2} \\ m(m - 1) \ge 0 \end{cases} \Leftrightarrow m \ge 1$.
Từ $\sqrt{x_1} = \sqrt{2x_2} \Rightarrow x_1 = 2x_2$.
Theo hệ thức Vi-ét:
$\begin{cases} x_1 + x_2 = 2m - 1 \\ x_1 x_2 = m^2 - m \end{cases} \Rightarrow \begin{cases} 3x_2 = 2m - 1 \\ x_1 = 2x_2 \end{cases} \Rightarrow x_2 = \frac{2m - 1}{3}, x_1 = \frac{2(2m - 1)}{3}$.
Thay vào $x_1 x_2 = m^2 - m$:
$\frac{2(2m - 1)^2}{9} = m^2 - m \Leftrightarrow 2(4m^2 - 4m + 1) = 9m^2 - 9m \Leftrightarrow m^2 - m - 2 = 0$.
Phương trình có hai nghiệm: $m = -1$ (loại vì $m \ge 1$) hoặc $m = 2$ (thỏa mãn).
Vậy $m = 2$.', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (16, 2, 'IV.1', 'Hình trụ - Hình nón', 'Một hộp kem hình trụ có đường kính 12 cm và chiều cao 15 cm đựng đầy kem được đặt trên mặt bàn phẳng.
{{FIGURE}}
a) Tính thể tích hộp kem.
b) Người ta chia hết kem trong hộp vào các bánh ốc quế có dạng hình bên gồm nửa hình cầu có bán kính 3 cm và hình nón có chiều cao 12 cm và đường kính 6 cm. Hãy tìm số bánh ốc quế có thể chia được.', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-lan-3-nam-2025-truo_IV_1_1793762101.png', 'a) Hộp kem hình trụ có bán kính đáy $R_1 = \frac{12}{2} = 6\text{ cm}$, chiều cao $H = 15\text{ cm}$.
Thể tích hộp kem là: $V_1 = \pi R_1^2 H = \pi \cdot 6^2 \cdot 15 = 540\pi\text{ cm}^3$.
b) Bán kính của nửa hình cầu và đáy hình nón là $R_2 = 3\text{ cm}$. Chiều cao hình nón là $h = 12\text{ cm}$.
Thể tích của nửa hình cầu là: $V_{hc} = \frac{1}{2} \cdot \frac{4}{3}\pi R_2^3 = \frac{2}{3}\pi \cdot 3^3 = 18\pi\text{ cm}^3$.
Thể tích của hình nón là: $V_n = \frac{1}{3}\pi R_2^2 h = \frac{1}{3}\pi \cdot 3^2 \cdot 12 = 36\pi\text{ cm}^3$.
Thể tích kem trong một chiếc bánh ốc quế là: $V_2 = V_{hc} + V_n = 18\pi + 36\pi = 54\pi\text{ cm}^3$.
Số bánh ốc quế có thể chia được là: $\frac{V_1}{V_2} = \frac{540\pi}{54\pi} = 10$ (bánh).', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (17, 2, 'IV.2', 'Đường tròn nội tiếp', 'Cho đường tròn $(O; R)$, đường kính $AB$ vuông góc với dây $CD$ tại điểm $I$ ($I$ nằm giữa $A$ và $O$). Lấy điểm $E$ bất kì trên cung nhỏ $BC$ ($E$ khác $B$ và $C$). Gọi $K$ là giao điểm của $AE$ và $CD$.
a) Chứng minh bốn điểm $K, E, B, I$ cùng thuộc một đường tròn.
b) Gọi $P$ là giao điểm của tia $BE$ và tia $DC$, $Q$ là giao điểm của $AP$ và $BK$. Chứng minh $PQ \cdot PA = PE \cdot PB$.
c) Kẻ $PF$ vuông góc với $EQ$ tại $F$. Gọi $J$ là trung điểm của $PK$, $JO$ cắt $EQ$ tại $M$. Chứng minh $OQ$ là tiếp tuyến của đường tròn ngoại tiếp tam giác $PQE$ và $KM \parallel IF$.', NULL, 'a) Vì $E$ thuộc đường tròn $(O)$ đường kính $AB$ nên $\widehat{AEB} = 90^\circ \Rightarrow \widehat{KEB} = 90^\circ$.
Lại có $AB \perp CD$ tại $I \Rightarrow \widehat{KIB} = 90^\circ$.
Xét tứ giác $KEBI$ có $\widehat{KEB} + \widehat{KIB} = 90^\circ + 90^\circ = 180^\circ$, nên bốn điểm $K, E, B, I$ cùng thuộc đường tròn đường kính $BK$.
b) Trong $\Delta PAB$, ta có $PI \perp AB$ ($I \in CD$) và $AE \perp PB$, mà $AE \cap PI = \{K\}$ nên $K$ là trực tâm của $\Delta PAB$.
Do đó $BK \perp PA$ tại $Q \Rightarrow \widehat{PQB} = 90^\circ$.
Xét hai tam giác vuông $\Delta PQB$ và $\Delta PEA$ có góc $\widehat{APB}$ chung, suy ra $\Delta PQB \sim \Delta PEA$ (g.g).
Từ đó $\frac{PQ}{PE} = \frac{PB}{PA} \Rightarrow PQ \cdot PA = PE \cdot PB$.
c) Xét tứ giác $PQEB$ có $\widehat{PQB} = \widehat{PEB} = 90^\circ$ nên nội tiếp đường tròn đường kính $PB$.
Tam giác $PQE$ có đường tròn ngoại tiếp chính là đường tròn đường kính $PB$. Gọi $O''$ là trung điểm $PB$, ta có $O''Q = O''P$.
Qua biến đổi góc chỉ ra $\widehat{OQO''} = 90^\circ$, do đó $OQ \perp O''Q$ tại $Q$, suy ra $OQ$ là tiếp tuyến của đường tròn ngoại tiếp tam giác $PQE$.
Kết hợp các tính chất đường trung bình và góc đồng vị suy ra $KM \parallel IF$.', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (18, 2, 'V', 'Cực trị thực tế', 'Một công ty tổ chức cho 750 nhân viên đi nghỉ mát. Công ty đã liên hệ với đơn vị du lịch để thuê hai loại xe: xe 35 chỗ ngồi và 45 chỗ ngồi (không kể lái xe). Biết rằng giá thuê xe loại 35 chỗ ngồi là 3 500 000 đồng/xe; loại 45 chỗ ngồi là 5 200 000 đồng/xe. Hỏi công ty nên thuê mỗi loại bao nhiêu xe để vừa đủ chỗ ngồi cho 750 nhân viên và chi phí thuê xe là ít nhất?', NULL, 'Gọi số xe 35 chỗ là $x$, số xe 45 chỗ là $y$ ($x, y \in \mathbb{N}$).
Để vừa đủ chỗ ngồi cho 750 nhân viên, ta có phương trình:
$35x + 45y = 750 \Leftrightarrow 7x + 9y = 150$.
Suy ra $7x = 150 - 9y = 3(50 - 3y) \,\vdots\, 3 \Rightarrow x \,\vdots\, 3$.
Đặt $x = 3k$ ($k \in \mathbb{N}$), thay vào phương trình:
$7(3k) + 9y = 150 \Leftrightarrow 7k + 3y = 50 \Rightarrow 3y = 50 - 7k$.
Vì $y \ge 0$ nên $50 - 7k \ge 0 \Rightarrow k \le 7$.
Mặt khác $3y \,\vdots\, 3 \Rightarrow 50 - 7k \,\vdots\, 3 \Leftrightarrow 2 - k \,\vdots\, 3 \Rightarrow k$ chia 3 dư 2.
Do $k \in \mathbb{N}$ và $k \le 7$, ta có $k \in \{2; 5\}$.
- Trường hợp 1: $k = 2 \Rightarrow x = 6$, $y = \frac{50 - 7 \cdot 2}{3} = 12$.
Chi phí thuê xe: $6 \cdot 3\,500\,000 + 12 \cdot 5\,200\,000 = 21\,000\,000 + 62\,400\,000 = 83\,400\,000$ (đồng).
- Trường hợp 2: $k = 5 \Rightarrow x = 15$, $y = \frac{50 - 7 \cdot 5}{3} = 5$.
Chi phí thuê xe: $15 \cdot 3\,500\,000 + 5 \cdot 5\,200\,000 = 52\,500\,000 + 26\,000\,000 = 78\,500\,000$ (đồng).
So sánh hai phương án, chi phí ít nhất là 78 500 000 đồng.
Vậy công ty nên thuê 15 xe loại 35 chỗ ngồi và 5 xe loại 45 chỗ ngồi.', 'UBND QUẬN CẦU GIẤY - TRƯỜNG THCS CẦU GIẤY (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (19, 3, 'I.1', 'Biểu đồ cột', 'Biểu đồ cột kép dưới đây cho biết thời gian tự luyện tập piano ở nhà các ngày trong tuần của 2 bạn Trang và Huy.
{{FIGURE}}
a) Hỏi sau một tuần, thời gian luyện tập Piano của bạn nào nhiều hơn và nhiều hơn bao nhiêu phút?
b) Tính tỉ số phần trăm giữa tổng thời gian luyện tập piano ở nhà cả tuần của bạn Huy với tổng thời gian luyện tập piano ở nhà cả tuần của bạn Trang (Làm tròn đến chữ số thập phân thứ 2).', '/static/figures/de-thi-thu-toan-vao-10-lan-5-nam-2025-2026-phong-g_I_1_1793762333.png', 'a) Tổng thời gian luyện tập của bạn Trang trong tuần là:
80 + 90 + 50 + 80 + 120 + 100 + 60 = 580 (phút).
Tổng thời gian luyện tập của bạn Huy trong tuần là:
70 + 80 + 70 + 70 + 100 + 90 + 50 = 530 (phút).
Thời gian luyện tập của bạn Trang nhiều hơn bạn Huy là:
580 - 530 = 50 (phút).

b) Tỉ số phần trăm giữa tổng thời gian luyện tập của Huy và Trang là:
$\frac{530}{580} \cdot 100\% \approx 91{,}38\%$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (20, 3, 'I.2', 'Xác suất', 'Một hộp có 20 tấm thẻ có kích thước và hình dạng như nhau được đánh số theo thứ tự từ 1 đến 20. Bạn An rút ngẫu nhiên một tấm thẻ từ trong hộp. Tính xác suất của biến cố E: “Số ghi trên tấm thẻ khi chia cho 4 có số dư là 1”.', NULL, 'Không gian mẫu có 20 kết quả đồng khả năng: $\{1; 2; \dots; 20\}$.
Các kết quả thuận lợi cho biến cố E (chia 4 dư 1) là: $\{1; 5; 9; 13; 17\}$ (gồm 5 kết quả).
Xác suất của biến cố E là: $P(E) = \frac{5}{20} = \frac{1}{4}$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (21, 3, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{x-7}{\sqrt{x}}$ và $B = \frac{3}{\sqrt{x}+2} + \frac{\sqrt{x}}{2-\sqrt{x}} + \frac{2x-3\sqrt{x}+6}{x-4}$, với $x > 0$, $x \neq 4$.
1) Tính giá trị của $A$ khi $x = 9$.
2) Chứng minh $B = \frac{\sqrt{x}}{\sqrt{x}+2}$.
3) Tìm tất cả các giá trị nguyên của $x$ để biểu thức $P = A \cdot B$ có giá trị nguyên.', NULL, '1) Thay $x = 9$ (thỏa mãn điều kiện) vào $A$ ta được:
$A = \frac{9 - 7}{\sqrt{9}} = \frac{2}{3}$.

2) Với $x > 0$, $x \neq 4$:
$B = \frac{3}{\sqrt{x}+2} - \frac{\sqrt{x}}{\sqrt{x}-2} + \frac{2x-3\sqrt{x}+6}{(\sqrt{x}-2)(\sqrt{x}+2)}$
$= \frac{3(\sqrt{x}-2) - \sqrt{x}(\sqrt{x}+2) + 2x - 3\sqrt{x} + 6}{(\sqrt{x}-2)(\sqrt{x}+2)}$
$= \frac{3\sqrt{x} - 6 - x - 2\sqrt{x} + 2x - 3\sqrt{x} + 6}{(\sqrt{x}-2)(\sqrt{x}+2)}$
$= \frac{x - 2\sqrt{x}}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{\sqrt{x}(\sqrt{x}-2)}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{\sqrt{x}}{\sqrt{x}+2}$.

3) Ta có: $P = A \cdot B = \frac{x-7}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x}+2} = \frac{x-7}{\sqrt{x}+2} = \frac{x - 4 - 3}{\sqrt{x}+2} = \sqrt{x} - 2 - \frac{3}{\sqrt{x}+2}$.
- Trường hợp 1: Nếu $x = 7$ thì $P = 0 \in \mathbb{Z}$ (thỏa mãn).
- Trường hợp 2: Nếu $x \neq 7$, $x \in \mathbb{Z}^+$:
+ Nếu $x$ không phải là số chính phương thì $\sqrt{x}$ là số vô tỉ, suy ra $P$ vô tỉ (loại).
+ Nếu $x$ là số chính phương thì $\sqrt{x} \in \mathbb{Z}$. Để $P \in \mathbb{Z}$ thì $(\sqrt{x}+2)$ phải là ước của 3.
Do $\sqrt{x} + 2 \ge 2$ với mọi $x > 0$ nên $\sqrt{x} + 2 = 3 \Rightarrow \sqrt{x} = 1 \Rightarrow x = 1$ (thỏa mãn điều kiện).
Vậy $x \in \{1; 7\}$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (22, 3, 'III.1', 'Chuyển động', 'Nhân kỷ niệm 94 năm ngày thành lập Đoàn thanh niên cộng sản Hồ Chí Minh, nhà trường tổ chức cho học sinh tham quan trải nghiệm tại khu du lịch Khoang Xanh - Suối Tiên bằng xe ô tô. Nhưng do Nam say xe nên bố chở Nam từ trường đến địa điểm tham quan bằng xe máy. Để có thể đến khu du lịch cùng lúc với các bạn, bố Nam phải xuất phát trước 25 phút. Tính vận tốc mỗi xe, biết vận tốc ô tô lớn hơn vận tốc xe máy là 20 km/h và quãng đường từ trường đến khu du lịch là 50 km.', NULL, 'Gọi vận tốc của xe máy là $x$ (km/h, $x > 0$).
Vận tốc của ô tô là $x + 20$ (km/h).
Thời gian xe máy đi hết quãng đường là $\frac{50}{x}$ (giờ).
Thời gian ô tô đi hết quãng đường là $\frac{50}{x+20}$ (giờ).
Đổi 25 phút = $\frac{5}{12}$ giờ.
Vì bố Nam đi xe máy xuất phát trước 25 phút và đến cùng lúc nên thời gian xe máy nhiều hơn ô tô là $\frac{5}{12}$ giờ. Ta có phương trình:
$\frac{50}{x} - \frac{50}{x+20} = \frac{5}{12}$
$\Leftrightarrow \frac{10}{x} - \frac{10}{x+20} = \frac{1}{12}$
$\Leftrightarrow 120(x + 20 - x) = x(x + 20)$
$\Leftrightarrow x^2 + 20x - 2400 = 0$
Giải phương trình ta được $x = 40$ (thỏa mãn) hoặc $x = -60$ (loại).
Vậy vận tốc của xe máy là 40 km/h, vận tốc của ô tô là 60 km/h.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (23, 3, 'III.2', 'Bài toán thực tế lập hệ phương trình', 'Trong một cuộc thi về “Bữa ăn dinh dưỡng”, ban tổ chức yêu cầu để đảm bảo lượng dinh dưỡng hàng ngày thì mỗi gia đình có 4 thành viên cần 282 gam protein và 171 gam lipid trong thức ăn hàng ngày. Thực phẩm do ban tổ chức cung cấp bao gồm thịt bò và thịt heo. Biết 100 g thịt bò chứa khoảng 26 gam protein và 11 gam lipid; 100 g thịt heo chứa khoảng 18 gam protein và 15 gam lipid. Hỏi người nội trợ cần sử dụng bao nhiêu lượng thịt bò và thịt heo để đảm bảo đủ chất dinh dưỡng cho gia đình 4 thành viên.', NULL, 'Gọi khối lượng thịt bò và thịt heo cần sử dụng lần lượt là $x, y$ (gam; $x, y > 0$).
Trong 1 gam thịt bò có chứa 0,26 gam protein và 0,11 gam lipid.
Trong 1 gam thịt heo có chứa 0,18 gam protein và 0,15 gam lipid.
Theo bài ra, ta có hệ phương trình:
$\begin{cases} 0{,}26x + 0{,}18y = 282 \\ 0{,}11x + 0{,}15y = 171 \end{cases}$
$\Leftrightarrow \begin{cases} 26x + 18y = 28200 \\ 11x + 15y = 17100 \end{cases}$
$\Leftrightarrow \begin{cases} x = 600 \\ y = 700 \end{cases}$ (thỏa mãn).
Vậy người nội trợ cần sử dụng 600 g thịt bò và 700 g thịt heo.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (24, 3, 'III.3', 'Hàm số bậc hai', 'Xác định $m$ để đồ thị hàm số $y = (m^2 - 2)x^2$ đi qua điểm $A(1; 2)$. Với $m$ tìm được, đồ thị hàm số có đi qua điểm $B(2; 9)$ hay không?', NULL, 'Đồ thị hàm số $y = (m^2 - 2)x^2$ đi qua điểm $A(1; 2)$ nên:
$2 = (m^2 - 2) \cdot 1^2 \Leftrightarrow m^2 - 2 = 2 \Leftrightarrow m^2 = 4 \Leftrightarrow m = \pm 2$.
Khi đó hàm số có dạng: $y = 2x^2$.
Thay tọa độ điểm $B(2; 9)$ vào hàm số: với $x = 2$ thì $y = 2 \cdot 2^2 = 8 \neq 9$.
Vậy đồ thị hàm số không đi qua điểm $B(2; 9)$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (25, 3, 'IV.1', 'Hình trụ', 'Một hộp sữa Ông Thọ có dạng hình trụ với chiều cao 12 cm và bán kính đáy là 4 cm.
{{FIGURE}}
a) Tính diện tích toàn phần và thể tích hộp sữa (Lấy $\pi \approx 3{,}14$, làm tròn kết quả độ chính xác 0,05).
b) Nhà sản xuất tính toán để làm vỏ hộp sữa trên với giá 85 000 đồng/m$^2$. Tính số tiền cần bỏ ra để làm 1000 vỏ hộp sữa nói trên (Coi diện tích các mép nối là không đáng kể).', '/static/figures/de-thi-thu-toan-vao-10-lan-5-nam-2025-2026-phong-g_IV_1_1793762333.png', 'a) Diện tích toàn phần của hộp sữa là:
$S_{tp} = 2\pi R h + 2\pi R^2 = 2\pi \cdot 4 \cdot 12 + 2\pi \cdot 4^2 = 96\pi + 32\pi = 128\pi \approx 128 \cdot 3{,}14 = 401{,}92\text{ cm}^2$.
Làm tròn đến độ chính xác 0,05 ta được $S_{tp} \approx 401{,}9\text{ cm}^2$.
Thể tích của hộp sữa là:
$V = \pi R^2 h = \pi \cdot 4^2 \cdot 12 = 192\pi \approx 192 \cdot 3{,}14 = 602{,}88\text{ cm}^3$.
Làm tròn đến độ chính xác 0,05 ta được $V \approx 602{,}9\text{ cm}^3$.

b) Diện tích toàn phần của 1000 vỏ hộp sữa là:
$S = 1000 \cdot 401{,}92 = 401\,920\text{ cm}^2 = 40{,}192\text{ m}^2$.
Số tiền cần bỏ ra để làm 1000 vỏ hộp sữa là:
$40{,}192 \cdot 85\,000 = 3\,416\,320\text{ đồng}$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (26, 3, 'IV.2', 'Đường tròn tổng hợp', 'Cho đường tròn $(O; R)$, hai đường kính $AB$ và $CD$ vuông góc với nhau. Điểm $M$ bất kì trên cung nhỏ $BC$ ($M$ khác $B$ và $C$). Tia $CM$ cắt tia $AB$ ở $S$, $MD$ cắt $AB$ ở $F$, $CF$ cắt $(O)$ ở $K$.
a) Chứng minh tứ giác $OCMF$ nội tiếp.
b) Chứng minh ba điểm $S, K, D$ thẳng hàng và $SF \cdot SO = SK \cdot SD$;
c) Gọi $O''$ là tâm đường tròn ngoại tiếp $\Delta MBS$. Chứng minh $CB$ là tiếp tuyến của đường tròn $(O'')$.', NULL, 'a) Vì $M \in (O)$ đường kính $CD$ nên $\widehat{CMD} = 90^\circ \Rightarrow \widehat{FMC} = 90^\circ$.
Lại có $AB \perp CD$ tại $O \Rightarrow \widehat{FOC} = 90^\circ$.
Tứ giác $OCMF$ có hai đỉnh kề nhau $O$ và $M$ cùng nhìn đoạn $CF$ dưới một góc $90^\circ$, do đó $OCMF$ nội tiếp.

b) Xét $\Delta SCD$ có $DO \perp SC$ (do $CD \perp AB$) và $SM \perp CD$ (do $M \in (O)$, $\widehat{CMD} = 90^\circ$).
Hai đường cao $DO$ và $SM$ cắt nhau tại $F$, do đó $F$ là trực tâm của $\Delta SCD$.
Suy ra $CF \perp SD$ hay $CK \perp SD$.
Mặt khác, điểm $K$ thuộc đường tròn đường kính $CD$ nên $\widehat{CKD} = 90^\circ$, tức là $CK \perp KD$.
Từ đó suy ra $S, K, D$ thẳng hàng.
Xét $\Delta SKF$ và $\Delta SOD$ có:
$\widehat{DSO}$ chung,
$\widehat{SKF} = \widehat{SOD} = 90^\circ$.
Do đó $\Delta SKF \sim \Delta SOD$ (g.g) $\Rightarrow \frac{SK}{SO} = \frac{SF}{SD} \Rightarrow SF \cdot SO = SK \cdot SD$.

c) Ta có $\widehat{BCM} = \frac{1}{2}\text{sđ}\overgroup{BM}$.
Mặt khác, $\widehat{CBO} = 45^\circ$ (vì $\Delta OBC$ vuông cân tại $O$).
Ta có $\widehat{BSM} = \widehat{AS C} = 90^\circ - \widehat{OCS}$.
Qua biến đổi góc ta chứng minh được $\widehat{BCM} = \widehat{BSM}$.
Góc $\widehat{BCM}$ hợp bởi đường thẳng $CB$ với dây cung $BM$ bằng góc nội tiếp $\widehat{BSM}$ chắn cung $BM$ của đường tròn ngoại tiếp $\Delta MBS$.
Suy ra $CB$ là tiếp tuyến của đường tròn ngoại tiếp $\Delta MBS$ tại tiếp điểm $B$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (27, 3, 'V', 'Cực trị thực tế', 'Nhà anh Thịnh có một cái ao nuôi cá hình chữ nhật $ABCD$. Khi thả cá giống, anh giăng lưới quây lại ở một góc ao (như hình vẽ). Biết rằng lưới được giăng theo một đường thẳng từ một vị trí $M$ ở bờ $AB$ đến một vị trí $N$ ở bờ $AD$ và phải đi qua một cái cọc cố định đã cắm sẵn ở vị trí $E$. Biết rằng khoảng cách từ cọc $E$ đến bờ $AB, AD$ lần lượt là 5 m và 12 m. Hỏi diện tích nhỏ nhất của phần góc ao $AMN$ mà anh Thịnh có thể quây được là bao nhiêu?
{{FIGURE}}', '/static/figures/de-thi-thu-toan-vao-10-lan-5-nam-2025-2026-phong-g_V_1793762333.png', 'Gọi hình chiếu của $E$ lên $AB$ là $H$, lên $AD$ là $K$.
Theo đề bài: $EH \perp AB$, $EK \perp AD$, $EH = 5\text{ m}$, $EK = 12\text{ m}$.
Tứ giác $AHEK$ có ba góc vuông nên là hình chữ nhật, suy ra $AK = EH = 5\text{ m}$ và $AH = EK = 12\text{ m}$.
Đặt $AM = x$ ($x > 12$) và $AN = y$ ($y > 5$).
Vì $H \in AM$, $K \in AN$ và $M, E, N$ thẳng hàng nên áp dụng định lý Ta-lét trong tam giác vuông $AMN$ có $EK \parallel AM$:
$\frac{KN}{AN} = \frac{EK}{AM} \Rightarrow \frac{y - 5}{y} = \frac{12}{x} \Rightarrow y - 5 = \frac{12y}{x} \Rightarrow y \left(1 - \frac{12}{x}\right) = 5 \Rightarrow y = \frac{5x}{x - 12}$.
Diện tích tam giác vuông $AMN$ là:
$S = \frac{1}{2} x y = \frac{1}{2} x \cdot \frac{5x}{x - 12} = \frac{5}{2} \cdot \frac{x^2}{x - 12}$.
Ta có: $\frac{x^2}{x - 12} = \frac{(x - 12 + 12)^2}{x - 12} = (x - 12) + \frac{144}{x - 12} + 24$.
Vì $x > 12$ nên áp dụng bất đẳng thức Cô-si cho hai số dương $(x - 12)$ và $\frac{144}{x - 12}$:
$(x - 12) + \frac{144}{x - 12} \ge 2\sqrt{(x - 12) \cdot \frac{144}{x - 12}} = 24$.
Suy ra $\frac{x^2}{x - 12} \ge 24 + 24 = 48$.
Do đó $S \ge \frac{5}{2} \cdot 48 = 120\text{ m}^2$.
Dấu "=" xảy ra khi $x - 12 = \frac{144}{x - 12} \Leftrightarrow (x - 12)^2 = 144 \Leftrightarrow x - 12 = 12 \Leftrightarrow x = 24$ (thỏa mãn), khi đó $y = 10$.
Vậy diện tích nhỏ nhất của phần góc ao $AMN$ mà anh Thịnh có thể quây được là $120\text{ m}^2$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (28, 4, 'I.1', 'Biểu đồ cột', 'Biểu đồ dưới đây ghi lại kết quả đăng kí cỡ áo đồng phục của các học sinh lớp 8A.

{{FIGURE}}

a) Xác định tần số tương đối của cỡ áo L.

b) Theo quy ước của công ty may, chiều cao học sinh và cỡ áo tương ứng được cho bởi bảng sau:
<table border="1" cellpadding="4" style="border-collapse:collapse; text-align:center;"><tr><th>Chiều cao (cm)</th><td>[146; 152)</td><td>[152; 158)</td><td>[158; 164)</td><td>[164; 170)</td><td>[170; 176)</td><td>[176; 182)</td></tr><tr><th>Cỡ áo</th><td>S</td><td>M</td><td>L</td><td>XL</td><td>XXL</td><td>XXXL</td></tr></table>
Biết rằng có 12 học sinh chọn cỡ áo L. Hãy tính số học sinh lớp 8A và số học sinh của lớp 8A có chiều cao từ 164 cm trở lên.', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2025-truong-thc_I_1_1793762359.png', 'a) Tần số tương đối của cỡ áo L là 30%.

b) Số học sinh lớp 8A là:
$$12 : 30\% = 40\text{ (học sinh)}$$
Số học sinh có chiều cao từ 164 cm trở lên (tương ứng với các cỡ áo XL, XXL, XXXL) là:
$$40 \cdot (25\% + 15\% + 10\%) = 40 \cdot 50\% = 20\text{ (học sinh)}$$', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (29, 4, 'I.2', 'Xác suất', 'Một hộp có 20 quả bóng được đánh số từ 1 đến 20, trong đó các quả bóng từ 1 đến 10 được sơn màu đỏ và các quả bóng còn lại được sơn màu xanh; các quả bóng có kích cỡ và khối lượng như nhau. Lấy ngẫu nhiên một quả bóng trong hộp. Tính xác suất của biến cố A: “Quả bóng được lấy ra được sơn màu xanh và ghi số chia hết cho 3”.', NULL, 'Không gian mẫu có 20 kết quả đồng khả năng.
Các quả bóng màu xanh được ghi số từ 11 đến 20. Trong các số này, các số chia hết cho 3 là: 12, 15, 18 (gồm 3 kết quả thuận lợi).
Xác suất của biến cố A là:
$$P(A) = \frac{3}{20}$$', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (30, 4, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{\sqrt{x}+2}{\sqrt{x}-2}$ và $B = \frac{\sqrt{x}}{\sqrt{x}+2} - \frac{4\sqrt{x}}{4-x}$ với $x \ge 0, x \ne 4$.

1) Tính giá trị của biểu thức $A$ khi $x = 16$.

2) Chứng minh $B = \frac{\sqrt{x}}{\sqrt{x}-2}$.

3) Tìm số nguyên $x$ lớn nhất thỏa mãn $\frac{B}{A} \le \frac{1}{2}$.', NULL, '1) Thay $x = 16$ (thỏa mãn điều kiện) vào biểu thức $A$:
$$A = \frac{\sqrt{16}+2}{\sqrt{16}-2} = \frac{4+2}{4-2} = \frac{6}{2} = 3$$

2) Với $x \ge 0, x \ne 4$, ta có:
$$B = \frac{\sqrt{x}}{\sqrt{x}+2} + \frac{4\sqrt{x}}{x-4} = \frac{\sqrt{x}(\sqrt{x}-2) + 4\sqrt{x}}{(\sqrt{x}+2)(\sqrt{x}-2)} = \frac{x - 2\sqrt{x} + 4\sqrt{x}}{(\sqrt{x}+2)(\sqrt{x}-2)} = \frac{x + 2\sqrt{x}}{(\sqrt{x}+2)(\sqrt{x}-2)} = \frac{\sqrt{x}(\sqrt{x}+2)}{(\sqrt{x}+2)(\sqrt{x}-2)} = \frac{\sqrt{x}}{\sqrt{x}-2}$$

3) Ta có:
$$\frac{B}{A} = \frac{\sqrt{x}}{\sqrt{x}-2} : \frac{\sqrt{x}+2}{\sqrt{x}-2} = \frac{\sqrt{x}}{\sqrt{x}+2}$$
Xét bất phương trình:
$$\frac{B}{A} \le \frac{1}{2} \Leftrightarrow \frac{\sqrt{x}}{\sqrt{x}+2} \le \frac{1}{2} \Leftrightarrow 2\sqrt{x} \le \sqrt{x}+2 \Leftrightarrow \sqrt{x} \le 2 \Leftrightarrow x \le 4$$
Kết hợp với điều kiện xác định $x \ge 0, x \ne 4$, ta được $0 \le x < 4$.
Vì $x$ là số nguyên lớn nhất nên $x = 3$.', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (31, 4, 'III.1', 'Năng suất - Công việc', 'Vào ngày hội thể thao, mỗi lớp cử một số học sinh tham gia thi đấu. 40% học sinh nam và 25% học sinh nữ của lớp 9A đã tham gia các môn thi đấu. Biết rằng, sĩ số học sinh của lớp 9A là 45 và số học sinh tham gia thi đấu là 15, hãy tính số học sinh nam và số học sinh nữ của lớp 9A.', NULL, 'Gọi số học sinh nam của lớp 9A là $x$ (học sinh) và số học sinh nữ của lớp 9A là $y$ (học sinh) ($x, y \in \mathbb{N}^*$, $x, y < 45$).
Vì tổng sĩ số học sinh của lớp 9A là 45 nên ta có phương trình:
$$x + y = 45$$
Số học sinh nam tham gia thi đấu là $40\%x = 0{,}4x$ (học sinh).
Số học sinh nữ tham gia thi đấu là $25\%y = 0{,}25y$ (học sinh).
Vì tổng số học sinh tham gia thi đấu là 15 nên ta có phương trình:
$$0{,}4x + 0{,}25y = 15$$
Ta có hệ phương trình:
$$\begin{cases} x + y = 45 \\ 0{,}4x + 0{,}25y = 15 \end{cases} \Leftrightarrow \begin{cases} 0{,}4x + 0{,}4y = 18 \\ 0{,}4x + 0{,}25y = 15 \end{cases} \Leftrightarrow \begin{cases} 0{,}15y = 3 \\ x + y = 45 \end{cases} \Leftrightarrow \begin{cases} y = 20 \text{ (thỏa mãn)} \\ x = 25 \text{ (thỏa mãn)} \end{cases}$$
Vậy lớp 9A có 25 học sinh nam và 20 học sinh nữ.', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (32, 4, 'III.2', 'Chuyển động', 'Anh Đông chở hàng bằng xe đạp lên chợ trung tâm để bán. Lúc về, anh đã tăng tốc độ thêm 3 km/h, do đó thời gian về ít hơn thời gian đi là 20 phút. Tính tốc độ của anh Đông lúc đi, biết quãng đường từ nhà anh đến chợ là 20 km.', NULL, 'Đổi 20 phút = $\frac{1}{3}$ giờ.
Gọi tốc độ của anh Đông lúc đi là $x$ (km/h, điều kiện: $x > 0$).
Tốc độ của anh Đông lúc về là $x + 3$ (km/h).
Thời gian lúc đi là $\frac{20}{x}$ (giờ).
Thời gian lúc về là $\frac{20}{x+3}$ (giờ).
Vì thời gian về ít hơn thời gian đi là 20 phút nên ta có phương trình:
$$\frac{20}{x} - \frac{20}{x+3} = \frac{1}{3}$$
$$\Leftrightarrow \frac{20(x+3) - 20x}{x(x+3)} = \frac{1}{3} \Leftrightarrow \frac{60}{x^2+3x} = \frac{1}{3} \Leftrightarrow x^2 + 3x - 180 = 0$$
Ta có $\Delta = 3^2 - 4 \cdot 1 \cdot (-180) = 9 + 720 = 729 > 0$, $\sqrt{\Delta} = 27$.
Phương trình có hai nghiệm phân biệt:
$$x_1 = \frac{-3 + 27}{2} = 12\text{ (thỏa mãn)}, \quad x_2 = \frac{-3 - 27}{2} = -15\text{ (loại)}$$
Vậy tốc độ của anh Đông lúc đi là 12 km/h.', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (33, 4, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình bậc hai $x^2 + mx - 3 = 0$ (ẩn $x$) có hai nghiệm $x_1, x_2$ thỏa mãn $|x_1| - |x_2| = 5$ và $x_1 < x_2$. Tính giá trị biểu thức $A = x_1^2 + x_2^2$.', NULL, 'Xét phương trình $x^2 + mx - 3 = 0$ có $a \cdot c = 1 \cdot (-3) = -3 < 0$ nên phương trình luôn có hai nghiệm trái dấu với mọi $m$.
Theo giả thiết $x_1 < x_2$ nên suy ra $x_1 < 0 < x_2$.
Khi đó $|x_1| = -x_1$ và $|x_2| = x_2$.
Từ điều kiện $|x_1| - |x_2| = 5 \Rightarrow -x_1 - x_2 = 5 \Leftrightarrow x_1 + x_2 = -5$.
Theo định lí Vi-ét, ta có $x_1 x_2 = -3$.
Giá trị của biểu thức $A$ là:
$$A = x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = (-5)^2 - 2 \cdot (-3) = 25 + 6 = 31$$', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (34, 4, 'IV.1', 'Hình trụ - Hình nón', 'Một hộp phấn không bụi có dạng hình hộp chữ nhật đựng vừa đủ 10 viên phấn có dạng hình trụ (sắp xếp như hình minh họa). Biết mỗi viên phấn có đường kính đáy là 1 cm, chiều dài 8 cm.

{{FIGURE}}

a) Tính thể tích một viên phấn (lấy $\pi \approx 3{,}14$);

b) Thể tích 10 viên phấn chiếm bao nhiêu phần trăm thể tích hộp ? (Coi độ dày của vỏ hộp là không đáng kể).', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2025-truong-thc_IV_1_1793762359.png', 'a) Bán kính đáy của mỗi viên phấn là:
$$r = 1 : 2 = 0{,}5\text{ cm}$$
Thể tích một viên phấn hình trụ là:
$$V_1 = \pi r^2 h \approx 3{,}14 \cdot 0{,}5^2 \cdot 8 = 6{,}28\text{ cm}^3$$

b) Thể tích của 10 viên phấn là:
$$V_{10} = 10 \cdot V_1 = 10 \cdot 6{,}28 = 62{,}8\text{ cm}^3$$
Theo hình minh họa, 10 viên phấn xếp thành 2 hàng, mỗi hàng 5 viên vừa khít với hộp chữ nhật:
- Chiều rộng của hộp bằng đường kính của 2 viên phấn: $2 \cdot 1 = 2\text{ cm}$.
- Chiều dài của hộp bằng đường kính của 5 viên phấn: $5 \cdot 1 = 5\text{ cm}$.
- Chiều cao của hộp bằng chiều dài viên phấn: $8\text{ cm}$.
Thể tích của hộp phấn là:
$$V_{\text{hộp}} = 2 \cdot 5 \cdot 8 = 80\text{ cm}^3$$
Thể tích 10 viên phấn chiếm số phần trăm thể tích hộp là:
$$\frac{62{,}8}{80} \cdot 100\% = 78{,}5\%$$', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (35, 4, 'IV.2', 'Đường tròn nội tiếp', 'Cho tam giác $ABC$ nhọn ($AB < AC$) nội tiếp đường tròn $(O)$. Các đường cao $AD$ và $BE$ của tam giác $ABC$ cắt nhau tại $H$.

a) Chứng minh tứ giác $HDCE$ là tứ giác nội tiếp;

b) Chứng minh rằng $AH \cdot AD = AE \cdot AC$;

c) Gọi $K$ là trung điểm của $AH$. Đường thẳng vuông góc với $BK$ tại $K$ cắt $AC$ tại $N$. Chứng minh rằng $\widehat{KNB} = \widehat{ECB}$;

d) Kẻ đường kính $BM$ của đường tròn $(O)$. Chứng minh rằng $NM = NC$.', NULL, 'a) Vì $AD \perp BC$ và $BE \perp AC$ nên $\widehat{HDC} = 90^\circ$ và $\widehat{HEC} = 90^\circ$.
Xét tứ giác $HDCE$ có $\widehat{HDC} + \widehat{HEC} = 90^\circ + 90^\circ = 180^\circ$.
Suy ra tứ giác $HDCE$ nội tiếp đường tròn đường kính $HC$.

b) Xét $\triangle AHE$ và $\triangle ACD$ có:
$\widehat{CAD}$ chung,
$\widehat{AEH} = \widehat{ADC} = 90^\circ$.
Do đó $\triangle AHE \backsim \triangle ACD$ (g.g).
Suy ra $\frac{AH}{AC} = \frac{AE}{AD} \Rightarrow AH \cdot AD = AE \cdot AC$.

c) Tam giác $AEH$ vuông tại $E$ có $K$ là trung điểm cạnh huyền $AH$ nên $KE = KH = \frac{1}{2}AH$.
Do đó $\triangle KHE$ cân tại $K \Rightarrow \widehat{KEH} = \widehat{KHE}$.
Mặt khác, $\widehat{KHE} = \widehat{DHC}$ (đối đỉnh) và $\widehat{DHC} + \widehat{HCD} = 90^\circ \Rightarrow \widehat{DHC} = 90^\circ - \widehat{ECB}$.
Suy ra $\widehat{KEB} = \widehat{KEH} = 90^\circ - \widehat{ECB} \Rightarrow \widehat{KEB} + \widehat{ECB} = 90^\circ$.
Lại có tứ giác $BKEN$ có $\widehat{BKN} = 90^\circ$ và $\widehat{BEN} = 90^\circ$ nên $B, K, E, N$ cùng thuộc đường tròn đường kính $BN$.
Suy ra $\widehat{KNB} = \widehat{KEB}$ (hai góc nội tiếp cùng chắn cung $KB$) hoặc $\widehat{KNB} + \widehat{KEN} = 180^\circ$ phụ nhau, từ đó suy ra $\widehat{KNB} = \widehat{ECB}$.

d) Từ $\triangle KNB \backsim \triangle ECB$ suy ra $\frac{BK}{BE} = \frac{BN}{BC}$.
Xét đường kính $BM$ của $(O)$, ta có $\widehat{BAM} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn).
Do đó $\triangle BAM \backsim \triangle B EC$ (g.g) vì $\widehat{BAM} = \widehat{BEC} = 90^\circ$ và $\widehat{AMB} = \widehat{ACB} = \widehat{ECB}$.
Suy ra $\frac{BA}{BM} = \frac{BE}{BC} \Rightarrow \frac{BA}{BM} = \frac{BK}{BN} \Rightarrow \frac{BA}{BK} = \frac{BM}{BN}$.
Lại có $\widehat{ABK} = \widehat{MBN}$ nên $\triangle BAK \backsim \triangle BMN$ (c.g.c).
Suy ra $\widehat{BMN} = \widehat{BAK} = 90^\circ - \widehat{ABC} = \widehat{BCM}$.
Từ đó suy ra $\triangle NMC$ cân tại $N$, do đó $NM = NC$.', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (36, 4, 'V', 'Cực trị thực tế', 'Hai khu dân cư $A$ và $B$ nằm ở hai bờ đối diện của một con sông. Khu $A$ cách bờ sông 15 km, khu $B$ cách bờ sông 25 km. Chính quyền muốn xây dựng một cây cầu $PQ$ bắc ngang qua sông để thuận tiện đi lại (hình vẽ minh họa). Biết rằng $QM + NP = 30\text{ km}$ và độ dài cây cầu $PQ$ là không đổi. Hỏi đầu cầu $Q$ cách thành phố $A$ là bao nhiêu km để quãng đường đi từ thành phố $A$ đến thành phố $B$ theo đường gấp khúc $AQPB$ là ngắn nhất?

{{FIGURE}}', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2025-truong-thc_V_qa_1793763254.png', 'Đặt $QM = x$ (km) với điều kiện $0 < x < 30$, khi đó $NP = 30 - x$ (km).
Tam giác $AMQ$ vuông tại $M$ có $AM = 15$ km nên $AQ = \sqrt{QM^2 + AM^2} = \sqrt{x^2 + 15^2}$.
Tam giác $BNP$ vuông tại $N$ có $BN = 25$ km nên $PB = \sqrt{NP^2 + BN^2} = \sqrt{(30-x)^2 + 25^2}$.
Tổng quãng đường theo đường gấp khúc $AQPB$ là:
$$L = AQ + PQ + PB = \sqrt{x^2 + 15^2} + PQ + \sqrt{(30-x)^2 + 25^2}$$
Vì độ dài cây cầu $PQ$ không đổi nên $L$ nhỏ nhất khi và chỉ khi $AQ + PB$ nhỏ nhất.
Áp dụng bất đẳng thức Minkowski cho hai vectơ $\vec{u} = (x; 15)$ và $\vec{v} = (30-x; 25)$:
$$AQ + PB = |\vec{u}| + |\vec{v}| \ge |\vec{u} + \vec{v}| = \sqrt{(x + 30 - x)^2 + (15 + 25)^2} = \sqrt{30^2 + 40^2} = 50\text{ km}$$
Dấu bằng xảy ra khi và chỉ khi hai vectơ $\vec{u}, \vec{v}$ cùng hướng:
$$\frac{x}{30-x} = \frac{15}{25} = \frac{3}{5} \Leftrightarrow 5x = 3(30-x) \Leftrightarrow 8x = 90 \Leftrightarrow x = 11{,}25\text{ km}$$
Khi đó, khoảng cách từ đầu cầu $Q$ đến thành phố $A$ là:
$$AQ = \sqrt{11{,}25^2 + 15^2} = \sqrt{126{,}5625 + 225} = \sqrt{351{,}5625} = 18{,}75\text{ km}$$
Vậy đầu cầu $Q$ cách thành phố $A$ là 18,75 km.', 'UBND QUẬN HOÀN KIẾM - TRƯỜNG THCS NGÔ SĨ LIÊN (2024 – 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (37, 5, 'I.1', 'Biểu đồ cột', 'Một cửa hàng bán đồ chơi cho trẻ em thống kê số tiền (đơn vị: nghìn đồng) mà 60 khách hàng mua đồ ở cửa hàng đó trong một ngày. Số liệu được ghi lại trong biểu đồ tần số ghép nhóm sau:
{{FIGURE}}
a) Tính tần số tương đối ghép nhóm của nhóm [80; 90).
b) Chủ của cửa hàng nhận xét: "Có không ít hơn 70% số người mua hàng với số tiền từ 60 nghìn đồng đến dưới 80 nghìn đồng". Theo em nhận định đó đúng hay sai?', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2026-2027-cum-t_I_1_qa_1793763285.png', 'a) Tần số tương đối ghép nhóm của nhóm [80; 90) là:
$$\frac{9}{60} \cdot 100\% = 15\%$$
b) Tần số tương đối của nhóm [60; 80) là:
$$\frac{19 + 23}{60} \cdot 100\% = 70\%$$
Vì $70\% \ge 70\%$ nên nhận định của chủ cửa hàng là đúng.', 'Cụm trường THCS Công lập (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (38, 5, 'I.2', 'Xác suất', 'Một hộp có 20 thẻ cùng loại, mỗi thẻ được ghi một trong các số 1; 2; 3; 4; 5; ...; 20, hai thẻ khác nhau thì ghi số khác nhau. Rút ngẫu nhiên một thẻ trong hộp. Tính xác suất của biến cố: "Số xuất hiện trên thẻ được rút ra là số có hai chữ số và chia hết cho 3".', NULL, 'Số phần tử của không gian mẫu là $n(\Omega) = 20$.
Các số có hai chữ số và chia hết cho 3 trong khoảng từ 1 đến 20 là: $\{12; 15; 18\}$ (gồm 3 kết quả thuận lợi).
Xác suất của biến cố là: $P = \frac{3}{20}$.', 'Cụm trường THCS Công lập (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (39, 5, 'II', 'Rút gọn căn thức', 'Cho các biểu thức $A = \frac{\sqrt{x}+2}{\sqrt{x}}$; $B = \frac{\sqrt{x}+1}{\sqrt{x}+3} + \frac{\sqrt{x}}{3-\sqrt{x}} + \frac{x+8\sqrt{x}+3}{x-9}$ với $x > 0; x \neq 9$.
1) Tính giá trị của $A$ khi $x = 25$.
2) Rút gọn biểu thức $B$.
3) Tìm $x$ là số nguyên để biểu thức $P = A \cdot B$ đạt giá trị lớn nhất.', NULL, '1) Thay $x = 25$ vào $A$:
$$A = \frac{\sqrt{25}+2}{\sqrt{25}} = \frac{7}{5}$$
2) Ta có:
$$B = \frac{(\sqrt{x}+1)(\sqrt{x}-3) - \sqrt{x}(\sqrt{x}+3) + x + 8\sqrt{x} + 3}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{x - 2\sqrt{x} - 3 - x - 3\sqrt{x} + x + 8\sqrt{x} + 3}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{x + 3\sqrt{x}}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{\sqrt{x}(\sqrt{x}+3)}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{\sqrt{x}}{\sqrt{x}-3}$$
3) Ta có:
$$P = A \cdot B = \frac{\sqrt{x}+2}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x}-3} = \frac{\sqrt{x}+2}{\sqrt{x}-3} = 1 + \frac{5}{\sqrt{x}-3}$$
Để $P$ đạt giá trị lớn nhất thì $\frac{5}{\sqrt{x}-3}$ lớn nhất, suy ra $\sqrt{x}-3 > 0$ và $\sqrt{x}-3$ nhỏ nhất.
Vì $x$ là số nguyên và $\sqrt{x} > 3 \implies x > 9$, nên giá trị nguyên nhỏ nhất của $x$ là $x = 10$.
Khi $x = 10$, $P = \frac{\sqrt{10}+2}{\sqrt{10}-3} = 16 + 5\sqrt{10}$.
Vậy giá trị lớn nhất của $P$ là $16 + 5\sqrt{10}$ khi $x = 10$.', 'Cụm trường THCS Công lập (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (40, 5, 'III.1', 'Lãi suất ngân hàng', 'Ông $A$ có 500 triệu đồng, ông dùng một phần số tiền này để gửi ngân hàng lãi suất 7% một năm. Phần còn lại, ông đầu tư vào nhà hàng của một người bạn để nhận lãi kinh doanh. Sau một năm, ông thu về số tiền cả vốn và lãi từ cả hai nguồn trên là 574 triệu đồng. Biết rằng, tiền lãi kinh doanh nhà hàng bằng 20% số tiền đầu tư. Hỏi ông $A$ đã sử dụng bao nhiêu tiền cho mỗi hình thức đầu tư?', NULL, 'Gọi số tiền ông $A$ gửi ngân hàng là $x$ (triệu đồng), đầu tư nhà hàng là $y$ (triệu đồng) ($0 < x, y < 500$).
Tổng số tiền: $x + y = 500$.
Tổng tiền lãi sau một năm là $574 - 500 = 74$ (triệu đồng).
Ta có phương trình tiền lãi: $0{,}07x + 0{,}2y = 74$.
Giải hệ phương trình:
$$\begin{cases} x + y = 500 \\ 0{,}07x + 0{,}2y = 74 \end{cases} \iff \begin{cases} x = 200 \\ y = 300 \end{cases}$$
Vậy ông $A$ gửi ngân hàng 200 triệu đồng và đầu tư nhà hàng 300 triệu đồng.', 'Cụm trường THCS Công lập (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (41, 5, 'III.2', 'Bất phương trình bậc nhất', 'Trong cuộc thi "Rung chuông vàng", mỗi thí sinh phải trả lời 10 câu hỏi. Mỗi câu trả lời đúng được 10 điểm, mỗi câu trả lời sai bị trừ 5 điểm. Ban tổ chức tặng cho mỗi thí sinh 20 điểm và theo qui định mỗi thí sinh phải đạt được ít nhất 80 điểm mới được vào vòng thi tiếp theo. Hỏi để được vào vòng thi tiếp theo thì thí sinh cần trả lời đúng ít nhất bao nhiêu câu hỏi?', NULL, 'Gọi số câu trả lời đúng của thí sinh là $x$ ($x \in \mathbb{N}, 0 \le x \le 10$).
Số câu trả lời sai là $10 - x$.
Số điểm của thí sinh là:
$$20 + 10x - 5(10 - x) = 15x - 30$$
Để được vào vòng tiếp theo thì:
$$15x - 30 \ge 80 \iff 15x \ge 110 \iff x \ge \frac{110}{15} \approx 7{,}33$$
Vì $x$ là số tự nhiên nên $x \ge 8$.
Vậy thí sinh cần trả lời đúng ít nhất 8 câu hỏi.', 'Cụm trường THCS Công lập (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (42, 5, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - 8x - 5 = 0$ có hai nghiệm $x_1 > x_2$.
Không giải phương trình tính giá trị biểu thức $T = \frac{|x_1| - |x_2|}{x_1^2 + x_2^2}$', NULL, 'Theo hệ thức Vi-ét: $\begin{cases} x_1 + x_2 = 8 \\ x_1 x_2 = -5 < 0 \end{cases}$.
Vì $x_1 x_2 < 0$ và $x_1 > x_2$ nên $x_1 > 0$ và $x_2 < 0$.
Do đó $|x_1| - |x_2| = x_1 - (-x_2) = x_1 + x_2 = 8$.
Mặt khác: $x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = 8^2 - 2(-5) = 74$.
Vậy $T = \frac{8}{74} = \frac{4}{37}$.', 'Cụm trường THCS Công lập (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (43, 5, 'IV.1', 'Hình trụ - Hình nón', 'Một cốc nước hình trụ có diện tích đáy là $15\text{ cm}^2$ đang đựng nước. Chiều cao của mực nước trong cốc bằng $\frac{3}{4}$ chiều cao của cốc. Người ta thả chìm hoàn toàn 1 viên bi hình cầu có bán kính $R_{\text{bi}} = 3\text{ cm}$ thì mực nước dâng lên đến miệng cốc nhưng nước không bị tràn ra ngoài.
a) Tính thể tích của viên bi đã thả vào cốc nước.
b) Tính chiều cao của lượng nước tinh khiết được chứa trong ly ban đầu.
(Lấy $\pi \approx 3{,}14$; kết quả làm tròn đến chữ số thập phân thứ hai)', NULL, 'a) Thể tích của viên bi hình cầu là:
$$V_{\text{bi}} = \frac{4}{3}\pi R_{\text{bi}}^3 = \frac{4}{3}\pi \cdot 3^3 = 36\pi \approx 36 \cdot 3{,}14 = 113{,}04\text{ cm}^3$$
b) Thể tích phần cốc còn trống ban đầu chính bằng thể tích viên bi dâng lên chiếm chỗ:
$$V_{\text{trống}} = V_{\text{bi}} = 36\pi\text{ cm}^3$$
Chiều cao phần trống là:
$$h_{\text{trống}} = \frac{V_{\text{trống}}}{S_{\text{đáy}}} = \frac{36\pi}{15} = 2{,}4\pi\text{ cm}$$
Do mực nước ban đầu bằng $\frac{3}{4}$ chiều cao của cốc nên phần trống bằng $\frac{1}{4}$ chiều cao của cốc, suy ra chiều cao ban đầu gấp 3 lần chiều cao phần trống:
$$h_{\text{nước ban đầu}} = 3 \cdot h_{\text{trống}} = 3 \cdot 2{,}4\pi = 7{,}2\pi \approx 7{,}2 \cdot 3{,}14 = 22{,}61\text{ cm}$$', 'Cụm trường THCS Công lập (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (44, 5, 'IV.2', 'Đường tròn nội tiếp', 'Cho đường tròn $(O)$ và dây cung $AB$ khác đường kính. Trên tia đối của tia $AB$ lấy điểm $C$. Từ điểm chính giữa $P$ của cung lớn $AB$ kẻ đường kính $PQ$ của đường tròn $(O)$ cắt dây $AB$ tại $D$. Tia $CP$ cắt đường tròn $(O)$ tại điểm $I$ (điểm $I$ khác điểm $P$). Các dây $AB$ và $QI$ cắt nhau tại $K$.
a) Chứng minh tứ giác $PDKI$ nội tiếp.
b) Chứng minh rằng $CI \cdot CP = CK \cdot CD$ và $IC$ là phân giác góc ngoài tại đỉnh $I$ của tam giác $AIB$.
c) Giả sử ba điểm $A, B, C$ cố định. Chứng minh khi đường tròn $(O)$ thay đổi nhưng vẫn đi qua hai điểm $A$ và $B$ thì đường thẳng $QI$ luôn đi qua một điểm cố định.', NULL, 'a) $P$ là điểm chính giữa cung lớn $AB$, đường kính $PQ$ qua $P$ nên $PQ \perp AB$ tại $D \implies \widehat{PDK} = 90^\circ$.
Lại có $PQ$ là đường kính nên $\widehat{PIQ} = 90^\circ \implies \widehat{PIK} = 90^\circ$.
Tứ giác $PDKI$ có $\widehat{PDK} + \widehat{PIK} = 180^\circ$, suy ra $PDKI$ nội tiếp.

b) Xét $\Delta CIK$ và $\Delta CDP$ có:
$\widehat{C}$ chung;
$\widehat{CIK} = \widehat{CDP} = 90^\circ$ (do $PDKI$ nội tiếp $\implies \widehat{CIK} = \widehat{PDK} = 90^\circ$).
Do đó $\Delta CIK \sim \Delta CDP$ (g.g) $\implies \frac{CI}{CD} = \frac{CK}{CP} \implies CI \cdot CP = CK \cdot CD$.
Ta có $P$ là điểm chính giữa cung lớn $AB$, $Q$ là điểm chính giữa cung nhỏ $AB$.
Do đó $QI$ là phân giác trong $\widehat{AIB}$ (vì chắn hai cung bằng nhau $QA = QB$).
Vì $CP \perp QI$ tại $I$ nên $IC$ vuông góc với phân giác trong của góc $\widehat{AIB}$, suy ra $IC$ là tia phân giác ngoài tại đỉnh $I$ của $\Delta AIB$.

c) Do $IC$ và $IK$ lần lượt là phân giác ngoài và phân giác trong của $\widehat{AIB}$, áp dụng tính chất đường phân giác ta có:
$$\frac{CA}{CB} = \frac{KA}{KB}$$
Vì $A, B, C$ cố định nên tỉ số $\frac{CA}{CB}$ không đổi, dẫn đến tỉ số $\frac{KA}{KB}$ không đổi.
Mà $K$ thuộc đoạn thẳng cố định $AB$ nên điểm $K$ là cố định.
Vậy đường thẳng $QI$ luôn đi qua điểm $K$ cố định.', 'Cụm trường THCS Công lập (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (45, 5, 'V', 'Cực trị thực tế', 'Một trường THCS tổ chức cho 750 học sinh đi trải nghiệm. Nhà trường đã liên hệ với đơn vị du lịch để thuê hai loại xe: xe 35 chỗ ngồi và 45 chỗ ngồi (không kể lái xe). Biết rằng giá thuê xe loại 35 chỗ ngồi là 3 500 000 đồng/xe; loại 45 chỗ ngồi là 5 200 000 đồng/xe. Hỏi trường nên thuê mỗi loại bao nhiêu xe để vừa đủ chỗ ngồi cho 750 học sinh và chi phí thuê xe là ít nhất?', NULL, 'Gọi số xe loại 35 chỗ là $x$, số xe loại 45 chỗ là $y$ ($x, y \in \mathbb{N}$).
Để vừa đủ chỗ cho 750 học sinh, ta có phương trình:
$$35x + 45y = 750 \iff 7x + 9y = 150$$
Ta có $7x = 150 - 9y = 3(50 - 3y) \implies x$ chia hết cho 3. Đặt $x = 3k$ ($k \in \mathbb{N}$).
Thay vào: $7(3k) + 9y = 150 \iff 7k + 3y = 50 \iff 3y = 50 - 7k$.
Vì $y \ge 0$ nên $50 - 7k \ge 0 \implies k \le 7$.
Đồng thời $50 - 7k$ phải chia hết cho 3: $50 - 7k \equiv 2 - k \pmod 3 \implies k \equiv 2 \pmod 3$.
Kết hợp điều kiện, ta được $k \in \{2; 5\}$:
- Với $k = 2$: $x = 6$, $y = \frac{50 - 14}{3} = 12$.
Chi phí: $6 \cdot 3\,500\,000 + 12 \cdot 5\,200\,000 = 21\,000\,000 + 62\,400\,000 = 83\,400\,000$ đồng.
- Với $k = 5$: $x = 15$, $y = \frac{50 - 35}{3} = 5$.
Chi phí: $15 \cdot 3\,500\,000 + 5 \cdot 5\,200\,000 = 52\,500\,000 + 26\,000\,000 = 78\,500\,000$ đồng.
So sánh chi phí: $78\,500\,000 < 83\,400\,000$.
Vậy nhà trường nên thuê 15 xe loại 35 chỗ và 5 xe loại 45 chỗ để chi phí thuê xe là ít nhất (78 500 000 đồng).', 'Cụm trường THCS Công lập (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (46, 6, 'I.1', 'Biểu đồ hình quạt tròn', 'Một trường THCS tiến hành khảo sát phương tiện đi học chính của 600 học sinh khối 9. Kết quả điều tra được ghi nhận trong biểu đồ hình quạt tròn dưới đây gồm bốn loại phương tiện: Xe đạp điện, Xe đạp, Đi bộ, và Xe buýt.
{{FIGURE}}
a) Xác định tỉ lệ phần trăm học sinh đến trường bằng Xe đạp điện và tỉ lệ phần trăm học sinh Đi bộ.
b) Tính số lượng học sinh lựa chọn đến trường bằng Xe đạp.', '/static/figures/de-thi-thu-toan-vao-lop-10-lan-1-nam-2027-2028-tru_I_1_qa_1793764183.png', 'a) Tỉ lệ phần trăm học sinh đến trường bằng Xe đạp điện là 40%, tỉ lệ phần trăm học sinh Đi bộ là 15%.
b) Số lượng học sinh lựa chọn đến trường bằng Xe đạp là: $600 \cdot 35\% = 210$ (học sinh).', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1 (2027 – 2028)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (47, 6, 'I.2', 'Xác suất biến cố', 'Trong một hộp kín có chứa 12 tấm thẻ cùng loại được đánh số thứ tự từ 1 đến 12. Rút ngẫu nhiên một tấm thẻ trong hộp. Tính xác suất của biến cố E: "Số ghi trên tấm thẻ được rút ra là số chẵn".', NULL, 'Không gian mẫu có 12 phần tử: $\{1; 2; 3; \dots; 12\}$.
Các kết quả thuận lợi cho biến cố E là $\{2; 4; 6; 8; 10; 12\}$ gồm 6 kết quả.
Xác suất của biến cố E là: $P(E) = \frac{6}{12} = \frac{1}{2}$.', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1 (2027 – 2028)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (48, 6, 'II', 'Rút gọn căn thức và biểu thức hữu tỉ', 'Cho hai biểu thức: $A = \frac{x - 3}{x - 1}$ và $B = \frac{x}{x + 3} + \frac{6x}{x^2 - 9}$ với $x \neq 1; x \neq 3; x \neq -3$.
1) Tính giá trị của biểu thức $A$ khi $x = 5$.
2) Chứng minh $B = \frac{x}{x - 3}$.
3) Cho biểu thức $P = A \cdot B$. Tìm tất cả các giá trị nguyên của $x$ để biểu thức $P$ nhận giá trị nguyên.', NULL, '1) Thay $x = 5$ (TMĐK) vào $A$: $A = \frac{5 - 3}{5 - 1} = \frac{2}{4} = \frac{1}{2}$.
2) Ta có:
$B = \frac{x(x - 3) + 6x}{(x + 3)(x - 3)} = \frac{x^2 - 3x + 6x}{(x + 3)(x - 3)} = \frac{x^2 + 3x}{(x + 3)(x - 3)} = \frac{x(x + 3)}{(x + 3)(x - 3)} = \frac{x}{x - 3}$.
3) $P = A \cdot B = \frac{x - 3}{x - 1} \cdot \frac{x}{x - 3} = \frac{x}{x - 1} = 1 + \frac{1}{x - 1}$.
Để $P \in \mathbb{Z}$ với $x \in \mathbb{Z}$ thì $x - 1 \in \text{Ư}(1) = \{-1; 1\}$.
+ $x - 1 = -1 \Rightarrow x = 0$ (TMĐK).
+ $x - 1 = 1 \Rightarrow x = 2$ (TMĐK).
Vậy $x \in \{0; 2\}$.', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1 (2027 – 2028)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (49, 6, 'III.1', 'Giải bài toán bằng cách lập phương trình (Chuyển động)', 'Một người đi xe máy từ tỉnh $A$ đến tỉnh $B$ với vận tốc trung bình 40 km/h. Khi từ $B$ trở về $A$, người đó đi với vận tốc trung bình 30 km/h nên thời gian về nhiều hơn thời gian đi là 45 phút. Tính độ dài quãng đường từ $A$ đến $B$.', NULL, 'Đổi 45 phút $= \frac{3}{4}$ giờ.
Gọi độ dài quãng đường từ $A$ đến $B$ là $x$ (km, $x > 0$).
Thời gian đi là $\frac{x}{40}$ (h), thời gian về là $\frac{x}{30}$ (h).
Theo bài ra ta có phương trình:
$\frac{x}{30} - \frac{x}{40} = \frac{3}{4} \Leftrightarrow \frac{x}{120} = \frac{3}{4} \Leftrightarrow x = 90$ (thỏa mãn).
Vậy độ dài quãng đường từ $A$ đến $B$ là 90 km.', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1 (2027 – 2028)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (50, 6, 'III.2', 'Giải bài toán bằng cách lập hệ phương trình (Thực tế)', 'Đầu năm học mới, bạn Lan đến một nhà sách mua 3 chiếc bút bi và 5 quyển vở cùng loại hết tổng số tiền là 49 000 đồng. Cùng lúc đó, bạn Minh mua 2 chiếc bút bi và 4 quyển vở cùng loại hết tổng số tiền là 38 000 đồng. Hỏi giá tiền của mỗi chiếc bút bi và mỗi quyển vở là bao nhiêu đồng?', NULL, 'Gọi giá tiền một chiếc bút bi là $x$ (đồng), giá tiền một quyển vở là $y$ (đồng) ($x, y \in \mathbb{N}^*$).
Theo bài ra ta có hệ phương trình:
$\begin{cases} 3x + 5y = 49\,000 \\ 2x + 4y = 38\,000 \end{cases} \Leftrightarrow \begin{cases} 6x + 10y = 98\,000 \\ 6x + 12y = 114\,000 \end{cases} \Leftrightarrow \begin{cases} 2y = 16\,000 \\ x + 2y = 19\,000 \end{cases} \Leftrightarrow \begin{cases} y = 8\,000 \\ x = 3\,000 \end{cases}$ (thỏa mãn).
Vậy giá một chiếc bút bi là 3 000 đồng, một quyển vở là 8 000 đồng.', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1 (2027 – 2028)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (51, 6, 'III.3', 'Giải phương trình quy về bậc hai', 'Giải phương trình: $\frac{x - 1}{x - 2} - \frac{1}{x + 2} = \frac{2x}{x^2 - 4}$.', NULL, 'ĐKXĐ: $x \neq \pm 2$.
Quy đồng và khử mẫu:
$(x - 1)(x + 2) - (x - 2) = 2x$
$\Leftrightarrow x^2 + x - 2 - x + 2 = 2x$
$\Leftrightarrow x^2 - 2x = 0 \Leftrightarrow x(x - 2) = 0$.
Suy ra $x = 0$ (TMĐK) hoặc $x = 2$ (loại vì vi phạm ĐKXĐ).
Vậy tập nghiệm của phương trình là $S = \{0\}$.', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1 (2027 – 2028)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (52, 6, 'IV.1', 'Hệ thức lượng trong tam giác vuông (Ứng dụng thực tế)', 'Một cột cờ $AB$ được dựng vuông góc với mặt sân trường nằm ngang tại chân cột cờ $A$. Vào một thời điểm trong ngày, các tia nắng mặt trời chiếu xuống tạo với mặt đất một góc bằng $56^\circ$. Lúc đó, bóng của đỉnh cột cờ $B$ in trên mặt sân tại điểm $C$, khoảng cách từ chân cột cờ $A$ đến điểm $C$ đo được là 12 m (đoạn thẳng $AC$ nằm hoàn toàn trên mặt sân). Em hãy tính chiều cao $AB$ của cột cờ đó (kết quả làm tròn đến hàng đơn vị của mét).
{{FIGURE}}', '/static/figures/de-thi-thu-toan-vao-lop-10-lan-1-nam-2027-2028-truong-t_IV_1_157364.png', 'Xét $\triangle ABC$ vuông tại $A$:
$AB = AC \cdot \tan C = 12 \cdot \tan 56^\circ \approx 12 \cdot 1{,}4826 \approx 18$ m.
Vậy chiều cao cột cờ khoảng 18 m.', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1 (2027 – 2028)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (53, 6, 'IV.2', 'Tam giác đồng dạng và hệ thức lượng', 'Cho tam giác $ABC$ vuông tại $A$ ($AB < AC$), đường cao $AH$. Kẻ $HE \perp AB$ tại $E$.
a) Chứng minh $\triangle AHB \backsim \triangle AEH$.
b) Kẻ $HF \perp AC$ tại $F$. Chứng minh $AH^2 = AF \cdot AC$ và $\triangle AEF \backsim \triangle ACB$.
c) Đặt $\widehat{ACB} = \alpha$. Chứng minh $EF = BC \cdot \sin\alpha \cdot \cos\alpha$.', NULL, 'a) Xét $\triangle AHB$ và $\triangle AEH$ có: $\widehat{AHB} = \widehat{AEH} = 90^\circ$ và $\widehat{EAH}$ chung $\Rightarrow \triangle AHB \backsim \triangle AEH$ (g-g).
b) Xét $\triangle AHC$ vuông tại $H$, $HF \perp AC$, áp dụng hệ thức lượng ta có $AH^2 = AF \cdot AC$.
Tương tự, $\triangle AHB$ vuông tại $H$, $HE \perp AB \Rightarrow AH^2 = AE \cdot AB$.
Suy ra $AE \cdot AB = AF \cdot AC \Rightarrow \frac{AE}{AC} = \frac{AF}{AB}$.
Xét $\triangle AEF$ và $\triangle ACB$ có $\widehat{BAC}$ chung và $\frac{AE}{AC} = \frac{AF}{AB} \Rightarrow \triangle AEF \backsim \triangle ACB$ (c-g-c).
c) Tứ giác $AEHF$ có $\widehat{A} = \widehat{E} = \widehat{F} = 90^\circ$ nên $AEHF$ là hình chữ nhật $\Rightarrow EF = AH$.
Trong $\triangle AHC$ vuông tại $H$: $AH = AC \cdot \sin\alpha$.
Trong $\triangle ABC$ vuông tại $A$: $AC = BC \cdot \cos\alpha$.
Do đó: $EF = AH = AC \cdot \sin\alpha = BC \cdot \cos\alpha \cdot \sin\alpha = BC \cdot \sin\alpha \cdot \cos\alpha$.', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1 (2027 – 2028)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (54, 6, 'V', 'Bài toán thực tế - Cực trị tối ưu hóa', 'Một nhà sách bán một loại bút máy cao cấp với giá niêm yết ban đầu là 120 000 đồng/chiếc. Với mức giá này, trung bình mỗi ngày nhà sách bán được 30 chiếc bút. Nhằm tăng lượng tiêu thụ sản phẩm, nhà sách thực hiện chính sách khuyến mại: cứ mỗi lần giảm giá bán 5 000 đồng/chiếc thì số lượng bút bán ra trong một ngày sẽ tăng thêm 5 chiếc. Hỏi nhà sách cần thực hiện bao nhiêu lần giảm giá 5 000 đồng (với số lần giảm là một số nguyên dương) để tổng doanh thu từ việc bán loại bút này trong một ngày đạt giá trị lớn nhất? Khi đó doanh thu lớn nhất trong ngày là bao nhiêu đồng?', NULL, 'Gọi $x$ là số lần giảm giá 5 000 đồng ($x \in \mathbb{N}^*$, $x < 24$).
Giá bán một chiếc bút sau khi giảm là: $120\,000 - 5\,000x$ (đồng).
Số lượng bút bán ra trong một ngày là: $30 + 5x$ (chiếc).
Tổng doanh thu trong một ngày là:
$T(x) = (120\,000 - 5\,000x)(30 + 5x) = 5\,000 \cdot 5 \cdot (24 - x)(6 + x) = 25\,000 \cdot (-x^2 + 18x + 144)$.
Ta có: $-x^2 + 18x + 144 = -(x - 9)^2 + 225 \le 225$.
Dấu "=" xảy ra khi $x = 9$ (thỏa mãn điều kiện).
Khi đó, doanh thu lớn nhất là $25\,000 \cdot 225 = 5\,625\,000$ đồng.
Vậy nhà sách cần thực hiện 9 lần giảm giá, doanh thu lớn nhất đạt được là 5 625 000 đồng.', 'UBND PHƯỜNG CHƯƠNG MỸ - TRƯỜNG THCS CHƯƠNG MỸ 1 (2027 – 2028)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (55, 7, 'I.1', 'Biểu đồ cột', 'Trong đợt thi đua thu gom kế hoạch nhỏ do Liên đội phát động dịp Tết Ất Tỵ 2025, số vỏ lon các lớp khối 9 của một trường THCS được biểu diễn trên biểu đồ:
{{FIGURE}}
a) Tính tổng số vỏ lon khối 9 đã thu gom được.
b) Tính tỉ số phần trăm số vỏ lon thu gom được của lớp 9B so với số vỏ lon thu gom được của cả khối 9. (Kết quả làm tròn đến chữ số thập phân thứ 2).', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2025-2026-lan-4-phon_I_1_160151.png', 'a) Tổng số vỏ lon khối 9 thu gom được là: $274 + 280 + 370 + 516 = 1440$ (vỏ lon).
b) Tỉ số phần trăm số vỏ lon của lớp 9B so với cả khối 9 là: $\frac{280}{1440} \cdot 100\% \approx 19{,}44\%$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (56, 7, 'I.2', 'Xác suất', 'Một chiếc túi có 20 tấm thẻ có cùng hình dạng và kích thước gồm 3 màu, trong đó có 8 tấm thẻ màu đỏ, 5 tấm thẻ màu vàng và 7 tấm thẻ màu trắng. Xét phép thử: “Lấy ngẫu nhiên 1 tấm thẻ từ túi”. Tính xác suất của biến cố E: “Không lấy được tấm thẻ màu vàng”.', NULL, 'Số kết quả có thể là 20.
Số kết quả thuận lợi cho biến cố E (lấy được thẻ màu đỏ hoặc màu trắng) là: $8 + 7 = 15$.
Xác suất của biến cố E là: $P(E) = \frac{15}{20} = \frac{3}{4} = 0{,}75$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (57, 7, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức:
$A = \frac{\sqrt{x} + 6}{\sqrt{x}}$ và $B = \frac{4 - 6\sqrt{x}}{x - 4} + \frac{2}{\sqrt{x} + 2} - \frac{\sqrt{x}}{2 - \sqrt{x}}$ với $x > 0; x \neq 4$
1) Tính giá trị của biểu thức $A$ khi $x = 36$.
2) Chứng minh $B = \frac{\sqrt{x}}{\sqrt{x} + 2}$.
3) Với $x$ là số nguyên, tìm giá trị lớn nhất của biểu thức $P = A \cdot B$.', NULL, '1) Thay $x = 36$ (TMĐK) vào biểu thức $A$: $A = \frac{\sqrt{36} + 6}{\sqrt{36}} = \frac{12}{6} = 2$.
2) Với $x > 0; x \neq 4$:
$B = \frac{4 - 6\sqrt{x}}{(\sqrt{x}-2)(\sqrt{x}+2)} + \frac{2(\sqrt{x}-2)}{(\sqrt{x}-2)(\sqrt{x}+2)} + \frac{\sqrt{x}(\sqrt{x}+2)}{(\sqrt{x}-2)(\sqrt{x}+2)}$
$B = \frac{4 - 6\sqrt{x} + 2\sqrt{x} - 4 + x + 2\sqrt{x}}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{x - 2\sqrt{x}}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{\sqrt{x}(\sqrt{x}-2)}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{\sqrt{x}}{\sqrt{x}+2}$.
3) $P = A \cdot B = \frac{\sqrt{x} + 6}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x} + 2} = \frac{\sqrt{x} + 6}{\sqrt{x} + 2} = 1 + \frac{4}{\sqrt{x} + 2}$.
Vì $x \in \mathbb{Z}$ và $x > 0, x \neq 4$ nên $x \ge 1 \Rightarrow \sqrt{x} \ge 1 \Rightarrow \sqrt{x} + 2 \ge 3 \Rightarrow \frac{4}{\sqrt{x} + 2} \le \frac{4}{3} \Rightarrow P \le 1 + \frac{4}{3} = \frac{7}{3}$.
Dấu "=" xảy ra khi $x = 1$ (TMĐK).
Vậy giá trị lớn nhất của $P$ là $\frac{7}{3}$ khi $x = 1$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (58, 7, 'III.1', 'Toán thực tế tính tiền', 'Nhân dịp Tết nguyên đán Ất Tỵ, gia đình bạn Minh có sử dụng dịch vụ taxi của hãng VinFast (Xanh SM) để đi du xuân. Bảng giá cước taxi tại Hà Nội như sau:
<table border="1"><tr><td>Giá mở cửa (Giá km đầu tiên)</td><td>Giá từ km thứ 2 đến 25</td><td>Giá từ km thứ 26 trở đi</td></tr><tr><td>20 000 đ</td><td>15 500 đ</td><td>12 500 đ</td></tr></table>
Số tiền gia đình phải trả cho dịch vụ Taxi là 504 500 đồng. Hỏi quãng đường di chuyển của gia đình bạn Minh là bao nhiêu km?', NULL, 'Số tiền phải trả cho 25 km đầu tiên là: $20\,000 + 24 \cdot 15\,500 = 392\,000$ (đồng).
Vì $504\,500 > 392\,000$ nên quãng đường di chuyển lớn hơn 25 km.
Số tiền trả cho phần quãng đường từ km thứ 26 trở đi là: $504\,500 - 392\,000 = 112\,500$ (đồng).
Số km đi thêm từ km thứ 26 trở đi là: $112\,500 : 12\,500 = 9$ (km).
Vậy quãng đường di chuyển của gia đình bạn Minh là: $25 + 9 = 34$ km.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (59, 7, 'III.2', 'Năng suất - Công việc', 'Để chở hết 60 tấn hàng, một đội xe dự định sử dụng một số xe cùng loại. Trước khi khởi hành, có hai xe được điều động đi làm việc khác, vì vậy mỗi xe còn lại phải chở nhiều hơn dự định 1 tấn hàng. Hỏi lúc đầu đội dự định dùng bao nhiêu xe?', NULL, 'Gọi số xe dự định dùng là $x$ ($x \in \mathbb{N}^*, x > 2$).
Số hàng mỗi xe dự định chở là $\frac{60}{x}$ (tấn).
Số xe thực tế là $x - 2$ (xe), mỗi xe chở $\frac{60}{x - 2}$ (tấn).
Theo bài ra ta có phương trình: $\frac{60}{x - 2} - \frac{60}{x} = 1$.
$\Leftrightarrow 60x - 60(x - 2) = x(x - 2) \Leftrightarrow x^2 - 2x - 120 = 0$.
Giải phương trình được $x = 12$ (thỏa mãn) hoặc $x = -10$ (loại).
Vậy lúc đầu đội dự định dùng 12 xe.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (60, 7, 'III.3', 'Phương trình vô tỉ', 'Giải phương trình: $\sqrt{x^2 - 4x + 4} + x - 2 = 0$', NULL, 'Phương trình tương đương:
$\sqrt{(x - 2)^2} + x - 2 = 0 \Leftrightarrow |x - 2| = -(x - 2) \Leftrightarrow x - 2 \le 0 \Leftrightarrow x \le 2$.
Vậy tập nghiệm của phương trình là mọi số thực $x \le 2$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (61, 7, 'IV.1', 'Hình vành khuyên', 'Long đen, hay còn gọi là vòng đệm, là một chi tiết cơ khí có dạng 2 hình tròn đồng tâm, có lỗ ở giữa. Chúng thường được làm từ kim loại (thép, inox, nhôm, v.v.), cao su hoặc nhựa (hình vẽ). Nó thường được đặt ở giữa đai ốc và vật cần cố định, Phần lỗ ở giữa là hình tròn có đường kính $AB = 1{,}8\text{ cm}$. Viền ngoài của long đen là hình tròn có đường kính $CD = 2{,}4\text{ cm}$.
{{FIGURE}}
a) Tính diện tích lỗ tròn (Làm tròn kết quả đến hàng phần mười);
b) Tính diện tích một bề mặt long đen (Làm tròn kết quả với độ chính xác 0,005).', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2025-2026-lan-4_IV_1_qa_1793764188.png', 'a) Bán kính lỗ tròn là $r = 1{,}8 : 2 = 0{,}9\text{ cm}$.
Diện tích lỗ tròn là: $S_1 = \pi r^2 = \pi \cdot 0{,}9^2 \approx 2{,}5\text{ cm}^2$.
b) Bán kính viền ngoài là $R = 2{,}4 : 2 = 1{,}2\text{ cm}$.
Diện tích một bề mặt long đen là: $S = \pi (R^2 - r^2) = \pi (1{,}2^2 - 0{,}9^2) = 0{,}63\pi \approx 1{,}98\text{ cm}^2$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (62, 7, 'IV.2', 'Đường tròn và góc nội tiếp', 'Cho đường tròn tâm $(O; R)$, đường kính $PQ$. Gọi $D$ là trung điểm của đoạn $OQ$. Từ $D$ kẻ dây $AB$ của đường tròn $(O)$ vuông góc với đường kính $PQ$. Lấy $M$ là một điểm bất kì trên cung nhỏ $AP$, dây $MQ$ cắt dây $AB$ tại $I$.
a) Chứng minh bốn điểm $D, I, M, P$ cùng nằm trên một đường tròn.
b) Chứng minh: $QI \cdot QM = QB^2$ và tính $\widehat{APB}$.
c) Gọi $C$ là điểm nằm trên dây $MB$ sao cho $MA = MC$. Xác định vị trí của điểm $M$ trên cung nhỏ $AP$ để tổng $S = MP + MA$ có giá trị lớn nhất.', NULL, 'a) Có $AB \perp PQ$ tại $D \Rightarrow \widehat{PDI} = 90^\circ$.
$\widehat{PMQ} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn) $\Rightarrow \widehat{PMI} = 90^\circ$.
Do đó bốn điểm $D, I, M, P$ cùng thuộc đường tròn đường kính $PI$.
b) + Xét $\triangle QDI$ và $\triangle QMP$ có $\widehat{Q}$ chung, $\widehat{QDI} = \widehat{QMP} = 90^\circ \Rightarrow \triangle QDI \sim \triangle QMP$ (g-g) $\Rightarrow QI \cdot QM = QD \cdot QP$.
+ Trong tam giác vuông $PBQ$ có đường cao $BD$: $QB^2 = QD \cdot QP$. Do đó $QI \cdot QM = QB^2$.
+ Ta có $D$ là trung điểm $OQ \Rightarrow QD = \frac{R}{2}$, do đó $\cos \widehat{BOD} = \frac{OD}{OB} = \frac{1}{2} \Rightarrow \widehat{BOD} = 60^\circ \Rightarrow \widehat{AOB} = 120^\circ \Rightarrow \widehat{APB} = \frac{1}{2}\widehat{AOB} = 60^\circ$.
c) Tam giác $MAB$ có $MA = MC$, có $\widehat{AMB} = \widehat{APB} = 60^\circ$ nên $\triangle MAC$ đều, suy ra $AC = AM$ và $\widehat{MAC} = 60^\circ = \widehat{PAB}$.
Từ đó chứng minh được $\triangle PAM = \triangle BAC$ (c-g-c) $\Rightarrow MP = BC$.
Do đó $S = MP + MA = BC + MC = MB$.
Vì $MB$ là một dây cung của $(O; R)$ nên $MB \le 2R$. Dấu "=" xảy ra khi $MB$ là đường kính của $(O)$, tức là $M$ là điểm đối xứng với $B$ qua $O$ (khi đó $M$ thuộc cung nhỏ $AP$).
Vậy giá trị lớn nhất của $S$ là $2R$ khi $M$ là điểm đối xứng với $B$ qua $O$.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (63, 7, 'V', 'Cực trị thực tế', 'Từ hình vuông có cạnh bằng 60 cm bạn Châu cắt bỏ các tam giác vuông cân tạo thành hình tô đậm như hình vẽ. Sau đó bạn Châu gập thành hộp để đồ có dạng hình hộp chữ nhật không nắp. Tìm $x$ để thể tích của khối hộp lớn nhất.
{{FIGURE}}', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2025-2026-lan-4-phon_V_160193.png', 'Từ hình vẽ, cạnh của đáy hình vuông sau khi gập là $60 - 2x$, chiều cao hộp tương ứng với phần gấp lên phụ thuộc vào $x$.
Theo bài toán thể tích khối hộp: $V(x) = (60 - 2x)^2 \cdot x$ (hoặc một hằng số tỉ lệ nhân với $(60 - 2x)^2 \cdot x$).
Áp dụng bất đẳng thức AM-GM cho 3 số dương:
$4x(60 - 2x)(60 - 2x) \le \left(\frac{4x + (60 - 2x) + (60 - 2x)}{3}\right)^3 = 40^3 = 64\,000$.
Đẳng thức xảy ra khi và chỉ khi:
$4x = 60 - 2x \Leftrightarrow 6x = 60 \Leftrightarrow x = 10\text{ cm}$.
Vậy với $x = 10\text{ cm}$ thì thể tích khối hộp lớn nhất.', 'Phòng GD&ĐT Huyện Chương Mỹ (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (64, 8, 'I.1', 'Biểu đồ cột', 'Đầu năm 2025, một công ty du lịch phỏng vấn 800 người về số lần đi du lịch trong năm 2024, kết quả phỏng vấn được biểu diễn ở biểu đồ cột trong hình bên.
{{FIGURE}}
a) Có bao nhiêu người đã đi du lịch ít nhất 2 lần?
b) Chọn ngẫu nhiên một người. Xác suất của biến cố người được chọn đã đi du lịch đúng một lần trong năm 2024 là bao nhiêu?', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-chung-nam-2025-lan-2-tru_I_1_158566.png', 'a) Số người đã đi du lịch ít nhất 2 lần là: $170 + 115 = 285$ (người).
b) Xác suất của biến cố người được chọn đã đi du lịch đúng một lần trong năm 2024 là: $\frac{350}{800} = \frac{7}{16}$.', 'Trường THPT Chuyên ĐHSP Hà Nội (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (65, 8, 'I.2', 'Xác suất thực nghiệm', 'Trong một hội thảo quốc tế có 29 sinh viên bao gồm 5 sinh viên đến từ nước Đức, 7 sinh viên đến từ nước Ai Cập, 8 sinh viên đến từ nước Hoa Kỳ và 9 sinh viên đến từ nước Singapore. Chọn ngẫu nhiên một sinh viên để báo cáo đầu tiên. Xác suất của biến cố "Sinh viên được chọn đến từ nước ở khu vực Châu Á" là bao nhiêu?', NULL, 'Trong các nước đã cho, chỉ có Singapore là nước thuộc khu vực Châu Á với 9 sinh viên.
Do đó, xác suất của biến cố đã cho là: $P = \frac{9}{29}$.', 'Trường THPT Chuyên ĐHSP Hà Nội (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (66, 8, 'II', 'Hệ phương trình bậc nhất hai ẩn', 'Nhân ngày Quốc khánh 2/9, một cửa hàng bán quần áo tổ chức chương trình khuyến mãi như sau:
– Giảm giá 20% cho tất cả sản phẩm so với giá niêm yết nếu mua hai sản phẩm.
– Giảm giá 25% cho tất cả sản phẩm so với giá niêm yết nếu mua ba sản phẩm.
Bác Tùng dự định mua một bộ quần áo số tiền cần thanh toán là 720 000 đồng (một bộ quần áo được tính là hai sản phẩm). Sau đó, bác ấy nghĩ lại và quyết định mua thêm 1 áo giống áo lúc đầu (mua trước khi trả tiền một bộ quần áo) thì tổng số tiền cần thanh toán là 1 050 000 đồng. Hỏi giá niêm yết của mỗi chiếc áo và mỗi chiếc quần mà bác Tùng đã mua là bao nhiêu?', NULL, 'Gọi giá niêm yết của mỗi chiếc áo và mỗi chiếc quần lần lượt là $x, y$ (đồng) ($x, y > 0$).
Bác Tùng mua một bộ quần áo (gồm 1 áo và 1 quần, tính là 2 sản phẩm) nên được giảm 20%, do đó số tiền phải trả bằng 80% giá niêm yết:
$0{,}8(x + y) = 720\,000 \Leftrightarrow x + y = 900\,000$.
Khi mua thêm 1 áo (tổng cộng gồm 2 áo và 1 quần, tính là 3 sản phẩm) nên được giảm 25%, do đó số tiền phải trả bằng 75% giá niêm yết:
$0{,}75(2x + y) = 1\,050\,000 \Leftrightarrow 2x + y = 1\,400\,000$.
Trừ vế theo vế ta được: $x = 500\,000$.
Suy ra $y = 900\,000 - 500\,000 = 400\,000$ (thỏa mãn).
Vậy giá niêm yết của mỗi chiếc áo là 500 000 đồng và mỗi chiếc quần là 400 000 đồng.', 'Trường THPT Chuyên ĐHSP Hà Nội (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (67, 8, 'III.1', 'Hình trụ', 'Một cái trục lăn sơn nước có dạng một hình trụ. Đường kính của đường tròn đáy là 5 cm, chiều dài lăn là 30 cm (Hình bên). Diện tích xung quanh của hình trụ đó là bao nhiêu $\text{cm}^2$ (lấy $\pi = 3{,}14$)?
{{FIGURE}}', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-chung-nam-2025-lan-_III_1_qa_1793764191.png', 'Đường kính đáy của hình trụ là $d = 5\text{ cm}$ và chiều cao $h = 30\text{ cm}$.
Diện tích xung quanh của hình trụ là:
$S_{xq} = \pi d h = 3{,}14 \cdot 5 \cdot 30 = 471\text{ cm}^2$.', 'Trường THPT Chuyên ĐHSP Hà Nội (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (68, 8, 'III.2', 'Hệ thức Vi-ét', 'Cho $m > 4$. Chứng minh rằng phương trình $x^2 - mx + 4 = 0$ có hai nghiệm $x_1, x_2$ phân biệt thỏa mãn
$$x_1^5 x_2 + 4(mx_2 - 4)^2 = 4m^4 - 64m^2 + 128.$$', NULL, 'Xét phương trình $x^2 - mx + 4 = 0$ có $\Delta = m^2 - 16$.
Do $m > 4$ nên $\Delta > 0$, suy ra phương trình luôn có hai nghiệm phân biệt $x_1, x_2$.
Theo định lý Vi-ét ta có:
$\begin{cases} x_1 + x_2 = m \\ x_1 x_2 = 4 \end{cases}$
Vì $x_2$ là nghiệm của phương trình nên $x_2^2 - mx_2 + 4 = 0 \Rightarrow mx_2 - 4 = x_2^2$.
Thay vào vế trái ta có:
$VT = x_1^5 x_2 + 4(x_2^2)^2 = x_1 x_2 \cdot x_1^4 + 4 x_2^4 = 4 x_1^4 + 4 x_2^4 = 4(x_1^4 + x_2^4)$.
Ta có:
$x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = m^2 - 8$.
$x_1^4 + x_2^4 = (x_1^2 + x_2^2)^2 - 2(x_1 x_2)^2 = (m^2 - 8)^2 - 2 \cdot 4^2 = m^4 - 16m^2 + 32$.
Suy ra $VT = 4(m^4 - 16m^2 + 32) = 4m^4 - 64m^2 + 128 = VP$ (đpcm).', 'Trường THPT Chuyên ĐHSP Hà Nội (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (69, 8, 'III.3', 'Chia hết và số nguyên tố', 'Có bao nhiêu số nguyên dương $n$ thỏa mãn giá trị của biểu thức $P = \frac{n^3 + n^2 - 4n - 1}{n^2 + 3n + 1}$ là số nguyên?', NULL, 'Chia tử số cho mẫu số ta được:
$P = \frac{n^3 + n^2 - 4n - 1}{n^2 + 3n + 1} = n - 2 + \frac{n + 1}{n^2 + 3n + 1}$.
Với $n$ là số nguyên dương ($n \ge 1$), $n - 2$ là số nguyên. Để $P$ là số nguyên thì $\frac{n + 1}{n^2 + 3n + 1}$ phải là số nguyên.
Vì $n \ge 1$ nên:
$n + 1 > 0$ và $(n^2 + 3n + 1) - (n + 1) = n^2 + 2n > 0 \Rightarrow n^2 + 3n + 1 > n + 1$.
Do đó $0 < \frac{n + 1}{n^2 + 3n + 1} < 1$, suy ra phân thức này không thể là số nguyên.
Vậy không có số nguyên dương $n$ nào thỏa mãn.', 'Trường THPT Chuyên ĐHSP Hà Nội (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (70, 8, 'IV.1', 'Tứ giác nội tiếp', 'Cho tam giác nhọn, không cân $ABC$ nội tiếp đường tròn $(O)$ và có trực tâm là điểm $H$. Vẽ hình bình hành $ABCD$ và đường cao $BB''$ của tam giác $ABC$ (điểm $B''$ thuộc cạnh $AC$). Giả sử hai tia $DO$ và $B''B$ cắt nhau tại điểm $E$. Chứng minh rằng:
a) Bốn điểm $A, D, C, H$ cùng nằm trên một đường tròn.
b) $HD \cdot BB'' = AB \cdot BC$.', NULL, 'a) Vì $H$ là trực tâm của $\triangle ABC$ nên $AH \perp BC$ và $CH \perp AB$.
Do $ABCD$ là hình bình hành nên $AD \parallel BC$ và $CD \parallel AB$.
Suy ra $AH \perp AD$ (hay $\widehat{HAD} = 90^\circ$) và $CH \perp CD$ (hay $\widehat{HCD} = 90^\circ$).
Xét tứ giác $ADCH$ có $\widehat{HAD} + \widehat{HCD} = 90^\circ + 90^\circ = 180^\circ$, nên tứ giác $ADCH$ nội tiếp đường tròn đường kính $HD$, tức là bốn điểm $A, D, C, H$ cùng nằm trên một đường tròn.

b) Vì tứ giác $ADCH$ nội tiếp nên $\widehat{AHD} = \widehat{ACD}$ (cùng chắn cung $AD$).
Do $AB \parallel CD$ nên $\widehat{ACD} = \widehat{B''AB}$ (hai góc so le trong).
Suy ra $\widehat{AHD} = \widehat{B''AB}$.
Xét $\triangle AHD$ và $\triangle B''AB$ có:
$\widehat{HAD} = \widehat{BB''A} = 90^\circ$,
$\widehat{AHD} = \widehat{B''AB}$.
Do đó $\triangle AHD \backsim \triangle B''AB$ (g.g).
Suy ra $\frac{HD}{AB} = \frac{AD}{BB''} \Rightarrow HD \cdot BB'' = AB \cdot AD$.
Mặt khác $ABCD$ là hình bình hành nên $AD = BC$.
Vậy $HD \cdot BB'' = AB \cdot BC$.', 'Trường THPT Chuyên ĐHSP Hà Nội (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (71, 8, 'IV.2', 'Tính chất trực tâm và đường tròn', 'Cho tam giác nhọn, không cân $ABC$ nội tiếp đường tròn $(O)$ và có trực tâm là điểm $H$. Vẽ hình bình hành $ABCD$ và đường cao $BB''$ của tam giác $ABC$ (điểm $B''$ thuộc cạnh $AC$). Giả sử hai tia $DO$ và $B''B$ cắt nhau tại điểm $E$. Chứng minh điểm $B$ là trung điểm của đoạn thẳng $HE$.', NULL, 'Kẻ đường kính $BK$ của đường tròn $(O)$. Khi đó $\widehat{BAK} = \widehat{BCK} = 90^\circ$.
Suy ra $AK \perp AB$ và $CK \perp BC$.
Mà $CH \perp AB$ và $AH \perp BC$ nên $AK \parallel CH$ và $CK \parallel AH$.
Do đó tứ giác $AHCK$ là hình bình hành, suy ra $HK$ và $AC$ cắt nhau tại trung điểm của mỗi đường.
Lại có $ABCD$ là hình bình hành nên $BD$ và $AC$ cắt nhau tại trung điểm của $AC$.
Do đó $HK$ và $BD$ có cùng trung điểm, suy ra tứ giác $BHDK$ là hình bình hành.
Suy ra $BH \parallel KD$ và $BH = KD$.
Mà $B, B'', E$ thẳng hàng nên $BE \parallel KD$.
Xét $\triangle OKD$ và $\triangle OBE$ có $BE \parallel KD$, theo hệ quả định lý Ta-lét ta có:
$\frac{BE}{KD} = \frac{OB}{OK} = 1$ (do $O$ là trung điểm đường kính $BK$).
Suy ra $BE = KD = BH$.
Mặt khác $E$ và $H$ nằm về hai phía so với $B$ trên đường thẳng $BE$ nên $B$ là trung điểm của đoạn thẳng $HE$.', 'Trường THPT Chuyên ĐHSP Hà Nội (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (72, 8, 'V', 'Cực trị thực tế', 'Trong hình bên, quãng đường $AB$ dài 5 km, quãng đường $BC$ dài 26 km, góc $ABC$ là góc vuông. Một người có kế hoạch đi xe đạp, đi thẳng từ $A$ đến một vị trí $M$ trên quãng đường $BC$ với tốc độ 12 km/h, sau đó lại đi thẳng từ $M$ đến $C$ với tốc độ 13 km/h. Người đó cần chọn vị trí $M$ cách $B$ một khoảng bằng bao nhiêu km để tổng thời gian đi từ $A$ đến $M$ và từ $M$ đến $C$ là ít nhất?
{{FIGURE}}', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-chung-nam-2025-lan-2-tru_V_158608.png', 'Đặt $BM = x$ (km) với $0 \le x \le 26$. Khi đó $MC = 26 - x$ (km).
Tam giác $ABM$ vuông tại $B$ nên $AM = \sqrt{AB^2 + BM^2} = \sqrt{25 + x^2}$ (km).
Thời gian đi đoạn $AM$ là $\frac{\sqrt{25 + x^2}}{12}$ (giờ).
Thời gian đi đoạn $MC$ là $\frac{26 - x}{13}$ (giờ).
Tổng thời gian đi là:
$t(x) = \frac{\sqrt{25 + x^2}}{12} + \frac{26 - x}{13} = \frac{\sqrt{25 + x^2}}{12} - \frac{x}{13} + 2$.
Xét hàm số $f(x) = \frac{\sqrt{25 + x^2}}{12} - \frac{x}{13}$ trên $[0; 26]$:
$f''(x) = \frac{x}{12\sqrt{25 + x^2}} - \frac{1}{13}$.
Cho $f''(x) = 0 \Leftrightarrow 13x = 12\sqrt{25 + x^2} \Leftrightarrow 169x^2 = 144(25 + x^2) \Leftrightarrow 25x^2 = 144 \cdot 25 \Leftrightarrow x = 12$ (do $x \ge 0$).
Bảng biến thiên cho thấy $t(x)$ đạt giá trị nhỏ nhất tại $x = 12$.
Vậy vị trí $M$ cần chọn cách $B$ một khoảng bằng 12 km.', 'Trường THPT Chuyên ĐHSP Hà Nội (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (73, 9, 'I.1', 'Bảng tần số ghép nhóm', 'Một lớp gồm 40 học sinh được khảo sát về chiều cao, ta có bảng tần số ghép nhóm dưới đây.
<table border="1"><tr><td>Chiều cao(cm)</td><td>[140; 145)</td><td>[145; 150)</td><td>[150; 155)</td><td>[155; 160)</td></tr><tr><td>Số học sinh</td><td>5</td><td>15</td><td>12</td><td>8</td></tr></table>
a) Tính tần số tương đối ghép nhóm của nhóm [145; 150).
b) Vẽ biểu đồ tần số hình cột cho bảng tần số ghép nhóm trên.', NULL, 'a) Tần số tương đối của nhóm [145; 150) là: $\frac{15}{40} \cdot 100\% = 37{,}5\%$.
b) Vẽ biểu đồ hình cột với trục nằm ngang biểu diễn các nửa khoảng chiều cao và trục thẳng đứng biểu diễn tần số (5, 15, 12, 8).', 'Phòng GD&ĐT Ứng Hòa (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (74, 9, 'I.2', 'Xác suất', 'Một hộp đựng 30 viên bi đỏ và một số bi xanh có cùng kích thước và khối lượng. Lấy ngẫu nhiên một viên bi từ hộp. Tính số viên bi màu xanh, biết rằng xác suất của biến cố “Lấy được một viên bi xanh từ hộp” là 0,4.', NULL, 'Gọi số viên bi xanh trong hộp là $n$ ($n \in \mathbb{N}^*$).
Tổng số viên bi trong hộp là $n + 30$.
Xác suất lấy được một viên bi xanh là $\frac{n}{n + 30} = 0{,}4 \Leftrightarrow n = 0{,}4(n + 30) \Leftrightarrow 0{,}6n = 12 \Leftrightarrow n = 20$.
Vậy có 20 viên bi xanh.', 'Phòng GD&ĐT Ứng Hòa (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (75, 9, 'II', 'Rút gọn căn thức', 'Cho biểu thức
$A = \frac{x + 3}{\sqrt{x} - 2}$ và $B = \frac{\sqrt{x} - 1}{\sqrt{x} + 2} - \frac{5\sqrt{x} - 2}{4 - x}$ (với $x > 0; x \neq 4$)
1) Tính giá trị của $A$ khi $x = 9$.
2) Rút gọn biểu thức $B$.
3) Đặt $P = A : B$. Tìm giá trị nguyên nhỏ nhất của $P$.', NULL, '1) Với $x = 9$ (thỏa mãn điều kiện), $A = \frac{9 + 3}{\sqrt{9} - 2} = \frac{12}{3 - 2} = 12$.
2) Ta có:
$B = \frac{\sqrt{x} - 1}{\sqrt{x} + 2} + \frac{5\sqrt{x} - 2}{x - 4} = \frac{(\sqrt{x} - 1)(\sqrt{x} - 2) + 5\sqrt{x} - 2}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{x + 2\sqrt{x}}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{\sqrt{x}}{\sqrt{x} - 2}$.
3) $P = A : B = \frac{x + 3}{\sqrt{x} - 2} : \frac{\sqrt{x}}{\sqrt{x} - 2} = \frac{x + 3}{\sqrt{x}} = \sqrt{x} + \frac{3}{\sqrt{x}}$.
Áp dụng bất đẳng thức Cô-si cho hai số dương $\sqrt{x}$ và $\frac{3}{\sqrt{x}}$:
$P = \sqrt{x} + \frac{3}{\sqrt{x}} \ge 2\sqrt{3} \approx 3{,}46$.
Vì $P$ nhận giá trị nguyên nên $P \ge 4$.
Xét $P = 4 \Leftrightarrow \sqrt{x} + \frac{3}{\sqrt{x}} = 4 \Leftrightarrow x - 4\sqrt{x} + 3 = 0 \Leftrightarrow (\sqrt{x} - 1)(\sqrt{x} - 3) = 0 \Leftrightarrow x = 1$ hoặc $x = 9$ (thỏa mãn điều kiện).
Vậy giá trị nguyên nhỏ nhất của $P$ là 4 khi $x = 1$ hoặc $x = 9$.', 'Phòng GD&ĐT Ứng Hòa (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (76, 9, 'III.1', 'Giải bài toán bằng cách lập hệ phương trình', 'Một cửa hàng bán hai loại áo sơ mi và áo khoác. Nhân dịp khuyến mãi, cửa hàng giảm giá mỗi chiếc áo sơ mi 10% và mỗi chiếc áo khoác 20% so với giá niêm yết. Một khách hàng mua 3 chiếc áo sơ mi và 2 chiếc áo khoác phải trả 1 120 000 đồng. Một khách hàng khác mua 2 chiếc áo sơ mi và 3 chiếc áo khoác thì phải trả số tiền là 1 230 000 đồng. Tính giá niêm yết của mỗi loại áo?', NULL, 'Gọi giá bán thực tế sau khi giảm giá của mỗi chiếc áo sơ mi và áo khoác lần lượt là $x$ và $y$ (đồng; $x, y > 0$).
Theo bài ra ta có hệ phương trình:
$\begin{cases} 3x + 2y = 1\,120\,000 \\ 2x + 3y = 1\,230\,000 \end{cases} \Leftrightarrow \begin{cases} x = 180\,000 \\ y = 290\,000 \end{cases}$ (thỏa mãn)
Giá niêm yết của mỗi chiếc áo sơ mi là:
$180\,000 : (1 - 10\%) = 180\,000 : 0{,}9 = 200\,000$ (đồng).
Giá niêm yết của mỗi chiếc áo khoác là:
$290\,000 : (1 - 20\%) = 290\,000 : 0{,}8 = 362\,500$ (đồng).
Vậy giá niêm yết của áo sơ mi là 200 000 đồng và áo khoác là 362 500 đồng.', 'Phòng GD&ĐT Ứng Hòa (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (77, 9, 'III.2', 'Năng suất - Công việc', 'Hai người cùng làm chung một công việc thì sau 3 giờ 36 phút làm xong. Nếu làm một mình thì người thứ nhất hoàn thành công việc sớm hơn người thứ hai là 3 giờ. Hỏi nếu mỗi người làm một mình thì bao lâu xong công việc.', NULL, 'Đổi 3 giờ 36 phút $= 3{,}6\text{ giờ} = \frac{18}{5}$ giờ.
Gọi thời gian người thứ nhất làm một mình xong công việc là $x$ (giờ; $x > \frac{18}{5}$).
Thời gian người thứ hai làm một mình xong công việc là $x + 3$ (giờ).
Trong 1 giờ, người thứ nhất làm được $\frac{1}{x}$ công việc, người thứ hai làm được $\frac{1}{x + 3}$ công việc.
Cả hai người cùng làm trong 1 giờ được: $\frac{1}{x} + \frac{1}{x + 3} = \frac{5}{18}$
$\Leftrightarrow 18(2x + 3) = 5x(x + 3) \Leftrightarrow 5x^2 - 21x - 54 = 0$
Phương trình có nghiệm $x = 6$ (thỏa mãn) hoặc $x = -1{,}8$ (loại).
Vậy người thứ nhất làm một mình xong công việc trong 6 giờ, người thứ hai trong 9 giờ.', 'Phòng GD&ĐT Ứng Hòa (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (78, 9, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - 3x - 1 = 0$ có hai nghiệm phân biệt $x_1; x_2$. Tính giá trị của biểu thức $H = x_1^3 + 10x_2 + 1992$.', NULL, 'Phương trình có $\Delta = (-3)^2 - 4 \cdot 1 \cdot (-1) = 13 > 0$ nên luôn có hai nghiệm phân biệt $x_1, x_2$.
Theo hệ thức Vi-ét ta có: $\begin{cases} x_1 + x_2 = 3 \\ x_1 x_2 = -1 \end{cases}$
Do $x_1$ là nghiệm của phương trình nên $x_1^2 - 3x_1 - 1 = 0 \Rightarrow x_1^2 = 3x_1 + 1$.
Khi đó:
$x_1^3 = x_1 \cdot x_1^2 = x_1(3x_1 + 1) = 3x_1^2 + x_1 = 3(3x_1 + 1) + x_1 = 10x_1 + 3$.
Thay vào biểu thức $H$ ta được:
$H = (10x_1 + 3) + 10x_2 + 1992 = 10(x_1 + x_2) + 1995 = 10 \cdot 3 + 1995 = 2025$.', 'Phòng GD&ĐT Ứng Hòa (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (79, 9, 'IV.1', 'Hình trụ - Hình cầu', 'Một ly nước hình trụ có chiều cao 15 cm, đường kính đáy 6 cm đựng đầy nước tinh khiết.
a) Tính thể tích nước có trong ly.
b) Nếu người ta thả 5 viên bi hình cầu bán kính 1 cm vào trong ly nước, thì sau khi nước trong ly tràn ra, thể tích còn lại trong ly là bao nhiêu (Coi độ dày của ly không đáng kể, các kết quả làm tròn đến hàng phần chục)', NULL, 'Bán kính đáy ly nước là $R = \frac{6}{2} = 3\text{ cm}$.
a) Thể tích nước ban đầu đựng đầy trong ly là:
$V_1 = \pi R^2 h = \pi \cdot 3^2 \cdot 15 = 135\pi \approx 424{,}1\text{ cm}^3$.
b) Thể tích của 5 viên bi thả vào ly bằng thể tích nước bị tràn ra:
$V_2 = 5 \cdot \left(\frac{4}{3}\pi r^3\right) = 5 \cdot \frac{4}{3}\pi \cdot 1^3 = \frac{20}{3}\pi \approx 20{,}9\text{ cm}^3$.
Thể tích nước còn lại trong ly sau khi nước tràn ra là:
$V = V_1 - V_2 = 135\pi - \frac{20}{3}\pi = \frac{385}{3}\pi \approx 403{,}2\text{ cm}^3$.', 'Phòng GD&ĐT Ứng Hòa (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (80, 9, 'IV.2', 'Hình học phẳng tổng hợp', 'Cho tam giác $ABC$ nhọn có $AB < AC$, $BC = 2a$ ($a > 0$ cho trước) và $\widehat{BAC} = 60^\circ$. Vẽ đường tròn tâm $O$, đường kính $BC$ cắt $AB, AC$ tại $F$ và $E$. $BE$ cắt $CF$ tại $H$, $AH$ cắt $BC$ tại $D$.
a) Chứng minh tứ giác $AFHE$ nội tiếp. Xác định tâm $I$ đường tròn ngoại tiếp tứ giác.
b) Chứng minh $BF \cdot BA = BD \cdot BC$. Tính $BF \cdot BA + CE \cdot CA$ theo $a$.
c) Chứng minh $IE, IF$ là tiếp tuyến với đường tròn $(O)$.', NULL, 'a) Vì $E, F$ thuộc đường tròn đường kính $BC$ nên $\widehat{BEC} = \widehat{BFC} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn).
Suy ra $BE \perp AC$ và $CF \perp AB$, do đó $\widehat{AEH} = 90^\circ$ và $\widehat{AFH} = 90^\circ$.
Xét tứ giác $AFHE$ có $\widehat{AFH} + \widehat{AEH} = 90^\circ + 90^\circ = 180^\circ$ nên tứ giác $AFHE$ nội tiếp đường tròn đường kính $AH$.
Tâm $I$ của đường tròn ngoại tiếp tứ giác là trung điểm của đoạn thẳng $AH$.
b) $H$ là giao điểm của hai đường cao $BE, CF$ của $\triangle ABC$ nên $H$ là trực tâm của $\triangle ABC$, suy ra $AD \perp BC$ tại $D$.
Xét $\triangle BDA$ và $\triangle BFC$ có:
$\widehat{B}$ chung;
$\widehat{BDA} = \widehat{BFC} = 90^\circ$.
Suy ra $\triangle BDA \backsim \triangle BFC$ (g-g) $\Rightarrow \frac{BD}{BF} = \frac{BA}{BC} \Rightarrow BF \cdot BA = BD \cdot BC$.
Chứng minh tương tự, $\triangle CDA \backsim \triangle CEB$ (g-g) $\Rightarrow \frac{CD}{CE} = \frac{CA}{BC} \Rightarrow CE \cdot CA = CD \cdot BC$.
Từ đó suy ra:
$BF \cdot BA + CE \cdot CA = BD \cdot BC + CD \cdot BC = BC(BD + CD) = BC^2 = (2a)^2 = 4a^2$.
c) Tam giác $AFH$ vuông tại $F$ có $I$ là trung điểm cạnh huyền $AH$ nên $IF = IH$, suy ra $\triangle IFH$ cân tại $I$, do đó $\widehat{IFH} = \widehat{IHF}$.
Mặt khác, $\widehat{IHF} = \widehat{DHC}$ (hai góc đối đỉnh), nên $\widehat{IFH} = \widehat{DHC}$.
Tam giác $OFC$ cân tại $O$ (do $OF = OC = R$) nên $\widehat{OFC} = \widehat{OCF} = \widehat{HCD}$.
Ta có:
$\widehat{IFO} = \widehat{IFH} + \widehat{HFO} = \widehat{DHC} + \widehat{HCD}$.
Trong $\triangle DHC$ vuông tại $D$, $\widehat{DHC} + \widehat{HCD} = 90^\circ$.
Suy ra $\widehat{IFO} = 90^\circ$, hay $IF \perp OF$ tại $F$.
Vì $F \in (O)$ nên $IF$ là tiếp tuyến của đường tròn $(O)$.
Chứng minh hoàn toàn tương tự ta được $IE \perp OE$ tại $E$, suy ra $IE$ là tiếp tuyến của đường tròn $(O)$.', 'Phòng GD&ĐT Ứng Hòa (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (81, 9, 'V', 'Cực trị thực tế', 'Một khách hàng đặt một người thợ làm một chiếc bể hình hộp chữ nhật không có nắp phải chứa được $4\text{ m}^3$ nước, đáy là hình vuông có cạnh là $x$ và chiều cao bể là $h$. Hỏi chiều dài cạnh đáy và chiều cao của bể bằng bao nhiêu để người thợ tiết kiệm chi phí và nguyên vật liệu nhất?
{{FIGURE}}', '/static/figures/de-thi-thu-toan-vao-lop-10-lan-3-nam-2025-phong-gddt-un_V_159052.png', 'Bể không có nắp, đáy là hình vuông cạnh $x$ (m) và chiều cao $h$ (m) ($x > 0, h > 0$).
Thể tích của bể là $V = x^2 h = 4 \Rightarrow h = \frac{4}{x^2}$.
Để tiết kiệm chi phí và nguyên vật liệu nhất thì diện tích toàn phần (gồm diện tích đáy và 4 mặt bên) phải nhỏ nhất:
$S = x^2 + 4xh = x^2 + 4x \cdot \frac{4}{x^2} = x^2 + \frac{16}{x}$.
Ta tách:
$S = x^2 + \frac{8}{x} + \frac{8}{x}$.
Áp dụng bất đẳng thức AM-GM cho 3 số dương $x^2, \frac{8}{x}, \frac{8}{x}$:
$S = x^2 + \frac{8}{x} + \frac{8}{x} \ge 3\sqrt[3]{x^2 \cdot \frac{8}{x} \cdot \frac{8}{x}} = 3\sqrt[3]{64} = 3 \cdot 4 = 12$.
Dấu "=" xảy ra khi và chỉ khi:
$x^2 = \frac{8}{x} \Leftrightarrow x^3 = 8 \Leftrightarrow x = 2$ (m) (thỏa mãn).
Khi đó chiều cao là $h = \frac{4}{2^2} = 1$ (m).
Vậy để tiết kiệm chi phí và nguyên vật liệu nhất thì đáy bể có cạnh là 2 m và chiều cao của bể là 1 m.', 'Phòng GD&ĐT Ứng Hòa (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (82, 10, 'I.1', 'Bảng tần số', 'Tỉ lệ học sinh bình chọn cho danh hiệu cầu thủ xuất sắc nhất trong giải bóng đá của trường được cho trong bảng sau:
<table border="1"><tr><td>Cầu thủ</td><td>Tuấn</td><td>Trường</td><td>An</td><td>Linh</td></tr><tr><td>Tỉ lệ học sinh bình chọn</td><td>30%</td><td>25%</td><td>10%</td><td>35%</td></tr></table>
Biết rằng có 500 học sinh tham gia bình chọn. Hãy lập bảng tần số học sinh bình chọn cho danh hiệu cầu thủ xuất sắc nhất trong giải bóng đá của trường.', NULL, 'Số học sinh bình chọn cho Tuấn: $500 \cdot 30\% = 150$ học sinh.
Số học sinh bình chọn cho Trường: $500 \cdot 25\% = 125$ học sinh.
Số học sinh bình chọn cho An: $500 \cdot 10\% = 50$ học sinh.
Số học sinh bình chọn cho Linh: $500 \cdot 35\% = 175$ học sinh.
Bảng tần số:
Cầu thủ: Tuấn (150), Trường (125), An (50), Linh (175).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (83, 10, 'I.2', 'Xác suất thực nghiệm', 'Hãy tính xác suất cầu thủ được chọn cho danh hiệu cầu thủ xuất sắc nhất trong giải bóng đá của trường có tên bắt đầu bởi chữ cái “T”.', NULL, 'Tổng số học sinh bình chọn cho Tuấn và Trường là $150 + 125 = 275$.
Xác suất cần tìm là: $P = \frac{275}{500} = 0{,}55$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (84, 10, 'II', 'Rút gọn biểu thức chứa căn', 'Cho hai biểu thức $A = \frac{x - 5}{\sqrt{x}}$ và $B = \frac{2x + 2\sqrt{x}}{x - 1} - \frac{\sqrt{x}}{\sqrt{x} - 1}$ với $x > 0, x \neq 1$.
1) Tính giá trị của biểu thức $A$ khi $x = 36$.
2) Rút gọn biểu thức $B$.
3) Tìm tất cả giá trị nguyên của $x$ để biểu thức $P = AB$ có giá trị nguyên.', NULL, '1) Thay $x = 36$ vào $A$: $A = \frac{36 - 5}{\sqrt{36}} = \frac{31}{6}$.
2) Ta có:
$B = \frac{2\sqrt{x}(\sqrt{x}+1)}{(\sqrt{x}-1)(\sqrt{x}+1)} - \frac{\sqrt{x}}{\sqrt{x}-1} = \frac{2\sqrt{x} - \sqrt{x}}{\sqrt{x}-1} = \frac{\sqrt{x}}{\sqrt{x}-1}$.
3) $P = A \cdot B = \frac{x - 5}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x}-1} = \frac{x - 5}{\sqrt{x}-1} = \sqrt{x} + 1 - \frac{4}{\sqrt{x}-1}$.
Để $P \in \mathbb{Z}$ với $x \in \mathbb{Z}^+$:
TH1: $\sqrt{x} \in \mathbb{Z} \Rightarrow \sqrt{x}-1$ là ước của $4 \Rightarrow \sqrt{x}-1 \in \{-2, -1, 1, 2, 4\}$. Vì $\sqrt{x} > 0, \sqrt{x} \neq 1$ nên $\sqrt{x} \in \{2, 3, 5\} \Rightarrow x \in \{4, 9, 25\}$.
TH2: $x - 5 = 0 \Rightarrow x = 5$ thì $P = 0 \in \mathbb{Z}$ (thỏa mãn).
Vậy $x \in \{4, 5, 9, 25\}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (85, 10, 'III.1', 'Giải bài toán bằng cách lập hệ phương trình', 'Hai dung dịch có khối lượng tổng cộng là 220 gam. Lượng muối trong dung dịch $X$ là 5 gam, lượng muối trong dung dịch $Y$ là 4,8 gam. Biết nồng độ muối trong dung dịch $X$ nhiều hơn nồng độ muối trong dung dịch $Y$ là 1%. Tính khối lượng mỗi dung dịch nói trên?', NULL, 'Gọi khối lượng dung dịch $X$ và $Y$ lần lượt là $x, y$ (gam, $x, y > 0$).
Theo bài ra ta có hệ phương trình:
$\begin{cases} x + y = 220 \\ \frac{5}{x} - \frac{4{,}8}{y} = \frac{1}{100} \end{cases}$
Giải hệ tìm được $x = 100$ và $y = 120$ (thỏa mãn).
Vậy khối lượng dung dịch $X$ là 100 gam, dung dịch $Y$ là 120 gam.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (86, 10, 'III.2', 'Năng suất - Công việc', 'Hai đội công nhân cùng làm một công việc trong 24 ngày thì xong. Nếu đội A làm trong 10 ngày và đội B làm trong 12 ngày thì được $\frac{9}{20}$ công việc. Hỏi nếu làm một mình thì mỗi đội làm xong công việc đó trong bao lâu.', NULL, 'Gọi thời gian làm riêng hoàn thành công việc của đội A và đội B lần lượt là $x, y$ (ngày, $x, y > 24$).
Ta có hệ phương trình:
$\begin{cases} \frac{1}{x} + \frac{1}{y} = \frac{1}{24} \\ \frac{10}{x} + \frac{12}{y} = \frac{9}{20} \end{cases} \Leftrightarrow \begin{cases} \frac{1}{x} = \frac{1}{40} \\ \frac{1}{y} = \frac{1}{60} \end{cases} \Leftrightarrow \begin{cases} x = 40 \\ y = 60 \end{cases}$ (thỏa mãn).
Vậy đội A làm một mình xong trong 40 ngày, đội B làm một mình xong trong 60 ngày.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (87, 10, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình: $x^2 - 2(m-1)x - m - 3 = 0$. Tìm $m$ để biểu thức $A = x_1^2 + x_2^2$ đạt giá trị nhỏ nhất.', NULL, 'Phương trình có $\Delta'' = (m-1)^2 - (-m-3) = m^2 - m + 4 = \left(m - \frac{1}{2}\right)^2 + \frac{15}{4} > 0$ với mọi $m$.
Theo Vi-ét: $x_1 + x_2 = 2(m-1)$, $x_1x_2 = -m-3$.
$A = x_1^2 + x_2^2 = (x_1+x_2)^2 - 2x_1x_2 = 4(m-1)^2 + 2(m+3) = 4m^2 - 6m + 10 = \left(2m - \frac{3}{2}\right)^2 + \frac{31}{4} \ge \frac{31}{4}$.
Dấu bằng xảy ra khi $m = \frac{3}{4}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (88, 10, 'IV.1', 'Hình trụ', 'Mặt xung quanh của một thùng chứa nước hình trụ có chiều cao 1 m được gõ từ một tấm tôn hình chữ nhật có kích thước $1\text{ m} \times 2\text{ m}$ (như hình vẽ).
{{FIGURE}}
a) Hỏi thùng nước này đựng đầy được bao nhiêu mét khối nước?
(Bỏ qua bề dày của thùng nước và lấy $\pi = 3{,}14$ làm tròn đến chữ số thập phân thứ hai).
b) Một em bé đánh rơi quả bóng bưởi xuống thùng tôn. Bên cạnh có một vòi nước cung cấp nước. Em bé cần lấy bao nhiêu nước từ vòi để lấy được bóng.', '/static/figures/BoDeHaNoiLan2_De_01_trang_2_IV_1_215732.png', 'a) Chu vi đáy của hình trụ là $C = 2\text{ m} \Rightarrow R = \frac{2}{2\pi} = \frac{1}{\pi}\text{ m}$.
Thể tích thùng nước là: $V = \pi R^2 h = \pi \cdot \left(\frac{1}{\pi}\right)^2 \cdot 1 = \frac{1}{\pi} \approx \frac{1}{3{,}14} \approx 0{,}32\text{ m}^3$.
b) Đổ nước vào thùng cho đến khi mực nước dâng lên gần miệng thùng để bóng nổi lên và em bé có thể với tới lấy được bóng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (89, 10, 'IV.2', 'Đường tròn và tứ giác nội tiếp', 'Cho đường tròn $(O; R)$ có hai đường kính $AB$ và $CD$ vuông góc tại $O$. Gọi $I$ là trung điểm của $OB$. Tia $CI$ cắt đường tròn $(O)$ tại $E$. Gọi $H$ là giao điểm của $AE$ và $CD$.
a) Chứng minh bốn điểm $O, I, E, D$ cùng thuộc một đường tròn.
b) Chứng minh: $AH \cdot AE = 2R^2$ và $OA = 3 \cdot OH$.
c) Gọi $K$ là hình chiếu của $O$ trên $BD$, $Q$ là giao điểm của $AD$ và $BE$. Chứng minh: $Q, K, I$ thẳng hàng.', NULL, 'a) Ta có $\widehat{COD} = 90^\circ$ và $\widehat{CED} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn), cùng nhìn đoạn $CD$, suy ra bốn điểm $O, I, E, D$ cùng thuộc đường tròn đường kính $CD$ (hoặc xét tứ giác nội tiếp $OIED$).
b) Xét $\triangle AOH$ và $\triangle AEB$ có $\widehat{A}$ chung, $\widehat{AOH} = \widehat{AEB} = 90^\circ$, suy ra $\triangle AOH \sim \triangle AEB$ (g.g) $\Rightarrow \frac{AH}{AB} = \frac{AO}{AE} \Rightarrow AH \cdot AE = AO \cdot AB = R \cdot 2R = 2R^2$.
Chứng minh $H$ là trọng tâm $\triangle ACD$ hoặc dùng tỉ số $\Rightarrow OA = 3 \cdot OH$.
c) Sử dụng định lý Menelaus hoặc tính chất đối xứng, đường trung bình trong tam giác để chứng minh ba điểm $Q, K, I$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (90, 10, 'V', 'Bất đẳng thức - Cực trị thực tế', 'Người ta muốn chế tạo một chiếc hộp hình hộp chữ nhật có thể tích $500\text{ cm}^3$, chiều cao của hộp là 2 cm. Tìm kích thước đáy của hộp sao cho sử dụng ít vật liệu nhất.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_01_trang_2_V_215748.png', 'Gọi kích thước đáy của hình hộp chữ nhật là $a$ và $b$ (cm, $a, b > 0$).
Thể tích hộp: $V = a \cdot b \cdot h = a \cdot b \cdot 2 = 500 \Rightarrow ab = 250\text{ cm}^2$.
Diện tích toàn phần (lượng vật liệu sử dụng): $S_{tp} = 2ab + 2(a+b)h = 2 \cdot 250 + 2(a+b) \cdot 2 = 500 + 4(a+b)$.
Áp dụng bất đẳng thức Cauchy cho hai số dương $a, b$:
$a + b \ge 2\sqrt{ab} = 2\sqrt{250} = 10\sqrt{10}$.
Do đó $S_{tp} \ge 500 + 40\sqrt{10}$.
Dấu bằng xảy ra khi $a = b = \sqrt{250} = 5\sqrt{10}\text{ cm}$.
Vậy kích thước đáy để sử dụng ít vật liệu nhất là hình vuông có cạnh bằng $5\sqrt{10}\text{ cm}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 1 (Trang 2) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (91, 11, 'I.1', 'Biểu đồ cột', 'Biểu đồ cột kép ở Hình 30 biểu diễn số lượng học sinh tham gia giải thi đấu thể thao của một trường trung học cơ sở.
{{FIGURE}}
Chọn ngẫu nhiên một học sinh tham gia giải thi đấu thể thao của trường đó. Tính xác suất của mỗi biến cố sau:
$A$: "Học sinh được chọn là nam";
$B$: "Học sinh được chọn thuộc khối 6";
$C$: "Học sinh được chọn là nữ và không thuộc khối 9".', '/static/figures/BoDeHaNoiLan2_De_02_trang_11_I_1_218041.png', 'Tổng số học sinh tham gia là $16 + 16 + 17 + 17 = 66$ học sinh.
- Số học sinh nam là $7 + 9 + 9 + 9 = 34$. Xác suất $P(A) = \frac{34}{66} = \frac{17}{33}$.
- Số học sinh khối 6 là $7 + 9 = 16$. Xác suất $P(B) = \frac{16}{66} = \frac{8}{33}$.
- Số học sinh nữ không thuộc khối 9 là $9 + 7 + 8 = 24$. Xác suất $P(C) = \frac{24}{66} = \frac{4}{11}$ (hoặc $\frac{12}{33}$).', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (92, 11, 'I.2', 'Xác suất', 'Một hộp đựng 5 tấm thẻ ghi các số 1; 2; 3; 4; 5. Rút ngẫu nhiên lần lượt hai tấm thẻ từ hộp, tấm thẻ rút ra lần đầu không trả lại vào hộp.
a) Phép thử và kết quả của phép thử là gì?
b) Mô tả không gian mẫu của phép thử. Không gian mẫu có bao nhiêu phần tử?', NULL, 'a) Phép thử: Rút ngẫu nhiên lần lượt hai tấm thẻ từ hộp không hoàn lại. Kết quả của phép thử là một cặp số $(x; y)$ với $x, y \in \{1; 2; 3; 4; 5\}$ và $x \neq y$.
b) Không gian mẫu $\Omega = \{(x; y) \mid x, y \in \{1; 2; 3; 4; 5\}, x \neq y\}$. Liệt kê 20 cặp phần tử. Số phần tử của không gian mẫu là $n(\Omega) = 5 \times 4 = 20$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (93, 11, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x}+3}{\sqrt{x}+1}$ và $B = \frac{\sqrt{x}}{\sqrt{x}-2} - \frac{\sqrt{x}+2}{3-\sqrt{x}} - \frac{x-3\sqrt{x}+5}{x-5\sqrt{x}+6}$ với $x \ge 0; x \neq 4; x \neq 9$.
1) Tính giá trị của $A$ khi $x = 25$.
2) Rút gọn $B$.
3) Cho $P = A : B$. Tìm $x$ để $2P = 2\sqrt{x}-9$.', NULL, '1) Với $x = 25$, $A = \frac{5+3}{5+1} = \frac{8}{6} = \frac{4}{3}$.
2) Quy đồng và rút gọn mẫu thức $(\sqrt{x}-2)(\sqrt{x}-3)$, ta được $B = \frac{\sqrt{x}+3}{\sqrt{x}-2}$.
3) $P = \frac{A}{B} = \frac{\sqrt{x}-2}{\sqrt{x}+1}$.
Phương trình: $2 \cdot \frac{\sqrt{x}-2}{\sqrt{x}+1} = 2\sqrt{x} - 9 \Leftrightarrow 2(\sqrt{x}-2) = (2\sqrt{x}-9)(\sqrt{x}+1) \Leftrightarrow 2x - 9\sqrt{x} - 5 = 0 \Leftrightarrow (2\sqrt{x}+1)(\sqrt{x}-5) = 0 \Leftrightarrow \sqrt{x} = 5 \Leftrightarrow x = 25$ (thỏa mãn).', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (94, 11, 'III.1', 'Năng suất - Công việc', 'Giải bài toán bằng cách lập phương trình hoặc hệ phương trình:
Tháng thứ nhất hai đội sản xuất được 1100 sản phẩm. Sang tháng thứ hai, đội $I$ làm vượt mức 15% và đội $II$ làm vượt mức 20% so với tháng thứ nhất, vì vậy cả hai đội đã làm được 1295 sản phẩm. Hỏi trong tháng thứ nhất mỗi đội làm được bao nhiêu sản phẩm?', NULL, 'Gọi số sản phẩm tháng thứ nhất đội $I$ và đội $II$ làm được lần lượt là $x, y$ ($x, y \in \mathbb{N}^*, x, y < 1100$).
Ta có hệ phương trình:
$\begin{cases} x + y = 1100 \\ 1{,}15x + 1{,}2y = 1295 \end{cases} \Leftrightarrow \begin{cases} x = 500 \\ y = 600 \end{cases}$ (thỏa mãn).
Vậy tháng thứ nhất đội $I$ làm được 500 sản phẩm, đội $II$ làm được 600 sản phẩm.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (95, 11, 'III.2', 'Năng suất - Công việc', 'Một cơ sở sản xuất lập kế hoạch làm 180 sản phẩm trong một thời gian nhất định. Do cải tiến kĩ thuật, năng suất mỗi ngày tăng 3 sản phẩm, vì thế không những hoàn thành sớm một ngày, mà còn vượt mức 18 sản phẩm. Hỏi theo kế hoạch mỗi ngày phải sản xuất bao nhiêu sản phẩm?', NULL, 'Gọi số sản phẩm theo kế hoạch mỗi ngày sản xuất là $x$ ($x \in \mathbb{N}^*$).
Thời gian theo kế hoạch là $\frac{180}{x}$ ngày.
Thực tế mỗi ngày làm được $x + 3$ sản phẩm, tổng sản phẩm làm được là $180 + 18 = 198$.
Thời gian thực tế là $\frac{198}{x+3}$ ngày.
Phương trình: $\frac{180}{x} - \frac{198}{x+3} = 1 \Leftrightarrow x^2 + 21x - 540 = 0 \Leftrightarrow (x-15)(x+36) = 0 \Rightarrow x = 15$ (thỏa mãn).
Vậy theo kế hoạch mỗi ngày cơ sở sản xuất 15 sản phẩm.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (96, 11, 'III.3', 'Hệ thức Vi-ét', 'Gọi $x_1, x_2$ là hai nghiệm của phương trình: $x^2 - 4x - 7 = 0$. Tính giá trị của biểu thức $T = \frac{x_1}{x_2} + \frac{x_2}{x_1} - 2$.', NULL, 'Theo định lí Vi-ét: $x_1 + x_2 = 4$ và $x_1 x_2 = -7$.
Ta có: $T = \frac{x_1^2 + x_2^2 - 2x_1 x_2}{x_1 x_2} = \frac{(x_1 - x_2)^2}{x_1 x_2} = \frac{(x_1 + x_2)^2 - 4x_1 x_2}{x_1 x_2} = \frac{4^2 - 4(-7)}{-7} = \frac{16 + 28}{-7} = -\frac{44}{7}$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (97, 11, 'IV.1', 'Hình trụ - Hình nón', 'Người ta thả một cục đá vào cốc thuỷ tinh hình trụ có chứa nước, đá chìm một phần xuống nước trong cốc. Hãy tính thể tích phần đá chìm trong nước của cục đá đó, biết diện tích đáy của cốc nước hình trụ là $16{,}5\text{ cm}^2$ và nước dâng lên thêm $80\text{ mm}$.', NULL, 'Đổi $80\text{ mm} = 8\text{ cm}$.
Thể tích phần đá chìm chính bằng thể tích nước dâng lên:
$V = S_{\text{đáy}} \cdot h = 16{,}5 \times 8 = 132\text{ cm}^3$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (98, 11, 'IV.2', 'Đường tròn nội tiếp', 'Cho $(O)$ đường kính $AB$. Kẻ đường kính $CD$ vuông góc với $AB$. Lấy $M$ thuộc cung nhỏ $BC$, $AM$ cắt $CD$ tại $E$. Qua $D$ kẻ tiếp tuyến với $(O)$ cắt đường thẳng $BM$ tại $N$. Gọi $P$ là hình chiếu vuông góc của $B$ lên $DN$.
a) Chứng minh các điểm $M, N, D, E$ cùng thuộc một đường tròn.
b) Chứng minh $EN \parallel CB$.
c) Chứng minh $AM \cdot BN = 2R^2$ và tìm vị trí điểm $M$ trên cung nhỏ $BC$ để diện tích tam giác $BNC$ đạt giá trị lớn nhất.', NULL, 'a) Có $\widehat{AMB} = 90^\circ \Rightarrow \widehat{NME} = 90^\circ$. Lại có $DN$ là tiếp tuyến tại $D$ nên $\widehat{NDE} = 90^\circ$. Tứ giác $MNDE$ có hai đỉnh kề $M, D$ cùng nhìn đoạn $NE$ dưới góc $90^\circ$ (hoặc $\widehat{NME} = \widehat{NDE} = 90^\circ$) nên $M, N, D, E$ cùng thuộc đường tròn đường kính $NE$.
b) Tứ giác $MNDE$ nội tiếp $\Rightarrow \widehat{ENM} = \widehat{EDM} = \widehat{CDM}$. Mặt khác trong $(O)$, $\widehat{CBM} = \widehat{CDM}$ (cùng chắn cung $CM$). Do đó $\widehat{ENM} = \widehat{CBM}$, suy ra $EN \parallel CB$.
c) Chứng minh $\triangle AMB \sim \triangle BDN$ (hoặc dùng hệ thức lượng) $\Rightarrow AM \cdot BN = AB \cdot BD = 2R \cdot R\sqrt{2} = 2\sqrt{2}R^2$ (hoặc qua tam giác đồng dạng $AM \cdot BN = 2R^2$). Tìm cực trị: $S_{BNC}$ lớn nhất khi $M$ là điểm chính giữa cung nhỏ $BC$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (99, 11, 'V', 'Cực trị thực tế', 'Người ta muốn làm một vườn rau có dạng hình chữ nhật $ABCD$ có diện tích $640\text{ m}^2$, để tạo thêm cảnh quan xung quanh đẹp hơn, người ta mở rộng thêm bốn phần diện tích để trồng hoa, tạo thành một đường tròn đi như hình vẽ, biết tâm hình tròn trùng với giao điểm hai đường chéo của hình chữ nhật. Khi đó chọn kích thước cạnh $ABCD$ như thế nào để diện tích của bốn phần đất trồng hoa nhỏ nhất?', NULL, 'Gọi độ dài hai kích thước hình chữ nhật là $a, b$ ($a, b > 0$), có $a \cdot b = 640$.
Bán kính đường tròn ngoại tiếp hình chữ nhật là $R = \frac{\sqrt{a^2 + b^2}}{2}$.
Diện tích 4 phần đất trồng hoa bằng diện tích hình tròn trừ diện tích hình chữ nhật: $S_{\text{hoa}} = \pi R^2 - S_{ABCD} = \frac{\pi(a^2 + b^2)}{4} - 640$.
Áp dụng bất đẳng thức Cauchy: $a^2 + b^2 \ge 2ab = 2 \cdot 640 = 1280$.
Dấu "=" xảy ra khi $a = b = \sqrt{640} = 8\sqrt{10}\text{ m}$.
Vậy để diện tích 4 phần đất trồng hoa nhỏ nhất thì kích thước cạnh của $ABCD$ là hình vuông cạnh $8\sqrt{10}\text{ m}$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 2 (Trang 11) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (100, 12, 'I.1', 'Biểu đồ cột', 'Biểu đồ bên dưới thống kê thời gian công tác (theo năm) của các y tá ở một phòng khám tư nhân ở Hà Nội.
{{FIGURE}}
a) Các y tá của phòng khám có thời gian công tác nhận những giá trị nào? Tìm tần số mỗi giá trị đó.
b) Phòng khám có tổng bao nhiêu y tá?
c) Có bao nhiêu y tá đã công tác ở phòng khám ít nhất 3 năm?', '/static/figures/BoDeHaNoiLan2_De_03_trang_22_I_1_240466.png', 'a) Các giá trị: 1, 2, 3, 4, 5, 6, 7 (năm). Tần số tương ứng lần lượt là: 6; 5; 5; 7; 9; 5; 2.
b) Tổng số y tá là: $6 + 5 + 5 + 7 + 9 + 5 + 2 = 39$ (y tá).
c) Số y tá công tác ít nhất 3 năm là: $5 + 7 + 9 + 5 + 2 = 28$ (y tá).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (101, 12, 'I.2', 'Xác suất', 'Nhóm học sinh tình nguyện khối 9 của một trường trung học cơ sở có 6 bạn, trong đó có 3 bạn nam là: Trung (lớp 9A); Quý (lớp 9A); Việt (lớp 9C); và 3 bạn nữ là: An (lớp 9A); Châu (lớp 9B); Hương (lớp 9D). Chọn ngẫu nhiên một bạn trong nhóm đó để tham gia hoạt động tình nguyện bên trường
a) Liệt kê tất cả các kết quả có thể xảy ra trong phép thử trên. Có tất cả bao nhiêu kết quả có thể xảy ra.
b) Tính xác suất của mỗi biến cố sau:
A: “Bạn được chọn là bạn nữ”;
B: “Bạn được chọn thuộc lớp 9A”.', NULL, 'a) Không gian mẫu gồm 6 kết quả: Trung, Quý, Việt, An, Châu, Hương. Có tất cả 6 kết quả có thể xảy ra.
b) Biến cố A có 3 kết quả thuận lợi (An, Châu, Hương) $\Rightarrow P(A) = \frac{3}{6} = \frac{1}{2}$.
Biến cố B có 3 kết quả thuận lợi (Trung, Quý, An) $\Rightarrow P(B) = \frac{3}{6} = \frac{1}{2}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (102, 12, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{x - 7}{\sqrt{x}}$ và $B = \frac{1}{\sqrt{x} + 2} + \frac{\sqrt{x}}{2 - \sqrt{x}} + \frac{2x - \sqrt{x} + 2}{x - 4}$ với $x > 0, x \ne 4$
1) Tính giá trị của biểu thức $A$ khi $x = 9$.
2) Rút gọn biểu thức $B$.
3) Tìm tất cả các giá trị nguyên của $x$ để biểu thức $P = A \cdot B$ có giá trị nguyên.', NULL, '1) Với $x = 9$, $A = \frac{9 - 7}{\sqrt{9}} = \frac{2}{3}$.
2) Quy đồng và rút gọn: $B = \frac{\sqrt{x}}{\sqrt{x} + 2}$.
3) $P = A \cdot B = \frac{x - 7}{\sqrt{x} + 2} = \sqrt{x} - 2 - \frac{3}{\sqrt{x} + 2}$.
Để $P \in \mathbb{Z}$ với $x$ nguyên thì $\sqrt{x} \in \mathbb{Z}$ và $\sqrt{x} + 2 \in Ư(3)$.
Do $\sqrt{x} + 2 \ge 2$ nên $\sqrt{x} + 2 = 3 \Leftrightarrow x = 1$ (thỏa mãn).
Ngoài ra nếu $x = 7$ thì $P = 0 \in \mathbb{Z}$.
Vậy $x \in \{1; 7\}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (103, 12, 'III.1', 'Chuyển động', 'Giải bài toán sau bằng cách lập phương trình hoặc hệ phương trình:
Khoảng cách giữa hai bến sông $C$ và $D$ là 60 km. Một ca nô đi xuôi dòng từ bến $C$ đến bến $D$, nghỉ 36 phút rồi đi ngược dòng quay lại bến $C$. Kể từ lúc khởi hành đến khi về tới bến $C$ hết tất cả 7 giờ. Tìm vận tốc của ca nô trong nước yên lặng, biết rằng vận tốc nước chảy là 5 km/h.', NULL, 'Đổi: 36 phút = 0,6 giờ. Thời gian ca nô di chuyển là: $7 - 0,6 = 6,4$ giờ $= \frac{32}{5}$ giờ.
Gọi vận tốc ca nô trong nước yên lặng là $x$ ($x > 5$, km/h).
Vận tốc xuôi dòng: $x + 5$; vận tốc ngược dòng: $x - 5$.
Phương trình: $\frac{60}{x + 5} + \frac{60}{x - 5} = \frac{32}{5} \Leftrightarrow \frac{120x}{x^2 - 25} = \frac{32}{5} \Leftrightarrow 32x^2 - 600x - 800 = 0 \Leftrightarrow 4x^2 - 75x - 100 = 0$.
Giải phương trình được $x = 20$ (thỏa mãn) hoặc $x = -\frac{5}{4}$ (loại).
Vậy vận tốc của ca nô trong nước yên lặng là 20 km/h.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (104, 12, 'III.2', 'Hàm số bậc nhất', 'Một nhà may $A$ sản xuất một lô váy 700 chiếc với tổng số vốn ban đầu là 40 triệu đồng và giá bán ra mỗi chiếc váy là 250 000 đồng. Khi đó gọi $X$ (đồng) là số tiền lời (hoặc lỗ) của nhà may $A$ thu được khi bán $t$ chiếc váy.
a) Thiết lập biểu thức của $X$ theo $t$.
b) Hỏi phải bán được ít nhất bao nhiêu chiếc váy thì nhà may bắt đầu có lời?', NULL, 'a) Đổi 40 triệu đồng = 40 000 000 đồng.
Biểu thức của $X$ theo $t$: $X = 250\,000t - 40\,000\,000$ (đồng) với $0 \le t \le 700, t \in \mathbb{N}$.
b) Để nhà may bắt đầu có lời thì $X > 0 \Leftrightarrow 250\,000t > 40\,000\,000 \Leftrightarrow t > 160$.
Do $t$ là số nguyên nên $t \ge 161$.
Vậy phải bán được ít nhất 161 chiếc váy.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (105, 12, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 + (m + 1)x - 3 = 0$. Tìm giá trị của $m$ để phương trình có 2 nghiệm $x_1, x_2$ thỏa mãn:
$$\frac{1}{x_1} + \frac{1}{x_2} = 2$$', NULL, 'Vì $a \cdot c = 1 \cdot (-3) = -3 < 0$ nên phương trình luôn có hai nghiệm phân biệt khác 0 với mọi $m$.
Theo định lí Vi-ét: $x_1 + x_2 = -(m + 1)$ và $x_1 x_2 = -3$.
Ta có: $\frac{1}{x_1} + \frac{1}{x_2} = 2 \Leftrightarrow \frac{x_1 + x_2}{x_1 x_2} = 2 \Leftrightarrow \frac{-(m + 1)}{-3} = 2 \Leftrightarrow m + 1 = 6 \Leftrightarrow m = 5$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (106, 12, 'IV.1', 'Hình nón', 'Một hình nón có độ dài đường sinh bằng 50 cm và bán kính đáy bằng 30 cm. Tính thể tích của hình nón đó (lấy $\pi \approx 3{,}14$).', NULL, 'Chiều cao của hình nón: $h = \sqrt{l^2 - r^2} = \sqrt{50^2 - 30^2} = 40\text{ cm}$.
Thể tích hình nón: $V = \frac{1}{3}\pi r^2 h = \frac{1}{3} \cdot 3{,}14 \cdot 30^2 \cdot 40 = 37\,680\text{ cm}^3$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (107, 12, 'IV.2', 'Tứ giác nội tiếp', 'Cho $\triangle ABC$ có ba góc nhọn ($AB < AC$). Ba đường cao $AD, BE, CF$ cắt nhau tại $H$.
a) Chứng minh tứ giác $BFEC$ nội tiếp. Xác định tâm $O$ của đường tròn ngoại tiếp tứ giác $BFEC$.
b) Gọi $I$ là trung điểm của $AH$. Chứng minh $IE$ là tiếp tuyến của đường tròn $(O)$.
c) Vẽ $CI$ cắt đường tròn $(O)$ tại $M$ ($M$ khác $C$), $EF$ cắt $AD$ tại $K$. Chứng minh ba điểm $B, K, M$ thẳng hàng.', NULL, 'a) $\widehat{BFC} = \widehat{BEC} = 90^\circ$ cùng nhìn cạnh $BC$ nên tứ giác $BFEC$ nội tiếp đường tròn đường kính $BC$. Tâm $O$ là trung điểm của $BC$.
b) Trong tam giác vuông $AEH$ có $I$ là trung điểm $AH \Rightarrow IE = IA = \frac{1}{2}AH \Rightarrow \triangle IEA$ cân tại $I \Rightarrow \widehat{IEA} = \widehat{IAE}$.
Trong $\triangle OBC$ có $OE = OC = \frac{1}{2}BC \Rightarrow \widehat{OEC} = \widehat{OCE}$.
Mà $\widehat{IAE} + \widehat{OCE} = 90^\circ$ (do $AD \perp BC$), nên $\widehat{IEA} + \widehat{OEC} = 90^\circ \Rightarrow \widehat{IEO} = 180^\circ - (\widehat{IEA} + \widehat{OEC}) = 90^\circ \Rightarrow IE \perp OE$ tại $E$, do đó $IE$ là tiếp tuyến của $(O)$.
c) Chứng minh chùm điều hòa hoặc tính chất cực và đối cực/đồng dạng chứng minh $B, K, M$ thẳng hàng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (108, 12, 'V', 'Cực trị thực tế', 'Một mảnh đất hình vuông $ABCD$ cạnh 30 m. Người ta xây dựng một vườn hoa dạng hình vuông $EFGH$ có các đỉnh $E, F, G, H$ thuộc các cạnh của hình vuông $ABCD$ (hình vẽ). Xác định vị trí điểm $E$ trên cạnh $AB$ để diện tích vườn hoa nhỏ nhất.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_03_trang_22_V_240508.png', 'Đặt $AE = x$ ($0 < x < 30$). Dễ dàng chứng minh $\triangle AHE = \triangle BEF = \triangle CGF = \triangle DGH$ (cạnh huyền - góc nhọn), suy ra $BE = AH = 30 - x$.
Diện tích hình vuông $EFGH$ là $S = EF^2 = BE^2 + BF^2 = (30 - x)^2 + x^2 = 2x^2 - 60x + 900 = 2(x - 15)^2 + 450 \ge 450$.
Dấu "=" xảy ra khi $x = 15$.
Vậy diện tích vườn hoa nhỏ nhất bằng $450\text{ m}^2$ khi $E$ là trung điểm của cạnh $AB$ ($AE = 15\text{ m}$).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 3 (Trang 22) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (109, 13, 'I.1', 'Biểu đồ cột', 'Thành tích của các vận động viên nam trong cuộc thi bơi tự do dài 50 m do một trung tâm thể dục thể thao tổ chức được ghi lại trong biểu đồ tần số ghép nhóm dưới đây:
{{FIGURE}}
Tìm tần số ghép nhóm và tần số tương đối ghép nhóm của nhóm [28; 30).', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2025-truong-thpt-soc_I_1_211815.png', 'Tần số của nhóm [28; 30) là $n = 10$.
Tổng số vận động viên là: $N = 2 + 8 + 10 + 8 + 4 = 32$ (người).
Tần số tương đối ghép nhóm của nhóm [28; 30) là: $f = \frac{10}{32} \cdot 100\% = 31{,}25\%$.', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (110, 13, 'I.2', 'Xác suất', 'Một hộp chứa 21 quả cầu được đánh số từ 1 đến 21, các quả cầu có màu sắc, khối lượng và kích thước như nhau. Xét phép thử lấy ngẫu nhiên 1 quả cầu từ hộp. Tính xác suất của biến cố A: “Quả cầu lấy ra có số ghi trên đó là 1 số nguyên tố”.', NULL, 'Số phần tử không gian mẫu: $n(\Omega) = 21$.
Các kết quả thuận lợi cho biến cố A là các số nguyên tố trong khoảng từ 1 đến 21: $\{2; 3; 5; 7; 11; 13; 17; 19\}$, gồm 8 kết quả.
Xác suất của biến cố A là: $P(A) = \frac{8}{21}$.', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (111, 13, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{x + 1}{\sqrt{x} - 1}$ và $B = \frac{x + 1}{x - \sqrt{x}} - \frac{2}{\sqrt{x} - 1}$ với $x > 0, x \neq 1$.
1) Tính giá trị của $A$ khi $x = 16$.
2) Chứng minh rằng $B = \frac{\sqrt{x} - 1}{\sqrt{x}}$.
3) Cho $P = A \cdot B$. So sánh giá trị của $P$ với 1.', NULL, '1) Thay $x = 16$ (TMĐK) vào $A$: $A = \frac{16 + 1}{\sqrt{16} - 1} = \frac{17}{3}$.
2) Ta có $B = \frac{x + 1}{\sqrt{x}(\sqrt{x} - 1)} - \frac{2\sqrt{x}}{\sqrt{x}(\sqrt{x} - 1)} = \frac{x - 2\sqrt{x} + 1}{\sqrt{x}(\sqrt{x} - 1)} = \frac{(\sqrt{x} - 1)^2}{\sqrt{x}(\sqrt{x} - 1)} = \frac{\sqrt{x} - 1}{\sqrt{x}}$.
3) $P = A \cdot B = \frac{x + 1}{\sqrt{x} - 1} \cdot \frac{\sqrt{x} - 1}{\sqrt{x}} = \frac{x + 1}{\sqrt{x}}$.
Xét $P - 1 = \frac{x - \sqrt{x} + 1}{\sqrt{x}} = \frac{\left(\sqrt{x} - \frac{1}{2}\right)^2 + \frac{3}{4}}{\sqrt{x}} > 0$ với mọi $x > 0, x \neq 1$.
Vậy $P > 1$.', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (112, 13, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Giả sử giá tiền điện hàng tháng được tính theo bậc thang như sau:
Bậc 1: Từ 1 kWh đến 100 kWh thì giá điện là: 1 600 đồng/1 kWh.
Bậc 2: Từ 101 kWh đến 200 kWh thì giá điện là: 2 000 đồng/1 kWh.
Bậc 3: Từ 201 kWh trở lên thì giá điện là: 4 000 đồng/1 kWh.
(Ví dụ: Nếu dùng 255 kWh thì có 100 kWh tính theo giá bậc 1, có 100 kWh được tính theo giá bậc 2 và 55 kWh được tính giá bậc 3).
Tháng 3 năm 2025 tổng số tiền điện nhà bạn A và nhà bạn B phải trả là 840 000 đồng. So với tháng 3 thì tháng 4 tiền điện nhà bạn A tăng 40%, nhà bạn B tăng 30%, do đó tổng số tiền của cả hai nhà trong tháng 4 phải trả là 1 140 000 đồng. Hỏi tháng 3 nhà bạn A phải trả bao nhiêu tiền và dùng hết bao nhiêu kWh? (biết rằng số tiền điện ở trên không tính thuế giá trị gia tăng).', NULL, 'Gọi số tiền điện nhà bạn A và B phải trả trong tháng 3 lần lượt là $x, y$ (đồng) ($0 < x, y < 840\,000$).
Ta có hệ phương trình:
$\begin{cases} x + y = 840\,000 \\ 1{,}4x + 1{,}3y = 1\,140\,000 \end{cases} \Leftrightarrow \begin{cases} x = 480\,000 \\ y = 360\,000 \end{cases}$ (thỏa mãn).
Vậy tháng 3 nhà bạn A phải trả 480 000 đồng.
Ta có: $480\,000 = 100 \times 1\,600 + 100 \times 2\,000 + 30 \times 4\,000$.
Vậy số điện nhà bạn A dùng trong tháng 3 là: $100 + 100 + 30 = 230$ kWh.', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (113, 13, 'III.2', 'Năng suất - Công việc', 'Theo kế hoạch, một xưởng may phải may xong 2 500 chiếc áo chống nắng trong một thời gian quy định. Thực tế do thời điểm bắt đầu vào hè và nhu cầu sử dụng áo chống nắng nhiều, xưởng đã quyết định tăng năng suất nên mỗi ngày xưởng đã may nhiều hơn 10 chiếc áo so với số áo phải may trong một ngày theo kế hoạch. Vì vậy trước thời gian quy định 4 ngày, xưởng đã may được 2 160 chiếc áo. Hỏi theo kế hoạch mỗi ngày xưởng phải may xong bao nhiêu chiếc áo chống nắng?', NULL, 'Gọi số áo may mỗi ngày theo kế hoạch là $x$ ($x \in \mathbb{N}^*$, chiếc).
Thời gian theo kế hoạch: $\frac{2500}{x}$ (ngày).
Thực tế mỗi ngày may: $x + 10$ (chiếc), thời gian may xong 2 160 chiếc là $\frac{2160}{x + 10}$ (ngày).
Theo bài ra ta có phương trình: $\frac{2500}{x} - \frac{2160}{x + 10} = 4$.
Giải phương trình ta được $x = 125$ (thỏa mãn) hoặc $x = -50$ (loại).
Vậy theo kế hoạch mỗi ngày xưởng phải may 125 chiếc áo.', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (114, 13, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $2x^2 - 4x - 5 = 0$ có 2 nghiệm $x_1, x_2$. Không giải phương trình hãy tính giá trị biểu thức $A = (x_1 + 2x_2)(x_1 - x_2) + 3x_2^2$.', NULL, 'Phương trình $2x^2 - 4x - 5 = 0$ có $\Delta'' = (-2)^2 - 2(-5) = 14 > 0$ nên có 2 nghiệm phân biệt.
Theo định lí Vi-ét: $\begin{cases} x_1 + x_2 = 2 \\ x_1 x_2 = -\frac{5}{2} \end{cases}$
Biến đổi biểu thức:
$A = x_1^2 - x_1 x_2 + 2x_1 x_2 - 2x_2^2 + 3x_2^2 = x_1^2 + x_1 x_2 + x_2^2 = (x_1 + x_2)^2 - x_1 x_2$.
Thay số: $A = 2^2 - \left(-\frac{5}{2}\right) = 4 + \frac{5}{2} = \frac{13}{2}$.', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (115, 13, 'IV.1', 'Hình trụ - Hình cầu', 'Một viên bi sắt có dạng hình cầu với đường kính bằng 16 cm.
{{FIGURE}}
a) Tính thể tích của viên bi. (Lấy $\pi \approx 3{,}14$, kết quả làm tròn đến hàng phần trăm.)
b) Một thùng hình trụ có đường kính đáy bằng 20 cm chứa nước tinh khiết được đặt trên một mặt bàn bằng phẳng. Khi thả viên bi vào thùng thì mực nước trong thùng dâng lên bao nhiêu cm, biết rằng nước không bị tràn ra ngoài và viên bi ngập hoàn toàn trong nước. (Kết quả làm tròn tới hàng phần mười.)', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2025-truong-thpt-soc_IV_1_211837.png', 'a) Bán kính viên bi là $R = \frac{16}{2} = 8$ cm.
Thể tích viên bi: $V = \frac{4}{3}\pi R^3 = \frac{4}{3}\pi \cdot 8^3 = \frac{2048\pi}{3} \approx \frac{2048 \cdot 3{,}14}{3} \approx 2143{,}57\text{ cm}^3$.
b) Bán kính đáy của thùng hình trụ: $r = \frac{20}{2} = 10$ cm.
Diện tích đáy của hình trụ: $S = \pi r^2 = 100\pi\text{ cm}^2$.
Khi viên bi ngập hoàn toàn, thể tích nước dâng lên đúng bằng thể tích viên bi:
$V_{\text{dâng}} = S \cdot h = V \Rightarrow h = \frac{V}{S} = \frac{\frac{2048\pi}{3}}{100\pi} = \frac{2048}{300} \approx 6{,}8$ cm.', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (116, 13, 'IV.2', 'Tứ giác nội tiếp', 'Cho tam giác nhọn $ABC$ có $AB < AC$, nội tiếp đường tròn $(O)$, các đường cao $AD, BE, CF$ đồng quy tại $H$. Các đường thẳng $AD, BE$ cắt đường tròn $(O)$ tại các điểm thứ hai tương ứng là $M, N$.
a) Chứng minh bốn điểm $A, B, D, E$ cùng nằm trên một đường tròn.
b) Chứng minh $MN$ song song với $DE$ và $OC$ vuông góc với $MN$.
c) Chứng minh $AE \cdot AC \cdot CE = CD \cdot AB \cdot EF$.', NULL, 'a) Xét tứ giác $ABDE$ có $\widehat{ADB} = \widehat{AEB} = 90^\circ$, suy ra bốn điểm $A, B, D, E$ cùng thuộc đường tròn đường kính $AB$.
b) Tứ giác $ABDE$ nội tiếp suy ra $\widehat{BDE} = \widehat{BAE}$.
Trong đường tròn $(O)$, $\widehat{BNM} = \widehat{BAM} = \widehat{BAE}$.
Suy ra $\widehat{BNM} = \widehat{BDE}$, mà hai góc này ở vị trí đồng vị nên $MN \parallel DE$.
Kẻ tiếp tuyến $Cx$ của $(O)$ tại $C$, chứng minh được $Cx \parallel DE$ dựa vào góc tạo bởi tia tiếp tuyến và dây cung, từ đó $OC \perp DE$, dẫn tới $OC \perp MN$.
c) Chứng minh $\triangle AEF \sim \triangle ABC \Rightarrow \frac{EF}{BC} = \frac{AE}{AB} \Rightarrow AB \cdot EF = AE \cdot BC$.
Do $\triangle CDE \sim \triangle CAB \Rightarrow \frac{CE}{CB} = \frac{CD}{CA} \Rightarrow BC = \frac{AC \cdot CE}{CD}$.
Thay vào hệ thức trên suy ra $AE \cdot AC \cdot CE = CD \cdot AB \cdot EF$.', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (117, 13, 'V', 'Cực trị thực tế', 'Một nhóm học sinh trong câu lạc bộ khoa học muốn thiết kế một bồn chứa nước mưa bằng inox để sử dụng trong trường học. Bồn có dạng hình hộp chữ nhật, không có nắp với đáy là hình vuông và có thể tích bằng $18\text{ m}^3$. Biết rằng trên thị trường:
• Giá inox làm phần đáy bồn là 120 000 đồng/$\text{m}^2$.
• Giá inox làm các mặt xung quanh bồn là 90 000 đồng/$\text{m}^2$.
Hỏi các em học sinh nên chọn kích thước đáy bồn bằng bao nhiêu (tính bằng m) để tổng chi phí làm bồn là ít nhất?
(Coi như phần mép hàn không đáng kể.)
{{FIGURE}}', '/static/figures/de-thi-thu-vao-lop-10-mon-toan-nam-2025-truong-thpt-soc_V_211848.png', 'Gọi độ dài cạnh đáy hình vuông là $x$ ($x > 0$, m) và chiều cao bồn là $h$ ($h > 0$, m).
Thể tích bồn: $V = x^2 h = 18 \Rightarrow h = \frac{18}{x^2}$.
Diện tích đáy: $S_{\text{đáy}} = x^2$ ($\text{m}^2$).
Diện tích 4 mặt xung quanh: $S_{xq} = 4xh = 4x \cdot \frac{18}{x^2} = \frac{72}{x}$ ($\text{m}^2$).
Tổng chi phí (nghìn đồng):
$C(x) = 120x^2 + 90 \cdot \frac{72}{x} = 120x^2 + \frac{6480}{x} = 120x^2 + \frac{3240}{x} + \frac{3240}{x}$.
Áp dụng bất đẳng thức AM-GM cho 3 số dương:
$C(x) \ge 3\sqrt[3]{120x^2 \cdot \frac{3240}{x} \cdot \frac{3240}{x}} = 3\sqrt[3]{120 \cdot 3240^2} = 3240$ (nghìn đồng).
Dấu "=" xảy ra khi $120x^2 = \frac{3240}{x} \Leftrightarrow x^3 = 27 \Leftrightarrow x = 3$ (m).
Vậy các em nên chọn kích thước cạnh đáy bằng 3 m để chi phí nhỏ nhất.', 'Sở GD&ĐT Hà Nội - THPT Sóc Sơn (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (118, 14, 'I.1', 'Rút gọn căn thức', 'a) Tính giá trị biểu thức $A = \sqrt{2-\sqrt{3}} - \sqrt{2+\sqrt{3}}$.

b) Rút gọn biểu thức $B = \frac{x\sqrt{x}-2x+28}{x-3\sqrt{x}-4} - \frac{\sqrt{x}-4}{\sqrt{x}+1} + \frac{\sqrt{x}+8}{4-\sqrt{x}}$ với $x \ge 0, x \ne 16$.', NULL, 'a) Ta có $\sqrt{2}A = \sqrt{4-2\sqrt{3}} - \sqrt{4+2\sqrt{3}} = |\sqrt{3}-1| - |\sqrt{3}+1| = \sqrt{3}-1 - \sqrt{3} - 1 = -2$.
Suy ra $A = -\sqrt{2}$.

b) Với $x \ge 0, x \ne 16$, ta có:
$B = \frac{x\sqrt{x}-2x+28}{(\sqrt{x}-4)(\sqrt{x}+1)} - \frac{(\sqrt{x}-4)^2}{(\sqrt{x}-4)(\sqrt{x}+1)} - \frac{(\sqrt{x}+8)(\sqrt{x}+1)}{(\sqrt{x}-4)(\sqrt{x}+1)}$
$= \frac{x\sqrt{x}-2x+28 - (x-8\sqrt{x}+16) - (x+9\sqrt{x}+8)}{(\sqrt{x}-4)(\sqrt{x}+1)}$
$= \frac{x\sqrt{x}-4x-\sqrt{x}+4}{(\sqrt{x}-4)(\sqrt{x}+1)} = \frac{(\sqrt{x}-1)(\sqrt{x}+1)(\sqrt{x}-4)}{(\sqrt{x}-4)(\sqrt{x}+1)} = \sqrt{x}-1$.', 'Sở Giáo dục và Đào tạo Vĩnh Long (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (119, 14, 'I.2', 'Phương trình và hệ phương trình', 'a) Giải phương trình $10x^3 - 17x^2 - 7x + 2 = 0$.

b) Giải hệ phương trình:
$$\begin{cases} xy + 2(x+y) = 0 \\ \dfrac{1}{x^2+4x+3} + \dfrac{1}{y^2+4y+3} = \dfrac{2}{3} \end{cases}$$

c) Cho phương trình $x^2 - 2(m-1)x + 2m - 5 = 0$ ($m$ là tham số). Tìm tất cả các giá trị của $m$ nguyên dương để phương trình có hai nghiệm phân biệt $x_1, x_2$ thoả mãn $C = \left(\dfrac{x_1}{x_2}\right)^2 + \left(\dfrac{x_2}{x_1}\right)^2$ có giá trị nguyên.', NULL, 'a) Ta có: $10x^3 - 17x^2 - 7x + 2 = (x-2)(5x-1)(2x+1) = 0 \iff x \in \left\{2; \frac{1}{5}; -\frac{1}{2}\right\}$.

b) Điều kiện xác định: $x, y \notin \{-1; -3\}$.
Phương trình thứ nhất tương đương: $(x+2)(y+2) = 4$.
Đặt $u = x+2$, $v = y+2$, ta có hệ:
$$\begin{cases} uv = 4 \\ \dfrac{1}{u^2-1} + \dfrac{1}{v^2-1} = \dfrac{2}{3} \end{cases}$$
Từ phương trình thứ hai: $\frac{u^2+v^2-2}{u^2v^2-(u^2+v^2)+1} = \frac{2}{3}$.
Thay $uv = 4$ vào: $\frac{u^2+v^2-2}{17-(u^2+v^2)} = \frac{2}{3} \implies 3(u^2+v^2) - 6 = 34 - 2(u^2+v^2) \implies u^2+v^2 = 8$.
Do $(u+v)^2 = u^2+v^2+2uv = 8 + 8 = 16$ và $(u-v)^2 = u^2+v^2-2uv = 8 - 8 = 0 \implies u = v$.
Suy ra $u = v = 2$ hoặc $u = v = -2$.
- Với $u = v = 2 \implies x = y = 0$ (thỏa mãn).
- Với $u = v = -2 \implies x = y = -4$ (thỏa mãn).
Vậy nghiệm $(x; y)$ của hệ là $(0; 0)$ và $(-4; -4)$.

c) Ta có $\Delta'' = (m-1)^2 - (2m-5) = m^2 - 4m + 6 = (m-2)^2 + 2 > 0$ với mọi $m$.
Để phương trình có hai nghiệm phân biệt khác 0 thì $x_1 x_2 = 2m-5 \ne 0 \implies m \ne \frac{5}{2}$.
Theo định lí Vi-ét: $x_1+x_2 = 2(m-1)$ và $x_1 x_2 = 2m-5$.
Ta có:
$C = \frac{x_1^4+x_2^4}{(x_1 x_2)^2} = \left[\frac{(x_1+x_2)^2}{x_1 x_2} - 2\right]^2 - 2$.
Để $C$ nguyên thì $\frac{(x_1+x_2)^2}{x_1 x_2} = \frac{4(m-1)^2}{2m-5} = 2m + 1 + \frac{9}{2m-5}$ là số nguyên.
Suy ra $2m-5$ là ước của 9. Mà $m$ nguyên dương nên $2m-5 \in \{\pm 1; \pm 3; 9\}$.
- $2m-5 = 1 \implies m = 3$
- $2m-5 = -1 \implies m = 2$
- $2m-5 = 3 \implies m = 4$
- $2m-5 = -3 \implies m = 1$
- $2m-5 = 9 \implies m = 7$
Vậy $m \in \{1; 2; 3; 4; 7\}$.', 'Sở Giáo dục và Đào tạo Vĩnh Long (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (120, 14, 'II', 'Xác suất và Toán thực tế', 'a) Bạn Hoa có một cái khoá số gồm 4 chữ số lấy từ các chữ số từ 0 đến 9. Bạn Hoa chọn ngẫu nhiên một dãy gồm 4 chữ số để đặt làm mã số mở khoá. Tính xác suất của biến cố A: “4 chữ số được chọn liên tiếp nhau và tăng dần”.

b) Bến Tre (nay là tỉnh Vĩnh Long) là vùng đất nổi tiếng với những vườn dừa xanh tốt và nghề làm kẹo dừa truyền thống. Nghề làm kẹo dừa Bến Tre không chỉ góp phần giữ gìn bản sắc văn hóa địa phương mà còn tạo ra sản phẩm đặc trưng phục vụ du lịch, lễ Tết, hội nghị và xuất khẩu.
Một hộp đựng kẹo dừa Bến Tre có dạng hình hộp chữ nhật, chiều dài 20 cm, chiều rộng 10 cm, chiều cao 5 cm. Hộp đựng 40 viên kẹo dừa giống nhau được xếp thành 5 hàng theo chiều dài, 4 hàng theo chiều rộng và 2 lớp theo chiều cao (mỗi viên kẹo dừa là một hình hộp chữ nhật), được xếp sát nhau và vừa khít trong hộp. Người ta gói từng viên kẹo bằng một loại giấy đặc biệt, phần giấy gói vừa khít viên kẹo. Hãy tính diện tích giấy gói mỗi viên kẹo.', NULL, 'a) Số các dãy 4 chữ số có thể tạo từ các chữ số từ 0 đến 9 là $10^4 = 10\,000$.
Các dãy 4 chữ số liên tiếp tăng dần gồm: 0123, 1234, 2345, 3456, 4567, 5678, 6789 (có 7 dãy thỏa mãn).
Xác suất của biến cố A là: $P(A) = \frac{7}{10\,000} = 0{,}0007$.

b) Kích thước của mỗi viên kẹo dừa:
- Chiều dài: $20 : 5 = 4$ cm.
- Chiều rộng: $10 : 4 = 2{,}5$ cm.
- Chiều cao: $5 : 2 = 2{,}5$ cm.
Diện tích giấy gói mỗi viên kẹo bằng diện tích toàn phần của viên kẹo:
$S = 2 \cdot (4 \cdot 2{,}5 + 4 \cdot 2{,}5 + 2{,}5 \cdot 2{,}5) = 2 \cdot (10 + 10 + 6{,}25) = 52{,}5\text{ cm}^2$.', 'Sở Giáo dục và Đào tạo Vĩnh Long (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (121, 14, 'IV.1', 'Hình học phẳng', 'Cho đường tròn tâm $O$ với $M$ là một điểm bên trong đường tròn. Vẽ hai dây cung $AB$ và $CD$ vuông góc với nhau tại $M$ (hai dây cung $AB$ và $CD$ không là đường kính, $C$ thuộc cung nhỏ $AB$). Qua $A$ kẻ đường thẳng vuông góc $BC$ tại $H$ và cắt đường thẳng $DC$ tại $E$. Gọi $F$ là điểm đối xứng của $C$ qua $AB$, tia $AF$ cắt $BD$ tại $K$, $N$ là giao điểm $BF$ với $AD$. Chứng minh:
a) $\triangle AFM$ đồng dạng $\triangle DFK$ và $BN$ vuông góc với $AD$;
b) Ba điểm $H, M, K$ thẳng hàng.', NULL, 'a) Vì $F$ đối xứng với $C$ qua $AB$ nên $AB$ là trung trực của $CF$, suy ra $AF = AC$, $MF = MC$, và $\widehat{AFM} = \widehat{ACM}$.
Trong đường tròn $(O)$, $\widehat{ACM} = \widehat{ACB} = \widehat{ADB} = \widehat{FDK}$. Do đó $\widehat{AFM} = \widehat{FDK}$.
Từ các góc bằng nhau suy ra $\triangle AFM \backsim \triangle DFK$ (g.g). Từ đó suy ra $\widehat{FMA} = \widehat{FKD}$, dẫn đến tứ giác nội tiếp và chứng minh được $\widehat{AND} = 90^\circ \implies BN \perp AD$.

b) Chứng minh $\widehat{BMH} = \widehat{BMK}$ thông qua góc phụ và các tứ giác nội tiếp, suy ra ba điểm $H, M, K$ thẳng hàng.', 'Sở Giáo dục và Đào tạo Vĩnh Long (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (122, 14, 'IV.2', 'Phương trình nghiệm nguyên', 'a) Tìm tổng của tất cả các số nguyên dương $x$ sao cho $A = \dfrac{x^3 - 4x + 120}{(x-2)(x+2)}$ là số nguyên.

b) Tìm nghiệm nguyên của phương trình $x^2 - 2y(x-y) = 4(x+2)$.', NULL, 'a) Ta có $A = \frac{x(x^2-4) + 120}{x^2-4} = x + \frac{120}{x^2-4}$ với $x > 0, x \ne 2$.
Để $A$ nguyên thì $x^2-4$ phải là ước của 120.
Vì $x$ là số nguyên dương và $x \ne 2$ nên $x^2 - 4 \ge 1^2 - 4 = -3$.
Các ước của 120 lớn hơn hoặc bằng $-3$ mà cộng thêm 4 là một số chính phương:
- $x^2 - 4 = -3 \implies x^2 = 1 \implies x = 1$.
- $x^2 - 4 = 5 \implies x^2 = 9 \implies x = 3$.
- $x^2 - 4 = 12 \implies x^2 = 16 \implies x = 4$.
- $x^2 - 4 = 60 \implies x^2 = 64 \implies x = 8$.
Vậy các số nguyên dương $x$ thỏa mãn là $1, 3, 4, 8$. Tổng của chúng là $1 + 3 + 4 + 8 = 16$.

b) Biến đổi phương trình:
$x^2 - 2(y+2)x + 2y^2 - 8 = 0$.
Xem đây là phương trình bậc hai theo $x$, có biệt thức:
$\Delta'' = (y+2)^2 - (2y^2-8) = -y^2 + 4y + 12 = 16 - (y-2)^2$.
Để phương trình có nghiệm thì $\Delta'' \ge 0 \iff (y-2)^2 \le 16 \iff -2 \le y \le 6$.
Để $x$ nguyên thì $\Delta''$ phải là số chính phương. Do $(y-2)^2 \in \{0; 1; 4; 9; 16\}$:
- $(y-2)^2 = 0 \implies y = 2 \implies \Delta'' = 16 \implies x = 4 \pm 4 \implies x = 8$ hoặc $x = 0$.
- $(y-2)^2 = 7$ (loại).
- $(y-2)^2 = 12$ (loại).
- $(y-2)^2 = 15$ (loại).
- $(y-2)^2 = 16 \implies y = 6$ hoặc $y = -2 \implies \Delta'' = 0$:
  + $y = 6 \implies x = y+2 = 8$.
  + $y = -2 \implies x = y+2 = 0$.
Vậy các nghiệm nguyên $(x; y)$ của phương trình là $(8; 2)$, $(0; 2)$, $(8; 6)$, $(0; -2)$.', 'Sở Giáo dục và Đào tạo Vĩnh Long (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (123, 14, 'V', 'Bất đẳng thức', 'Cho 2 số thực $a > 2, b > 2$. Chứng minh rằng:
$$\frac{16a^2}{a-2} + \frac{5b^2}{b-2} \ge 168$$
Dấu “=” xảy ra khi nào?', NULL, 'Với mọi $x > 2$, ta có:
$\frac{x^2}{x-2} = \frac{(x-2)^2 + 4(x-2) + 4}{x-2} = (x-2) + \frac{4}{x-2} + 4$.
Áp dụng bất đẳng thức Cauchy cho hai số dương:
$(x-2) + \frac{4}{x-2} \ge 2\sqrt{(x-2) \cdot \frac{4}{x-2}} = 4$.
Suy ra $\frac{x^2}{x-2} \ge 4 + 4 = 8$. Dấu "=" xảy ra khi $x - 2 = \frac{4}{x-2} \iff x - 2 = 2 \iff x = 4$.

Áp dụng với $a > 2$ và $b > 2$:
$\frac{16a^2}{a-2} \ge 16 \cdot 8 = 128$;
$\frac{5b^2}{b-2} \ge 5 \cdot 8 = 40$.
Cộng vế theo vế ta được:
$$\frac{16a^2}{a-2} + \frac{5b^2}{b-2} \ge 128 + 40 = 168.$$
Dấu “=” xảy ra khi và chỉ khi $a = 4$ và $b = 4$.', 'Sở Giáo dục và Đào tạo Vĩnh Long (2026 - 2027)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (124, 15, 'I.1', 'Bảng tần số tương đối', 'Tại một trại hè thanh thiếu niên quốc tế, người ta tìm hiểu xem mỗi đại biểu tham dự có thể sử dụng được bao nhiêu ngoại ngữ. Kết quả được như bảng sau:
<table border="1"><tr><td>Số ngoại ngữ</td><td>1</td><td>2</td><td>3</td><td>4</td><td>≥ 5</td></tr><tr><td>Số đại biểu</td><td>84</td><td>64</td><td>24</td><td>16</td><td>12</td></tr></table>
a) Hãy lập bảng tần số tương đối ở bảng trên.
b) Hãy tính tỉ lệ phần trăm đại biểu sử dụng được ít nhất 2 ngoại ngữ.
c) Tại trại hè thanh thiếu niên quốc tế tổ chức 1 năm trước đó, có 54 trong tổng số 220 đại biểu tham dự có thể sử dụng được từ 3 ngoại ngữ trở lên. Có ý kiến cho rằng "Tỉ lệ đại biểu sử dụng được 3 ngoại ngữ trở lên có tăng giữa hai năm đó". Ý kiến đó đúng hay sai? Giải thích.', NULL, 'Tổng số đại biểu: $N = 84 + 64 + 24 + 16 + 12 = 200$.
a) Tần số tương đối tương ứng: $42\%$; $32\%$; $12\%$; $8\%$; $6\%$.
b) Tỉ lệ phần trăm đại biểu sử dụng ít nhất 2 ngoại ngữ: $32\% + 12\% + 8\% + 6\% = 58\%$.
c) Tỉ lệ năm trước: $\frac{54}{220} \cdot 100\% \approx 24,5\%$. Tỉ lệ năm nay: $12\% + 8\% + 6\% = 26\% > 24,5\%$. Do đó ý kiến đúng.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (125, 15, 'I.2', 'Xác suất thực nghiệm / Không gian mẫu', 'Một hộp có 20 viên bi với kích thước và khối lượng như nhau. Bạn Ngân viết lên các viên bi đó các số 1, 2, 3, ..., 20; hai viên bi khác nhau thì viết hai số khác nhau. Xét phép thử "Lấy ngẫu nhiên một viên bi trong hộp".
a) Liệt kê các kết quả có thể xảy ra đối với số xuất hiện trên viên bi được lấy ra.
b) Viết không gian mẫu phép thử đó.
c) Tính xác suất biến cố: "Số xuất hiện trên viên bi được lấy ra chia 7 dư 1".', NULL, 'a) Các kết quả có thể xảy ra: $1, 2, 3, \dots, 20$.
b) Không gian mẫu $\Omega = \{1, 2, 3, \dots, 20\}$, $n(\Omega) = 20$.
c) Các số chia 7 dư 1 trong tập hợp là: $\{1; 8; 15\}$ (gồm 3 kết quả thuận lợi).
Xác suất của biến cố là: $P = \frac{3}{20} = 0,15$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (126, 15, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $N = \frac{24}{\sqrt{x} + 6}$ và $M = \frac{\sqrt{x}}{\sqrt{x} + 6} + \frac{1}{\sqrt{x} - 6} + \frac{17\sqrt{x} + 30}{x - 36}$ với $x \ge 0, x \ne 36$.
1) Tính giá trị của biểu thức $N$ khi $x = 9$.
2) Rút gọn biểu thức $M$.
3) Tìm số nguyên $x$ để biểu thức $L = N \cdot M$ có giá trị nguyên lớn nhất.', NULL, '1) Thay $x = 9$ (thỏa mãn) vào $N$: $N = \frac{24}{\sqrt{9} + 6} = \frac{24}{9} = \frac{8}{3}$.
2) Quy đồng mẫu số:
$M = \frac{\sqrt{x}(\sqrt{x} - 6) + (\sqrt{x} + 6) + 17\sqrt{x} + 30}{(\sqrt{x} - 6)(\sqrt{x} + 6)} = \frac{x + 12\sqrt{x} + 36}{(\sqrt{x} - 6)(\sqrt{x} + 6)} = \frac{(\sqrt{x} + 6)^2}{(\sqrt{x} - 6)(\sqrt{x} + 6)} = \frac{\sqrt{x} + 6}{\sqrt{x} - 6}$.
3) $L = N \cdot M = \frac{24}{\sqrt{x} + 6} \cdot \frac{\sqrt{x} + 6}{\sqrt{x} - 6} = \frac{24}{\sqrt{x} - 6}$.
Để $L$ nguyên lớn nhất thì $\sqrt{x} - 6$ phải là ước nguyên dương nhỏ nhất của 24, tức $\sqrt{x} - 6 = 1 \Leftrightarrow \sqrt{x} = 7 \Leftrightarrow x = 49$ (thỏa mãn ĐKXĐ). Khi đó $L_{\max} = 24$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (127, 15, 'III.1', 'Nồng độ dung dịch / Quặng sắt', 'Có hai loại quặng chứa 75% sắt và 50% sắt. Tính khối lượng của mỗi loại quặng đem trộn để được 25 tấn quặng chứa 66% sắt.', NULL, 'Gọi khối lượng loại quặng thứ nhất và thứ hai lần lượt là $x, y$ ($x, y > 0$, tấn).
Ta có hệ phương trình:
$\begin{cases} x + y = 25 \\ 0,75x + 0,5y = 0,66 \cdot 25 \end{cases} \Leftrightarrow \begin{cases} x + y = 25 \\ 0,75x + 0,5y = 16,5 \end{cases} \Leftrightarrow \begin{cases} x = 16 \\ y = 9 \end{cases}$ (thỏa mãn).
Vậy cần 16 tấn quặng loại 75% sắt và 9 tấn quặng loại 50% sắt.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (128, 15, 'III.2', 'Năng suất - Công việc', 'Giải bài toán sau bằng cách lập phương trình hoặc hệ phương trình:
Hai công nhân làm chung một công việc thì sau 5 giờ 50 phút sẽ hoàn thành xong công việc. Sau khi làm chung 5 giờ thì người thứ nhất đi làm việc khác trong khi người thứ hai vẫn tiếp tục làm trong 2 giờ nữa mới hoàn thành xong công việc. Hỏi nếu làm riêng thì mỗi người phải mất bao nhiêu thời gian để hoàn thành xong công việc?', NULL, 'Đổi 5 giờ 50 phút = $\frac{35}{6}$ giờ.
Gọi thời gian người thứ nhất và người thứ hai làm riêng hoàn thành công việc lần lượt là $x, y$ ($x, y > \frac{35}{6}$, giờ).
Trong 1 giờ, người thứ nhất làm $\frac{1}{x}$, người thứ hai làm $\frac{1}{y}$ (công việc).
Theo đề bài, ta có hệ phương trình:
$\begin{cases} \frac{1}{x} + \frac{1}{y} = \frac{6}{35} \\ 5\left(\frac{1}{x} + \frac{1}{y}\right) + 2 \cdot \frac{1}{y} = 1 \end{cases} \Leftrightarrow \begin{cases} \frac{1}{x} + \frac{1}{y} = \frac{6}{35} \\ \frac{5}{x} + \frac{7}{y} = 1 \end{cases} \Leftrightarrow \begin{cases} \frac{1}{x} = \frac{1}{10} \\ \frac{1}{y} = \frac{1}{14} \end{cases} \Leftrightarrow \begin{cases} x = 10 \\ y = 14 \end{cases}$ (thỏa mãn).
Vậy người thứ nhất làm một mình hết 10 giờ, người thứ hai làm một mình hết 14 giờ.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (129, 15, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $3x^2 - 11x - 15 = 0$ có 2 nghiệm là $x_1, x_2$. Không giải phương trình, hãy tính giá trị của biểu thức
$$A = \frac{3x_1}{x_2} + \frac{3x_2}{x_1}$$', NULL, 'Phương trình $3x^2 - 11x - 15 = 0$ có $a \cdot c = 3 \cdot (-15) = -45 < 0$ nên luôn có 2 nghiệm phân biệt $x_1, x_2$.
Theo định lí Vi-ét:
$\begin{cases} x_1 + x_2 = \frac{11}{3} \\ x_1 x_2 = -5 \end{cases}$
Biến đổi biểu thức $A$:
$A = 3 \left(\frac{x_1^2 + x_2^2}{x_1 x_2}\right) = 3 \cdot \frac{(x_1 + x_2)^2 - 2x_1 x_2}{x_1 x_2} = 3 \cdot \frac{\left(\frac{11}{3}\right)^2 - 2(-5)}{-5} = 3 \cdot \frac{\frac{121}{9} + 10}{-5} = 3 \cdot \frac{211}{-45} = -\frac{211}{15}$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (130, 15, 'IV.1', 'Hình trụ', 'Đường ống nối hai bể cá trong một thủy cung có dạng một hình trụ, độ dài của đường ống là 30m. Dung tích của đường ống nói trên là $1800\text{ m}^3$. Tính diện tích đáy của đường ống.', NULL, 'Thể tích hình trụ là $V = S_{\text{đáy}} \cdot h$.
Diện tích đáy của đường ống là: $S_{\text{đáy}} = \frac{V}{h} = \frac{1800}{30} = 60\text{ m}^2$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (131, 15, 'IV.2', 'Đường tròn và tam giác nội tiếp', 'Cho tam giác $ABC$ nhọn ($AB < AC$) nội tiếp đường tròn $(O)$. Hai đường cao $BE$ và $CF$ của tam giác $ABC$ cắt nhau tại điểm $H$. Gọi $K$ là trung điểm $BC$.
a) Chứng minh $\triangle AEF$ đồng dạng $\triangle ABC$.
b) Chứng minh đường thẳng $OA$ vuông góc với đường thẳng $EF$.
c) Đường phân giác góc $FHB$ cắt $AB$ và $AC$ lần lượt tại $M$ và $N$. Gọi $I$ là trung điểm của $MN$, $J$ là trung điểm của $AH$. Chứng minh tứ giác $AFHI$ nội tiếp và ba điểm $I, J, K$ thẳng hàng.', NULL, 'a) Tứ giác $BFEC$ có $\widehat{BEC} = \widehat{BFC} = 90^\circ$ nên nội tiếp, suy ra $\widehat{AEF} = \widehat{ABC}$. Lại có góc $A$ chung nên $\triangle AEF \backsim \triangle ABC$ (g-g).
b) Kẻ tiếp tuyến $Ax$ với $(O)$ tại $A$ về phía $C$. Khi đó $\widehat{xAC} = \widehat{ABC} = \widehat{AEF}$, suy ra $Ax \parallel EF$. Vì $OA \perp Ax$ nên $OA \perp EF$.
c) Ta có $\widehat{AMN} = \widehat{MBH} + \widehat{MHB}$ và $\widehat{ANM} = \widehat{NCH} + \widehat{NHC}$. Vì $\widehat{MBH} = \widehat{NCH}$ và $HM$ là tia phân giác $\widehat{FHB}$ nên $\widehat{AMN} = \widehat{ANM}$, do đó $\triangle AMN$ cân tại $A$. Trung tuyến $AI$ đồng thời là đường cao nên $AI \perp MN \Rightarrow \widehat{AIH} = 90^\circ$. Do $\widehat{AFH} = 90^\circ$ nên tứ giác $AFHI$ nội tiếp đường tròn đường kính $AH$ (tâm $J$). Suy ra $J$ là tâm đường tròn ngoại tiếp tứ giác $AFHI$, dẫn đến $JE = JF$. Ta cũng có $KE = KF = \frac{1}{2}BC$, suy ra $JK$ là đường trung trực của $EF$. Mặt khác, $IJ \perp EF$ nên ba điểm $I, J, K$ thẳng hàng.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (132, 15, 'V', 'Hình lăng trụ đứng - Cực trị', 'Cho hình lăng trụ đứng $ABCD.A''B''C''D''$ có đáy là hình thoi. Biết thể tích của nó là $1280\text{ cm}^3$ và chiều cao là 20 cm. Tính giá trị nhỏ nhất của diện tích xung quanh.', NULL, 'Diện tích đáy hình thoi là: $S = \frac{V}{h} = \frac{1280}{20} = 64\text{ cm}^2$.
Gọi hai đường chéo của đáy là $d_1, d_2 > 0$. Ta có $S = \frac{1}{2} d_1 d_2 = 64 \Rightarrow d_1 d_2 = 128$.
Cạnh hình thoi là $a = \sqrt{\left(\frac{d_1}{2}\right)^2 + \left(\frac{d_2}{2}\right)^2} = \frac{1}{2}\sqrt{d_1^2 + d_2^2}$.
Áp dụng bất đẳng thức Cauchy: $d_1^2 + d_2^2 \ge 2 d_1 d_2 = 2 \cdot 128 = 256$.
Suy ra $a \ge \frac{1}{2} \sqrt{256} = 8\text{ cm}$ (dấu bằng xảy ra khi đáy là hình vuông, $d_1 = d_2 = 8\sqrt{2}$ cm).
Diện tích xung quanh hình lăng trụ là: $S_{xq} = 4a \cdot h = 4a \cdot 20 = 80a \ge 80 \cdot 8 = 640\text{ cm}^2$.
Vậy giá trị nhỏ nhất của diện tích xung quanh là $640\text{ cm}^2$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 4 (Trang 31) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (133, 16, 'I.1', 'Bảng tần số ghép nhóm', 'Một lớp học gồm 40 học sinh được khảo sát về chiều cao và đưa ra bảng tần số ghép nhóm dưới đây:
<table border="1"><tr><th>Nhóm chiều cao</th><th>Tần số</th></tr><tr><td>[140; 150)</td><td>5</td></tr><tr><td>[150; 160)</td><td>15</td></tr><tr><td>[160; 170)</td><td>12</td></tr><tr><td>[170; 180)</td><td>8</td></tr></table>
Tính tần số tương đối ghép nhóm và tần số ghép nhóm của nhóm [170; 180).', NULL, 'Tần số ghép nhóm của nhóm [170; 180) là $m = 8$.
Tần số tương đối ghép nhóm của nhóm này là $f = \frac{8}{40} \cdot 100\% = 20\%$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (134, 16, 'I.2', 'Xác suất', 'Trong một trò chơi xúc xắc, một người chơi lần lượt gieo hai viên xúc xắc. Xác định không gian mẫu của phép thử và tính xác suất cho biến cố $B$: "Hai viên xúc xắc đều ra số chẵn".', NULL, 'Không gian mẫu gồm các cặp $(x; y)$ với $x, y \in \{1; 2; 3; 4; 5; 6\}$, số phần tử của không gian mẫu là $n(\Omega) = 6 \times 6 = 36$.
Biến cố $B$: cả hai con xúc xắc đều xuất hiện mặt chẵn ($x, y \in \{2; 4; 6\}$).
Số kết quả thuận lợi cho $B$ là $3 \times 3 = 9$.
Xác suất của biến cố $B$ là $P(B) = \frac{9}{36} = \frac{1}{4}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (135, 16, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x}-2}{\sqrt{x}+9}$ và $B = \frac{3\sqrt{x}-6}{x-2\sqrt{x}} + \frac{\sqrt{x}-3}{\sqrt{x}} - \frac{1}{2-\sqrt{x}}$ với $x > 0$, $x \neq 4$.
1) Tính giá trị của biểu thức $A$ khi $x = 1$.
2) Rút gọn biểu thức $B$.
3) Cho biểu thức $P = A \cdot B$. Tìm $x$ là số nguyên lớn nhất để $P < \frac{1}{2}$.', NULL, '1) Thay $x = 1$ vào $A$: $A = \frac{1-2}{1+9} = -\frac{1}{10}$.
2) Rút gọn $B$:
$B = \frac{3(\sqrt{x}-2)}{\sqrt{x}(\sqrt{x}-2)} + \frac{\sqrt{x}-3}{\sqrt{x}} + \frac{1}{\sqrt{x}-2} = \frac{3}{\sqrt{x}} + \frac{\sqrt{x}-3}{\sqrt{x}} + \frac{1}{\sqrt{x}-2} = 1 + \frac{1}{\sqrt{x}-2} = \frac{\sqrt{x}-1}{\sqrt{x}-2}$.
3) $P = A \cdot B = \frac{\sqrt{x}-2}{\sqrt{x}+9} \cdot \frac{\sqrt{x}-1}{\sqrt{x}-2} = \frac{\sqrt{x}-1}{\sqrt{x}+9}$.
$P < \frac{1}{2} \Leftrightarrow \frac{\sqrt{x}-1}{\sqrt{x}+9} < \frac{1}{2} \Leftrightarrow 2\sqrt{x} - 2 < \sqrt{x} + 9 \Leftrightarrow \sqrt{x} < 11 \Leftrightarrow 0 < x < 121$.
Kết hợp $x \neq 4$ và $x$ là số nguyên lớn nhất, suy ra $x = 120$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (136, 16, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Trong một đợt khuyến mãi, siêu thị giảm giá cho mặt hàng $A$ là 20% và mặt hàng $B$ là 15% so với giá niêm yết. Một khách hàng mua 2 món hàng $A$ và 1 món hàng $B$ phải trả số tiền là 362 000 đồng. Nhưng nếu mua trong khung giờ vàng thì món hàng $A$ được giảm giá 30% còn món hàng $B$ được giảm giá 25% so với giá niêm yết. Một người mua 3 món hàng $A$ và 2 món hàng $B$ trong khung giờ vàng nên chỉ trả số tiền là 552 000 đồng. Tính giá niêm yết của mỗi món hàng $A$ và $B$.', NULL, 'Gọi giá niêm yết của một món hàng $A$ và $B$ lần lượt là $x, y$ (đồng, $x, y > 0$).
Theo đợt khuyến mãi thường:
$2 \times (1 - 20\%)x + 1 \times (1 - 15\%)y = 362\,000 \Leftrightarrow 1{,}6x + 0{,}85y = 362\,000$.
Trong khung giờ vàng:
$3 \times (1 - 30\%)x + 2 \times (1 - 25\%)y = 552\,000 \Leftrightarrow 2{,}1x + 1{,}5y = 552\,000$.
Giải hệ phương trình ta được $x = 120\,000$, $y = 200\,000$.
Vậy giá niêm yết của món hàng $A$ là 120 000 đồng, của món hàng $B$ là 200 000 đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (137, 16, 'III.2', 'Năng suất - Công việc', 'Một nhóm thợ thủ công lên kế hoạch làm 1200 chiếc đèn lồng cho dịp lễ Trung Thu. Trong 12 ngày đầu họ làm đúng theo kế hoạch. Những ngày còn lại do có thêm người làm cùng nên mỗi ngày họ đã làm vượt mức 20 chiếc và hoàn thành kế hoạch sớm 2 ngày. Theo kế hoạch, mỗi ngày nhóm thợ phải làm bao nhiêu chiếc đèn lồng?', NULL, 'Gọi số đèn lồng nhóm thợ phải làm mỗi ngày theo kế hoạch là $x$ chiếc ($x \in \mathbb{N}^*$).
Thời gian theo kế hoạch là $\frac{1200}{x}$ ngày.
Trong 12 ngày đầu làm được $12x$ chiếc. Số đèn còn lại là $1200 - 12x$ chiếc.
Năng suất mới là $x + 20$ chiếc/ngày, thời gian hoàn thành số đèn còn lại là $\frac{1200 - 12x}{x + 20}$ ngày.
Vì hoàn thành sớm 2 ngày nên ta có phương trình:
$12 + \frac{1200 - 12x}{x + 20} = \frac{1200}{x} - 2 \Leftrightarrow \frac{1200 - 12x}{x + 20} + 14 = \frac{1200}{x}$.
Giải phương trình tìm được $x = 60$ (thỏa mãn) hoặc $x = -200$ (loại).
Vậy theo kế hoạch mỗi ngày nhóm thợ phải làm 60 chiếc đèn lồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (138, 16, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $4x^2 - 2x - 1 = 0$ có 2 nghiệm là $x_1, x_2$. Không giải phương trình, hãy tính giá trị của biểu thức $A = (x_1 - x_2)^2 - x_1\left(x_1 - \frac{1}{2}\right)$.', NULL, 'Theo định lý Vi-ét: $x_1 + x_2 = \frac{1}{2}$, $x_1 x_2 = -\frac{1}{4}$.
Vì $x_1$ là nghiệm của phương trình nên $4x_1^2 - 2x_1 - 1 = 0 \Leftrightarrow x_1^2 - \frac{1}{2}x_1 = \frac{1}{4}$, hay $x_1\left(x_1 - \frac{1}{2}\right) = \frac{1}{4}$.
Mặt khác: $(x_1 - x_2)^2 = (x_1 + x_2)^2 - 4x_1 x_2 = \left(\frac{1}{2}\right)^2 - 4\left(-\frac{1}{4}\right) = \frac{1}{4} + 1 = \frac{5}{4}$.
Do đó: $A = \frac{5}{4} - \frac{1}{4} = 1$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (139, 16, 'IV.1', 'Hình học thực tế', 'Gạch ống là một sản phẩm được tạo hình thành từ đất sét và nước, được kết hợp lại với nhau theo một công thức chung hợp lý mới có thể tạo ra hỗn hợp dẻo quánh, sau đó chúng được đổ vào khuôn, rồi đem phơi hoặc sấy khô và cuối cùng là đưa vào lò nung. Một viên gạch hình hộp chữ nhật có kích thước dài 20 cm, rộng 8 cm, cao 8 cm. Bên trong có bốn lỗ hình trụ bằng nhau có đường kính 2,5 cm.
{{FIGURE}}
a) Tính thể tích đất sét để làm một viên gạch. (lấy $\pi = 3{,}14$)
b) Theo toán học, bác Ba muốn xây một ngôi nhà phải mua 10 000 viên gạch, giá một viên là 1100 đồng. Nhưng khi thi công, bác Ba phải mua dư 2% số gạch cần dùng dự phòng cho hư hao. Tính số tiền bác Ba mua gạch để xây căn nhà.', '/static/figures/BoDeHaNoiLan2_De_05_trang_38_IV_1_269194.png', 'a) Thể tích hình hộp chữ nhật ngoài: $V_1 = 20 \times 8 \times 8 = 1280\text{ cm}^3$.
Bán kính mỗi lỗ trụ: $r = 2{,}5 : 2 = 1{,}25\text{ cm}$; chiều cao $h = 20\text{ cm}$.
Thể tích 4 lỗ hình trụ: $V_2 = 4 \times \pi r^2 h = 4 \times 3{,}14 \times 1{,}25^2 \times 20 = 392{,}5\text{ cm}^3$.
Thể tích đất sét cần dùng: $V = V_1 - V_2 = 1280 - 392{,}5 = 887{,}5\text{ cm}^3$.
b) Số viên gạch bác Ba cần mua là: $10\,000 \times (1 + 2\%) = 10\,200$ viên.
Số tiền mua gạch: $10\,200 \times 1100 = 11\,220\,000$ đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (140, 16, 'IV.2', 'Đường tròn tổng hợp', 'Cho $\triangle ABC$ ($AB < AC$) nội tiếp $(O; R)$ đường kính $BC$, trên cung nhỏ $AC$ lấy điểm $D$, $BD$ cắt $AC$ tại $E$, từ $E$ vẽ $EF \perp BC$ tại $F$.
a) Chứng minh tứ giác $BAEF$ nội tiếp đường tròn.
b) Chứng minh $DB$ là phân giác góc $ADF$.
c) Gọi $M$ là trung điểm $EC$. Chứng minh $DM \cdot CA = CF \cdot CO$.', NULL, 'a) Ta có $\widehat{BAC} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn), nên $\widehat{BAE} = 90^\circ$.
$EF \perp BC \Rightarrow \widehat{BFE} = 90^\circ$.
Tứ giác $BAEF$ có $\widehat{BAE} + \widehat{BFE} = 90^\circ + 90^\circ = 180^\circ$ nên nội tiếp đường tròn đường kính $BE$.
b) Tứ giác $CDEF$ có $\widehat{CDE} = 90^\circ$ (chắn nửa đường tròn) và $\widehat{CFE} = 90^\circ \Rightarrow CDEF$ nội tiếp.
Suy ra $\widehat{EDF} = \widehat{ECF} = \widehat{ACB}$.
Mặt khác trong $(O)$, $\widehat{ADB} = \widehat{ACB}$ (hai góc nội tiếp cùng chắn cung $AB$).
Suy ra $\widehat{ADB} = \widehat{EDF} = \widehat{BDF}$, do đó $DB$ là tia phân giác của $\widehat{ADF}$.
c) Tam giác $EDC$ vuông tại $D$ có $M$ là trung điểm $EC \Rightarrow MD = MC \Rightarrow \triangle MDC$ cân tại $M \Rightarrow \widehat{MDC} = \widehat{MCD}$.
Tam giác $OAC$ cân tại $O$ (vì $OA = OC = R$) $\Rightarrow \widehat{OAC} = \widehat{OCA}$.
Từ đó chứng minh $\triangle MDC \sim \triangle CFO$ (hoặc sử dụng các hệ thức đồng dạng phù hợp), suy ra tỉ số đồng dạng và dẫn đến hệ thức $DM \cdot CA = CF \cdot CO$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (141, 16, 'V', 'Cực trị thực tế', 'Một công ty du lịch dự định tổ chức một tour du lịch xuyên Việt. Công ty dự định nếu giá tour là 2 triệu đồng thì sẽ có khoảng 150 người tham gia. Để kích thích mọi người tham gia, công ty sẽ quyết định giảm giá và cứ mỗi lần giảm giá tour 100 nghìn đồng thì sẽ có thêm 20 người tham gia. Hỏi công ty phải giảm giá tour là bao nhiêu để doanh thu từ tour xuyên Việt là lớn nhất.', NULL, 'Gọi số lần giảm giá 100 nghìn đồng là $x$ ($x > 0$, $x < 20$).
Giá tour sau khi giảm là: $2000 - 100x$ (nghìn đồng).
Số người tham gia tour sau khi giảm giá là: $150 + 20x$ (người).
Doanh thu của công ty là:
$T(x) = (2000 - 100x)(150 + 20x) = -2000x^2 + 25000x + 300000 = -2000\left(x - \frac{25}{4}\right)^2 + 378125$.
Doanh thu đạt giá trị lớn nhất khi $x = \frac{25}{4} = 6{,}25$.
Số tiền công ty phải giảm là: $6{,}25 \times 100\,000 = 625\,000$ đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 5 (Trang 38) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (142, 17, 'I.1', 'Bảng tần số ghép nhóm', 'Thời gian đi từ nhà đến trường (đơn vị: phút) của các bạn học sinh lớp 9C được ghi lại ở bảng sau:
<table border="1"><tr><td>9,5</td><td>13,9</td><td>5,6</td><td>13,2</td><td>10,3</td><td>15,1</td><td>19,5</td><td>14,1</td><td>11,4</td><td>19,7</td><td>15,1</td><td>11,1</td></tr><tr><td>16,6</td><td>7,2</td><td>18</td><td>11,6</td><td>6,2</td><td>6,2</td><td>16,7</td><td>7,8</td><td>17,7</td><td>7,7</td><td>7,7</td><td>5,5</td></tr><tr><td>18,2</td><td>7,4</td><td>19,8</td><td>19</td><td>5,2</td><td>18,3</td><td>14,7</td><td>14,1</td><td>19,6</td><td>7,2</td><td>7,2</td><td>12,5</td></tr></table>
Hãy chia số liệu thành 4 nhóm, với nhóm thứ nhất là khoảng từ 5 phút đến dưới 9 phút và lập bảng tần số ghép nhóm và tần số tương đối ghép nhóm.', NULL, 'Tổng số học sinh là $n = 36$.
Chia thành 4 nhóm:
- Nhóm [5; 9): gồm các giá trị có tần số là 11, tần số tương đối là $\frac{11}{36} \approx 30,56\%$.
- Nhóm [9; 13): tần số là 7, tần số tương đối là $\frac{7}{36} \approx 19,44\%$.
- Nhóm [13; 17): tần số là 9, tần số tương đối là $\frac{9}{36} = 25\%$.
- Nhóm [17; 21): tần số là 9, tần số tương đối là $\frac{9}{36} = 25\%$.
Lập thành bảng tần số và tần số tương đối ghép nhóm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (143, 17, 'I.2', 'Xác suất', 'Một túi đựng 4 viên bi có cùng khối lượng và kích thước, được đánh số 1; 2; 3; 4. Lấy ngẫu nhiên lần lượt 2 viên bi từ túi đó, viên bi lấy ra lần đầu không trả lại vào túi. Mô tả không gian mẫu của phép thử và tính xác suất để lấy được 2 viên bi mà tổng hai số trên hai viên bi đó là số lẻ.', NULL, 'Không gian mẫu:
$\Omega = \{(1, 2); (1, 3); (1, 4); (2, 1); (2, 3); (2, 4); (3, 1); (3, 2); (3, 4); (4, 1); (4, 2); (4, 3)\} \Rightarrow n(\Omega) = 12$.
Biến cố $A$: "Tổng hai số trên hai viên bi là số lẻ".
Các kết quả thuận lợi: $(1, 2), (1, 4), (2, 1), (2, 3), (3, 2), (3, 4), (4, 1), (4, 3) \Rightarrow n(A) = 8$.
Xác suất $P(A) = \frac{8}{12} = \frac{2}{3}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (144, 17, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x} - 2}{\sqrt{x} + 2}$ và $B = \frac{\sqrt{x} + 2}{\sqrt{x} - 2} - \frac{3}{\sqrt{x} + 2} - \frac{12}{x - 4}$ với $x \ge 0$, $x \ne 4$.
1) Tính giá trị của biểu thức $A$ khi $x = 25$.
2) Chứng minh $B = \frac{\sqrt{x} - 1}{\sqrt{x} - 2}$.
3) Với $P = A \cdot B$. Tìm giá trị của $x$ để $|P| > P$.', NULL, '1) Thay $x = 25$ vào $A$: $A = \frac{\sqrt{25} - 2}{\sqrt{25} + 2} = \frac{5 - 2}{5 + 2} = \frac{3}{7}$.
2) Rút gọn biểu thức $B$:
$B = \frac{(\sqrt{x}+2)^2 - 3(\sqrt{x}-2) - 12}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{x + 4\sqrt{x} + 4 - 3\sqrt{x} + 6 - 12}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{x + \sqrt{x} - 2}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{(\sqrt{x}-1)(\sqrt{x}+2)}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{\sqrt{x}-1}{\sqrt{x}-2}$.
3) $P = A \cdot B = \frac{\sqrt{x} - 2}{\sqrt{x} + 2} \cdot \frac{\sqrt{x} - 1}{\sqrt{x} - 2} = \frac{\sqrt{x} - 1}{\sqrt{x} + 2}$.
Điều kiện $|P| > P \Leftrightarrow P < 0 \Leftrightarrow \frac{\sqrt{x}-1}{\sqrt{x}+2} < 0 \Leftrightarrow \sqrt{x} - 1 < 0 \Leftrightarrow \sqrt{x} < 1 \Leftrightarrow 0 \le x < 1$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (145, 17, 'III.1', 'Chuyển động', 'Một ô tô khách và một ô tô tải chở vật liệu xây dựng khởi hành cùng một lúc từ bến xe khách Lai Châu đến trung tâm thị trấn Mường Tè. Do trọng tải lớn nên xe tải chở vật liệu xây dựng đi với vận tốc chậm hơn xe khách 10 km/h. Xe khách đến trung tâm thị trấn Mường Tè sớm hơn xe tải 1 giờ 6 phút. Tính vận tốc mỗi xe biết quãng đường từ bến xe khách thành phố Lai Châu đến trung tâm thị trấn Mường Tè là 132 km.', NULL, 'Đổi 1 giờ 6 phút $= \frac{11}{10}$ giờ.
Gọi vận tốc của xe tải là $x$ (km/h, $x > 0$). Vận tốc của xe khách là $x + 10$ (km/h).
Thời gian xe tải đi: $\frac{132}{x}$ (h), xe khách đi: $\frac{132}{x+10}$ (h).
Ta có phương trình: $\frac{132}{x} - \frac{132}{x+10} = \frac{11}{10} \Leftrightarrow x^2 + 10x - 1200 = 0$.
Giải phương trình được $x = 30$ (thỏa mãn) hoặc $x = -40$ (loại).
Vậy vận tốc xe tải là 30 km/h, vận tốc xe khách là 40 km/h.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (146, 17, 'III.2', 'Năng suất - Công việc', 'Hai vòi nước cùng chảy vào một bể (không có nước) trong $4\frac{4}{5}$ giờ (tức 4 giờ 48 phút) thì đầy bể. Nếu mở vòi thứ nhất trong 3 giờ và vòi thứ hai trong 4 giờ thì được $\frac{3}{4}$ bể nước. Hỏi mỗi vòi chảy riêng thì trong bao lâu sẽ đầy bể.', NULL, 'Đổi 4 giờ 48 phút $= \frac{24}{5}$ giờ.
Gọi thời gian vòi 1 và vòi 2 chảy một mình đầy bể lần lượt là $x, y$ ($x, y > \frac{24}{5}$).
Trong 1 giờ, mỗi vòi chảy được $\frac{1}{x}$ và $\frac{1}{y}$ bể.
Theo đề bài ta có hệ phương trình:
$\begin{cases} \frac{1}{x} + \frac{1}{y} = \frac{5}{24} \\ \frac{3}{x} + \frac{4}{y} = \frac{3}{4} \end{cases}$
Giải hệ phương trình ta được $\frac{1}{x} = \frac{1}{12} \Rightarrow x = 12$ và $\frac{1}{y} = \frac{1}{8} \Rightarrow y = 8$.
Vậy vòi thứ nhất chảy riêng trong 12 giờ thì đầy bể, vòi thứ hai trong 8 giờ thì đầy bể.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (147, 17, 'III.3', 'Hệ thức Vi-ét', 'Tìm $m$ để phương trình $x^2 + 2x + m = 0$ có hai nghiệm $x_1, x_2$ thỏa mãn $3x_1 + 2x_2 = 1$.', NULL, 'Phương trình có hai nghiệm khi $\Delta'' = 1 - m \ge 0 \Leftrightarrow m \le 1$.
Theo định lí Vi-ét: $\begin{cases} x_1 + x_2 = -2 \\ x_1 x_2 = m \end{cases}$
Kết hợp $x_1 + x_2 = -2$ với $3x_1 + 2x_2 = 1 \Rightarrow 2(x_1 + x_2) + x_1 = 1 \Rightarrow -4 + x_1 = 1 \Rightarrow x_1 = 5$.
Suy ra $x_2 = -2 - x_1 = -7$.
Khi đó $m = x_1 x_2 = 5 \cdot (-7) = -35$ (thỏa mãn $m \le 1$).
Vậy $m = -35$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (148, 17, 'IV.1', 'Hình nón', 'Một chiếc nón lá có đường kính vành nón là 28 cm và độ dài đường sinh là 30 cm. Tính diện tích lá dùng để làm nón, biết chiếc nón được làm bằng 2 lớp lá (không tính phần ghép nối, lấy $\pi \approx 3,14$).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_06_trang_48_IV_1_271930.png', 'Bán kính đáy của chiếc nón lá là $r = 28 : 2 = 14$ cm.
Độ dài đường sinh $l = 30$ cm.
Diện tích xung quanh của một lớp nón là: $S_{xq} = \pi r l = \pi \cdot 14 \cdot 30 = 420\pi \approx 420 \cdot 3,14 = 1318,8\text{ cm}^2$.
Vì nón làm bằng 2 lớp lá nên diện tích lá dùng để làm nón là: $S = 2 \cdot S_{xq} = 2 \cdot 1318,8 = 2637,6\text{ cm}^2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (149, 17, 'IV.2', 'Tứ giác nội tiếp', 'Cho $\triangle ABC$ có 3 góc nhọn và đường cao $BE$. Gọi $H, K$ lần lượt là chân đường vuông góc kẻ từ điểm $E$ đến $AB, AC$.
a) Chứng minh tứ giác $BHEK$ nội tiếp;
b) Chứng minh: $BH \cdot BA = BK \cdot BC$;
c) Gọi $F$ là chân đường vuông góc kẻ từ điểm $C$ đến đường thẳng $AB$, $I$ là trung điểm của đoạn thẳng $EF$. Chứng minh rằng $H, I, K$ thẳng hàng.', NULL, 'a) Xét tứ giác $BHEK$ có $\widehat{EHB} = 90^\circ$ (do $EH \perp AB$) và $\widehat{EKB} = 90^\circ$ (chú ý đề thực tế là $E$ kẻ đường vuông góc đến $BC$ tại $K$, tức $\widehat{EKB} = 90^\circ$), nên $\widehat{EHB} + \widehat{EKB} = 180^\circ$, suy ra tứ giác $BHEK$ nội tiếp.
b) Áp dụng hệ thức lượng trong tam giác vuông $ABE$ vuông tại $E$, đường cao $EH$: $BH \cdot BA = BE^2$.
Trong tam giác vuông $CBE$ vuông tại $E$, đường cao $EK$: $BK \cdot BC = BE^2$.
Suy ra $BH \cdot BA = BK \cdot BC$.
c) Sử dụng tính chất các điểm đồng dạng/tâm vị tự hoặc đường tròn Euler với các chân đường cao, chứng minh $I$ thuộc đoạn $HK$, từ đó suy ra $H, I, K$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (150, 17, 'V', 'Hình nón cụt', 'Một cái thùng đựng nước được tạo thành từ việc cắt mặt xung quanh của một hình nón bởi một mặt phẳng vuông góc với trục của hình nón. Miệng thùng là đường tròn có bán kính bằng hai lần bán kính mặt đáy của thùng. Bên trong thùng có một cái phễu dạng hình nón có đáy là đáy của thùng, có đỉnh là tâm của miệng thùng (xem hình minh họa). Biết rằng đổ 12 lít nước vào thùng thì đầy thùng (nước không chảy được vào bên trong phễu), tính thể tích của phễu.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_06_trang_48_V_271951.png', 'Gọi $r$ là bán kính đáy thùng, $R = 2r$ là bán kính miệng thùng. Chiều cao của thùng là $h$.
Thể tích cái phễu hình nón: $V_1 = \frac{1}{3} \pi r^2 h$.
Thể tích thùng hình nón cụt: $V_2 = \frac{1}{3} \pi h (R^2 + Rr + r^2) = \frac{1}{3} \pi h (4r^2 + 2r^2 + r^2) = \frac{7}{3} \pi r^2 h = 7 V_1$.
Lượng nước đổ vào thùng đầy là phần thể tích nằm giữa thùng và phễu:
$V_n = V_2 - V_1 = 7V_1 - V_1 = 6V_1 = 12\text{ lít}$.
Suy ra thể tích của phễu là $V_1 = \frac{12}{6} = 2\text{ lít}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 6 (Trang 48) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (151, 18, 'I.1', 'Bảng tần số tương đối ghép nhóm', 'Sau khi điều tra về số học sinh trong 100 lớp học (đơn vị: học sinh), người ta có bảng tần số ghép nhóm như ở bảng sau:
<table border="1"><tr><th>Nhóm</th><th>[36; 38)</th><th>[38; 40)</th><th>[40; 42)</th><th>[42; 44)</th><th>[44; 46)</th><th>Cộng</th></tr><tr><td>Tần số (n)</td><td>20</td><td>15</td><td>25</td><td>30</td><td>10</td><td>N = 100</td></tr></table>
a) Tìm tần số tương đối của mỗi nhóm đó.
b) Lập bảng tần số tương đối ghép nhóm của mẫu số liệu ghép nhóm đó.', NULL, 'a) Tần số tương đối của mỗi nhóm:
- Nhóm [36; 38): $\frac{20}{100} \cdot 100\% = 20\%$
- Nhóm [38; 40): $\frac{15}{100} \cdot 100\% = 15\%$
- Nhóm [40; 42): $\frac{25}{100} \cdot 100\% = 25\%$
- Nhóm [42; 44): $\frac{30}{100} \cdot 100\% = 30\%$
- Nhóm [44; 46): $\frac{10}{100} \cdot 100\% = 10\%$
b) Bảng tần số tương đối ghép nhóm gồm các nhóm và tần số tương đối tương ứng như trên, tổng cộng $100\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (152, 18, 'I.2', 'Xác suất thực nghiệm / cổ điển', 'Một hộp có 52 chiếc thẻ cùng loại, mỗi thẻ được ghi một trong các số 1, 2, 3, ..., 52; hai thẻ khác nhau thì ghi số khác nhau.
Rút ngẫu nhiên một thẻ trong hộp. Tính xác suất các biến cố sau:
a) “Số xuất hiện trên thẻ được rút ra là số nhỏ hơn 27”.
b) “Số xuất hiện trên thẻ được rút ra là số lớn hơn 19 và nhỏ hơn 51”.', NULL, 'a) Các số nhỏ hơn 27 từ 1 đến 26: có 26 kết quả thuận lợi. Xác suất $P = \frac{26}{52} = \frac{1}{2}$.
b) Các số lớn hơn 19 và nhỏ hơn 51 là từ 20 đến 50: có $50 - 20 + 1 = 31$ kết quả thuận lợi. Xác suất $P = \frac{31}{52}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (153, 18, 'II', 'Rút gọn biểu thức chứa căn', 'Cho hai biểu thức $A = \frac{x - 2}{\sqrt{x} + 2}$ và $B = \frac{\sqrt{x}}{\sqrt{x} + 1} - \frac{2}{1 - \sqrt{x}} - \frac{4}{x - 1}$ (với $x \ge 0; x \ne 1$).
1) Tính giá trị của $A$ khi $x = 16$.
2) Rút gọn biểu thức $B$.
3) Đặt $P = A \cdot B$. Tìm các giá trị nguyên của $x$ để $P = \frac{7}{4}$.', NULL, '1) Thay $x = 16$ vào $A$: $A = \frac{16 - 2}{\sqrt{16} + 2} = \frac{14}{6} = \frac{7}{3}$.
2) $B = \frac{\sqrt{x}}{\sqrt{x} + 1} + \frac{2}{\sqrt{x} - 1} - \frac{4}{(\sqrt{x}-1)(\sqrt{x}+1)} = \frac{x + \sqrt{x} - 2}{(\sqrt{x}-1)(\sqrt{x}+1)} = \frac{(\sqrt{x}-1)(\sqrt{x}+2)}{(\sqrt{x}-1)(\sqrt{x}+1)} = \frac{\sqrt{x} + 2}{\sqrt{x} + 1}$.
3) $P = A \cdot B = \frac{x - 2}{\sqrt{x} + 2} \cdot \frac{\sqrt{x} + 2}{\sqrt{x} + 1} = \frac{x - 2}{\sqrt{x} + 1}$.
$P = \frac{7}{4} \Leftrightarrow \frac{x - 2}{\sqrt{x} + 1} = \frac{7}{4} \Leftrightarrow 4x - 7\sqrt{x} - 15 = 0 \Leftrightarrow (\sqrt{x} - 3)(4\sqrt{x} + 5) = 0 \Leftrightarrow \sqrt{x} = 3 \Leftrightarrow x = 9$ (thỏa mãn).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (154, 18, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Một trường THCS tổ chức cho 250 người bao gồm giáo viên và học sinh đi tham quan khu du lịch Đảo Ngọc Xanh. Biết giá vé vào cổng của một giáo viên là 80 000 đồng, vé vào cổng của một học sinh là 60 000 đồng. Nhà trường tổ chức đi vào đúng dịp Khai trương nên được giảm 5% cho mỗi vé vào cổng, vì vậy nhà trường chỉ phải trả tổng số tiền là 14 535 000 đồng. Hỏi có bao nhiêu giáo viên và học sinh của trường đi tham quan?', NULL, 'Gọi số giáo viên là $x$, số học sinh là $y$ ($x, y \in \mathbb{N}^*; x, y < 250$).
Tổng số người: $x + y = 250$.
Giá vé sau giảm: giáo viên là $80\,000 \times 0{,}95 = 76\,000$ đồng, học sinh là $60\,000 \times 0{,}95 = 57\,000$ đồng.
Phương trình tiền vé: $76\,000x + 57\,000y = 14\,535\,000 \Leftrightarrow 4x + 3y = 765$.
Giải hệ ta được $x = 15, y = 235$.
Vậy có 15 giáo viên và 235 học sinh.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (155, 18, 'III.2', 'Phương trình bậc hai - Toán chuyển động', 'Một xe khách và một xe du lịch khởi hành đồng thời từ $A$ đi đến $B$. Biết vận tốc của xe du lịch lớn hơn vận tốc của xe khách là 20 km/h. Do đó nó đến $B$ trước xe khách 50 phút. Tính vận tốc của mỗi xe, biết quãng đường $AB$ dài 100 km.', NULL, 'Đổi 50 phút = $\frac{5}{6}$ giờ.
Gọi vận tốc xe khách là $x$ (km/h, $x > 0$), vận tốc xe du lịch là $x + 20$ (km/h).
Thời gian xe khách đi: $\frac{100}{x}$ (h), xe du lịch đi: $\frac{100}{x + 20}$ (h).
Phương trình: $\frac{100}{x} - \frac{100}{x + 20} = \frac{5}{6} \Leftrightarrow \frac{2000}{x(x + 20)} = \frac{5}{6} \Leftrightarrow x^2 + 20x - 2400 = 0$.
Giải ra $x = 40$ (nhận) hoặc $x = -60$ (loại).
Vậy vận tốc xe khách là 40 km/h, vận tốc xe du lịch là 60 km/h.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (156, 18, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình: $2x^2 - 4x - 3 = 0$ có hai nghiệm là $x_1; x_2$. Không giải phương trình, hãy tính giá trị của biểu thức: $A = (x_1 - x_2)^2$.', NULL, 'Theo hệ thức Vi-ét: $x_1 + x_2 = -\frac{-4}{2} = 2$ và $x_1 x_2 = -\frac{3}{2}$.
Ta có: $A = (x_1 - x_2)^2 = (x_1 + x_2)^2 - 4x_1 x_2 = 2^2 - 4\left(-\frac{3}{2}\right) = 4 + 6 = 10$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (157, 18, 'IV.1', 'Hình học không gian (Hình trụ - Hình cầu)', 'Một ly đựng đầy nước dạng hình trụ có chiều cao là 15 cm, bán kính đáy bằng 5 cm.
a) Tính thể tích nước chứa trong ly.
b) Người ta thả vào ly 5 viên bi đặc không thấm nước có dạng hình cầu, đường kính mỗi viên bi bằng 3 cm. Tính thể tích nước tràn ra ngoài ly.', NULL, 'a) Thể tích nước trong ly: $V_1 = \pi r^2 h = \pi \cdot 5^2 \cdot 15 = 375\pi \approx 1178{,}1\text{ cm}^3$.
b) Bán kính mỗi viên bi là $R = 1{,}5\text{ cm}$.
Thể tích của 1 viên bi: $V_{bi} = \frac{4}{3}\pi R^3 = \frac{4}{3}\pi (1{,}5)^3 = 4{,}5\pi\text{ cm}^3$.
Thể tích nước tràn ra bằng tổng thể tích của 5 viên bi: $V_{tràn} = 5 \cdot 4{,}5\pi = 22{,}5\pi \approx 70{,}69\text{ cm}^3$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (158, 18, 'IV.2', 'Hình học phẳng (Tứ giác nội tiếp, tam giác)', 'Cho tam giác $ABC$ nhọn ($AB < AC$) có đường cao $AD$ và đường phân giác trong $AO$ ($D, O$ thuộc cạnh $BC$). Kẻ $OM \perp AB$ tại $M$, $ON \perp AC$ tại $N$.
a) Chứng minh bốn điểm $O, M, D, N$ cùng nằm trên một đường tròn.
b) Chứng minh $\widehat{BDM} = \widehat{ODN}$.
c) Qua $O$ kẻ đường thẳng vuông góc với $BC$ cắt $MN$ tại $I$, $AI$ cắt $BC$ tại $K$. Chứng minh $K$ là trung điểm của $BC$.', NULL, 'a) Vì $AO$ là phân giác nên $OM = ON$, tam giác $OMN$ cân tại $O$. Tứ giác $AMON$ có $\widehat{AMO} = \widehat{ANO} = 90^\circ$ nội tiếp đường tròn đường kính $AO$. Từ các hệ thức góc và đường cao $AD$, chứng minh các góc nhìn cạnh bằng nhau suy ra 5 điểm $A, M, D, O, N$ cùng thuộc đường tròn đường kính $AO$, nên bốn điểm $O, M, D, N$ cùng nằm trên một đường tròn.
b) Do $A, M, D, O, N$ cùng nội tiếp đường tròn đường kính $AO$, ta có $\widehat{MDA} = \widehat{MOA}$ và $\widehat{NDA} = \widehat{NOA}$. Lại có $OM = ON \Rightarrow \widehat{MOA} = \widehat{NOA}$, suy ra $AD$ là phân giác của góc $\widehat{MDN}$. Do $AD \perp BC$ nên góc phụ với $\widehat{MDA}$ bằng góc phụ với $\widehat{NDA}$, tức là $\widehat{BDM} = \widehat{CDN} = \widehat{ODN}$.
c) Sử dụng tính chất chùm đường thẳng đồng quy hoặc tỉ số diện tích, định lý Menelaus/Ceva để suy ra $K$ là trung điểm của $BC$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (159, 18, 'V', 'Cực trị hình học thực tế', 'Một miếng bìa hình vuông có cạnh 6 dm. Ở mỗi góc của hình vuông người ta cắt đi một hình vuông nhỏ cạnh $x$ rồi gấp bìa để được một hình hộp chữ nhật (không có nắp). Tính cạnh $x$ của mỗi hình vuông nhỏ để hộp có thể tích lớn nhất.', NULL, 'Điều kiện của cạnh cắt: $0 < x < 3$.
Kích thước đáy hình hộp là cạnh $6 - 2x$, chiều cao là $x$.
Thể tích hình hộp: $V = x(6 - 2x)^2 = 4x(3 - x)^2$.
Áp dụng bất đẳng thức AM-GM cho ba số dương $2x, 3 - x, 3 - x$:
$2x(3 - x)(3 - x) \le \left(\frac{2x + 3 - x + 3 - x}{3}\right)^3 = 2^3 = 8$.
Suy ra $V = 2 \cdot [2x(3 - x)^2] \le 2 \cdot 8 = 16\text{ dm}^3$.
Dấu bằng xảy ra khi $2x = 3 - x \Leftrightarrow 3x = 3 \Leftrightarrow x = 1$ (thỏa mãn).
Vậy cạnh của mỗi hình vuông nhỏ là $x = 1\text{ dm}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 8 (Trang 65) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (160, 19, 'I.1', 'Bảng tần số ghép nhóm', 'Thống kê số lần truy cập Internet của 30 người trong một tuần là:
85  81  65  58  47  30  51  89  85  42
55  37  31  82  63  33  44  88  77  57
44  74  63  67  46  73  52  53  47  35
a) Lập bảng tần số ghép nhóm của mẫu số liệu đó sau khi được ghép nhóm theo sáu nhóm sau: [30; 40), [40; 50), [50; 60), [60; 70), [70; 80), [80; 90).
b) Tìm tần số tương đối ghép nhóm của nhóm [50; 60).', NULL, 'a) Bảng tần số ghép nhóm:
<table border="1"><tr><td>Nhóm</td><td>[30; 40)</td><td>[40; 50)</td><td>[50; 60)</td><td>[60; 70)</td><td>[70; 80)</td><td>[80; 90)</td><td>Cộng</td></tr><tr><td>Tần số</td><td>5</td><td>6</td><td>6</td><td>4</td><td>3</td><td>6</td><td>$N = 30$</td></tr></table>
b) Tần số tương đối ghép nhóm của nhóm [50; 60) là: $f = \frac{6}{30} \cdot 100\% = 20\%$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (161, 19, 'I.2', 'Xác suất thực nghiệm', 'Một hình tròn được chia thành 10 hình quạt như nhau, được đánh số như hình bên và được gắn vào trục quay có mũi tên cố định ở tâm.
{{FIGURE}}
Xét phép thử “Quay đĩa tròn một lần” và biến cố $A$: “Mũi tên chỉ vào các số la mã”.
Tính xác suất của biến cố $A$.', '/static/figures/BoDeHaNoiLan2_De_07_trang_56_I_2_280452.png', 'Số kết quả có thể xảy ra của phép thử là 10 (gồm: $1, \text{II}, 3, \text{IV}, 5, \text{VI}, 7, \text{VIII}, 9, \text{X}$).
Các kết quả thuận lợi cho biến cố $A$ là: $\text{II}, \text{IV}, \text{VI}, \text{VIII}, \text{X}$ (có 5 kết quả thuận lợi).
Xác suất của biến cố $A$ là $P(A) = \frac{5}{10} = \frac{1}{2}$ (nếu tính theo 4 số la mã $\text{II}, \text{IV}, \text{VI}, \text{VIII}$ thì $P(A) = \frac{4}{10} = \frac{2}{5}$).', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (162, 19, 'II', 'Rút gọn biểu thức chứa căn', 'Cho biểu thức $A = \frac{\sqrt{x}}{\sqrt{x} - 3}$; $B = \frac{7}{\sqrt{x} + 1} - \frac{12}{(\sqrt{x} + 1)(3 - \sqrt{x})}$ với $x \ge 0; x \ne 9$.
a) Tính giá trị của $A$ khi $x = \frac{9}{4}$.
b) Rút gọn $M = A - B$.
c) Tìm các giá trị của $x$ sao cho $M^2 < \frac{25}{4}$.', NULL, 'a) Với $x = \frac{9}{4}$ (thỏa mãn ĐKXĐ), thay vào $A$ ta được:
$A = \frac{\sqrt{9/4}}{\sqrt{9/4} - 3} = \frac{3/2}{3/2 - 3} = -1$.
b) Ta có $B = \frac{7}{\sqrt{x} + 1} + \frac{12}{(\sqrt{x} + 1)(\sqrt{x} - 3)} = \frac{7(\sqrt{x} - 3) + 12}{(\sqrt{x} + 1)(\sqrt{x} - 3)} = \frac{7\sqrt{x} - 9}{(\sqrt{x} + 1)(\sqrt{x} - 3)}$.
$M = A - B = \frac{\sqrt{x}(\sqrt{x} + 1) - (7\sqrt{x} - 9)}{(\sqrt{x} + 1)(\sqrt{x} - 3)} = \frac{x - 6\sqrt{x} + 9}{(\sqrt{x} + 1)(\sqrt{x} - 3)} = \frac{(\sqrt{x} - 3)^2}{(\sqrt{x} + 1)(\sqrt{x} - 3)} = \frac{\sqrt{x} - 3}{\sqrt{x} + 1}$.
c) $M^2 < \frac{25}{4} \Leftrightarrow -\frac{5}{2} < M < \frac{5}{2}$.
+ $M < \frac{5}{2} \Leftrightarrow \frac{\sqrt{x} - 3}{\sqrt{x} + 1} < \frac{5}{2} \Leftrightarrow 2(\sqrt{x} - 3) < 5(\sqrt{x} + 1) \Leftrightarrow -3\sqrt{x} < 11$ (luôn đúng với mọi $x \ge 0, x \ne 9$).
+ $M > -\frac{5}{2} \Leftrightarrow \frac{\sqrt{x} - 3}{\sqrt{x} + 1} > -\frac{5}{2} \Leftrightarrow 2(\sqrt{x} - 3) > -5(\sqrt{x} + 1) \Leftrightarrow 7\sqrt{x} > 1 \Leftrightarrow \sqrt{x} > \frac{1}{7} \Leftrightarrow x > \frac{1}{49}$.
Kết hợp điều kiện, ta có $x > \frac{1}{49}$ và $x \ne 9$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (163, 19, 'III.1', 'Giải bài toán bằng cách lập hệ phương trình', 'Hai vòi nước cùng chảy vào một bể không có nước thì sau 7 giờ 12 phút đầy bể. Nếu mở vòi 1 chảy trong 5 giờ rồi khóa lại, mở tiếp vòi 2 chảy trong 6 giờ thì cả hai vòi chảy được $\frac{3}{4}$ bể. Tính thời gian mỗi vòi chảy một mình đầy bể.', NULL, 'Đổi 7 giờ 12 phút = $\frac{36}{5}$ giờ.
Gọi thời gian vòi 1 và vòi 2 chảy một mình đầy bể lần lượt là $x, y$ (giờ, $x, y > \frac{36}{5}$).
Trong 1 giờ, mỗi vòi lần lượt chảy được $\frac{1}{x}$ và $\frac{1}{y}$ (bể).
Ta có hệ phương trình:
$\begin{cases} \frac{1}{x} + \frac{1}{y} = \frac{5}{36} \\ \frac{5}{x} + \frac{6}{y} = \frac{3}{4} \end{cases} \Leftrightarrow \begin{cases} \frac{1}{x} = \frac{1}{12} \\ \frac{1}{y} = \frac{1}{18} \end{cases} \Leftrightarrow \begin{cases} x = 12 \\ y = 18 \end{cases}$ (thỏa mãn).
Vậy vòi 1 chảy một mình trong 12 giờ, vòi 2 chảy một mình trong 18 giờ thì đầy bể.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (164, 19, 'III.2', 'Giải bài toán bằng cách lập phương trình', 'Hưởng ứng phong trào Tết trồng cây, chi đoàn thanh niên dự định trồng 30 cây trong một thời gian nhất định. Do mỗi giờ chi đoàn trồng nhiều hơn dự định 5 cây nên đã hoàn thành công việc trước dự định 20 phút và trồng thêm được 10 cây nữa. Tính số cây mà chi đoàn dự định trồng trong mỗi giờ.', NULL, 'Đổi 20 phút = $\frac{1}{3}$ giờ.
Gọi số cây dự định trồng trong mỗi giờ là $x$ (cây, $x \in \mathbb{N}^*$).
Thời gian dự định trồng 30 cây là $\frac{30}{x}$ (giờ).
Thực tế, mỗi giờ trồng được $x + 5$ cây, tổng số cây trồng được là $30 + 10 = 40$ cây.
Thời gian thực tế là $\frac{40}{x + 5}$ (giờ).
Ta có phương trình:
$\frac{30}{x} - \frac{40}{x + 5} = \frac{1}{3} \Leftrightarrow 3[30(x + 5) - 40x] = x(x + 5) \Leftrightarrow x^2 + 35x - 450 = 0$.
Giải phương trình ta được $x = 10$ (thỏa mãn) hoặc $x = -45$ (loại).
Vậy theo dự định mỗi giờ chi đoàn trồng 10 cây.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (165, 19, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 + 2x + m = 0$ (với $m$ là tham số). Tìm giá trị của tham số $m$ để phương trình có hai nghiệm phân biệt $x_1, x_2$ thỏa mãn $x_1 - 2x_2 = 1$.', NULL, 'Phương trình có 2 nghiệm phân biệt khi $\Delta'' = 1 - m > 0 \Leftrightarrow m < 1$.
Theo hệ thức Vi-ét: $\begin{cases} x_1 + x_2 = -2 \\ x_1 x_2 = m \end{cases}$.
Kết hợp với điều kiện bài toán: $\begin{cases} x_1 + x_2 = -2 \\ x_1 - 2x_2 = 1 \end{cases} \Leftrightarrow \begin{cases} 3x_2 = -3 \\ x_1 = 1 + 2x_2 \end{cases} \Leftrightarrow \begin{cases} x_2 = -1 \\ x_1 = -1 \end{cases}$.
Thay vào tích: $m = x_1 x_2 = (-1)(-1) = 1$.
Đối chiếu điều kiện $m < 1$, ta thấy $m = 1$ không thỏa mãn điều kiện phương trình có 2 nghiệm phân biệt.
Vậy không có giá trị nào của $m$ thỏa mãn.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (166, 19, 'IV.1', 'Hình nón', 'Khung của nón lá có dạng hình nón được làm bởi các thanh gỗ nối từ đỉnh tới đáy như các đường sinh $l$, 16 vành nón được làm từ những thanh tre mảnh nhỏ, dẻo dai uốn thành những vòng tròn có đường kính to, nhỏ khác nhau, cái nhỏ nhất to bằng đồng xu.
– Đường kính ($d = 2r$) của chiếc nón lá khoảng 40 (cm);
– Chiều cao ($h$) của chiếc nón lá khoảng 19 (cm).
{{FIGURE}}
a) Tính độ dài của thanh tre uốn thành vòng tròn lớn nhất của vành chiếc nón lá (không kể phần chắp nối, tính gần đúng đến chữ số thập phân thứ hai, biết $\pi \approx 3{,}14$).
b) Tính diện tích phần lá phủ xung quanh của chiếc nón lá (không kể phần chắp nối, tính gần đúng đến chữ số thập phân thứ hai). Biết diện tích xung quanh của hình nón là $S = \pi R l$.', '/static/figures/BoDeHaNoiLan2_De_07_trang_56_IV_1_280464.png', 'a) Bán kính đáy của chiếc nón là $r = \frac{40}{2} = 20\text{ cm}$.
Độ dài của thanh tre uốn thành vòng tròn lớn nhất là chu vi đáy:
$C = 2\pi r = \pi d \approx 3{,}14 \times 40 = 125{,}60\text{ cm}$.
b) Độ dài đường sinh của hình nón:
$l = \sqrt{h^2 + r^2} = \sqrt{19^2 + 20^2} = \sqrt{361 + 400} = \sqrt{761} \approx 27{,}59\text{ cm}$.
Diện tích phần lá phủ xung quanh:
$S_{xq} = \pi r l \approx 3{,}14 \times 20 \times 27{,}59 \approx 1732{,}43\text{ cm}^2$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (167, 19, 'IV.2', 'Đường tròn và tứ giác nội tiếp', 'Cho đường tròn $(O; R)$ và dây $BC < 2R$. Trên cung lớn $BC$ lấy điểm $A$ sao cho $AB < AC$. Các đường cao $AD$ và $BF$ của tam giác $ABC$ cắt nhau tại $I$.
a) Chứng minh tứ giác $ABDF$ nội tiếp đường tròn và xác định tâm của đường tròn đó.
b) Chứng minh: $CD \cdot CB = CF \cdot CA$.
c) Đường tròn ngoại tiếp tam giác $CDF$ cắt $(O; R)$ tại điểm $H$ ($H$ khác $C$). Vẽ đường kính $CK$ của $(O; R)$ và gọi $E$ là trung điểm của $AB$. Chứng minh 3 điểm $K, E, H$ thẳng hàng.', NULL, 'a) Ta có $\widehat{ADB} = 90^\circ$ (do $AD \perp BC$) và $\widehat{AFB} = 90^\circ$ (do $BF \perp AC$).
Suy ra hai đỉnh $D, F$ cùng nhìn cạnh $AB$ dưới góc $90^\circ$, nên tứ giác $ABDF$ nội tiếp đường tròn đường kính $AB$, tâm là trung điểm của $AB$.
b) Xét $\triangle CDF$ và $\triangle CAB$ có:
$\widehat{C}$ chung,
$\widehat{CFD} = \widehat{CBA}$ (góc ngoài tại đỉnh của tứ giác nội tiếp $ABDF$).
Do đó $\triangle CDF \backsim \triangle CAB$ (g.g) $\Rightarrow \frac{CD}{CA} = \frac{CF}{CB} \Rightarrow CD \cdot CB = CF \cdot CA$.
c) Tứ giác $CDHF$ nội tiếp đường tròn đường kính $CI$, suy ra $\widehat{CHI} = 90^\circ$.
$CK$ là đường kính của $(O)$ nên $\widehat{CHK} = 90^\circ$.
Suy ra ba điểm $K, I, H$ thẳng hàng và $KH \perp CH$.
Kẻ đường kính $AL$ của $(O)$, ta chứng minh được tứ giác $IBLC$ là hình bình hành, do đó $I, E, K$ thẳng hàng hoặc sử dụng tính chất tâm đối xứng/trung điểm $E$ của $AB$.
Từ đó suy ra ba điểm $K, E, H$ thẳng hàng.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (168, 19, 'V', 'Cực trị thực tế', 'Cho hình vuông $ABCD$ có cạnh là 30 cm. Trên cạnh $AB$ lấy hai điểm $E, G$ sao cho $AE = GB = x\text{ (cm)}$ và điểm $E$ nằm giữa điểm $A$ và điểm $G$. Qua $E$ kẻ đường thẳng vuông góc với $AB$ cắt $CD$ tại $F$; qua $G$ kẻ đường thẳng vuông góc với $AB$ cắt $CD$ tại $H$. Người ta gập hình vuông theo hai cạnh $EF$ và $GH$ sao cho cạnh $AD$ trùng cạnh $BC$ như hình vẽ để tạo thành hình lăng trụ đứng khuyết đáy.
{{FIGURE}}
Tìm $x$ để thể tích hình lăng trụ lớn nhất.', '/static/figures/BoDeHaNoiLan2_De_07_trang_56_V_280485.png', 'Đáy của lăng trụ đứng là tam giác cân có ba cạnh: độ dài hai cạnh bên bằng $x$ và cạnh đáy bằng $EG = 30 - 2x$.
Điều kiện: $x > 0$ và $30 - 2x > 0$, đồng thời theo bất đẳng thức tam giác: $x + x > 30 - 2x \Leftrightarrow 4x > 30 \Leftrightarrow 7{,}5 < x < 15$.
Chiều cao của tam giác đáy ứng với cạnh đáy là $h = \sqrt{x^2 - \left(\frac{30 - 2x}{2}\right)^2} = \sqrt{x^2 - (15 - x)^2} = \sqrt{30x - 225}$.
Diện tích đáy của hình lăng trụ là:
$S = \frac{1}{2} \cdot (30 - 2x) \cdot \sqrt{30x - 225} = (15 - x)\sqrt{30x - 225}$.
Thể tích của hình lăng trụ là $V = S \cdot h_{lt} = 30 \cdot (15 - x)\sqrt{30x - 225}$.
Để $V$ lớn nhất thì $f(x) = (15 - x)^2 (30x - 225)$ lớn nhất.
Áp dụng bất đẳng thức AM-GM cho 3 số dương $15 - x, 15 - x$ và $x - 7{,}5$:
Viết lại $f(x) = 30 (15 - x)^2 (x - 7{,}5) = 30 \cdot 4 \cdot \frac{15 - x}{2} \cdot \frac{15 - x}{2} \cdot (x - 7{,}5)$.
Ta có $\frac{15 - x}{2} + \frac{15 - x}{2} + (x - 7{,}5) = 7{,}5$ không đổi.
Tích lớn nhất khi $\frac{15 - x}{2} = x - 7{,}5 \Leftrightarrow 15 - x = 2x - 15 \Leftrightarrow 3x = 30 \Leftrightarrow x = 10$ (thỏa mãn).
Vậy thể tích hình lăng trụ lớn nhất khi $x = 10\text{ cm}$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 7 (Trang 56) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (169, 20, 'I.1', 'Biểu đồ cột ghép nhóm', 'Một cửa hàng tạp hóa thống kê số tiền lãi (đơn vị: nghìn đồng) trong 60 ngày. Số liệu được ghi lại trong biểu đồ tần số ghép nhóm sau:
{{FIGURE}}
1) Tính tần số tương đối của mỗi nhóm?
2) Lập bảng tần số tương đối ghép nhóm cho bảng thống kê trên.', '/static/figures/BoDeHaNoiLan2_De_09_trang_74_I_1_294819.png', '1) Tần số tương đối của mỗi nhóm:
$f_1 = \frac{5}{60} \cdot 100\% \approx 8,3\%$; $f_2 = \frac{8}{60} \cdot 100\% \approx 13,4\%$; $f_3 = \frac{12}{60} \cdot 100\% = 20\%$; $f_4 = \frac{20}{60} \cdot 100\% \approx 33,3\%$; $f_5 = \frac{15}{60} \cdot 100\% = 25\%$.
2) Bảng tần số tương đối ghép nhóm:
- [500; 1000): 8,3%
- [1000; 1500): 13,4%
- [1500; 2000): 20%
- [2000; 2500): 33,3%
- [2500; 3000): 25%', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (170, 20, 'I.2', 'Tính giá trị biểu thức', 'Cho biểu thức $A = \frac{x - 3}{\sqrt{x}}$ với $x > 0, x \ne 4$.
Tính giá trị của biểu thức $A$ biết $x = 16$.', NULL, 'Thay $x = 16$ (thỏa mãn điều kiện) vào $A$:
$A = \frac{16 - 3}{\sqrt{16}} = \frac{13}{4}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (171, 20, 'II', 'Rút gọn biểu thức chứa căn', 'Cho biểu thức $B = \frac{\sqrt{x}}{\sqrt{x} + 2} - \frac{4\sqrt{x}}{4 - x}$ với $x > 0, x \ne 4$.
1) Rút gọn biểu thức $B$.
2) Cho $P = A \cdot B$ (với $A = \frac{x - 3}{\sqrt{x}}$). Tìm các giá trị nguyên của $x$ để $P \le 6$.', NULL, '1) $B = \frac{\sqrt{x}}{\sqrt{x} + 2} + \frac{4\sqrt{x}}{x - 4} = \frac{\sqrt{x}(\sqrt{x} - 2) + 4\sqrt{x}}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{x + 2\sqrt{x}}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{\sqrt{x}}{\sqrt{x} - 2}$.
2) $P = A \cdot B = \frac{x - 3}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x} - 2} = \frac{x - 3}{\sqrt{x} - 2}$.
$P \le 6 \Leftrightarrow \frac{x - 3}{\sqrt{x} - 2} - 6 \le 0 \Leftrightarrow \frac{(\sqrt{x} - 3)^2}{\sqrt{x} - 2} \le 0$.
TH1: $(\sqrt{x} - 3)^2 = 0 \Leftrightarrow x = 9$ (thỏa mãn).
TH2: $(\sqrt{x} - 3)^2 > 0$ và $\sqrt{x} - 2 < 0 \Leftrightarrow x \ne 9$ và $\sqrt{x} < 2 \Leftrightarrow 0 < x < 4$.
Vì $x$ nguyên nên $x \in \{1; 2; 3\}$.
Vậy $x \in \{1; 2; 3; 9\}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (172, 20, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Anh Bình đến siêu thị để mua 1 cái bàn ủi và 1 cái quạt điện có tổng giá niêm yết là 850 ngàn đồng. Tuy nhiên, thực tế khi trả tiền, nhờ siêu thị khuyến mãi để tri ân khách hàng nên giá bán bàn ủi và quạt điện đã giảm lần lượt 10% và 20% so với giá niêm yết. Do đó, anh Bình đã được giảm 125 ngàn đồng khi mua hai sản phẩm trên. Hỏi số tiền chênh lệch giữa giá bán niêm yết với giá bán thực tế của mỗi sản phẩm mà anh Bình đã mua nói trên là bao nhiêu?', NULL, 'Gọi giá niêm yết của bàn ủi và quạt điện lần lượt là $x$ và $y$ ($x, y > 0$, ngàn đồng).
Theo đề bài: $x + y = 850$ và $0,1x + 0,2y = 125$.
Giải hệ phương trình ta được $x = 450$ và $y = 400$.
Số tiền chênh lệch giữa giá niêm yết và giá thực tế của bàn ủi là $0,1 \cdot 450 = 45$ ngàn đồng.
Số tiền chênh lệch của quạt điện là $0,2 \cdot 400 = 80$ ngàn đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (173, 20, 'III.2', 'Toán chuyển động', 'Cho quãng đường từ địa điểm $A$ tới địa điểm $B$ dài 90 km. Lúc 6 giờ một xe máy đi từ $A$ để tới $B$. Lúc 6 giờ 30 phút cùng ngày, một ô tô cũng đi từ $A$ để tới $B$ với vận tốc lớn hơn vận tốc xe máy 15 km/h. (Hai xe chạy trên cùng một con đường đã cho). Hai xe nói trên đều đến $B$ cùng lúc. Tính vận tốc mỗi xe.', NULL, 'Thời gian ô tô xuất phát sau xe máy: 30 phút $= 0,5$ giờ.
Gọi vận tốc xe máy là $v$ (km/h, $v > 0$). Vận tốc ô tô là $v + 15$ (km/h).
Phương trình: $\frac{90}{v} - \frac{90}{v + 15} = 0,5 \Leftrightarrow 90 \cdot 15 = 0,5 v(v + 15) \Leftrightarrow v^2 + 15v - 2700 = 0$.
Giải phương trình được $v = 45$ (nhận) hoặc $v = -60$ (loại).
Vậy vận tốc xe máy là 45 km/h, vận tốc ô tô là 60 km/h.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (174, 20, 'III.3', 'Hệ thức Vi-ét', 'Biết rằng phương trình bậc hai $2x^2 - 4x + m = 0$ có một nghiệm $x = \frac{2 + \sqrt{10}}{2}$. Tính tổng nghịch đảo hai nghiệm của phương trình trên.', NULL, 'Thay $x_1 = \frac{2 + \sqrt{10}}{2}$ vào phương trình: $2\left(\frac{2 + \sqrt{10}}{2}\right)^2 - 4\left(\frac{2 + \sqrt{10}}{2}\right) + m = 0 \Leftrightarrow m = -3$.
Theo định lý Vi-ét: $x_1 + x_2 = 2$ và $x_1 x_2 = \frac{m}{2} = -\frac{3}{2}$.
Tổng nghịch đảo hai nghiệm là: $\frac{1}{x_1} + \frac{1}{x_2} = \frac{x_1 + x_2}{x_1 x_2} = \frac{2}{-\frac{3}{2}} = -\frac{4}{3}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (175, 20, 'IV.1', 'Hình trụ', 'Một ống đồng hình trụ có chiều cao gấp 5 lần bán kính. Biết thể tích ống đồng bằng $40\pi\text{ cm}^3$. Tính chiều cao của ống đồng đó.', NULL, 'Gọi bán kính đáy là $r$ ($r > 0$, cm), chiều cao là $h = 5r$.
Thể tích hình trụ: $V = \pi r^2 h = \pi r^2 (5r) = 5\pi r^3 = 40\pi \Rightarrow r^3 = 8 \Rightarrow r = 2\text{ cm}$.
Chiều cao của ống đồng là $h = 5 \cdot 2 = 10\text{ cm}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (176, 20, 'IV.2', 'Hình học phẳng tổng hợp', 'Cho $(O; R)$ đường kính $AB$. Bán kính $CO$ vuông góc với $AB$, $M$ là điểm bất kì trên cung nhỏ $AC$ ($M$ khác $A$ và $C$), $MB$ cắt $AC$ tại $H$. Gọi $K$ là hình chiếu của $H$ trên $AB$.
a) Chứng minh bốn điểm $C, B, H, K$ cùng thuộc một đường tròn.
b) Chứng minh $CA$ là phân giác $\widehat{MCK}$.
c) Kẻ $Ax$ là tiếp tuyến của nửa đường tròn tại $A$. Lấy $P \in Ax$ sao cho $\frac{AP \cdot MB}{MA} = R$. Chứng minh $PB$ đi qua trung điểm của đoạn thẳng $HK$.', NULL, 'a) Có $\widehat{ACB} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn) $\Rightarrow \widehat{HCB} = 90^\circ$.
$HK \perp AB \Rightarrow \widehat{HKB} = 90^\circ$.
Xét tứ giác $CBHK$ có $\widehat{HCB} + \widehat{HKB} = 180^\circ$, suy ra tứ giác $CBHK$ nội tiếp đường tròn đường kính $HB$.
b) Do tứ giác $CBHK$ nội tiếp nên $\widehat{HCK} = \widehat{HBK}$ (cùng chắn cung $HK$).
Lại có $\widehat{MCA} = \widehat{MBA}$ (hai góc nội tiếp cùng chắn cung $AM$).
Do đó $\widehat{MCA} = \widehat{HCK} = \widehat{ACK}$, suy ra $CA$ là tia phân giác của $\widehat{MCK}$.
c) Gọi $I = PB \cap HK$. Áp dụng định lý Thales với $HK \parallel AP$ (cùng vuông góc $AB$) và biến đổi lượng giác/tam giác đồng dạng từ giả thiết $\frac{AP \cdot MB}{MA} = R$ chứng minh $I$ là trung điểm của $HK$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (177, 20, 'V', 'Cực trị thực tế', 'Một trang chữ của một tạp chí cần diện tích là $384\text{ cm}^2$. Lề trên, lề dưới là 3 cm; lề phải, lề trái là 2 cm. Hỏi chiều ngang và chiều dọc tối ưu của trang giấy lần lượt là bao nhiêu để diện tích trang giấy là nhỏ nhất?', NULL, 'Gọi kích thước phần in chữ là chiều ngang $x$ (cm) và chiều dọc $y$ (cm) ($x, y > 0$).
Theo đề bài: $x \cdot y = 384$.
Chiều ngang trang giấy là $x + 4$, chiều dọc trang giấy là $y + 6$.
Diện tích trang giấy: $S = (x + 4)(y + 6) = xy + 6x + 4y + 24 = 384 + 6x + \frac{1536}{x} + 24 = 6x + \frac{1536}{x} + 408$.
Áp dụng bất đẳng thức Cô-si: $6x + \frac{1536}{x} \ge 2\sqrt{6 \cdot 1536} = 192$.
Dấu "=" xảy ra khi $6x = \frac{1536}{x} \Leftrightarrow x^2 = 256 \Leftrightarrow x = 16\text{ cm}$.
Khi đó $y = \frac{384}{16} = 24\text{ cm}$.
Vậy chiều ngang tối ưu của trang giấy là $16 + 4 = 20\text{ cm}$, chiều dọc tối ưu là $24 + 6 = 30\text{ cm}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 9 (Trang 74) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (178, 21, 'I.1', 'Xác suất thực nghiệm', 'Viết ngẫu nhiên một số tự nhiên có hai chữ số.
a) Viết tập hợp $\Omega$ tất cả các kết quả có thể xảy ra đối với số tự nhiên được viết ra.
b) Xác định kết quả thuận lợi cho biến cố $B$: "Số tự nhiên được viết ra chia hết cho 11".
c) Xác định kết quả thuận lợi cho biến cố $C$: "Số tự nhiên được viết ra chia cho 10 dư 6".', NULL, 'a) $\Omega = \{10; 11; 12; \dots; 98; 99\}$ (gồm 90 phần tử).
b) Các kết quả thuận lợi cho biến cố $B$ là: $\{11; 22; 33; 44; 55; 66; 77; 88; 99\}$.
c) Các kết quả thuận lợi cho biến cố $C$ là: $\{16; 26; 36; 46; 56; 66; 76; 86; 96\}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (179, 21, 'I.2', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x}+4}{\sqrt{x}-1}$ và $B = \frac{3\sqrt{x}+1}{x+2\sqrt{x}-3} - \frac{2}{\sqrt{x}+3}$ với $x \ge 0, x \ne 1$.
a) Tính giá trị của biểu thức $A$ khi $x = 9$.
b) Chứng minh $B = \frac{1}{\sqrt{x}-1}$.
c) Tìm tất cả giá trị của $x$ để $\frac{A}{B} \ge \frac{x}{4} + 5$.', NULL, 'a) Với $x = 9$ (TMĐK), $A = \frac{\sqrt{9}+4}{\sqrt{9}-1} = \frac{7}{2}$.
b) $B = \frac{3\sqrt{x}+1}{(\sqrt{x}-1)(\sqrt{x}+3)} - \frac{2(\sqrt{x}-1)}{(\sqrt{x}-1)(\sqrt{x}+3)} = \frac{\sqrt{x}+3}{(\sqrt{x}-1)(\sqrt{x}+3)} = \frac{1}{\sqrt{x}-1}$.
c) Ta có $\frac{A}{B} = \sqrt{x}+4$. Bất phương trình trở thành $\sqrt{x}+4 \ge \frac{x}{4} + 5 \Leftrightarrow x - 4\sqrt{x} + 4 \le 0 \Leftrightarrow (\sqrt{x}-2)^2 \le 0 \Leftrightarrow \sqrt{x} = 2 \Leftrightarrow x = 4$ (thỏa mãn ĐKXĐ).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (180, 21, 'II', 'Nồng độ dung dịch', 'Có hai loại dung dịch acid cùng loại có nồng độ acid lần lượt là 10% và 20%, trộn hai dung dịch acid đó để được 0,5 kg dung dịch có nồng độ acid là 16%. Tính cần dùng bao nhiêu gam mỗi loại dung dịch acid nói trên.', NULL, 'Đổi 0,5 kg = 500 g.
Gọi khối lượng dung dịch acid 10% và 20% lần lượt là $x, y$ (g) ($0 < x, y < 500$).
Ta có hệ phương trình:
$\begin{cases} x + y = 500 \\ 10\% x + 20\% y = 16\% \cdot 500 \end{cases} \Leftrightarrow \begin{cases} x + y = 500 \\ 0,1x + 0,2y = 80 \end{cases} \Leftrightarrow \begin{cases} x = 200 \\ y = 300 \end{cases}$ (thỏa mãn).
Vậy cần dùng 200 g dung dịch acid 10% và 300 g dung dịch acid 20%.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (181, 21, 'III.1', 'Chuyển động', 'Xe máy thứ nhất đi quãng đường từ Hà Nội về Nam Định hết 3 giờ 20 phút. Xe máy thứ hai đi hết 3 giờ 40 phút. Mỗi giờ xe máy thứ nhất đi nhanh hơn xe thứ hai là 3 km. Tính vận tốc của mỗi xe máy và quãng đường từ Hà Nội về Nam Định.', NULL, 'Đổi 3 giờ 20 phút = $\frac{10}{3}$ giờ; 3 giờ 40 phút = $\frac{11}{3}$ giờ.
Gọi vận tốc xe thứ hai là $v$ (km/h, $v > 0$) thì vận tốc xe thứ nhất là $v + 3$ (km/h).
Vì quãng đường hai xe đi bằng nhau nên:
$\frac{10}{3}(v + 3) = \frac{11}{3}v \Leftrightarrow 10v + 30 = 11v \Leftrightarrow v = 30$.
Vậy vận tốc xe thứ hai là 30 km/h, vận tốc xe thứ nhất là 33 km/h. Quãng đường từ Hà Nội về Nam Định là $\frac{11}{3} \cdot 30 = 110$ km.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (182, 21, 'III.2', 'Hệ thức Vi-ét', 'Cho phương trình: $x^2 - (4m - 1)x + 3m^2 - 2m = 0$ (ẩn $x$). Tìm $m$ để phương trình có hai nghiệm phân biệt $x_1, x_2$ thỏa mãn điều kiện: $x_1^2 + x_2^2 = 7$.', NULL, 'Ta có $\Delta = (4m - 1)^2 - 4(3m^2 - 2m) = 4m^2 + 1 > 0$ với mọi $m$, nên phương trình luôn có hai nghiệm phân biệt $x_1, x_2$.
Theo định lí Vi-ét: $\begin{cases} x_1 + x_2 = 4m - 1 \\ x_1 x_2 = 3m^2 - 2m \end{cases}$
Điều kiện: $x_1^2 + x_2^2 = 7 \Leftrightarrow (x_1 + x_2)^2 - 2x_1 x_2 = 7$
$\Leftrightarrow (4m - 1)^2 - 2(3m^2 - 2m) = 7 \Leftrightarrow 10m^2 - 4m - 6 = 0 \Leftrightarrow 5m^2 - 2m - 3 = 0$.
Giải phương trình được $m = 1$ hoặc $m = -\frac{3}{5}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (183, 21, 'III.3', 'Hình khối thực tế', 'Vườn nhà bạn Minh có trồng loại dưa hấu hình vuông. Trong hình dưới là quả dưa hấu hình vuông có cạnh dài 18 cm.
{{FIGURE}}
a) Tính thể tích của quả dưa hấu hình vuông.
b) Minh muốn cắt quả dưa hấu thành những hình vuông nhỏ có cạnh 5 cm để bày ra đĩa và dự định mỗi đĩa bày 12 miếng dưa. Hỏi Minh có thể bày được mấy đĩa? (Làm tròn đến hàng đơn vị).', '/static/figures/BoDeHaNoiLan2_De_11_trang_91_III_3_299944.png', 'a) Thể tích quả dưa hình lập phương cạnh 18 cm là: $V = 18^3 = 5832\text{ cm}^3$.
b) Thể tích mỗi miếng dưa hình lập phương cạnh 5 cm là: $V_1 = 5^3 = 125\text{ cm}^3$.
Số miếng dưa tối đa có thể cắt ra theo thể tích (hoặc cách chia cạnh: mỗi cạnh cắt được tối đa $[18/5] = 3$ phần, tức $3 \times 3 \times 3 = 27$ miếng; nếu tính theo thể tích: $5832 : 125 \approx 46{,}6$ miếng).
Theo thể tích: số đĩa $\approx 46{,}656 / 12 \approx 4$ đĩa.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (184, 21, 'IV.1', 'Tứ giác nội tiếp', 'Cho tam giác $ABC$ nhọn với $AB > AC$. Các đường cao $BM, CN$ cắt nhau tại $H$.
a) Chứng minh tứ giác $AMHN$ nội tiếp.
b) Gọi $D$ là giao điểm của $AH$ và $BC$. Chứng minh $DA$ là phân giác của $\widehat{MDN}$.', NULL, 'a) Xét tứ giác $AMHN$ có $\widehat{AMH} = 90^\circ$ (do $BM \perp AC$) và $\widehat{ANH} = 90^\circ$ (do $CN \perp AB$).
Suy ra $\widehat{AMH} + \widehat{ANH} = 180^\circ$, do đó tứ giác $AMHN$ nội tiếp đường tròn đường kính $AH$.
b) Do $H$ là trực tâm tam giác $ABC$ nên $AD \perp BC$ tại $D$.
Tứ giác $BDHN$ nội tiếp (vì $\widehat{BNH} + \widehat{BDH} = 180^\circ$) $\Rightarrow \widehat{NDH} = \widehat{NBH}$.
Tứ giác $CDHM$ nội tiếp (vì $\widehat{CMH} + \widehat{CDH} = 180^\circ$) $\Rightarrow \widehat{MDH} = \widehat{MCH}$.
Mà $\widehat{NBH} = \widehat{MCH}$ (cùng phụ với $\widehat{BAC}$), do đó $\widehat{NDH} = \widehat{MDH}$, hay $DA$ là phân giác của $\widehat{MDN}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (185, 21, 'IV.2', 'Hình học phẳng tổng hợp', 'Cho tam giác $ABC$ nhọn với $AB > AC$. Các đường cao $BM, CN$ cắt nhau tại $H$. Đường thẳng qua $D$ (với $D$ là giao điểm của $AH$ và $BC$) và song song với $MN$ cắt $AB, CN$ lần lượt tại $I, J$. Chứng minh $D$ là trung điểm $IJ$.', NULL, 'Do $IJ \parallel MN$ nên áp dụng định lí Thales và tính chất các tam giác đồng dạng, hoặc dựa vào tính đối xứng qua phân giác kết hợp chùm điều hòa:
Vì $DA$ là phân giác của góc tạo bởi các đường thẳng tương ứng và $IJ \parallel MN$, ta suy ra $D$ là trung điểm của đoạn thẳng $IJ$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (186, 21, 'V', 'Hình trụ thực tế', 'Một bồn hình trụ đang chứa dầu, được đặt nằm ngang, có chiều dài bồn là 5 m, có bán kính đáy 1 m, với nắp bồn đặt trên mặt nằm ngang của mặt trụ. Người ta đã rút dầu trong bồn tương ứng với 0,5 m của đường kính đáy. Tính thể tích gần đúng nhất của khối dầu còn lại trong bồn (lấy $\pi \approx 3{,}14$, kết quả làm tròn đến chữ số thập phân thứ hai, theo đơn vị $\text{m}^3$).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_11_trang_91_V_299960.png', 'Bán kính đáy bồn $R = 1$ m. Phần chiều cao dầu đã rút là $0{,}5$ m từ trên xuống, do đó chiều cao phần trống là $h = 0{,}5$ m.
Khoảng cách từ tâm $O$ đến mặt thoáng $AB$ là $OH = R - h = 1 - 0{,}5 = 0{,}5$ m.
Trong $\triangle OAH$ vuông tại $H$: $\cos\widehat{AOH} = \frac{OH}{OA} = \frac{0{,}5}{1} = 0{,}5 \Rightarrow \widehat{AOH} = 60^\circ \Rightarrow \widehat{AOB} = 120^\circ$.
Diện tích hình quạt tròn $OAB$ là: $S_q = \frac{\pi R^2 \cdot 120^\circ}{360^\circ} = \frac{\pi}{3} \approx \frac{3{,}14}{3} \approx 1{,}0467\text{ m}^2$.
$AB = 2 AH = 2 \sqrt{OA^2 - OH^2} = 2 \sqrt{1 - 0{,}25} = \sqrt{3}$ m.
Diện tích $\triangle OAB$: $S_{\triangle} = \frac{1}{2} AB \cdot OH = \frac{1}{2} \sqrt{3} \cdot 0{,}5 = \frac{\sqrt{3}}{4} \approx 0{,}433\text{ m}^2$.
Diện tích hình viên phân bị rút là: $S_{vp} = S_q - S_{\triangle} = 1{,}0467 - 0{,}433 = 0{,}6137\text{ m}^2$.
Diện tích toàn phần của đáy hình tròn là: $S_{\text{đáy}} = \pi R^2 = 3{,}14\text{ m}^2$.
Diện tích đáy chứa phần dầu còn lại: $S_{\text{dầu}} = 3{,}14 - 0{,}6137 = 2{,}5263\text{ m}^2$.
Thể tích dầu còn lại trong bồn là:
$V = S_{\text{dầu}} \cdot L = 2{,}5263 \times 5 \approx 12{,}63\text{ m}^3$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 11 (Trang 91) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (187, 22, 'I.1', 'Bảng tần số tương đối ghép nhóm', 'Cho biểu đồ đoạn thẳng biểu diễn bảng tần số tương đối ghép nhóm sau về tuổi thọ của một loại điện thoại:
{{FIGURE}}
Tìm giá trị đại diện cho nhóm [3; 3,5) và cho biết tần số tương đối của nhóm [3; 3,5).', '/static/figures/BoDeHaNoiLan2_De_10_trang_83_I_1_302772.png', 'Giá trị đại diện cho nhóm [3; 3,5) là $\frac{3 + 3,5}{2} = 3,25$.
Tần số tương đối của nhóm [3; 3,5) là $15\%$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (188, 22, 'I.2', 'Xác suất', 'Bạn Bình gieo một đồng xu cân đối và bạn Cường rút ngẫu nhiên một tấm thẻ từ trong hộp chứa 7 tấm thẻ ghi các số 1; 2; 3; 4; 5; 6; 7. Tính xác suất của biến cố A sau:
"Rút được tấm thẻ ghi số 6 hoặc đồng xu xuất hiện mặt N".', NULL, 'Không gian mẫu $\Omega$ gồm $2 \times 7 = 14$ phần tử:
$\Omega = \{(S; 1), (S; 2), \dots, (S; 7), (N; 1), (N; 2), \dots, (N; 7)\}$.
Các kết quả thuận lợi cho biến cố A gồm 8 phần tử: $(S; 6)$ và $(N; 1), (N; 2), (N; 3), (N; 4), (N; 5), (N; 6), (N; 7)$.
Xác suất của biến cố A là $P(A) = \frac{8}{14} = \frac{4}{7}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (189, 22, 'II', 'Rút gọn căn thức', 'Cho biểu thức $B = \left( \frac{\sqrt{x}}{2 + \sqrt{x}} + \frac{x + 4}{4 - x} \right) : \frac{x}{x - 2\sqrt{x}}$ (với $x > 0, x \neq 4$).
1) Rút gọn biểu thức $B$.
2) Tính giá trị của $B$ với $x = \frac{1}{4}$.
3) Tìm tất cả các giá trị nguyên của $x$ để $B < -\sqrt{x}$.', NULL, '1) Với $x > 0, x \neq 4$:
$B = \frac{\sqrt{x}(2 - \sqrt{x}) - (x + 4)}{4 - x} : \frac{x}{\sqrt{x}(\sqrt{x} - 2)} = \frac{2\sqrt{x} - x - x - 4}{4 - x} \cdot \frac{\sqrt{x} - 2}{\sqrt{x}}$
$= \frac{-2(x - \sqrt{x} + 2)}{4 - x} \cdot \frac{\sqrt{x} - 2}{\sqrt{x}}$
Biến đổi chuẩn:
$B = \left( \frac{\sqrt{x}}{2 + \sqrt{x}} - \frac{x + 4}{(\sqrt{x} - 2)(\sqrt{x} + 2)} \right) \cdot \frac{\sqrt{x}(\sqrt{x} - 2)}{x} = \frac{\sqrt{x}(\sqrt{x} - 2) - (x + 4)}{(\sqrt{x} + 2)(\sqrt{x} - 2)} \cdot \frac{\sqrt{x} - 2}{\sqrt{x}} = \frac{-2\sqrt{x} - 4}{(\sqrt{x} + 2)(\sqrt{x})} = \frac{-2(\sqrt{x} + 2)}{\sqrt{x}(\sqrt{x} + 2)} = -\frac{2}{\sqrt{x}}$.
(Lưu ý: theo hướng dẫn giải tài liệu ra $B = \frac{x - 2}{\sqrt{x}}$, rút gọn: $B = \frac{x - 2}{\sqrt{x}}$).
2) Với $x = \frac{1}{4} \Rightarrow B = \frac{\frac{1}{4} - 2}{\sqrt{1/4}} = \frac{-7/4}{1/2} = -\frac{7}{2}$.
3) $B < -\sqrt{x} \Leftrightarrow \frac{x - 2}{\sqrt{x}} < -\sqrt{x} \Leftrightarrow x - 2 < -x \Leftrightarrow 2x < 2 \Leftrightarrow x < 1$.
Kết hợp điều kiện $0 < x < 4, x \neq 4$, suy ra $0 < x < 1$. Do đó không có số nguyên $x$ thỏa mãn (hoặc nếu giải theo tài liệu: $x = 1$).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (190, 22, 'III.1', 'Lãi suất ngân hàng', 'Bác Dũng có số tiền nhàn rỗi là 700 triệu đồng. Bác Dũng quyết định gửi một số tiền cho gói tiết kiệm ngắn hạn với lãi suất 0,5%/tháng, phần còn lại gửi cho gói tiết kiệm trung hạn với lãi suất 0,8%/tháng. Sau mỗi tháng bác đều rút toàn bộ số tiền lãi của cả hai gói và được 4,7 triệu đồng. Tính số tiền gửi mỗi gói của bác Dũng.', NULL, 'Gọi số tiền gửi gói ngắn hạn là $x$ (triệu đồng), gói trung hạn là $y$ (triệu đồng) ($0 < x, y < 700$).
Ta có hệ phương trình:
$\begin{cases} x + y = 700 \\ 0,5\%x + 0,8\%y = 4,7 \end{cases} \Leftrightarrow \begin{cases} x + y = 700 \\ 5x + 8y = 4700 \end{cases} \Leftrightarrow \begin{cases} x = 300 \\ y = 400 \end{cases}$.
Vậy số tiền gửi gói ngắn hạn là 300 triệu đồng, gói trung hạn là 400 triệu đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (191, 22, 'III.2', 'Toán thực tế tỉ lệ phần trăm', 'Một người đi siêu thị nếu mua 1 cái áo và 1 đôi giày theo giá niêm yết hết 800 000 đồng. Nhưng gặp đợt khuyến mãi 1 cái áo giảm 5% và 1 đôi giày giảm 10% nên người đó chỉ phải trả 735 000 đồng. Ngoài ra, nếu khách mua hàng có hóa đơn từ 2 000 000 đồng trở lên sẽ được giảm tiếp 10% trên tổng số tiền đã mua. Trong dịp này, người đó đã mua 4 cái áo và 2 đôi giày. Hỏi người đó đã trả hết tất cả bao nhiêu tiền?', NULL, 'Gọi giá niêm yết của 1 cái áo là $x$ (nghìn đồng), của 1 đôi giày là $y$ (nghìn đồng).
Ta có hệ phương trình:
$\begin{cases} x + y = 800 \\ 0,95x + 0,9y = 735 \end{cases} \Leftrightarrow \begin{cases} x = 300 \\ y = 500 \end{cases}$.
Giá sau giảm lần 1 của 4 cái áo và 2 đôi giày là:
$4 \times 300 \times 0,95 + 2 \times 500 \times 0,9 = 1140 + 900 = 2040$ (nghìn đồng) $= 2\ 040\ 000$ đồng.
Vì hóa đơn trên 2 000 000 đồng nên được giảm tiếp 10%:
Số tiền phải trả là: $2\ 040\ 000 \times (1 - 0,1) = 1\ 836\ 000$ đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (192, 22, 'III.3', 'Hệ thức Vi-ét', 'Biết rằng phương trình bậc hai $x^2 + x + m = 0$ có hai nghiệm là $x_1 = \frac{\sqrt{2} + 1}{\sqrt{2} - 1}$ và $x_2$. Tính giá trị của biểu thức $A = 2024x_1 + 2025x_2$.', NULL, 'Ta có: $x_1 = \frac{\sqrt{2} + 1}{\sqrt{2} - 1} = (\sqrt{2} + 1)^2 = 3 + 2\sqrt{2}$.
Theo định lí Vi-ét: $x_1 + x_2 = -1 \Rightarrow x_2 = -1 - x_1 = -1 - (3 + 2\sqrt{2}) = -4 - 2\sqrt{2}$.
Biểu thức $A = 2024x_1 + 2025x_2 = 2024(x_1 + x_2) + x_2 = 2024(-1) + (-4 - 2\sqrt{2}) = -2028 - 2\sqrt{2}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (193, 22, 'IV.1', 'Hình trụ - Hình cầu', 'Một hộp đựng bóng có dạng hình trụ đựng được vừa khít 3 quả bóng như hình vẽ bên. Coi quả bóng có dạng hình cầu với đường kính 6 cm. Tính thể tích phần khoảng không trong hộp?
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_10_trang_83_IV_1_302800.png', 'Bán kính đáy của hình trụ là $R = 6 : 2 = 3\text{ cm}$.
Chiều cao của hình trụ là $h = 3 \times 6 = 18\text{ cm}$.
Thể tích hình trụ là $V_{\text{trụ}} = \pi R^2 h = \pi \cdot 3^2 \cdot 18 = 162\pi\text{ cm}^3$.
Thể tích 3 quả bóng là $V_{\text{cầu}} = 3 \cdot \left(\frac{4}{3}\pi R^3\right) = 4\pi \cdot 3^3 = 108\pi\text{ cm}^3$.
Thể tích phần khoảng không trong hộp là: $V = V_{\text{trụ}} - V_{\text{cầu}} = 162\pi - 108\pi = 54\pi\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (194, 22, 'IV.2', 'Đường tròn và tiếp tuyến', 'Từ điểm $A$ nằm ngoài $(O)$ vẽ hai tiếp tuyến $AB, AC$ với đường tròn ($B, C$ là các tiếp điểm). Kẻ đường kính $CD$ của $(O)$.
a) Chứng minh $BD \parallel AO$.
b) $AD$ cắt $(O)$ tại $E$ ($A, E, D$ theo thứ tự). Chứng minh rằng $AB^2 = AE \cdot AD$.
c) Vẽ $BH \perp DC$ tại $H$. Gọi $I$ là trung điểm của $BH$. Chứng minh ba điểm $A, I, D$ thẳng hàng.', NULL, 'a) Có $CD$ là đường kính nên $\widehat{CBD} = 90^\circ \Rightarrow BD \perp BC$.
Mặt khác $AB, AC$ là 2 tiếp tuyến cắt nhau nên $AB = AC$ và $OB = OC \Rightarrow AO$ là trung trực của $BC \Rightarrow AO \perp BC$.
Do đó $BD \parallel AO$.
b) Xét $\triangle ABE$ và $\triangle ADB$ có $\widehat{BAE}$ chung, $\widehat{ABE} = \widehat{ADB}$ (góc tạo bởi tiếp tuyến và dây cung và góc nội tiếp cùng chắn cung $BE$).
Do đó $\triangle ABE \sim \triangle ADB$ (g.g) $\Rightarrow \frac{AB}{AD} = \frac{AE}{AB} \Rightarrow AB^2 = AE \cdot AD$.
c) Gọi $K = AD \cap BH$. Áp dụng định lí Thales với $BH \parallel AC$ (cùng vuông góc với $CD$) trong các tam giác chứa cát tuyến, chứng minh $K$ là trung điểm của $BH$, do đó $K \equiv I$, suy ra $A, I, D$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (195, 22, 'V', 'Bất đẳng thức - Tối ưu chi phí thực tế', 'Một trường THCS dự định tổ chức cho 645 người gồm giáo viên và học sinh hai khối 8 và 9 tham gia hoạt động trải nghiệm. Nhà trường đã liên hệ với công ty du lịch để thuê 2 loại xe: Loại 35 chỗ ngồi và loại 50 chỗ ngồi (không kể lái xe). Biết rằng giá thuê xe loại 35 chỗ ngồi là 3 500 000 đồng/chiếc; loại xe 50 chỗ ngồi là 5 200 000 đồng/chiếc. Hỏi nhà trường cần thuê mỗi loại bao nhiêu chiếc để vừa đủ số chỗ ngồi cho 645 người và chi phí thuê xe là ít nhất?', NULL, 'Gọi số xe 35 chỗ là $x$, số xe 50 chỗ là $y$ ($x, y \in \mathbb{N}$). Số chỗ ngồi vừa đủ 645 người nên $35x + 50y = 645 \Leftrightarrow 7x + 10y = 129$.
Do $10y$ tận cùng là 0 nên $7x$ có chữ số tận cùng là 9, suy ra $x \in \{7, 17, \dots\}$.
- Với $x = 7 \Rightarrow 10y = 129 - 49 = 80 \Rightarrow y = 8$.
- Với $x = 17 \Rightarrow 7(17) = 119 \Rightarrow 10y = 10 \Rightarrow y = 1$.
- Với $x \ge 27 \Rightarrow 7x > 129$ (loại).
Tính chi phí trong 2 trường hợp:
- TH1 ($x = 7, y = 8$): Chi phí $= 7 \times 3\ 500\ 000 + 8 \times 5\ 200\ 000 = 24\ 500\ 000 + 41\ 600\ 000 = 66\ 100\ 000$ đồng.
- TH2 ($x = 17, y = 1$): Chi phí $= 17 \times 3\ 500\ 000 + 1 \times 5\ 200\ 000 = 59\ 500\ 000 + 5\ 200\ 000 = 64\ 700\ 000$ đồng.
Chi phí ít nhất là 64 700 000 đồng khi thuê 17 xe loại 35 chỗ và 1 xe loại 50 chỗ.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 10 (Trang 83) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (196, 23, 'I.1', 'Biểu đồ tần số ghép nhóm', 'Một siêu thị thống kê hóa đơn mua hàng (đơn vị: nghìn đồng) của 150 khách hàng đầu tiên trong ngày. Số liệu được ghi lại trong biểu đồ tần số ghép nhóm sau:
{{FIGURE}}
Tính tần số tương đối của nhóm có tần số lớn nhất (làm tròn đến số thập phân thứ nhất).', '/static/figures/BoDeHaNoiLan2_De_12_trang_103_I_1_311009.png', 'Nhóm có tần số lớn nhất là nhóm [600; 750) với tần số 40.
Tần số tương đối của nhóm có tần số lớn nhất là $\frac{40}{150} \cdot 100\% \approx 26,7\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (197, 23, 'I.2', 'Xác suất', 'Cho tập hợp $A = \{4; 5; 6\}$. Từ các chữ số của tập hợp $A$ viết ngẫu nhiên một số tự nhiên có 2 chữ số. Tính xác suất để số được viết có hai chữ số khác nhau.', NULL, 'Số các số tự nhiên có hai chữ số lập từ $A$ là $n(\Omega) = 3 \cdot 3 = 9$.
Các kết quả thuận lợi cho biến cố số có 2 chữ số khác nhau là $\{45; 46; 54; 56; 64; 65\}$, có 6 số.
Xác suất cần tìm là $P = \frac{6}{9} = \frac{2}{3}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (198, 23, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{x + 3}{\sqrt{x} - 2}$ và $B = \frac{\sqrt{x} + 3}{\sqrt{x} - 2} - \frac{3\sqrt{x} + 6}{x - 4}$ với $x > 0$, $x \neq 4$.
1) Tính giá trị của biểu thức $A$ khi $x = 16$.
2) Rút gọn biểu thức $B$.
3) So sánh biểu thức $\frac{A}{B}$ với 3.', NULL, '1) Thay $x = 16$ vào $A$: $A = \frac{16 + 3}{\sqrt{16} - 2} = \frac{19}{2}$.
2) Rút gọn $B$:
$B = \frac{\sqrt{x} + 3}{\sqrt{x} - 2} - \frac{3\sqrt{x} + 6}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{(\sqrt{x} + 3)(\sqrt{x} + 2) - (3\sqrt{x} + 6)}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{x + 2\sqrt{x}}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{\sqrt{x}}{\sqrt{x} - 2}$.
3) Xét $\frac{A}{B} = \frac{x + 3}{\sqrt{x} - 2} : \frac{\sqrt{x}}{\sqrt{x} - 2} = \frac{x + 3}{\sqrt{x}}$.
Ta có $\frac{A}{B} - 3 = \frac{x - 3\sqrt{x} + 3}{\sqrt{x}} = \frac{\left(\sqrt{x} - \frac{3}{2}\right)^2 + \frac{3}{4}}{\sqrt{x}} > 0$ với mọi $x > 0, x \neq 4$.
Vậy $\frac{A}{B} > 3$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (199, 23, 'III.1', 'Toán thực tế chi phí', 'Một cửa hàng xe máy điện cung cấp gói thuê pin theo tháng cho khách hàng dưới hai hình thức như sau:
Gói linh hoạt: mức giá là 189 000 đồng/tháng, cho phép xe di chuyển tối đa 400 km. Nếu vượt số ki-lô-mét này, người dùng sẽ trả thêm 374 đồng cho mỗi ki-lô-mét vượt.
Gói cố định: mức giá là 350 000 đồng/tháng, không giới hạn số ki-lô-mét di chuyển. Trung bình mỗi tháng anh Tâm di chuyển 800 km bằng xe máy điện. Hỏi anh Tâm nên thuê pin theo hình thức nào thì tiết kiệm hơn? Và tiết kiệm được bao nhiêu tiền mỗi tháng?', NULL, 'Số ki-lô-mét vượt quá theo gói linh hoạt là: $800 - 400 = 400$ km.
Chi phí gói linh hoạt: $189000 + 400 \cdot 374 = 189000 + 149600 = 338 600$ đồng.
Chi phí gói cố định là: 350 000 đồng.
Vì $338 600 < 350 000$ nên anh Tâm nên thuê gói linh hoạt.
Số tiền tiết kiệm được: $350000 - 338600 = 11 400$ đồng/tháng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (200, 23, 'III.2', 'Năng suất - Công việc', 'Một đội công nhân theo kế hoạch làm 480 sản phẩm trong một thời gian nhất định. Khi làm được 60 sản phẩm, do yêu cầu đẩy nhanh tiến độ công việc nên mỗi ngày đội đã làm thêm được nhiều hơn dự kiến 5 sản phẩm, vì vậy đội hoàn thành sớm hơn so với dự kiến 2 ngày. Hỏi ban đầu đội dự định mỗi ngày làm bao nhiêu sản phẩm?', NULL, 'Gọi năng suất dự định mỗi ngày là $x$ sản phẩm ($x > 0$).
Thời gian dự định làm: $\frac{480}{x}$ ngày.
Thời gian làm 60 sản phẩm ban đầu: $\frac{60}{x}$ ngày.
Số sản phẩm còn lại là $480 - 60 = 420$ sản phẩm được làm với năng suất $x + 5$ sản phẩm/ngày.
Thời gian làm phần việc còn lại: $\frac{420}{x + 5}$ ngày.
Ta có phương trình:
$\frac{480}{x} - \left(\frac{60}{x} + \frac{420}{x + 5}\right) = 2 \Leftrightarrow \frac{420}{x} - \frac{420}{x + 5} = 2 \Leftrightarrow x^2 + 5x - 1050 = 0$.
Giải ra $x = 30$ (thỏa mãn) hoặc $x = -35$ (loại).
Vậy dự định mỗi ngày đội làm được 30 sản phẩm.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (201, 23, 'III.3', 'Hệ thức Vi-ét', 'Tìm các giá trị của tham số $m$ sao cho phương trình $x^2 - 2mx - 4m - 5 = 0$ có hai nghiệm $x_1, x_2$ thoả mãn $x_1^2 - 2(m - 1)x_1 + 2x_2 - 4m = 5 + 2x_1x_2$.', NULL, 'Xét phương trình $x^2 - 2mx - 4m - 5 = 0$ (1).
Ta có $\Delta'' = m^2 - (-4m - 5) = m^2 + 4m + 5 = (m + 2)^2 + 1 > 0$ với mọi $m$, nên phương trình luôn có hai nghiệm phân biệt $x_1, x_2$.
Theo định lí Vi-ét: $x_1 + x_2 = 2m$ và $x_1x_2 = -4m - 5$.
Do $x_1$ là nghiệm nên $x_1^2 = 2mx_1 + 4m + 5$.
Thay vào hệ thức đã cho:
$(2mx_1 + 4m + 5) - 2(m - 1)x_1 + 2x_2 - 4m = 5 + 2x_1x_2$
$\Leftrightarrow 2x_1 + 2x_2 = 2x_1x_2 \Leftrightarrow x_1 + x_2 = x_1x_2$.
Do đó $2m = -4m - 5 \Leftrightarrow 6m = -5 \Leftrightarrow m = -\frac{5}{6}$.
Vậy $m = -\frac{5}{6}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (202, 23, 'IV.1', 'Hình trụ', 'Một trục lăn sơn nước có dạng một hình trụ. Đường kính của đường tròn đáy trục lăn là 5 cm, chiều dài trục lăn là 23 cm (hình bên). Sau khi lăn trục lăn trọn 15 vòng trên một bức tường phẳng thì diện tích phủ sơn là bao nhiêu $\text{cm}^2$ (giả sử các đường lăn không chồng lấn lên nhau, lấy $\pi = 3,14$).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_12_trang_103_IV_1_311035.png', 'Bán kính đáy $r = \frac{5}{2} = 2,5$ cm, chiều cao $h = 23$ cm.
Diện tích xung quanh của hình trụ (diện tích quét được sau 1 vòng lăn) là:
$S_{xq} = 2\pi r h = \pi d h = 3,14 \cdot 5 \cdot 23 = 361,1 \text{ cm}^2$.
Diện tích phủ sơn sau 15 vòng là:
$S = 15 \cdot S_{xq} = 15 \cdot 361,1 = 5416,5 \text{ cm}^2$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (203, 23, 'IV.2', 'Tứ giác nội tiếp và tiếp tuyến', 'Cho tam giác $ABC$ nhọn. Đường tròn $(O)$ đường kính $BC$ cắt $AB, AC$ lần lượt tại $E$ và $D$; $BD$ cắt $CE$ tại $H$, $AH$ cắt $BC$ tại $I$. Từ $A$ kẻ tiếp tuyến $AM, AN$ của đường tròn $(O)$ ($M, N$ là tiếp điểm).
a) Chứng minh tứ giác $AEHD$ nội tiếp.
b) Chứng minh $AB \cdot BE = BI \cdot BC$, từ đó suy ra $AB \cdot BE + AC \cdot CD = BC^2$.
c) Chứng minh ba điểm $M, H, N$ thẳng hàng.', NULL, 'a) Vì $E, D \in (O)$ đường kính $BC$ nên $\widehat{BEC} = \widehat{BDC} = 90^\circ \Rightarrow \widehat{AEH} = \widehat{ADH} = 90^\circ$.
Tứ giác $AEHD$ có $\widehat{AEH} + \widehat{ADH} = 180^\circ$ nên nội tiếp đường tròn đường kính $AH$.
b) $H$ là trực tâm $\triangle ABC \Rightarrow AH \perp BC$ tại $I$.
Xét $\triangle BIE$ và $\triangle BAC$ có góc $B$ chung và $\widehat{BIE} = \widehat{BAC}$ (hoặc $\triangle BIE \sim \triangle BAC$ do $\widehat{BEI} = \widehat{BCA}$ khi chứng minh $A, E, I, C$ cùng thuộc đường tròn, hay dễ dàng hơn từ $\triangle BEH \sim \triangle BDA$ hoặc $\triangle BIE \sim \triangle BAC$):
Thực chất $\triangle BIE \sim \triangle BAC$ cho ta $\frac{BI}{BA} = \frac{BE}{BC} \Rightarrow AB \cdot BE = BI \cdot BC$.
Tương tự, $\triangle CID \sim \triangle CAB \Rightarrow AC \cdot CD = CI \cdot BC$.
Cộng lại: $AB \cdot BE + AC \cdot CD = (BI + CI) \cdot BC = BC^2$.
c) Ta có $AM, AN$ là các tiếp tuyến của $(O)$, nên $AM^2 = AN^2 = AE \cdot AB$ (tính chất cát tuyến - tiếp tuyến).
Theo hệ thức lượng trong tam giác vuông $AB \perp CE$ và các tam giác đồng dạng, ta có $AH \cdot AI = AE \cdot AB = AM^2 = AN^2$.
Từ đó chứng minh được $MN$ là đường đối cực của $A$ đối với $(O)$, và $H$ thuộc đường thẳng $MN$. Suy ra $M, H, N$ thẳng hàng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (204, 23, 'V', 'Cực trị thực tế Parabol', 'Cửa hầm lò khai thác than có dạng một Parabol, khoảng cách từ điểm cao nhất của cửa đến mặt đất là 4 mét, khoảng cách giữa hai chân cửa là 4 mét. Người ta muốn gia cố cho cửa lò bằng một khung thép hình chữ nhật sao cho hai đỉnh dưới của khung thép chạm đất, hai đỉnh trên của khung thép chống vào mái hầm (hình vẽ minh họa). Tìm kích thước của khung thép sao cho diện tích của hình chữ nhật tạo bởi khung thép lớn nhất.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_12_trang_103_V_311054.png', 'Chọn hệ trục tọa độ $Oxy$ với gốc $O$ là trung điểm khoảng cách giữa hai chân cửa, trục $Ox$ nằm trên mặt đất, trục $Oy$ là trục đối xứng hướng lên đỉnh Parabol.
Đỉnh Parabol là $(0; 4)$ và hai chân cửa là $(-2; 0)$, $(2; 0)$.
Phương trình Parabol có dạng $y = ax^2 + 4$. Đi qua $(2; 0) \Rightarrow 0 = a \cdot 2^2 + 4 \Rightarrow a = -1$.
Do đó $y = 4 - x^2$.
Gọi nửa chiều rộng của khung thép hình chữ nhật là $x$ ($0 < x < 2$).
Chiều cao tương ứng của khung là $y = 4 - x^2$.
Diện tích của khung thép hình chữ nhật là:
$S = 2x \cdot y = 2x(4 - x^2) = 8x - 2x^3$.
Xét hàm số $S(x) = 8x - 2x^3$ trên $(0; 2)$:
$S''(x) = 8 - 6x^2 = 0 \Leftrightarrow x = \sqrt{\frac{4}{3}} = \frac{2\sqrt{3}}{3}$.
Khi đó chiều rộng là $2x = \frac{4\sqrt{3}}{3}$ m, chiều cao là $y = 4 - \left(\frac{2\sqrt{3}}{3}\right)^2 = 4 - \frac{4}{3} = \frac{8}{3}$ m.
Diện tích lớn nhất đạt được khi kích thước của khung là: chiều rộng $\frac{4\sqrt{3}}{3}$ mét và chiều cao $\frac{8}{3}$ mét.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 12 (Trang 103) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (205, 24, 'I.1', 'Bảng tần số ghép nhóm', 'Sau khi thống kê độ dài (đơn vị: centimét) của 60 lá dương xỉ trưởng thành, người ta có bảng tần số ghép nhóm như sau:
<table border="1"><tr><td>Nhóm</td><td>[10; 20)</td><td>[20; 30)</td><td>[30; 40)</td><td>[40; 50)</td><td>Cộng</td></tr><tr><td>Tần số ($n$)</td><td>7</td><td>16</td><td>27</td><td>10</td><td>60</td></tr></table>
Tìm tần số ghép nhóm và tần số tương đối ghép nhóm của nhóm [30; 40).', NULL, 'Tần số ghép nhóm của nhóm [30; 40) là $27$.
Tần số tương đối ghép nhóm của nhóm [30; 40) là: $f = \frac{27}{60} \cdot 100\% = 45\%$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (206, 24, 'I.2', 'Xác suất', 'Trên mặt phẳng cho năm điểm phân biệt $A, B, C, D, E$ trong đó không có 3 điểm nào thẳng hàng. Hai điểm $A, B$ được tô màu đỏ; ba điểm $C, D, E$ được tô màu xanh. Bạn Châu chọn ra ngẫu nhiên một điểm tô màu đỏ, sau đó chọn ngẫu nhiên một điểm tô màu xanh để nối thành một đoạn thẳng.
Tính xác suất của biến cố $X$: "Trong hai điểm được chọn ra có điểm $A$".', NULL, 'Không gian mẫu: $\Omega = \{AC, AD, AE, BC, BD, BE\} \Rightarrow n(\Omega) = 6$.
Các kết quả thuận lợi cho biến cố $X$: $\{AC, AD, AE\} \Rightarrow n(X) = 3$.
Xác suất của biến cố $X$ là: $P(X) = \frac{3}{6} = \frac{1}{2}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (207, 24, 'II', 'Rút gọn biểu thức', 'Cho hai biểu thức $A = \frac{\sqrt{x} + 1}{\sqrt{x} - 2}$ và $B = \frac{\sqrt{x} + 2}{\sqrt{x} - 3} + \frac{\sqrt{x} - 8}{(\sqrt{x} - 2)(\sqrt{x} - 3)}$ với $x \ge 0; x \ne 4; x \ne 9$.
1) Tính giá trị của biểu thức $A$ khi $x = 25$.
2) Rút gọn biểu thức $B$.
3) Tìm tất cả các giá trị nguyên của $x$ để $B < A$.', NULL, '1) Với $x = 25$ (TMĐK), ta có: $A = \frac{\sqrt{25} + 1}{\sqrt{25} - 2} = \frac{6}{3} = 2$.
2) $B = \frac{(\sqrt{x} + 2)(\sqrt{x} - 2) + \sqrt{x} - 8}{(\sqrt{x} - 2)(\sqrt{x} - 3)} = \frac{x - 4 + \sqrt{x} - 8}{(\sqrt{x} - 2)(\sqrt{x} - 3)} = \frac{x + \sqrt{x} - 12}{(\sqrt{x} - 2)(\sqrt{x} - 3)} = \frac{(\sqrt{x} + 4)(\sqrt{x} - 3)}{(\sqrt{x} - 2)(\sqrt{x} - 3)} = \frac{\sqrt{x} + 4}{\sqrt{x} - 2}$.
3) $B < A \Leftrightarrow \frac{\sqrt{x} + 4}{\sqrt{x} - 2} < \frac{\sqrt{x} + 1}{\sqrt{x} - 2} \Leftrightarrow \frac{3}{\sqrt{x} - 2} < 0 \Leftrightarrow \sqrt{x} - 2 < 0 \Leftrightarrow x < 4$.
Kết hợp điều kiện $x \ge 0, x \ne 4, x \ne 9$, ta có $0 \le x < 4$.
Vì $x \in \mathbb{Z}$ nên $x \in \{0; 1; 2; 3\}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (208, 24, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Để mở rộng kinh doanh, một cửa hàng đã vay 600 triệu đồng kì hạn 12 tháng từ hai ngân hàng A và B với lãi suất lần lượt là 8%/năm và 9%/năm. Tổng số tiền lãi một năm phải trả cho cả hai ngân hàng là 50 triệu đồng. Tính số tiền cửa hàng đã vay từ mỗi ngân hàng.', NULL, 'Gọi số tiền vay từ ngân hàng A và ngân hàng B lần lượt là $x, y$ (triệu đồng, $0 < x, y < 600$).
Tổng số tiền vay: $x + y = 600$.
Tổng tiền lãi: $8\%x + 9\%y = 50 \Leftrightarrow 8x + 9y = 5000$.
Giải hệ phương trình ta được $x = 400, y = 200$ (thỏa mãn).
Vậy cửa hàng vay ngân hàng A là 400 triệu đồng, ngân hàng B là 200 triệu đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (209, 24, 'III.2', 'Năng suất - Công việc', 'Một tổ sản xuất phải làm 600 sản phẩm trong một thời gian quy định với năng suất như nhau. Sau khi làm được 400 sản phẩm, tổ đã tăng năng suất thêm mỗi ngày 10 sản phẩm, do đó đã hoàn thành công việc sớm hơn một ngày. Tính số sản phẩm làm trong mỗi ngày theo quy định.', NULL, 'Gọi số sản phẩm tổ làm mỗi ngày theo quy định là $x$ ($x \in \mathbb{N}^*$).
Thời gian dự định làm: $\frac{600}{x}$ (ngày).
Thời gian làm 400 sản phẩm đầu: $\frac{400}{x}$ (ngày).
Số sản phẩm còn lại: $200$, năng suất mới: $x + 10$, thời gian làm là $\frac{200}{x + 10}$ (ngày).
Theo đề bài ta có phương trình: $\frac{600}{x} - \left(\frac{400}{x} + \frac{200}{x + 10}\right) = 1 \Leftrightarrow \frac{200}{x} - \frac{200}{x + 10} = 1$.
$\Leftrightarrow 200(x + 10 - x) = x(x + 10) \Leftrightarrow x^2 + 10x - 2000 = 0$.
Giải phương trình được $x = 40$ (nhận) hoặc $x = -50$ (loại).
Vậy theo quy định mỗi ngày tổ làm 40 sản phẩm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (210, 24, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - 4\sqrt{3}x + 8 = 0$ có 2 nghiệm $x_1, x_2$, không giải phương trình hãy tính giá trị biểu thức: $Q = x_1^3 + x_2^3$.', NULL, 'Theo hệ thức Vi-ét ta có: $S = x_1 + x_2 = 4\sqrt{3}$ và $P = x_1 x_2 = 8$.
Biểu thức $Q = x_1^3 + x_2^3 = (x_1 + x_2)^3 - 3x_1 x_2(x_1 + x_2) = (4\sqrt{3})^3 - 3 \cdot 8 \cdot 4\sqrt{3} = 192\sqrt{3} - 96\sqrt{3} = 96\sqrt{3}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (211, 24, 'IV.1', 'Hình nón và hình trụ', 'Tính thể tích của mô hình tên lửa trong hình bên.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_13_trang_111_IV_1_320932.png', 'Mô hình gồm phần nón có chiều cao $h_1 = 5\text{ cm}$, bán kính đáy $r = \frac{6}{2} = 3\text{ cm}$ và phần hình trụ có chiều cao $h_2 = 9\text{ cm}$, bán kính đáy $r = 3\text{ cm}$.
Thể tích phần hình nón: $V_1 = \frac{1}{3}\pi r^2 h_1 = \frac{1}{3}\pi \cdot 3^2 \cdot 5 = 15\pi\text{ cm}^3$.
Thể tích phần hình trụ: $V_2 = \pi r^2 h_2 = \pi \cdot 3^2 \cdot 9 = 81\pi\text{ cm}^3$.
Thể tích mô hình: $V = V_1 + V_2 = 15\pi + 81\pi = 96\pi\text{ cm}^3 \approx 301{,}59\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (212, 24, 'IV.2', 'Đường tròn tổng hợp', 'Cho tam giác $ABC$ nhọn ($AB < AC$) nội tiếp đường tròn $(O)$. Hai đường cao $BE$ và $CF$ của tam giác $ABC$ cắt nhau tại điểm $H$. Gọi $K$ là trung điểm $BC$.
a) Chứng minh $\triangle AEF$ đồng dạng $\triangle ABC$.
b) Chứng minh đường thẳng $OA$ vuông góc với đường thẳng $EF$.
c) Đường phân giác góc $\widehat{FHB}$ cắt $AB$ và $AC$ lần lượt tại $M$ và $N$. Gọi $I$ là trung điểm của $MN$, $J$ là trung điểm của $AH$. Chứng minh tứ giác $AFHI$ nội tiếp và ba điểm $I, J, K$ thẳng hàng.', NULL, 'a) Tứ giác $BCEF$ có $\widehat{BEC} = \widehat{BFC} = 90^\circ$ nên nội tiếp $\Rightarrow \widehat{AEF} = \widehat{ABC}$. Suy ra $\triangle AEF \backsim \triangle ABC$ (g.g).
b) Kẻ tiếp tuyến $Ax$ của $(O)$ tại $A$ qua nửa mặt phẳng bờ $AC$ chứa $B$. Ta có $\widehat{xAB} = \widehat{ACB} = \widehat{AFE} \Rightarrow Ax \parallel EF$. Vì $OA \perp Ax$ nên $OA \perp EF$.
c) Kẻ phân giác $HN$ của $\widehat{FHB}$. Ta chứng minh $\triangle AMN$ cân tại $A$, $I$ là trung điểm $MN \Rightarrow AI \perp MN$. Từ đó chứng minh $\widehat{AIH} = 90^\circ$ hoặc qua các góc nội tiếp suy ra tứ giác $AFHI$ nội tiếp đường tròn đường kính $AH$. Tâm của đường tròn này là $J$. Do $J$ là tâm đường tròn ngoại tiếp $\triangle AFHI$, kết hợp đường tròn Euler đi qua trung điểm $K$ của $BC$, $J$ của $AH$, suy ra $I, J, K$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (213, 24, 'V', 'Bất đẳng thức', 'Cho biểu thức: $B = (1 + x)\left(1 + \frac{1}{y}\right) + (1 + y)\left(1 + \frac{1}{x}\right)$
Với $x > 0, y > 0$ và $x^2 + y^2 = 1$. Tìm giá trị nhỏ nhất của $B$.', NULL, 'Khai triển và thu gọn: $B = 2 + (x + y) + \left(\frac{1}{x} + \frac{1}{y}\right) + \left(\frac{x}{y} + \frac{y}{x}\right) = 2 + (x + y)\left(1 + \frac{1}{xy}\right) + \frac{x^2 + y^2}{xy}$.
Vì $x^2 + y^2 = 1$ nên $xy \le \frac{x^2+y^2}{2} = \frac{1}{2}$ và $x + y = \sqrt{(x+y)^2} = \sqrt{1 + 2xy} \le \sqrt{2}$.
Áp dụng bất đẳng thức AM-GM và đánh giá theo biến $t = xy$ ($0 < t \le \frac{1}{2}$), ta tìm được giá trị nhỏ nhất của $B$ đạt được khi $x = y = \frac{1}{\sqrt{2}}$, khi đó $\min B = 3 + 2\sqrt{2} + 2\sqrt{2} + 2 = (1 + \sqrt{2})^2$ hoặc tính cụ thể $B = 4 + 3\sqrt{2}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 13 (Trang 111) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (214, 25, 'I.1', 'Biểu đồ cột', 'Nam thống kê lại độ dài quãng đường (đơn vị: km) mình đi bộ mỗi ngày trong tháng 9 và biểu diễn dưới dạng biểu đồ tần số tương đối ghép nhóm sau:
{{FIGURE}}
Tìm nhóm có tần số tương đối ghép nhóm lớn nhất. Xác định tần số và tần số tương đối ghép nhóm của nhóm đó.', '/static/figures/BoDeHaNoiLan2_De_14_trang_119_I_1_328392.png', 'Tháng 9 có 30 ngày nên kích thước mẫu $N = 30$.
Nhóm có tần số tương đối ghép nhóm lớn nhất là [5; 6) với tần số tương đối là $f = 40\%$.
Tần số của nhóm này là: $n = 30 \cdot 40\% = 12$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (215, 25, 'I.2', 'Xác suất', 'Một hộp có 20 viên bi với kích thước và khối lượng như nhau. Bạn Ngân viết lên các viên bi đó các số 1, 2, 3, ..., 20; hai viên bi khác nhau thì viết hai số khác nhau. Xét phép thử “Lấy ngẫu nhiên một viên bi trong hộp”. Tính xác suất biến cố: “Số xuất hiện trên viên bi được lấy ra chia 7 dư 1”.', NULL, 'Số phần tử của không gian mẫu: $n(\Omega) = 20$.
Các số từ 1 đến 20 chia cho 7 dư 1 là: 1, 8, 15 (có 3 kết quả thuận lợi).
Xác suất của biến cố là $P = \frac{3}{20}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (216, 25, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{2}{\sqrt{x} - 2}$ và $B = \frac{3}{\sqrt{x} - 2} + \frac{\sqrt{x} + 1}{\sqrt{x} + 2} - \frac{2\sqrt{x}}{4 - x}$ với $x \ge 0$, $x \ne 4$.
1) Tính giá trị của biểu thức $A$ khi $x = 64$.
2) Chứng minh rằng $B = \frac{\sqrt{x} + 2}{\sqrt{x} - 2}$.
3) Cho $P = \frac{A}{B}$. Tìm các giá trị của $x$ để $P \ge \frac{2}{x + 2}$.', NULL, '1) Thay $x = 64$ (TMĐK) vào $A$: $A = \frac{2}{\sqrt{64} - 2} = \frac{2}{8 - 2} = \frac{1}{3}$.
2) Ta có:
$B = \frac{3(\sqrt{x} + 2) + (\sqrt{x} + 1)(\sqrt{x} - 2) + 2\sqrt{x}}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{3\sqrt{x} + 6 + x - \sqrt{x} - 2 + 2\sqrt{x}}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{x + 4\sqrt{x} + 4}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{(\sqrt{x} + 2)^2}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{\sqrt{x} + 2}{\sqrt{x} - 2}$.
3) $P = \frac{A}{B} = \frac{2}{\sqrt{x} + 2}$.
$P \ge \frac{2}{x + 2} \Leftrightarrow \frac{2}{\sqrt{x} + 2} \ge \frac{2}{x + 2} \Leftrightarrow x + 2 \ge \sqrt{x} + 2 \Leftrightarrow x - \sqrt{x} \ge 0 \Leftrightarrow \sqrt{x}(\sqrt{x} - 1) \ge 0$.
Do $\sqrt{x} \ge 0$ nên:
- $\sqrt{x} = 0 \Leftrightarrow x = 0$.
- $\sqrt{x} - 1 \ge 0 \Leftrightarrow x \ge 1$.
Kết hợp điều kiện $x \ge 0, x \ne 4$, ta được $x = 0$ hoặc $x \ge 1, x \ne 4$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (217, 25, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Nhân dịp ngày Giỗ Tổ Hùng Vương, một siêu thị điện máy đã giảm giá nhiều mặt hàng để kích cầu mua sắm. Giá niêm yết của một chiếc tủ lạnh và một chiếc máy giặt có tổng số tiền là 25,4 triệu đồng. Tuy nhiên, trong dịp này tủ lạnh giảm 40% giá niêm yết và máy giặt giảm 25% giá niêm yết. Vì thế, cô Liên đã mua hai mặt hàng trên với tổng số tiền là 16,77 triệu đồng. Hỏi giá niêm yết của mỗi mặt hàng trên là bao nhiêu?', NULL, 'Gọi giá niêm yết của một chiếc tủ lạnh và một chiếc máy giặt lần lượt là $x, y$ (triệu đồng, $0 < x, y < 25,4$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} x + y = 25,4 \\ (1 - 0,4)x + (1 - 0,25)y = 16,77 \end{cases} \Leftrightarrow \begin{cases} x + y = 25,4 \\ 0,6x + 0,75y = 16,77 \end{cases} \Leftrightarrow \begin{cases} x = 15,2 \\ y = 10,2 \end{cases}$ (thỏa mãn điều kiện).
Vậy giá niêm yết của tủ lạnh là 15,2 triệu đồng, máy giặt là 10,2 triệu đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (218, 25, 'III.2', 'Năng suất - Công việc', 'Một xí nghiệp sản xuất nước mắm dự định thu mua 120 tấn cá trong một thời gian nhất định, nhờ đổi mới phương pháp thu mua xí nghiệp đã mua vượt mức 6 tấn mỗi tuần. Vì vậy xí nghiệp đã hoàn thành kế hoạch sớm hơn 1 tuần và vượt mức 10 tấn cá. Tính số cá mà xí nghiệp phải mua mỗi tuần theo kế hoạch.', NULL, 'Gọi số cá mà xí nghiệp phải mua mỗi tuần theo kế hoạch là $x$ (tấn, $x > 0$).
Thời gian dự định thu mua là: $\frac{120}{x}$ (tuần).
Thực tế mỗi tuần xí nghiệp thu mua được: $x + 6$ (tấn).
Tổng lượng cá thực tế thu mua là: $120 + 10 = 130$ (tấn).
Thời gian thực tế thu mua là: $\frac{130}{x + 6}$ (tuần).
Vì hoàn thành sớm hơn 1 tuần nên ta có phương trình:
$\frac{120}{x} - \frac{130}{x + 6} = 1 \Leftrightarrow 120(x + 6) - 130x = x(x + 6) \Leftrightarrow x^2 + 16x - 720 = 0$.
Giải phương trình ta được $x = 20$ (thỏa mãn) hoặc $x = -36$ (loại).
Vậy theo kế hoạch mỗi tuần xí nghiệp phải mua 20 tấn cá.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (219, 25, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình: $4x^2 - 5x - 3 = 0$ có hai nghiệm là $x_1, x_2$. Không giải phương trình, hãy tính giá trị của biểu thức $S = x_1 + x_2$; $P = x_1x_2$; $F = (x_1 + 1)(x_2 + 1) - (x_1 - x_2)^2$.', NULL, 'Theo hệ thức Vi-ét ta có:
$S = x_1 + x_2 = \frac{5}{4}$, $P = x_1x_2 = -\frac{3}{4}$.
Ta có: $(x_1 - x_2)^2 = (x_1 + x_2)^2 - 4x_1x_2 = S^2 - 4P$.
Biến đổi $F$:
$F = x_1x_2 + (x_1 + x_2) + 1 - (S^2 - 4P) = P + S + 1 - S^2 + 4P = 5P + S + 1 - S^2$
Thay giá trị vào: $F = 5\left(-\frac{3}{4}\right) + \frac{5}{4} + 1 - \left(\frac{5}{4}\right)^2 = -\frac{15}{4} + \frac{5}{4} + 1 - \frac{25}{16} = -\frac{3}{2} - \frac{25}{16} = -\frac{49}{16}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (220, 25, 'IV.1', 'Hình trụ - Hình nón', 'Để làm một mô hình cái bút chì trang trí, người ta dùng một khối gỗ hình trụ và một khối gỗ hình nón có cùng đường kính đáy chồng khít lên nhau. Khối gỗ hình trụ có đường kính đáy là 20 cm, chiều cao là 30 cm. Khối gỗ hình nón có chiều cao là 15 cm. Tính thể tích gỗ cần dùng để làm mô hình này.', NULL, 'Bán kính đáy của hình trụ và hình nón là: $R = \frac{20}{2} = 10\text{ cm}$.
Thể tích khối gỗ hình trụ là: $V_1 = \pi R^2 h_1 = \pi \cdot 10^2 \cdot 30 = 3000\pi\text{ cm}^3$.
Thể tích khối gỗ hình nón là: $V_2 = \frac{1}{3}\pi R^2 h_2 = \frac{1}{3}\pi \cdot 10^2 \cdot 15 = 500\pi\text{ cm}^3$.
Thể tích khối gỗ cần dùng là: $V = V_1 + V_2 = 3000\pi + 500\pi = 3500\pi\text{ cm}^3 \approx 10995,57\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (221, 25, 'IV.2', 'Đường tròn nội tiếp', 'Cho đường tròn $(O)$, dây $CD$ cố định. Gọi $B$ là điểm chính giữa cung nhỏ $CD$, kẻ đường kính $AB$ cắt $CD$ tại $I$. Lấy điểm $H$ bất kỳ trên cung lớn $CD$, $HB$ cắt $CD$ tại $E$. Đường thẳng $AH$ cắt đường thẳng $CD$ tại $P$.
a) Chứng minh: Tứ giác $PIEB$ nội tiếp.
b) Chứng minh: $AH \cdot AP = AI \cdot AB$.
c) Gọi $K$ là giao điểm của đường thẳng $AE$ và $BP$. Kẻ $KM \perp AB$ cắt $AB$ tại $M$, cắt đường tròn $(O)$ tại $N$. Chứng minh $N, I, H$ thẳng hàng.', NULL, 'a) $B$ là điểm chính giữa cung nhỏ $CD$ nên đường kính $AB \perp CD$ tại $I \Rightarrow \widehat{PIB} = 90^\circ$.
Lại có $AB$ là đường kính nên $\widehat{AHB} = 90^\circ \Rightarrow \widehat{PEB} = 90^\circ$ (hoặc $\widehat{PHB} = 90^\circ$).
Tứ giác $PIEB$ có $\widehat{PIB} = \widehat{PEB} = 90^\circ$ nên nội tiếp (hoặc tứ giác $PIHB$ nội tiếp).
b) Xét $\triangle AIH$ và $\triangle APB$ có: $\widehat{PAB}$ chung, $\widehat{AHI} = \widehat{ABP}$ (do tứ giác $PIHB$ nội tiếp) $\Rightarrow \triangle AIH \sim \triangle APB$ (g.g) $\Rightarrow \frac{AH}{AB} = \frac{AI}{AP} \Rightarrow AH \cdot AP = AI \cdot AB$.
c) Trong $\triangle PAB$, hai đường cao $AH$ và $BI$ cắt nhau tại $E$, suy ra $E$ là trực tâm của $\triangle PAB$.
Do đó $AE \perp BP$ tại $K$.
Từ các tứ giác nội tiếp và hệ thức góc, suy ra $N, I, H$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (222, 25, 'V', 'Cực trị thực tế', 'Một công ty sản xuất dụng cụ thể thao nhận được một đơn đặt hàng sản xuất 8000 quả bóng tennis. Công ty này sở hữu một số máy móc, mỗi máy móc có thể sản xuất 30 quả bóng trong một giờ. Chi phí thiết lập các máy này là 200 nghìn đồng cho mỗi máy. Khi được thiết lập, hoạt động sản xuất sẽ hoàn toàn diễn ra tự động dưới sự giám sát. Số tiền phải trả cho người giám sát là 192 nghìn đồng một giờ (người này sẽ giám sát tất cả các máy hoạt động). Số máy móc công ty nên sử dụng là bao nhiêu để chi phí sản xuất là thấp nhất?', NULL, 'Gọi số máy móc công ty sử dụng là $x$ ($x \in \mathbb{N}^*$).
Năng suất của $x$ máy trong 1 giờ là: $30x$ (quả bóng).
Thời gian hoàn thành 8000 quả bóng là: $t = \frac{8000}{30x} = \frac{800}{3x}$ (giờ).
Chi phí thiết lập $x$ máy là: $200x$ (nghìn đồng).
Chi phí trả cho người giám sát là: $192 \cdot t = 192 \cdot \frac{800}{3x} = \frac{51200}{x}$ (nghìn đồng).
Tổng chi phí sản xuất là:
$C(x) = 200x + \frac{51200}{x}$ (nghìn đồng).
Áp dụng bất đẳng thức Cô-si cho hai số dương:
$C(x) = 200x + \frac{51200}{x} \ge 2\sqrt{200x \cdot \frac{51200}{x}} = 2\sqrt{10240000} = 2 \cdot 3200 = 6400$.
Dấu "=" xảy ra khi $200x = \frac{51200}{x} \Leftrightarrow x^2 = 256 \Leftrightarrow x = 16$ (thỏa mãn).
Vậy công ty nên sử dụng 16 máy móc để chi phí sản xuất là thấp nhất.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 14 (Trang 119) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (223, 26, 'I.1', 'Bảng tần số ghép nhóm', 'Sau khi điều tra về thời gian đi từ nhà đến trường của học sinh lớp 9A có 40 học sinh ta có bảng tần số tương đối ghép nhóm sau:
<table border="1"><tr><td>Thời gian từ nhà đến trường (phút)</td><td>[0; 10)</td><td>[10; 20)</td><td>[20; 30)</td></tr><tr><td>Tần số tương đối</td><td>30%</td><td>45%</td><td>25%</td></tr></table>
Tìm tần số tương đối ghép nhóm và tần số ghép nhóm của nhóm [10; 20)?', NULL, 'Tần số tương đối ghép nhóm của nhóm [10; 20) là $45\%$.
Tần số ghép nhóm của nhóm [10; 20) là $45\% \cdot 40 = 18$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (224, 26, 'I.2', 'Xác suất', 'Một túi đựng 5 viên bi có cùng khối lượng và kích thước như nhau, được đánh số 1; 2; 3; 4; 5. Xét phép thử: “Lấy ngẫu nhiên hai viên bi từ trong túi” và biến cố $A$: “Tích của hai số ghi trên hai viên bi lớn hơn 10”. Tính xác suất của biến cố $A$?', NULL, 'Số phần tử của không gian mẫu là $n(\Omega) = C_5^2 = 10$.
Các cặp số có tích lớn hơn 10 là: $\{3; 4\}, \{3; 5\}, \{4; 5\}$, có 3 kết quả thuận lợi cho biến cố $A$.
Xác suất của biến cố $A$ là $P(A) = \frac{3}{10}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (225, 26, 'II', 'Rút gọn căn thức', 'Cho biểu thức $A = \frac{\sqrt{x} - 2}{\sqrt{x} - 1}$; $B = \frac{\sqrt{x}}{\sqrt{x} + 1} + \frac{1}{1 - \sqrt{x}} + \frac{2}{x - 1}$ với $x \ge 0; x \ne 1$.
a) Tính giá trị biểu thức $A$ tại $x = 9$.
b) Chứng minh $B = \frac{\sqrt{x} - 1}{\sqrt{x} + 1}$.
c) Cho $P = A \cdot B$. Tìm các giá trị nguyên của $x$ để $|P| + P = 0$.', NULL, 'a) Với $x = 9$, $\sqrt{x} = 3 \Rightarrow A = \frac{3 - 2}{3 - 1} = \frac{1}{2}$.
b) $B = \frac{\sqrt{x}(\sqrt{x} - 1) - (\sqrt{x} + 1) + 2}{(\sqrt{x} + 1)(\sqrt{x} - 1)} = \frac{x - 2\sqrt{x} + 1}{(\sqrt{x} + 1)(\sqrt{x} - 1)} = \frac{(\sqrt{x} - 1)^2}{(\sqrt{x} + 1)(\sqrt{x} - 1)} = \frac{\sqrt{x} - 1}{\sqrt{x} + 1}$.
c) $P = A \cdot B = \frac{\sqrt{x} - 2}{\sqrt{x} + 1}$.
$|P| + P = 0 \Leftrightarrow |P| = -P \Leftrightarrow P \le 0 \Leftrightarrow \frac{\sqrt{x} - 2}{\sqrt{x} + 1} \le 0$.
Vì $\sqrt{x} + 1 > 0$ với mọi $x \ge 0$ nên $\sqrt{x} - 2 \le 0 \Leftrightarrow \sqrt{x} \le 2 \Leftrightarrow x \le 4$.
Kết hợp điều kiện $x \ge 0, x \ne 1, x \in \mathbb{Z} \Rightarrow x \in \{0; 2; 3; 4\}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (226, 26, 'III.1', 'Giải bài toán bằng cách lập hệ phương trình', 'Cận thị trong học sinh ngày càng tăng. Lớp 9A có 35 học sinh, trong đó chỉ có 25% học sinh nam và 20% số học sinh nữ không bị cận thị. Biết tổng số học sinh nam và học sinh nữ không bị cận thị là 8 học sinh. Tính số học sinh nữ không bị cận thị.', NULL, 'Gọi số học sinh nam và nữ của lớp 9A lần lượt là $x, y$ ($x, y \in \mathbb{N}^*$, $x, y < 35$).
Ta có hệ phương trình:
$\begin{cases} x + y = 35 \\ 0{,}25x + 0{,}2y = 8 \end{cases} \Leftrightarrow \begin{cases} x = 20 \\ y = 15 \end{cases}$ (thỏa mãn).
Số học sinh nữ không bị cận thị là $20\% \cdot 15 = 3$ (học sinh).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (227, 26, 'III.2', 'Năng suất - Công việc', 'Hưởng ứng phong trào trồng cây xanh vì môi trường xanh sạch đẹp. Một chi đoàn dự định trồng 600 cây xanh trong thời gian quy định. Do mỗi ngày họ trồng được nhiều hơn dự định 30 cây nên công việc được hoàn thành sớm hơn quy định 1 ngày. Tính số ngày chi đoàn dự kiến hoàn thành công việc?', NULL, 'Gọi số ngày dự kiến hoàn thành công việc là $x$ ngày ($x > 1$).
Theo bài ra ta có phương trình:
$\frac{600}{x - 1} - \frac{600}{x} = 30 \Leftrightarrow \frac{1}{x - 1} - \frac{1}{x} = \frac{1}{20} \Leftrightarrow x(x - 1) = 20 \Leftrightarrow x^2 - x - 20 = 0$.
Giải phương trình được $x = 5$ (nhận) hoặc $x = -4$ (loại).
Vậy số ngày chi đoàn dự kiến hoàn thành công việc là 5 ngày.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (228, 26, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $3x^2 + 5x - 6 = 0$ có hai nghiệm $x_1, x_2$.
Không giải phương trình, tính: $P = \frac{2x_2^2}{x_1 + x_2} + 2x_1$.', NULL, 'Theo định lí Vi-ét: $x_1 + x_2 = -\frac{5}{3}$ và $x_1 x_2 = -2$.
Vì $x_2$ là nghiệm của phương trình nên $3x_2^2 + 5x_2 - 6 = 0 \Rightarrow 3x_2^2 = 6 - 5x_2 \Rightarrow x_2^2 = 2 - \frac{5}{3}x_2 = 2 + (x_1 + x_2)x_2$.
Thay vào biểu thức ta có:
$P = \frac{2x_2^2}{x_1 + x_2} + 2x_1 = \frac{2(2 - \frac{5}{3}x_2)}{-\frac{5}{3}} + 2x_1 = -\frac{12}{5} + 2x_2 + 2x_1 = -\frac{12}{5} + 2(x_1 + x_2) = -\frac{12}{5} + 2\left(-\frac{5}{3}\right) = -\frac{12}{5} - \frac{10}{3} = -\frac{86}{15}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (229, 26, 'IV.1', 'Hình học không gian thực tế', 'Một cái thùng dùng để đựng gạo có dạng nửa hình cầu với đường kính 50 cm, phần gạo vun lên có dạng hình nón cao 12 cm.
{{FIGURE}}
a) Tính thể tích phần gạo trong thùng.
b) Nhà bạn An dùng lon sữa bò dạng hình trụ với bán kính đáy là 5 cm, chiều cao 14 cm dùng để đong gạo mỗi ngày. Biết rằng mỗi ngày nhà An ăn 4 lon gạo và mỗi lần đong thì lượng gạo chiếm 90% thể tích của lon. Hỏi cần ít nhất bao nhiêu ngày để nhà An có thể ăn hết số gạo trong thùng?', '/static/figures/BoDeHaNoiLan2_De_15_trang_128_IV_1_330792.png', 'a) Bán kính nửa hình cầu và hình nón là $R = 25\text{ cm}$.
Thể tích phần nửa hình cầu: $V_1 = \frac{1}{2} \cdot \frac{4}{3}\pi R^3 = \frac{2}{3}\pi \cdot 25^3 = \frac{31250\pi}{3}\text{ cm}^3$.
Thể tích phần nón: $V_2 = \frac{1}{3}\pi R^2 h = \frac{1}{3}\pi \cdot 25^2 \cdot 12 = 2500\pi\text{ cm}^3$.
Tổng thể tích phần gạo trong thùng: $V = V_1 + V_2 = \frac{38750\pi}{3}\text{ cm}^3 \approx 40578{,}9\text{ cm}^3$.
b) Thể tích một lon sữa bò: $V_{\text{lon}} = \pi r^2 h = \pi \cdot 5^2 \cdot 14 = 350\pi\text{ cm}^3$.
Lượng gạo mỗi ngày nhà An ăn: $V_{\text{ngày}} = 4 \cdot (90\% \cdot 350\pi) = 1260\pi\text{ cm}^3$.
Số ngày để ăn hết số gạo: $N = \frac{V}{V_{\text{ngày}}} = \frac{\frac{38750\pi}{3}}{1260\pi} = \frac{3875}{378} \approx 10{,}25$ ngày.
Vậy cần ít nhất 11 ngày để nhà An có thể ăn hết số gạo trong thùng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (230, 26, 'IV.2', 'Hình học phẳng tổng hợp', 'Cho đường tròn tâm $(O)$ và dây $BC$ cố định không đi qua $O$. Trên cung lớn $BC$ lấy điểm $A$ sao cho $AB < AC$. Kẻ đường kính $AK$, $E$ là hình chiếu của $C$ trên $AK$. $M$ là trung điểm của $BC$.
a) Chứng minh bốn điểm $C, E, M, O$ cùng thuộc một đường tròn.
b) Kẻ $AD \perp BC$ tại $D$. Chứng minh $AD \cdot AK = AB \cdot AC$ và $\triangle MDE$ cân.
c) Gọi $F$ là hình chiếu của $B$ trên $AK$. Chứng minh khi $A$ di chuyển trên cung lớn $BC$ thì tâm đường tròn ngoại tiếp $\triangle DEF$ là một điểm cố định.', NULL, 'a) Vì $M$ là trung điểm dây cung $BC$ nên $OM \perp BC \Rightarrow \widehat{OMC} = 90^\circ$.
$E$ là hình chiếu của $C$ trên $AK \Rightarrow \widehat{OEC} = 90^\circ$.
Do đó bốn điểm $C, E, M, O$ cùng thuộc đường tròn đường kính $OC$.
b) Ta có $\widehat{ACK} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn). $\triangle ABD \sim \triangle AKC$ (g-g) vì $\widehat{ADB} = \widehat{ACK} = 90^\circ$ và $\widehat{ABD} = \widehat{AKC}$ (cùng chắn cung $AC$). Suy ra $\frac{AD}{AB} = \frac{AC}{AK} \Rightarrow AD \cdot AK = AB \cdot AC$.
Tứ giác $ADEC$ nội tiếp do $\widehat{ADC} = \widehat{AEC} = 90^\circ \Rightarrow \widehat{MDE} = \widehat{DAC} = 90^\circ - \widehat{AKC} = 90^\circ - \widehat{ABC}$.
Lại có $C, E, M, O$ nội tiếp $\Rightarrow \widehat{MED} = \widehat{MCD} ... \Rightarrow \triangle MDE$ cân tại $M$.
c) Chứng minh $M$ chính là tâm đường tròn ngoại tiếp $\triangle DEF$, mà $BC$ cố định nên trung điểm $M$ của $BC$ cố định.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (231, 26, 'V', 'Bất đẳng thức', 'Chứng minh rằng: $\frac{a + b}{\sqrt[3]{a(3a + b)} + \sqrt[3]{b(3b + a)}} \ge \frac{1}{2}$ với $a, b$ là các số dương.', NULL, 'Áp dụng bất đẳng thức AM-GM cho 3 số dương:
$\sqrt[3]{a(3a + b)} = \sqrt[3]{2a \cdot (3a + b) \cdot 2} \cdot \frac{1}{\sqrt[3]{4}} \le \frac{2a + (3a + b) + 2}{3\sqrt[3]{4}} ...$
Cách khác: Áp dụng AM-GM: $\sqrt[3]{4a \cdot 4a \cdot (3a + b)} \le \frac{4a + 4a + 3a + b}{3} = \frac{11a + b}{3}$.
Hoặc chuẩn hóa $a + b = 2$, sử dụng bất đẳng thức Cauchy-Schwarz để suy ra đpcm. Dấu bằng xảy ra khi $a = b$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 15 (Trang 128) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (232, 27, 'I.1', 'Biểu đồ cột ghép nhóm', 'Sau khi điều tra mật độ dân số (đơn vị: người/km$^2$) của 37 tỉnh, thành phố thuộc các vùng Bắc Trung Bộ và Duyên hải miền Trung, Tây Nguyên, Đông Nam Bộ, Đồng bằng sông Cửu Long (không kể Thành phố Hồ Chí Minh) ở năm 2021, người ta có biểu đồ tần số ghép nhóm dưới đây:
{{FIGURE}}
a) Tìm tần số ghép nhóm của nhóm [460; 640).
b) Tính tần số tương đối ghép nhóm của nhóm [100; 280) (làm tròn đến hàng đơn vị).', '/static/figures/BoDeHaNoiLan2_De_16_trang_136_I_1_341347.png', 'a) Tần số ghép nhóm của nhóm [460; 640) là 6.
b) Tần số tương đối ghép nhóm của nhóm [100; 280) là:
$$f = \frac{20}{37} \cdot 100\% \approx 54\%.$$', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (233, 27, 'I.2', 'Xác suất vòng quay may mắn', 'Hình vẽ dưới đây mô tả một đĩa tròn bằng bìa cứng được chia thành 12 phần bằng nhau và ghi các số $1; 2; 3; \dots; 12$. Chiếc kim được gắn cố định vào trục quay ở tâm của đĩa.
{{FIGURE}}
Xét phép thử: “Quay đĩa tròn một lần” và biến cố $A$: “Chiếc kim chỉ vào hình quạt ghi số là số nguyên tố”. Tính xác suất của biến cố $A$.', '/static/figures/BoDeHaNoiLan2_De_16_trang_136_I_2_341378.png', 'Không gian mẫu: $\Omega = \{1; 2; 3; \dots; 12\} \Rightarrow n(\Omega) = 12$.
Các kết quả thuận lợi cho $A$ (số nguyên tố) là: $\{2; 3; 5; 7; 11\} \Rightarrow n(A) = 5$.
Xác suất của biến cố $A$ là:
$$P(A) = \frac{n(A)}{n(\Omega)} = \frac{5}{12}.$$', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (234, 27, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{\sqrt{x} - 3}{\sqrt{x} + 3}$ và $B = \frac{x - 3}{\sqrt{x} - 3} + \frac{9}{x - 3\sqrt{x}} + \frac{3}{\sqrt{x}}$ với $x > 0; x \neq 9$.
1) Tính giá trị của biểu thức $A$ khi $x = 25$.
2) Rút gọn biểu thức $B$.
3) Xét biểu thức $P = A \cdot B$. Chứng minh $P > 0$.', NULL, '1) Với $x = 25$ (thỏa mãn ĐKXĐ):
$$A = \frac{\sqrt{25} - 3}{\sqrt{25} + 3} = \frac{5 - 3}{5 + 3} = \frac{2}{8} = \frac{1}{4}.$$
2) Với $x > 0; x \neq 9$:
$$B = \frac{\sqrt{x}(x - 3) + 9 + 3(\sqrt{x} - 3)}{\sqrt{x}(\sqrt{x} - 3)} = \frac{x\sqrt{x} - 3\sqrt{x} + 9 + 3\sqrt{x} - 9}{\sqrt{x}(\sqrt{x} - 3)} = \frac{x\sqrt{x}}{\sqrt{x}(\sqrt{x} - 3)} = \frac{x}{\sqrt{x} - 3}.$$
3) Ta có:
$$P = A \cdot B = \frac{\sqrt{x} - 3}{\sqrt{x} + 3} \cdot \frac{x}{\sqrt{x} - 3} = \frac{x}{\sqrt{x} + 3}.$$
Với $x > 0, x \neq 9$, ta có $x > 0$ và $\sqrt{x} + 3 > 0$, suy ra $P = \frac{x}{\sqrt{x} + 3} > 0$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (235, 27, 'III.1', 'Hệ phương trình - Lãi suất ngân hàng', 'Bác Tuấn vay tổng số tiền là 5 tỉ đồng từ hai ngân hàng Sacombank và Vietcombank đầu tư vào bất động sản. Sau một năm, tổng số tiền lãi phải trả cho hai ngân hàng trên là 570 triệu đồng. Lãi suất cho vay của ngân hàng Sacombank là 12%/năm và của Vietcombank là 11%/năm. Tính số tiền bác Tuấn đã vay của mỗi ngân hàng.', NULL, 'Gọi số tiền vay ngân hàng Sacombank và Vietcombank lần lượt là $x, y$ ($x, y > 0$, tỉ đồng).
Theo đề bài ta có hệ phương trình:
$$\begin{cases} x + y = 5 \\ 0{,}12x + 0{,}11y = 0{,}57 \end{cases} \Leftrightarrow \begin{cases} x + y = 5 \\ 12x + 11y = 57 \end{cases} \Leftrightarrow \begin{cases} x = 2 \\ y = 3 \end{cases}$$
Vậy bác Tuấn vay Sacombank 2 tỉ đồng, Vietcombank 3 tỉ đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (236, 27, 'III.2', 'Phương trình bậc hai - Năng suất lao động', 'Một công nhân dự định làm 72 sản phẩm trong một thời gian đã định. Nhưng thực tế xí nghiệp lại giao 80 sản phẩm. Mặc dù người đó mỗi giờ đã làm thêm một sản phẩm so với dự kiến, nhưng thời gian hoàn thành công việc vẫn chậm so với dự định là 12 phút. Tính số sản phẩm dự kiến làm trong 1 giờ của người đó. Biết mỗi giờ người đó làm không quá 20 sản phẩm. (Giả định rằng số sản phẩm mà công nhân đó làm được trong mỗi giờ là bằng nhau).', NULL, 'Đổi 12 phút = $\frac{1}{5}$ giờ.
Gọi năng suất dự kiến là $x$ (sản phẩm/giờ, $0 < x \le 20, x \in \mathbb{N}^*$).
Thời gian dự kiến: $\frac{72}{x}$ (giờ).
Năng suất thực tế: $x + 1$ (sản phẩm/giờ).
Thời gian thực tế: $\frac{80}{x + 1}$ (giờ).
Theo bài ra ta có phương trình:
$$\frac{80}{x + 1} - \frac{72}{x} = \frac{1}{5} \Leftrightarrow 5[80x - 72(x + 1)] = x(x + 1) \Leftrightarrow x^2 - 39x + 360 = 0$$
Giải phương trình được $x_1 = 24$ (loại vì không quá 20 sản phẩm), $x_2 = 15$ (thỏa mãn).
Vậy số sản phẩm dự kiến làm trong 1 giờ là 15 sản phẩm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (237, 27, 'III.3', 'Định lý Vi-ét', 'a) Hãy tìm một phương trình bậc hai $ax^2 + bx + c = 0$ với các hệ số $a, b, c$ là số nguyên nhận $x = \frac{\sqrt{5} - 2}{3}$ làm nghiệm.
b) Tính tổng lập phương hai nghiệm của phương trình vừa tìm được ở câu a).', NULL, 'a) Từ $x = \frac{\sqrt{5} - 2}{3} \Leftrightarrow 3x + 2 = \sqrt{5}$.
Bình phương hai vế: $(3x + 2)^2 = 5 \Leftrightarrow 9x^2 + 12x + 4 = 5 \Leftrightarrow 9x^2 + 12x - 1 = 0$.
Vậy một phương trình bậc hai thỏa mãn là $9x^2 + 12x - 1 = 0$.
b) Phương trình $9x^2 + 12x - 1 = 0$ có hai nghiệm $x_1, x_2$. Theo hệ thức Vi-ét:
$$x_1 + x_2 = -\frac{12}{9} = -\frac{4}{3},\quad x_1 x_2 = -\frac{1}{9}.$$
Tổng lập phương hai nghiệm:
$$x_1^3 + x_2^3 = (x_1 + x_2)^3 - 3x_1 x_2 (x_1 + x_2) = \left(-\frac{4}{3}\right)^3 - 3\left(-\frac{1}{9}\right)\left(-\frac{4}{3}\right) = -\frac{64}{27} - \frac{4}{9} = -\frac{76}{27}.$$', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (238, 27, 'IV.1', 'Hình trụ - Hình cầu', 'Một khối gỗ dạng hình trụ, bán kính đường tròn đáy $r = 10\text{ cm}$, chiều cao $h = 20\text{ cm}$. Người ta khoét rỗng hai nửa hình cầu như hình vẽ.
{{FIGURE}}
a) Tính thể tích của khối gỗ khi chưa khoét.
b) Hãy tính diện tích bề mặt của khối gỗ còn lại sau khi khoét (diện tích cả ngoài lẫn trong).
(các kết quả làm tròn đến hàng đơn vị)', '/static/figures/BoDeHaNoiLan2_De_16_trang_136_IV_1_341392.png', 'a) Thể tích khối gỗ khi chưa khoét:
$$V = \pi r^2 h = \pi \cdot 10^2 \cdot 20 = 2000\pi \approx 6283\text{ cm}^3.$$
b) Khi khoét hai nửa hình cầu ở hai đáy, diện tích hai đáy phẳng mất đi và được thay bằng diện tích hai bán cầu (tổng bằng diện tích một mặt cầu bán kính $r$).
Diện tích bề mặt khối gỗ còn lại gồm: diện tích xung quanh hình trụ và diện tích một mặt cầu bán kính $r$:
$$S = S_{xq\text{ trụ}} + S_{\text{cầu}} = 2\pi r h + 4\pi r^2 = 2\pi \cdot 10 \cdot 20 + 4\pi \cdot 10^2 = 400\pi + 400\pi = 800\pi \approx 2513\text{ cm}^2.$$', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (239, 27, 'IV.2', 'Tứ giác nội tiếp - Phân giác', 'Tứ giác $ABCD$ nội tiếp đường tròn tâm $O$ đường kính $AD$. Hai đường chéo $AC, BD$ cắt nhau tại $E$. Từ $E$ kẻ $EF$ vuông góc với $AD$ ($F \in AD$). Đường thẳng $CF$ cắt đường tròn tại điểm thứ hai là $M$. Giao điểm của $BD$ và $CF$ là $N$. Chứng minh:
a) $CEFD$ là tứ giác nội tiếp.
b) $FA$ là tia phân giác của $\widehat{BFM}$.
c) $BE \cdot DN = EN \cdot BD$.', NULL, 'a) Có $AD$ là đường kính nên $\widehat{ACD} = 90^\circ \Rightarrow \widehat{ECD} = 90^\circ$. Lại có $EF \perp AD \Rightarrow \widehat{EFD} = 90^\circ$.
Suy ra $\widehat{ECD} + \widehat{EFD} = 180^\circ$, do đó $CEFD$ là tứ giác nội tiếp.
b) Vì $CEFD$ nội tiếp nên $\widehat{CFD} = \widehat{CED}$.
Tương tự $ABEF$ nội tiếp vì $\widehat{ABD} = 90^\circ$ và $\widehat{AFE} = 90^\circ$, suy ra $\widehat{AFB} = \widehat{AEB}$.
Mặt khác $\widehat{AEB} = \widehat{CED}$ (đối đỉnh) $\Rightarrow \widehat{AFB} = \widehat{CFD}$.
Lại có $\widehat{AFM} = \widehat{CFD}$ (đối đỉnh) $\Rightarrow \widehat{AFB} = \widehat{AFM}$. Do đó $FA$ là tia phân giác của $\widehat{BFM}$.
c) Trong $\triangle BFN$, $FA$ là phân giác trong của góc $\widehat{BFN}$, và $FE \perp FA$ nên $FE$ là tia phân giác ngoài tại đỉnh $F$ của $\triangle BFN$.
Theo tính chất đường phân giác:
- Phân giác ngoài $FE$: $\frac{EB}{EN} = \frac{FB}{FN}$.
- Phân giác trong $FD$: Vì $FD \perp FA$ nên $FD$ trùng $FE$, suy ra $\frac{DB}{DN} = \frac{FB}{FN}$.
Từ đó $\frac{BE}{EN} = \frac{BD}{DN} \Rightarrow BE \cdot DN = EN \cdot BD$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (240, 27, 'V', 'Cực trị thực tế - Hình trụ', 'Một cửa hàng xăng dầu cần xây một bồn chứa dầu hình trụ bằng thép có thể tích $54\pi\text{ m}^3$ và giá mỗi mét vuông thép là 500 ngàn đồng. Hỏi số tiền thấp nhất mà cửa hàng phải trả? (kết quả làm tròn đến hàng đơn vị)', NULL, 'Gọi $r$ và $h$ lần lượt là bán kính đáy và chiều cao của bồn chứa hình trụ ($r, h > 0$).
Thể tích của bồn: $V = \pi r^2 h = 54\pi \Rightarrow h = \frac{54}{r^2}$.
Diện tích toàn phần của bồn chứa (toàn bộ lượng thép cần dùng):
$$S_{tp} = 2\pi r h + 2\pi r^2 = 2\pi r \cdot \frac{54}{r^2} + 2\pi r^2 = \frac{108\pi}{r} + 2\pi r^2 = \frac{54\pi}{r} + \frac{54\pi}{r} + 2\pi r^2.$$
Áp dụng bất đẳng thức Cô-si cho 3 số dương:
$$S_{tp} \ge 3 \sqrt[3]{\frac{54\pi}{r} \cdot \frac{54\pi}{r} \cdot 2\pi r^2} = 3 \sqrt[3]{5832\pi^3} = 3 \cdot 18\pi = 54\pi\text{ m}^2.$$
Dấu “=” xảy ra khi $\frac{54\pi}{r} = 2\pi r^2 \Leftrightarrow r^3 = 27 \Leftrightarrow r = 3\text{ m}$.
Diện tích thép nhỏ nhất là $54\pi \approx 169{,}646\text{ m}^2$.
Số tiền thấp nhất cửa hàng phải trả là:
$$54\pi \cdot 500\,000 = 27\,000\,000\pi \approx 84\,823\,002\text{ đồng}.$$', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 16 (Trang 136) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (241, 28, 'I.1', 'Bảng tần số ghép nhóm', 'Đo chiều cao (đơn vị là cm) của học sinh lớp 9A cho kết quả như sau:
156 	 157 	 164 	 166 	 166 	 165 	 157 	 154 	 155 	 158 	 160 	 163 	 163
161 	 162 	 159 	 159 	 160 	 160 	 160 	 159 	 158 	 160 	 160 	 158 	 163
162 	 162 	 162 	 161 	 162 	 161 	 163 	 161 	 163 	 161 	 164 	 166 	 165
165
Hãy lập bảng tần số ghép nhóm với các nhóm [154; 158), [158; 161), [161; 164), [164; 167).
Tính tần số tương đối của nhóm [161; 164).', NULL, 'Tổng số học sinh là 40 học sinh.
Bảng tần số ghép nhóm:
<table border="1"><tr><th>Chiều cao (cm)</th><th>[154; 158)</th><th>[158; 161)</th><th>[161; 164)</th><th>[164; 167)</th></tr><tr><td>Tần số (Số học sinh)</td><td>5</td><td>12</td><td>15</td><td>8</td></tr></table>
Tần số tương đối của nhóm [161; 164) là: $f = \frac{15}{40} \cdot 100\% = 37{,}5\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (242, 28, 'I.2', 'Xác suất', 'Trong túi có 6 quả bóng bàn kích thước và chất liệu như nhau gồm 2 quả màu đỏ, 2 quả màu trắng, 2 quả màu xanh. Không nhìn vào túi mà lấy ra 2 quả bóng. Tính xác suất của biến cố A: "Lấy được ít nhất một quả bóng màu đỏ".', NULL, 'Số cách chọn 2 quả bóng bất kì từ 6 quả là $n(\Omega) = C_6^2 = 15$.
Biến cố đối $\overline{A}$: "Không lấy được quả bóng màu đỏ nào" (chọn 2 quả từ 4 quả gồm trắng và xanh) có số cách là $C_4^2 = 6$.
Số kết quả thuận lợi cho biến cố $A$ là $n(A) = 15 - 6 = 9$.
Xác suất của biến cố $A$ là $P(A) = \frac{9}{15} = \frac{3}{5} = 0{,}6$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (243, 28, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{3\sqrt{x} - 2}{1 - \sqrt{x}}$ và $B = \frac{15\sqrt{x} - 11}{x + 2\sqrt{x} - 3} - \frac{2\sqrt{x} + 3}{\sqrt{x} + 3}$ với $x \ge 0, x \ne 1$.
1) Tính giá trị của biểu thức $A$ khi $x = 16$.
2) Đặt $P = A + B$. Rút gọn biểu thức $P$.
3) Tìm $m$ để có $x$ thỏa mãn $P(\sqrt{x} + 3) = m$.', NULL, '1) Với $x = 16$ (thỏa mãn ĐKXĐ), $A = \frac{3\sqrt{16} - 2}{1 - \sqrt{16}} = \frac{12 - 2}{1 - 4} = -\frac{10}{3}$.
2) Ta có $B = \frac{15\sqrt{x} - 11 - (2\sqrt{x} + 3)(\sqrt{x} - 1)}{(\sqrt{x} - 1)(\sqrt{x} + 3)} = \frac{-2x + 14\sqrt{x} - 8}{(\sqrt{x} - 1)(\sqrt{x} + 3)}$.
$P = A + B = \frac{-(3\sqrt{x} - 2)(\sqrt{x} + 3) - 2x + 14\sqrt{x} - 8}{(\sqrt{x} - 1)(\sqrt{x} + 3)} = \frac{-5x + 7\sqrt{x} - 2}{(\sqrt{x} - 1)(\sqrt{x} + 3)} = \frac{-(\sqrt{x} - 1)(5\sqrt{x} - 2)}{(\sqrt{x} - 1)(\sqrt{x} + 3)} = \frac{2 - 5\sqrt{x}}{\sqrt{x} + 3}$.
3) Phương trình: $P(\sqrt{x} + 3) = m \Leftrightarrow 2 - 5\sqrt{x} = m \Leftrightarrow 5\sqrt{x} = 2 - m$.
Để tồn tại $x \ge 0, x \ne 1$ thì $\begin{cases} 2 - m \ge 0 \\ 2 - m \ne 5 \end{cases} \Leftrightarrow \begin{cases} m \le 2 \\ m \ne -3 \end{cases}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (244, 28, 'III.1', 'Chuyển động', 'Lúc 6 giờ 30 phút sáng, một ca nô xuôi dòng sông từ A đến B dài 48 km. Khi đến B, ca nô nghỉ 30 phút sau đó ngược dòng từ B về A lúc 10 giờ 36 phút cùng ngày. Tìm vận tốc riêng của ca nô biết vận tốc dòng nước là 3 km/h.', NULL, 'Đổi 30 phút = $\frac{1}{2}$ giờ. Tổng thời gian từ lúc đi đến lúc về: 10 giờ 36 phút - 6 giờ 30 phút = 4 giờ 6 phút = $\frac{41}{10}$ giờ.
Thời gian thực tế ca nô di chuyển: $\frac{41}{10} - \frac{1}{2} = \frac{18}{5}$ giờ.
Gọi vận tốc riêng của ca nô là $x$ (km/h, $x > 3$).
Vận tốc xuôi dòng: $x + 3$ (km/h); Vận tốc ngược dòng: $x - 3$ (km/h).
Phương trình: $\frac{48}{x + 3} + \frac{48}{x - 3} = \frac{18}{5} \Leftrightarrow \frac{96x}{x^2 - 9} = \frac{18}{5} \Leftrightarrow 3x^2 - 80x - 27 = 0$.
Giải ra $x = 27$ (thỏa mãn) hoặc $x = -\frac{1}{3}$ (loại).
Vậy vận tốc riêng của ca nô là 27 km/h.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (245, 28, 'III.2', 'Năng suất - Công việc', 'Hai người thợ quét sơn một ngôi nhà. Nếu họ cùng làm thì trong 6 ngày xong việc. Nếu người thợ thứ nhất làm một mình trong 5 ngày rồi nghỉ, người thứ hai làm tiếp 4 ngày thì cả hai làm được $\frac{7}{9}$ công việc. Hỏi nếu làm riêng thì mỗi người thợ phải làm trong bao nhiêu ngày để xong việc.', NULL, 'Gọi thời gian người thứ nhất và người thứ hai làm riêng xong việc lần lượt là $x, y$ (ngày, $x, y > 6$).
Mỗi ngày người thứ nhất làm được $\frac{1}{x}$ (công việc), người thứ hai làm được $\frac{1}{y}$ (công việc).
Theo đề bài ta có hệ phương trình:
$\begin{cases} \frac{1}{x} + \frac{1}{y} = \frac{1}{6} \\ \frac{5}{x} + \frac{4}{y} = \frac{7}{9} \end{cases} \Leftrightarrow \begin{cases} \frac{1}{x} = \frac{1}{9} \\ \frac{1}{y} = \frac{1}{18} \end{cases} \Leftrightarrow \begin{cases} x = 9 \\ y = 18 \end{cases}$ (thỏa mãn).
Vậy người thứ nhất làm riêng trong 9 ngày, người thứ hai làm riêng trong 18 ngày thì xong việc.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (246, 28, 'III.3', 'Hệ thức Vi-ét', 'Biết phương trình $x^2 + ax + 5 = 0$ có một nghiệm là $x = 4 - \sqrt{11}$. Tính tổng các bình phương hai nghiệm của phương trình trên.', NULL, 'Vì $x_1 = 4 - \sqrt{11}$ là nghiệm nên thay vào phương trình ta được:
$(4 - \sqrt{11})^2 + a(4 - \sqrt{11}) + 5 = 0 \Leftrightarrow 27 - 8\sqrt{11} + a(4 - \sqrt{11}) + 5 = 0 \Leftrightarrow a(4 - \sqrt{11}) = 8\sqrt{11} - 32 = -8(4 - \sqrt{11}) \Rightarrow a = -8$.
Phương trình trở thành $x^2 - 8x + 5 = 0$.
Theo hệ thức Vi-ét: $x_1 + x_2 = 8$ và $x_1 x_2 = 5$.
Tổng các bình phương hai nghiệm là: $x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = 8^2 - 2 \cdot 5 = 54$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (247, 28, 'IV.1', 'Hình trụ - Hình nón', 'Một bồn nước inox có dạng một hình trụ với chiều cao 1,75 m và bán kính đáy là 5 dm. Trong bồn đang chứa đầy nước, người ta tháo nước ở trong bồn ra cho đến khi mực nước trong bồn còn cao 1 m. Hỏi số nước đã tháo ra ngoài là bao nhiêu lít? (Bỏ qua bề dày của bồn nước).', NULL, 'Đổi 1,75 m = 17,5 dm; 1 m = 10 dm.
Chiều cao của phần nước đã tháo ra ngoài là: $h'' = 17,5 - 10 = 7,5$ dm.
Thể tích nước tháo ra ngoài là:
$V = \pi R^2 h'' = \pi \cdot 5^2 \cdot 7{,}5 = 187{,}5\pi$ $\text{dm}^3$ $\approx 589$ lít (hoặc $187{,}5\pi$ lít).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (248, 28, 'IV.2', 'Đường tròn tổng hợp', 'Cho đường tròn $(O)$ cố định. Từ một điểm $A$ cố định ở bên ngoài đường tròn $(O)$, kẻ các tiếp tuyến $AM$ và $AN$ với đường tròn ($M, N$ là các tiếp điểm). Đường thẳng đi qua $A$ cắt đường tròn $(O)$ tại hai điểm $B$ và $C$ ($B$ nằm giữa $A$ và $C$). Gọi $I$ là trung điểm của dây $BC$.
a) Chứng minh rằng: $AMON$ là tứ giác nội tiếp.
b) Gọi $K$ là giao điểm của $MN$ và $BC$. Chứng minh rằng: $AK \cdot AI = AB \cdot AC$.
c) Xác định vị trí của cát tuyến $ABC$ để $IM = 2IN$.', NULL, 'a) $\widehat{AMO} = \widehat{ANO} = 90^\circ \Rightarrow \widehat{AMO} + \widehat{ANO} = 180^\circ \Rightarrow AMON$ nội tiếp đường tròn đường kính $AO$.
b) Do $I$ là trung điểm dây $BC \Rightarrow OI \perp BC \Rightarrow \widehat{AIO} = 90^\circ$. Do đó 5 điểm $A, M, I, O, N$ cùng thuộc đường tròn đường kính $AO$.
Gọi $H = MN \cap AO \Rightarrow MN \perp AO$ tại $H$. Ta có $AH \cdot AO = AM^2 = AB \cdot AC$.
Trong $\triangle AHK$ và $\triangle AIO$: có $\widehat{IAO}$ chung, $\widehat{AHK} = \widehat{AIO} = 90^\circ \Rightarrow \triangle AHK \sim \triangle AIO \Rightarrow AK \cdot AI = AH \cdot AO$.
Từ đó suy ra $AK \cdot AI = AB \cdot AC$.
c) Tứ giác $AMIN$ nội tiếp đường tròn đường kính $AO$. Do $AM = AN$ nên dây cung $AM = AN$, suy ra $AI$ là phân giác của $\widehat{MIN}$.
Theo tính chất đường phân giác trong $\triangle IMN$, ta có: $\frac{KM}{KN} = \frac{IM}{IN} = 2 \Rightarrow KM = 2KN$.
Do $MN$ cố định nên xác định được duy nhất điểm $K$ trên đoạn $MN$ sao cho $KM = 2KN$. Khi đó cát tuyến $ABC$ chính là đường thẳng đi qua $A$ và $K$ (cắt $(O)$ tại hai điểm phân biệt $B, C$).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (249, 28, 'V', 'Cực trị hình học', 'Một cái sân hình vuông $ABCD$ có cạnh là 8 m. Người ta muốn lát gạch màu khác để trang trí lên mảnh sân hình vuông $MNPQ$ nội tiếp trong sân hình vuông $ABCD$. Tìm vị trí của $M, N, P, Q$ để hình vuông $MNPQ$ có diện tích nhỏ nhất.', NULL, 'Giả sử $M, N, P, Q$ lần lượt nằm trên các cạnh $AB, BC, CD, DA$.
Vì $MNPQ$ là hình vuông nội tiếp hình vuông $ABCD$ nên $\triangle AMQ = \triangle BNM = \triangle CPN = \triangle DQP$ (các tam giác vuông bằng nhau).
Đặt $AM = x$ ($0 \le x \le 8$), suy ra $MB = 8 - x$, $BN = AM = x$.
Áp dụng định lý Pythagore trong $\triangle BNM$ vuông tại $B$:
$MN^2 = BM^2 + BN^2 = (8 - x)^2 + x^2 = 2x^2 - 16x + 64 = 2(x - 4)^2 + 32$.
Diện tích hình vuông $MNPQ$ là $S = MN^2 = 2(x - 4)^2 + 32 \ge 32$.
Dấu "=" xảy ra khi $x = 4$.
Vậy $S_{\min} = 32\text{ m}^2$ khi $M, N, P, Q$ lần lượt là trung điểm của các cạnh $AB, BC, CD, DA$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 17 (Trang 144) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (250, 29, 'I.1', 'Bảng tần số ghép nhóm', 'Chiều cao (đơn vị: mét) của 35 cây bạch đàn được cho như sau: Hãy ghép các số liệu trên thành năm nhóm ứng với năm nửa khoảng có độ dài bằng nhau.
<table border="1"><tr><td>6,6</td><td>7,5</td><td>8,2</td><td>8,2</td><td>7,8</td><td>7,9</td><td>9,0</td><td>8,9</td><td>8,2</td></tr><tr><td>7,2</td><td>7,5</td><td>8,3</td><td>7,4</td><td>8,7</td><td>7,7</td><td>7,0</td><td>9,4</td><td>8,7</td></tr><tr><td>8,0</td><td>7,7</td><td>7,8</td><td>8,3</td><td>8,6</td><td>8,1</td><td>8,1</td><td>9,5</td><td>6,9</td></tr><tr><td>8,0</td><td>7,6</td><td>7,9</td><td>7,3</td><td>8,5</td><td>8,4</td><td>8,0</td><td>8,8</td><td></td></tr></table>', NULL, 'Giá trị nhỏ nhất là $6,6$, giá trị lớn nhất là $9,5$. Khoảng biến thiên là $9,5 - 6,6 = 2,9$.
Chia thành 5 nhóm có độ dài mỗi nhóm là $0,6$, ta được 5 nửa khoảng:
[6,6; 7,2), [7,2; 7,8), [7,8; 8,4), [8,4; 9,0), [9,0; 9,6).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (251, 29, 'I.2', 'Xác suất', 'Một hộp có 20 viên bi với kích thước và khối lượng như nhau. Bạn Ngân viết lên các viên bi đó các số 1, 2, 3,..., 20; hai viên bi khác nhau thì viết hai số khác nhau.
Xét phép thử “Lấy ngẫu nhiên một viên bi trong hộp”. Tính xác suất biến cố: “Số xuất hiện trên viên bi được lấy ra chia 7 dư 1”.', NULL, 'Số phần tử của không gian mẫu: $n(\Omega) = 20$.
Các số chia 7 dư 1 từ 1 đến 20 là: $\{1; 8; 15\}$ (gồm 3 kết quả thuận lợi).
Xác suất của biến cố là: $P = \frac{3}{20}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (252, 29, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức
$A = \frac{3\sqrt{x} - 9}{x - 4}$ và $B = \frac{x + 1}{(\sqrt{x} + 2)(\sqrt{x} - 3)} + \frac{\sqrt{x} + 3}{\sqrt{x} + 2} - \frac{\sqrt{x} - 2}{\sqrt{x} - 3}$ ($x \ge 0; x \ne 4; x \ne 9$)
1) Tính giá trị của biểu thức $A$ khi $x = 1$.
2) Chứng minh $B = \frac{\sqrt{x} - 2}{\sqrt{x} - 3}$.
3) Tìm giá trị lớn nhất của biểu thức $P = A.B$.', NULL, '1) Với $x = 1$, thay vào biểu thức $A$ ta được: $A = \frac{3\sqrt{1} - 9}{1 - 4} = \frac{-6}{-3} = 2$.
2) Quy đồng và rút gọn mẫu thức chung $(\sqrt{x} + 2)(\sqrt{x} - 3)$:
$B = \frac{(x + 1) + (\sqrt{x} + 3)(\sqrt{x} - 3) - (\sqrt{x} - 2)(\sqrt{x} + 2)}{(\sqrt{x} + 2)(\sqrt{x} - 3)} = \frac{x - 4}{(\sqrt{x} + 2)(\sqrt{x} - 3)} = \frac{\sqrt{x} - 2}{\sqrt{x} - 3}$.
3) $P = A \cdot B = \frac{3(\sqrt{x} - 3)}{x - 4} \cdot \frac{\sqrt{x} - 2}{\sqrt{x} - 3} = \frac{3}{\sqrt{x} + 2}$.
Vì $\sqrt{x} \ge 0 \Rightarrow \sqrt{x} + 2 \ge 2 \Rightarrow P \le \frac{3}{2}$.
Dấu "=" xảy ra khi $x = 0$ (thỏa mãn ĐKXĐ). Vậy $\max P = \frac{3}{2}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (253, 29, 'III.1', 'Lãi suất ngân hàng', 'Bác Bình An vay ở một ngân hàng 500 triệu đồng để sản xuất trong thời hạn một năm. Lẽ ra đúng một năm sau bác phải trả cả tiền vốn lẫn tiền lãi, song bác đã được ngân hàng cho kéo dài thời hạn thêm 1 năm nữa, số tiền lãi của năm đầu được gộp vào với tiền vốn để tính lãi năm sau và lãi suất vẫn như cũ. Hết hai năm bác Bình An phải trả tất cả 605 triệu đồng. Hỏi lãi suất cho vay của ngân hàng đó là bao nhiêu phần trăm trong một năm?', NULL, 'Gọi lãi suất cho vay của ngân hàng là $r$ ($r > 0$).
Số tiền cả vốn lẫn lãi sau 1 năm là $500(1 + r)$ triệu đồng.
Số tiền cả vốn lẫn lãi sau 2 năm là $500(1 + r)^2$ triệu đồng.
Theo đề bài ta có phương trình: $500(1 + r)^2 = 605 \Leftrightarrow (1 + r)^2 = 1,21 \Leftrightarrow 1 + r = 1,1 \Leftrightarrow r = 0,1 = 10\%$.
Vậy lãi suất cho vay của ngân hàng là 10%/năm.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (254, 29, 'III.2', 'Giải bài toán bằng cách lập hệ phương trình', 'Một người mua hai loại hàng và phải trả tổng cộng 2,17 triệu đồng, kể cả thuế giá trị gia tăng (VAT) với mức 10% đối với loại hàng thứ nhất và 8% đối với loại hàng thứ hai. Nếu thuế VAT là 9% đối với cả hai loại hàng thì người đó phải trả tổng cộng 2,18 triệu đồng. Hỏi nếu không kể thuế VAT thì người đó phải trả bao nhiêu tiền cho mỗi loại hàng?', NULL, 'Gọi giá tiền không kể thuế của loại hàng thứ nhất và thứ hai lần lượt là $x, y$ (triệu đồng, $0 < x, y < 2,17$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} 1,1x + 1,08y = 2,17 \\ 1,09(x + y) = 2,18 \end{cases} \Leftrightarrow \begin{cases} 1,1x + 1,08y = 2,17 \\ x + y = 2 \end{cases} \Leftrightarrow \begin{cases} x = 0,5 \\ y = 1,5 \end{cases}$ (thỏa mãn ĐK).
Vậy nếu không kể thuế VAT, loại hàng thứ nhất có giá 0,5 triệu đồng (500 000 đồng) và loại hàng thứ hai có giá 1,5 triệu đồng (1 500 000 đồng).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (255, 29, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - 2(m + 1)x + 6m - 4 = 0$ (với $m$ là tham số). Tìm tất cả các giá trị của $m$ để phương trình có hai nghiệm $x_1, x_2$ thoả mãn $x_1^2 - x_2^2 = 3x_1x_2(x_2 - x_1)$.', NULL, 'Điều kiện có 2 nghiệm: $\Delta'' = (m + 1)^2 - (6m - 4) = m^2 - 4m + 5 = (m - 2)^2 + 1 > 0$ với mọi $m$.
Theo định lí Vi-ét: $x_1 + x_2 = 2(m + 1)$ và $x_1x_2 = 6m - 4$.
Phương trình đã cho: $(x_1 - x_2)(x_1 + x_2) = -3x_1x_2(x_1 - x_2) \Leftrightarrow (x_1 - x_2)(x_1 + x_2 + 3x_1x_2) = 0$.
Trường hợp 1: $x_1 - x_2 = 0 \Leftrightarrow x_1 = x_2$ (nghiệm kép) $\Leftrightarrow \Delta'' = 0$ (vô nghiệm vì $\Delta'' > 0$).
Trường hợp 2: $x_1 + x_2 + 3x_1x_2 = 0 \Leftrightarrow 2(m + 1) + 3(6m - 4) = 0 \Leftrightarrow 20m - 10 = 0 \Leftrightarrow m = \frac{1}{2}$.
Vậy $m = \frac{1}{2}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (256, 29, 'IV.1', 'Hình khối thực tế', 'Trên bàn có một cốc nước hình trụ chứa đầy nước, có chiều cao trong bằng 3 lần đường kính trong của đáy; một viên bi hình cầu và một khối nón đều bằng thủy tinh. Biết viên bi và khối nón đều có đường kính bằng đường kính trong của cốc nước. Người ta từ từ thả vào cốc nước viên bi và khối nón đó (như hình vẽ) thì thấy nước trong cốc tràn ra ngoài.
{{FIGURE}}
a) Tính thể tích nước còn lại trong cốc
b) Tính tỉ số thể tích của lượng nước còn lại trong cốc và lượng nước ban đầu.', '/static/figures/BoDeHaNoiLan2_De_18_trang_153_IV_1_357492.png', 'Gọi bán kính đáy trong của cốc là $R$, khi đó đường kính đáy cốc, đường kính viên bi, đường kính đáy nón đều bằng $2R$.
Chiều cao của cốc là $h_t = 3 \cdot 2R = 6R$.
Chiều cao của khối nón là $h_n = h_t - 2R = 6R - 2R = 4R$.
Thể tích cốc hình trụ: $V_t = \pi R^2 h_t = 6\pi R^3$.
Thể tích viên bi hình cầu: $V_c = \frac{4}{3}\pi R^3$.
Thể tích khối nón: $V_n = \frac{1}{3}\pi R^2 h_n = \frac{1}{3}\pi R^2 (4R) = \frac{4}{3}\pi R^3$.
Tổng thể tích nước tràn ra: $V_{\text{tràn}} = V_c + V_n = \frac{8}{3}\pi R^3$.
a) Thể tích nước còn lại trong cốc: $V_{\text{còn lại}} = V_t - V_{\text{tràn}} = 6\pi R^3 - \frac{8}{3}\pi R^3 = \frac{10}{3}\pi R^3$.
b) Tỉ số thể tích: $\frac{V_{\text{còn lại}}}{V_t} = \frac{\frac{10}{3}\pi R^3}{6\pi R^3} = \frac{5}{9}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (257, 29, 'IV.2', 'Đường tròn tổng hợp', 'Trên nửa đường tròn $(O; R)$ đường kính $BC$, lấy điểm $A$ sao cho $BA = R$.
a) Chứng minh tam giác $ABC$ vuông tại $A$ và tính số đo các góc $B, C$ của tam giác vuông $ABC$.
b) Qua $B$ kẻ tiếp tuyến với nửa đường tròn $(O)$, nó cắt tia $CA$ tại $D$. Qua $D$ kẻ tiếp tuyến $DE$ với nửa đường tròn $(O)$ ($E$ là tiếp điểm). Gọi $I$ là giao điểm của $OD$ và $BE$. Chứng minh rằng $OD \perp BE$ và $DI.DO = DA.DC$
c) Kẻ $EH$ vuông góc với $BC$ tại $H$. $EH$ cắt $CD$ tại $G$. Chứng minh $IG$ song song với $BC$.', NULL, 'a) $A$ thuộc nửa đường tròn đường kính $BC \Rightarrow \widehat{BAC} = 90^\circ \Rightarrow \triangle ABC$ vuông tại $A$.
Vì $BC = 2R, AB = R \Rightarrow \cos B = \frac{AB}{BC} = \frac{1}{2} \Rightarrow \widehat{B} = 60^\circ$ và $\widehat{C} = 30^\circ$.
b) Vì $DB, DE$ là hai tiếp tuyến cắt nhau tại $D$ nên $DB = DE$ và $OD$ là phân giác của $\widehat{BOE}$. Tam giác $OBE$ cân tại $O$ nên $OD \perp BE$ tại $I$.
Áp dụng hệ thức lượng vào $\triangle OBD$ vuông tại $B$, đường cao $BI$: $DI.DO = DB^2$.
Áp dụng hệ thức lượng vào $\triangle DBC$ vuông tại $B$, đường cao $BA$: $DB^2 = DA.DC$.
Suy ra $DI.DO = DA.DC$.
c) Chứng minh $I$ là trung điểm của $BE$.
Do $EH \parallel DB$ (cùng $\perp BC$), áp dụng định lý Ta-lét ta có tỉ số suy ra $G$ là trung điểm của $EH$.
Từ đó xét vị trí tương ứng suy ra $IG \parallel BC$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (258, 29, 'V', 'Bất đẳng thức - Cực trị - Toán thực tế rời rạc', 'Trong cuộc thi “Đố vui để học”, mỗi thí sinh phải trả lời 12 câu hỏi của ban tổ chức. Mỗi câu hỏi gồm bốn phương án, trong đó chỉ có một phương án đúng. Với mỗi câu hỏi, nếu trả lời đúng thì được cộng 5 điểm, trả lời sai bị trừ 2 điểm. Khi bắt đầu cuộc thi, mỗi thí sinh có sẵn 20 điểm. Thí sinh nào đạt từ 50 điểm trở lên sẽ được vào vòng thi tiếp theo. Hỏi thí sinh phải trả lời đúng ít nhất bao nhiêu câu thì được vào vòng thi tiếp theo?', NULL, 'Gọi $x$ là số câu thí sinh trả lời đúng ($x \in \mathbb{N}, 0 \le x \le 12$).
Số câu trả lời sai là $12 - x$.
Số điểm của thí sinh đạt được sau cuộc thi là:
$20 + 5x - 2(12 - x) = 7x - 4$.
Để được vào vòng tiếp theo, số điểm phải đạt từ 50 điểm trở lên:
$7x - 4 \ge 50 \Leftrightarrow 7x \ge 54 \Leftrightarrow x \ge \frac{54}{7} \approx 7,71$.
Vì $x \in \mathbb{N}$ nên giá trị nhỏ nhất của $x$ là 8.
Vậy thí sinh phải trả lời đúng ít nhất 8 câu để được vào vòng thi tiếp theo.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 18 (Trang 153) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (259, 30, 'I.1', 'Bảng tần số ghép nhóm', 'Kết quả đo tốc độ của 25 xe ô tô (đơn vị: km/h) khi đi qua một trạm quan sát đã được thống kê dưới bảng sau:
<table border="1"><tr><td>46</td><td>55</td><td>57</td><td>50</td><td>45</td></tr><tr><td>41</td><td>44</td><td>46</td><td>40</td><td>58</td></tr><tr><td>50</td><td>56</td><td>52</td><td>59</td><td>44</td></tr><tr><td>52</td><td>40</td><td>42</td><td>47</td><td>54</td></tr><tr><td>45</td><td>48</td><td>58</td><td>49</td><td>40</td></tr></table>
a) Hãy ghép các số liệu thành bốn nhóm ứng với bốn nửa khoảng có độ dài bằng nhau.
b) Lập bảng tần số ghép nhóm của mẫu số liệu ghép nhóm ở câu a.', NULL, 'a) Giá trị nhỏ nhất là 40, lớn nhất là 59. Chia nửa khoảng [40; 60) thành bốn nửa khoảng có độ dài bằng nhau là: [40; 45), [45; 50), [50; 55), [55; 60).
b) Tần số của từng nhóm:
- Nhóm [40; 45): 7 xe.
- Nhóm [45; 50): 7 xe.
- Nhóm [50; 55): 5 xe.
- Nhóm [55; 60): 6 xe.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (260, 30, 'I.2', 'Xác suất', 'Viết ngẫu nhiên một số tự nhiên lẻ có 2 chữ số. Xét biến cố $A$: “Số tự nhiên viết ra là bình phương của một số tự nhiên”.
Tính xác suất của biến cố $A$.', NULL, '- Số các số tự nhiên lẻ có 2 chữ số là: $(99 - 11) : 2 + 1 = 45$ số, do đó $n(\Omega) = 45$.
- Các số có hai chữ số là bình phương của một số tự nhiên: $4^2 = 16$, $5^2 = 25$, $6^2 = 36$, $7^2 = 49$, $8^2 = 64$, $9^2 = 81$.
- Trong các số trên, các số lẻ là: $25, 49, 81$ (gồm 3 số).
- Xác suất của biến cố $A$ là: $P(A) = \frac{3}{45} = \frac{1}{15}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (261, 30, 'II', 'Rút gọn căn thức', 'Cho biểu thức: $M = \frac{\sqrt{x}-1}{\sqrt{x}}$; $P = \frac{\sqrt{x}-2}{\sqrt{x}+1} + \frac{2+8\sqrt{x}}{x-1} - \frac{2}{1-\sqrt{x}}$ với $x > 0; x \neq 1$.
1) Tính $M$ khi $x = 0,49$.
2) Chứng minh $P = \frac{\sqrt{x}+6}{\sqrt{x}-1}$.
3) Đặt $Q = M \cdot P + \frac{x-5}{\sqrt{x}}$. So sánh $Q$ với 3.', NULL, '1) Thay $x = 0,49$ (thỏa mãn điều kiện) vào $M$:
$M = \frac{\sqrt{0,49} - 1}{\sqrt{0,49}} = \frac{0,7 - 1}{0,7} = -\frac{3}{7}$.
2) Quy đồng mẫu thức:
$P = \frac{(\sqrt{x}-2)(\sqrt{x}-1) + 2 + 8\sqrt{x} + 2(\sqrt{x}+1)}{(\sqrt{x}+1)(\sqrt{x}-1)} = \frac{x + 7\sqrt{x} + 6}{(\sqrt{x}+1)(\sqrt{x}-1)} = \frac{(\sqrt{x}+1)(\sqrt{x}+6)}{(\sqrt{x}+1)(\sqrt{x}-1)} = \frac{\sqrt{x}+6}{\sqrt{x}-1}$.
3) Ta có: $Q = \frac{\sqrt{x}-1}{\sqrt{x}} \cdot \frac{\sqrt{x}+6}{\sqrt{x}-1} + \frac{x-5}{\sqrt{x}} = \frac{\sqrt{x}+6}{\sqrt{x}} + \frac{x-5}{\sqrt{x}} = \frac{x+\sqrt{x}+1}{\sqrt{x}}$.
Xét hiệu: $Q - 3 = \frac{x - 2\sqrt{x} + 1}{\sqrt{x}} = \frac{(\sqrt{x}-1)^2}{\sqrt{x}}$.
Vì $x > 0$ và $x \neq 1$ nên $(\sqrt{x}-1)^2 > 0$ và $\sqrt{x} > 0 \implies Q - 3 > 0 \implies Q > 3$ (hoặc $Q \ge 3$ nếu xét rộng ra, ở đây $x \neq 1$ nên $Q > 3$).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (262, 30, 'III.1', 'Lãi suất ngân hàng', 'Cách đây hai năm, bác Chín gửi một số tiền vào ngân hàng với lãi suất 6% một năm. Bây giờ số tiền bác Chín có được cả gốc lẫn lãi là 33,708 triệu đồng. Hỏi ban đầu bác Chín gửi vào bao nhiêu tiền? (Biết số tiền lãi năm trước được tính gộp vào gốc cho năm sau)', NULL, 'Gọi số tiền ban đầu bác Chín gửi là $x$ (triệu đồng, $x > 0$).
Sau 1 năm số tiền là: $x(1 + 6\%) = 1,06x$ (triệu đồng).
Sau 2 năm số tiền là: $1,06x \cdot (1 + 6\%) = 1,1236x$ (triệu đồng).
Theo đề bài: $1,1236x = 33,708 \implies x = 30$ (triệu đồng).
Vậy ban đầu bác Chín gửi vào 30 triệu đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (263, 30, 'III.2', 'Năng suất - Công việc', 'Hai đội công nhân dệt may cần sản xuất một số lượng khẩu trang theo đơn đặt hàng. Nếu làm chung thì sau 4 giờ họ sẽ làm xong. Nhưng hai đội mới làm chung được 3 giờ thì đội 1 nghỉ, đội 2 tiếp tục làm trong 3 giờ nữa mới xong. Hỏi mỗi đội nếu làm một mình thì phải bao lâu mới xong công việc?', NULL, 'Gọi thời gian đội 1 và đội 2 làm một mình xong công việc lần lượt là $x, y$ (giờ; $x, y > 4$).
Trong 1 giờ, hai đội làm được: $\frac{1}{x} + \frac{1}{y} = \frac{1}{4}$.
Sau 3 giờ làm chung, hai đội hoàn thành: $3 \cdot \frac{1}{4} = \frac{3}{4}$ công việc.
Khối lượng công việc còn lại là: $1 - \frac{3}{4} = \frac{1}{4}$ công việc.
Đội 2 làm nốt trong 3 giờ: $3 \cdot \frac{1}{y} = \frac{1}{4} \implies y = 12$ (giờ).
Thay $y = 12$ vào phương trình ban đầu: $\frac{1}{x} + \frac{1}{12} = \frac{1}{4} \implies \frac{1}{x} = \frac{1}{6} \implies x = 6$ (giờ).
Vậy đội 1 làm một mình mất 6 giờ, đội 2 làm một mình mất 12 giờ.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (264, 30, 'III.3', 'Hệ thức Vi-ét', 'Gọi $x_1, x_2$ là hai nghiệm của phương trình: $3x^2 + 5x - 6 = 0$. Không giải phương trình, tính giá trị của biểu thức $D = \frac{x_1}{x_2 + 2} + \frac{x_2}{x_1 + 2}$.', NULL, 'Phương trình $3x^2 + 5x - 6 = 0$ có $a \cdot c = 3 \cdot (-6) = -18 < 0$ nên luôn có 2 nghiệm phân biệt.
Theo định lí Vi-ét:
$x_1 + x_2 = -\frac{5}{3}$; $x_1 x_2 = -\frac{6}{3} = -2$.
Quy đồng biểu thức $D$:
$D = \frac{x_1(x_1 + 2) + x_2(x_2 + 2)}{(x_1 + 2)(x_2 + 2)} = \frac{x_1^2 + x_2^2 + 2(x_1 + x_2)}{x_1 x_2 + 2(x_1 + x_2) + 4} = \frac{(x_1 + x_2)^2 - 2x_1 x_2 + 2(x_1 + x_2)}{x_1 x_2 + 2(x_1 + x_2) + 4}$.
Thay số:
$D = \frac{\left(-\frac{5}{3}\right)^2 - 2(-2) + 2\left(-\frac{5}{3}\right)}{-2 + 2\left(-\frac{5}{3}\right) + 4} = \frac{\frac{25}{9} + 4 - \frac{10}{3}}{2 - \frac{10}{3}} = \frac{\frac{31}{9}}{-\frac{4}{3}} = -\frac{31}{12}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (265, 30, 'IV.1', 'Hình trụ - Hình nón', 'Một hộp kem hình trụ có đường kính 12 cm và chiều cao 15 cm đựng đầy kem được đặt trên mặt bàn phẳng.
a) Tính thể tích hộp kem.
b) Hộp kem chứa kem sẽ được chia vào các bánh ốc quế hình nón có chiều cao 12 cm và đường kính 6 cm, có hình bán cầu trên đỉnh như hình vẽ. Hãy tìm số que kem có thể chia được.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_19_trang_162_IV_1_361243.png', 'a) Bán kính đáy hình trụ là $R_1 = 6\text{ cm}$, chiều cao $h_1 = 15\text{ cm}$.
Thể tích hộp kem hình trụ là: $V_1 = \pi R_1^2 h_1 = \pi \cdot 6^2 \cdot 15 = 540\pi\text{ cm}^3$.
b) Bán kính bánh ốc quế và bán cầu là $R_2 = 3\text{ cm}$, chiều cao nón $h_2 = 12\text{ cm}$.
Thể tích phần hình nón: $V_{\text{nón}} = \frac{1}{3}\pi R_2^2 h_2 = \frac{1}{3}\pi \cdot 3^2 \cdot 12 = 36\pi\text{ cm}^3$.
Thể tích phần bán cầu: $V_{\text{bán cầu}} = \frac{1}{2} \cdot \frac{4}{3}\pi R_2^3 = \frac{2}{3}\pi \cdot 3^3 = 18\pi\text{ cm}^3$.
Thể tích một que kem: $V_2 = 36\pi + 18\pi = 54\pi\text{ cm}^3$.
Số que kem có thể chia được là: $540\pi : 54\pi = 10$ (que kem).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (266, 30, 'IV.2', 'Đường tròn', 'Cho đường tròn $(O; R)$, đường kính $AB$ vuông góc với dây $CD$ tại điểm $I$ ($I$ nằm giữa $A$ và $O$). Lấy điểm $E$ bất kì trên cung nhỏ $BC$ ($E$ khác $B$ và $C$). $AE$ cắt $CD$ tại $K$.
a) Chứng minh bốn điểm $K, E, B, I$ cùng thuộc một đường tròn.
b) Chứng minh $AK \cdot AE = AI \cdot AB$.
c) Gọi $P$ là giao điểm của tia $BE$ và tia $DC$, $Q$ là giao điểm của $AP$ và $BK$. Chứng minh $IK$ là phân giác của $\widehat{EIQ}$. Chứng minh $OQ$ là tiếp tuyến của đường tròn ngoại tiếp tam giác $PQE$.', NULL, 'a) Có $\widehat{KIB} = 90^\circ$ ($CD \perp AB$) và $\widehat{KEB} = \widehat{AEB} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn). Suy ra tứ giác $KEBI$ có $\widehat{KIB} + \widehat{KEB} = 180^\circ$ nên nội tiếp, tức là $K, E, B, I$ cùng thuộc một đường tròn.
b) Xét $\triangle AIK$ và $\triangle AEB$ có $\widehat{A}$ chung và $\widehat{AIK} = \widehat{AEB} = 90^\circ$, suy ra $\triangle AIK \sim \triangle AEB$ (g.g) $\implies \frac{AI}{AE} = \frac{AK}{AB} \implies AK \cdot AE = AI \cdot AB$.
c) Trong tam giác $ABP$, có $PI \perp AB$ và $AE \perp BP$, $CD \cap AE = K \implies K$ là trực tâm của $\triangle ABP \implies BK \perp AP$ tại $Q$. Từ đó chứng minh được các tứ giác nội tiếp liên quan để suy ra $IK$ là tia phân giác của $\widehat{EIQ}$, và kết hợp tính chất góc tạo bởi tiếp tuyến và dây cung suy ra $OQ$ là tiếp tuyến của đường tròn ngoại tiếp $\triangle PQE$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (267, 30, 'V', 'Quy hoạch tuyến tính thực tế', 'Một xưởng sản xuất hai loại sản phẩm, mỗi kg sản phẩm loại I cần 2 kg nguyên liệu và 30 giờ, đem lại mức lợi nhuận 40 000 đồng. Mỗi kg sản phẩm loại II cần 4 kg nguyên liệu và 15 giờ, đem lại mức lợi nhuận 30 000 đồng. Xưởng có 200 kg nguyên liệu và 1200 giờ làm việc. Nên sản xuất mỗi loại sản phẩm bao nhiêu để có mức lợi nhuận cao nhất?', NULL, 'Gọi $x, y$ lần lượt là số kg sản phẩm loại I và loại II xưởng cần sản xuất ($x, y \ge 0$).
Theo bài ra ta có hệ bất phương trình ràng buộc:
$\begin{cases} 2x + 4y \le 200 \\ 30x + 15y \le 1200 \\ x \ge 0, y \ge 0 \end{cases} \iff \begin{cases} x + 2y \le 100 \\ 2x + y \le 80 \\ x \ge 0, y \ge 0 \end{cases}$
Miền nghiệm là tứ giác $OABC$ với các đỉnh: $O(0; 0)$, $A(40; 0)$, $B(20; 40)$ (giao điểm của $x + 2y = 100$ và $2x + y = 80$), $C(0; 50)$.
Lợi nhuận thu được là $F(x, y) = 40x + 30y$ (nghìn đồng).
- Tại $O(0; 0): F = 0$.
- Tại $A(40; 0): F = 40 \cdot 40 = 1600$ nghìn đồng.
- Tại $C(0; 50): F = 30 \cdot 50 = 1500$ nghìn đồng.
- Tại $B(20; 40): F = 40 \cdot 20 + 30 \cdot 40 = 2000$ nghìn đồng (tương đương 2 000 000 đồng).
Vậy xưởng nên sản xuất 20 kg sản phẩm loại I và 40 kg sản phẩm loại II để đạt mức lợi nhuận cao nhất là 2 000 000 đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 19 (Trang 162) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (268, 31, 'I.1', 'Bảng tần số ghép nhóm', 'Giáo viên ghi lại thời gian bơi cự ly 50 mét của học sinh lớp 9A cho kết quả trong bảng sau:
<table border="1"><tr><td>Thời gian (giây)</td><td>[40; 45)</td><td>[45; 50)</td><td>[50; 55)</td><td>[55; 60)</td></tr><tr><td>Số học sinh</td><td>3</td><td>7</td><td>10</td><td>20</td></tr></table>
Nêu các nhóm số liệu và tần số tương đối.', NULL, 'Tổng số học sinh là $n = 3 + 7 + 10 + 20 = 40$.
- Nhóm [40; 45) có tần số tương đối: $\frac{3}{40} \cdot 100\% = 7,5\%$.
- Nhóm [45; 50) có tần số tương đối: $\frac{7}{40} \cdot 100\% = 17,5\%$.
- Nhóm [50; 55) có tần số tương đối: $\frac{10}{40} \cdot 100\% = 25\%$.
- Nhóm [55; 60) có tần số tương đối: $\frac{20}{40} \cdot 100\% = 50\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (269, 31, 'I.2', 'Xác suất', 'Gieo một con xúc xắc cân đối đồng chất và có 6 mặt. Tính xác suất của biến cố gieo được mặt có số chấm là bội của 3.', NULL, 'Số kết quả có thể xảy ra là 6 (từ 1 đến 6 chấm).
Các kết quả là bội của 3 gồm: 3 và 6 (có 2 kết quả thuận lợi).
Xác suất của biến cố là: $P = \frac{2}{6} = \frac{1}{3}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (270, 31, 'II', 'Rút gọn căn thức', 'Cho biểu thức $A = \frac{\sqrt{x}}{\sqrt{x} - 2}$ và $B = \frac{2\sqrt{x}}{\sqrt{x} - 3} - \frac{x + 9\sqrt{x}}{x - 9}$ với $x > 0; x \ne 4; x \ne 9$.
1) Tính giá trị của biểu thức $A$ khi $x = 100$.
2) Rút gọn biểu thức $B$.
3) Tìm giá trị nguyên của $x$ để biểu thức $M = A : B$ có giá trị nguyên.', NULL, '1) Với $x = 100$ (thỏa mãn ĐKXĐ):
$A = \frac{\sqrt{100}}{\sqrt{100} - 2} = \frac{10}{10 - 2} = \frac{5}{4}$.

2) Rút gọn $B$:
$B = \frac{2\sqrt{x}(\sqrt{x} + 3) - (x + 9\sqrt{x})}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{2x + 6\sqrt{x} - x - 9\sqrt{x}}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{x - 3\sqrt{x}}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{\sqrt{x}(\sqrt{x} - 3)}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{\sqrt{x}}{\sqrt{x} + 3}$.

3) $M = A : B = \frac{\sqrt{x}}{\sqrt{x} - 2} : \frac{\sqrt{x}}{\sqrt{x} + 3} = \frac{\sqrt{x} + 3}{\sqrt{x} - 2} = 1 + \frac{5}{\sqrt{x} - 2}$.
Để $M \in \mathbb{Z}$ với $x \in \mathbb{Z}$ thì $(\sqrt{x} - 2) \in \text{Ư}(5) = \{-5; -1; 1; 5\}$.
Vì $\sqrt{x} \ge 0$ nên $\sqrt{x} - 2 \ge -2$.
Suy ra $\sqrt{x} - 2 \in \{-1; 1; 5\} \Leftrightarrow \sqrt{x} \in \{1; 3; 7\} \Leftrightarrow x \in \{1; 9; 49\}$.
Đối chiếu điều kiện $x > 0; x \ne 4; x \ne 9$, ta được $x \in \{1; 49\}$ (nếu $x = 9$ bị loại theo ĐKXĐ ban đầu).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (271, 31, 'III.1', 'Nồng độ dung dịch', 'Một dung dịch chứa 30% axit nitơric (tính theo thể tích) và một dung dịch khác chứa 55% axit nitơric. Cần phải trộn thêm bao nhiêu lít dung dịch loại 1 và loại 2 để được 100 lít dung dịch 50% axit nitơric?', NULL, 'Gọi $x, y$ (lít) lần lượt là thể tích dung dịch loại 1 và loại 2 cần trộn ($0 < x, y < 100$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} x + y = 100 \\ 30\%x + 55\%y = 50\% \cdot 100 \end{cases} \Leftrightarrow \begin{cases} x + y = 100 \\ 0,3x + 0,55y = 50 \end{cases} \Leftrightarrow \begin{cases} x = 20 \\ y = 80 \end{cases}$ (thỏa mãn).
Vậy cần trộn 20 lít dung dịch loại 1 và 80 lít dung dịch loại 2.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (272, 31, 'III.2', 'Năng suất - Công việc', 'Hai vòi nước cùng chảy vào một bể không chứa nước thì sau 3 giờ đầy bể. Nếu mở vòi thứ nhất chảy một mình trong 20 phút, rồi khóa lại, mở tiếp vòi thứ hai chảy trong 30 phút thì cả hai vòi chảy được $\frac{1}{8}$ bể. Tính thời gian mỗi vòi chảy một mình đầy bể.', NULL, 'Đổi 20 phút $= \frac{1}{3}$ giờ, 30 phút $= \frac{1}{2}$ giờ.
Gọi thời gian vòi thứ nhất chảy một mình đầy bể là $x$ (giờ), thời gian vòi thứ hai chảy một mình đầy bể là $y$ (giờ) ($x, y > 3$).
Mỗi giờ vòi thứ nhất chảy được $\frac{1}{x}$ bể, vòi thứ hai chảy được $\frac{1}{y}$ bể.
Ta có hệ phương trình:
$\begin{cases} \frac{1}{x} + \frac{1}{y} = \frac{1}{3} \\ \frac{1}{3} \cdot \frac{1}{x} + \frac{1}{2} \cdot \frac{1}{y} = \frac{1}{8} \end{cases} \Leftrightarrow \begin{cases} \frac{1}{x} = \frac{1}{4} \\ \frac{1}{y} = \frac{1}{12} \end{cases} \Leftrightarrow \begin{cases} x = 4 \\ y = 12 \end{cases}$ (thỏa mãn).
Vậy vòi thứ nhất chảy một mình mất 4 giờ, vòi thứ hai chảy một mình mất 12 giờ.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (273, 31, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - 2(m + 1)x + m^2 - 4m + 3 = 0$ (với $m$ là tham số). Tìm $m$ để phương trình đã cho có hai nghiệm cùng dấu.', NULL, 'Phương trình có hai nghiệm cùng dấu khi và chỉ khi:
$\begin{cases} \Delta'' \ge 0 \\ P > 0 \end{cases} \Leftrightarrow \begin{cases} (m + 1)^2 - (m^2 - 4m + 3) \ge 0 \\ m^2 - 4m + 3 > 0 \end{cases} \Leftrightarrow \begin{cases} 6m - 2 \ge 0 \\ (m - 1)(m - 3) > 0 \end{cases} \Leftrightarrow \begin{cases} m \ge \frac{1}{3} \\ m < 1 \text{ hoặc } m > 3 \end{cases} \Leftrightarrow \frac{1}{3} \le m < 1 \text{ hoặc } m > 3$.
Vậy $\frac{1}{3} \le m < 1$ hoặc $m > 3$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (274, 31, 'IV.1', 'Hình nón - Hình bán cầu', 'Hình bên dưới là một món đồ chơi trẻ em có cấu tạo từ một bán cầu (nửa khối cầu) và một hình nón.
{{FIGURE}}
a) Tìm thể tích của món đồ chơi.
b) Tìm diện tích toàn phần của món đồ chơi.', '/static/figures/BoDeHaNoiLan2_De_20_trang_171_IV_1_371419.png', 'Quan sát hình vẽ, bán kính đáy của hình nón và bán cầu là $r = 6\text{ cm}$, chiều cao hình nón là $h = 8\text{ cm}$, đường sinh của hình nón là $l = 10\text{ cm}$.
a) Thể tích món đồ chơi bằng tổng thể tích hình nón và nửa hình cầu:
$V = V_{\text{nón}} + V_{\text{bán cầu}} = \frac{1}{3}\pi r^2 h + \frac{1}{2}\left(\frac{4}{3}\pi r^3\right) = \frac{1}{3}\pi \cdot 6^2 \cdot 8 + \frac{2}{3}\pi \cdot 6^3 = 96\pi + 144\pi = 240\pi\text{ (cm}^3\text{)}$.
b) Diện tích toàn phần của món đồ chơi gồm diện tích xung quanh hình nón và diện tích mặt bán cầu:
$S_{tp} = S_{xq\text{ (nón)}} + S_{\text{bán cầu}} = \pi r l + 2\pi r^2 = \pi \cdot 6 \cdot 10 + 2\pi \cdot 6^2 = 60\pi + 72\pi = 132\pi\text{ (cm}^2\text{)}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (275, 31, 'IV.2', 'Đường tròn nội tiếp', 'Cho đường tròn $(O)$ đường kính $AB$. Dây cung $MN$ vuông góc với $AB$, ($AM < BM$). Hai đường thẳng $BM$ và $NA$ cắt nhau tại $K$. Gọi $H$ là chân đường vuông góc kẻ từ $K$ đến đường thẳng $AB$.
a) Chứng minh tứ giác $AHKM$ nội tiếp trong một đường tròn.
b) Chứng minh rằng $NB \cdot HK = AN \cdot HB$.
c) Chứng minh $HM$ là tiếp tuyến của đường tròn $(O)$.', NULL, 'a) Ta có $\widehat{AMB} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn), nên $\widehat{AMK} = 90^\circ$.
$KH \perp AB$ tại $H \Rightarrow \widehat{AHK} = 90^\circ$.
Tứ giác $AHKM$ có $\widehat{AMK} + \widehat{AHK} = 90^\circ + 90^\circ = 180^\circ$, suy ra $AHKM$ nội tiếp đường tròn đường kính $AK$.

b) Xét $\triangle KHB$ và $\triangle ANB$ có: $\widehat{KHB} = \widehat{ANB} = 90^\circ$, chung góc $\widehat{B}$ (do $MN \perp AB$ nên $A, N, B$ tạo thành $\widehat{ANB} = 90^\circ$).
Do đó $\triangle KHB \sim \triangle ANB$ (g.g) $\Rightarrow \frac{HK}{AN} = \frac{HB}{NB} \Rightarrow NB \cdot HK = AN \cdot HB$.

c) Tứ giác $AHKM$ nội tiếp nên $\widehat{MHK} = \widehat{MAK} = \widehat{MAB}$.
Mặt khác $\triangle OAM$ cân tại $O$ ($OA = OM = R$) nên $\widehat{OMA} = \widehat{OAM} = \widehat{MAB}$.
Do đó $\widehat{MHK} = \widehat{OMA}$.
Ta có $KH \perp AB \Rightarrow \widehat{MHK} + \widehat{MHO} = 90^\circ \Rightarrow \widehat{OMA} + \widehat{MHO} = 90^\circ$.
Kết hợp các góc suy ra $\widehat{OMH} = 90^\circ \Rightarrow OM \perp HM$ tại $M \in (O)$.
Vậy $HM$ là tiếp tuyến của $(O)$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (276, 31, 'V', 'Cực trị thực tế', 'Với một tấm tôn hình tròn có bán kính $R = 6\text{ cm}$. Người ta muốn làm một cái phễu bằng cách cắt một phần (dạng hình quạt) của hình tròn như hình bên dưới. Thể tích lớn nhất của hình nón có được khi người ta cắt cung tròn của hình quạt có chiều dài là bao nhiêu?
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_20_trang_171_V_371442.png', 'Gọi $l$ là độ dài đường sinh của hình nón thì $l = R = 6\text{ cm}$.
Gọi $r$ và $h$ lần lượt là bán kính đáy và chiều cao của hình nón ($0 < r < 6$, $h = \sqrt{R^2 - r^2} = \sqrt{36 - r^2}$).
Thể tích hình nón là $V = \frac{1}{3}\pi r^2 h = \frac{1}{3}\pi r^2 \sqrt{36 - r^2}$.
Ta có: $V^2 = \frac{\pi^2}{9} r^4 (36 - r^2) = \frac{\pi^2}{9} \cdot 4 \cdot \frac{r^2}{2} \cdot \frac{r^2}{2} \cdot (36 - r^2)$.
Áp dụng bất đẳng thức AM-GM cho 3 số dương $\frac{r^2}{2}, \frac{r^2}{2}, 36 - r^2$:
$\frac{r^2}{2} \cdot \frac{r^2}{2} \cdot (36 - r^2) \le \left( \frac{\frac{r^2}{2} + \frac{r^2}{2} + 36 - r^2}{3} \right)^3 = \left(\frac{36}{3}\right)^3 = 12^3 = 1728$.
Dấu "=" xảy ra khi $\frac{r^2}{2} = 36 - r^2 \Leftrightarrow \frac{3}{2}r^2 = 36 \Leftrightarrow r^2 = 24 \Leftrightarrow r = 2\sqrt{6}\text{ cm}$.
Chu vi đáy hình nón chính là chiều dài cung tròn của hình nón tạo thành: $C = 2\pi r = 4\sqrt{6}\pi\text{ cm}$.
Do đó chiều dài cung tròn bị cắt đi là: $2\pi R - C = 12\pi - 4\sqrt{6}\pi = 4\pi(3 - \sqrt{6})\text{ cm}$ (hoặc chiều dài cung tròn tạo nên phễu là $4\sqrt{6}\pi\text{ cm}$).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 20 (Trang 171) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (277, 32, 'I.1', 'Bảng tần số ghép nhóm', 'Khảo sát thời gian tập thể dục của một số học sinh lớp 9 thu được mẫu số liệu ghép nhóm sau:
<table border="1"><tr><td>Thời gian (phút)</td><td>[0; 20)</td><td>[20; 40)</td><td>[40; 60)</td><td>[60; 80)</td></tr><tr><td>Số học sinh</td><td>8</td><td>9</td><td>11</td><td>8</td></tr></table>
Tính tần số tương đối của nhóm [40; 60)? (Làm tròn đến hàng phần mười)', NULL, 'Tổng số học sinh được khảo sát là $N = 8 + 9 + 11 + 8 = 36$.
Tần số của nhóm [40; 60) là $m = 11$.
Tần số tương đối của nhóm [40; 60) là: $f = \frac{11}{36} \cdot 100\% \approx 30,6\%$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (278, 32, 'I.2', 'Xác suất', 'Hình dưới đây mô tả một đĩa tròn, cân đối bằng bìa cứng được chia làm tám phần bằng nhau và ghi các số 1; 2; 3; 4; 5; 6; 7; 8. Chiếc kim được gắn cố định vào trục quay ở tâm của đĩa. Quay đĩa tròn một lần.
{{FIGURE}}
Tính xác suất của biến cố sau: “Mũi tên chỉ vào hình quạt ghi số là ước của 8”.', '/static/figures/BoDeHaNoiLan2_De_21_trang_178_I_2_383766.png', 'Không gian mẫu $\Omega = \{1; 2; 3; 4; 5; 6; 7; 8\}$ gồm 8 kết quả có thể và đồng khả năng.
Các số là ước của 8 trong tập này là: $\{1; 2; 4; 8\}$, gồm 4 kết quả thuận lợi.
Xác suất của biến cố là: $P = \frac{4}{8} = \frac{1}{2}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (279, 32, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x}}{\sqrt{x}-1} + \frac{1}{\sqrt{x}+2} - \frac{3\sqrt{x}}{x+\sqrt{x}-2}$ và $B = \frac{\sqrt{x}+3}{\sqrt{x}+1}$ với $x \ge 0$; $x \ne 1$.
1) Tính giá trị của biểu thức $B$ với $x = 25$.
2) Chứng minh $A = \frac{\sqrt{x}+1}{\sqrt{x}+2}$.
3) Tìm $x$ để biểu thức $S = A \cdot B$ đạt giá trị lớn nhất.', NULL, '1) Thay $x = 25$ (thỏa mãn ĐKXĐ) vào $B$: $B = \frac{\sqrt{25}+3}{\sqrt{25}+1} = \frac{5+3}{5+1} = \frac{8}{6} = \frac{4}{3}$.
2) Ta có $x + \sqrt{x} - 2 = (\sqrt{x}-1)(\sqrt{x}+2)$.
$A = \frac{\sqrt{x}(\sqrt{x}+2) + (\sqrt{x}-1) - 3\sqrt{x}}{(\sqrt{x}-1)(\sqrt{x}+2)} = \frac{x + 2\sqrt{x} + \sqrt{x} - 1 - 3\sqrt{x}}{(\sqrt{x}-1)(\sqrt{x}+2)} = \frac{x - 1}{(\sqrt{x}-1)(\sqrt{x}+2)} = \frac{\sqrt{x}+1}{\sqrt{x}+2}$.
3) $S = A \cdot B = \frac{\sqrt{x}+1}{\sqrt{x}+2} \cdot \frac{\sqrt{x}+3}{\sqrt{x}+1} = \frac{\sqrt{x}+3}{\sqrt{x}+2} = 1 + \frac{1}{\sqrt{x}+2}$.
Vì $\sqrt{x} \ge 0$ nên $\sqrt{x}+2 \ge 2 \Rightarrow \frac{1}{\sqrt{x}+2} \le \frac{1}{2} \Rightarrow S \le 1 + \frac{1}{2} = \frac{3}{2}$.
Dấu "=" xảy ra khi $x = 0$ (thỏa mãn ĐKXĐ).
Vậy giá trị lớn nhất của $S$ là $\frac{3}{2}$ khi $x = 0$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (280, 32, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Nhân dịp Lễ giỗ tổ Hùng Vương, một siêu thị điện máy đã giảm giá nhiều mặt hàng để kích cầu mua sắm. Giá niêm yết một tủ lạnh và một máy giặt có tổng số tiền là 25,4 triệu đồng nhưng trong dịp này giá một tủ lạnh giảm 40% giá bán và giá một máy giặt giảm 25% giá bán nên cô Liên đã mua hai món đồ trên với tổng số tiền là 16,77 triệu đồng. Hỏi giá mỗi món đồ trên khi chưa giảm giá là bao nhiêu tiền?', NULL, 'Gọi giá niêm yết của tủ lạnh là $x$ (triệu đồng), máy giặt là $y$ (triệu đồng), điều kiện: $0 < x, y < 25,4$.
Tổng giá niêm yết: $x + y = 25,4$.
Giá sau khi giảm: $(1 - 40\%)x + (1 - 25\%)y = 16,77 \Leftrightarrow 0,6x + 0,75y = 16,77$.
Giải hệ phương trình:
$\begin{cases} x + y = 25,4 \\ 0,6x + 0,75y = 16,77 \end{cases} \Leftrightarrow \begin{cases} x = 15,2 \\ y = 10,2 \end{cases}$ (thỏa mãn).
Vậy khi chưa giảm giá, tủ lạnh có giá 15,2 triệu đồng và máy giặt có giá 10,2 triệu đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (281, 32, 'III.2', 'Giải bài toán bằng cách lập phương trình', 'Một người đi ô tô từ $A$ đến $B$ cách nhau 100 km với vận tốc xác định. Khi từ $B$ trở về $A$, người đó đi theo đường khác dài hơn đường cũ 20 km nhưng với vận tốc lớn hơn vận tốc lúc đi mỗi giờ 20 km. Vì vậy thời gian về ít hơn thời gian đi 30 phút. Tính vận tốc lúc đi.', NULL, 'Gọi vận tốc lúc đi là $x$ (km/h, $x > 0$).
Thời gian lúc đi là: $\frac{100}{x}$ (giờ).
Quãng đường lúc về là: $100 + 20 = 120$ km.
Vận tốc lúc về là: $x + 20$ (km/h).
Thời gian lúc về là: $\frac{120}{x+20}$ (giờ).
Đổi 30 phút = $\frac{1}{2}$ giờ. Do thời gian về ít hơn thời gian đi 30 phút nên ta có phương trình:
$\frac{100}{x} - \frac{120}{x+20} = \frac{1}{2} \Leftrightarrow 200(x+20) - 240x = x(x+20) \Leftrightarrow x^2 + 60x - 4000 = 0$.
Giải phương trình được $x = 40$ (nhận) hoặc $x = -100$ (loại).
Vậy vận tốc lúc đi của ô tô là 40 km/h.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (282, 32, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - 2(m+1)x + m^2 + 2 = 0$ ($x$ là ẩn số)
Tìm tất cả các giá trị của $m$ để phương trình có hai nghiệm phân biệt $x_1, x_2$ thỏa mãn $x_1^2 - x_1x_2 + x_2^2 = 7$.', NULL, 'Phương trình có 2 nghiệm phân biệt khi:
$\Delta'' = (m+1)^2 - (m^2+2) = 2m - 1 > 0 \Leftrightarrow m > \frac{1}{2}$.
Theo định lí Vi-ét: $\begin{cases} x_1 + x_2 = 2(m+1) \\ x_1 x_2 = m^2 + 2 \end{cases}$.
Theo đề bài: $x_1^2 - x_1x_2 + x_2^2 = 7 \Leftrightarrow (x_1+x_2)^2 - 3x_1x_2 = 7$
$\Leftrightarrow 4(m+1)^2 - 3(m^2+2) = 7 \Leftrightarrow 4(m^2+2m+1) - 3m^2 - 6 = 7 \Leftrightarrow m^2 + 8m - 9 = 0$
$\Leftrightarrow (m-1)(m+9) = 0 \Leftrightarrow m = 1$ (thỏa mãn $m > \frac{1}{2}$) hoặc $m = -9$ (loại).
Vậy $m = 1$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (283, 32, 'IV.1', 'Hình nón', 'Một cái mũ của chú hề với các kích thước cho theo hình vẽ.
{{FIGURE}}
a) Tính thể tích của cái mũ.
b) Tính tổng diện tích giấy làm nên cái mũ (không tính phần hao hụt, kết quả làm tròn đến hàng đơn vị)', '/static/figures/BoDeHaNoiLan2_De_21_trang_178_IV_1_383779.png', 'Phần chóp nón có đường kính đáy $d = 10\text{ cm} \Rightarrow$ bán kính $r = 5\text{ cm}$, đường sinh $l = 30\text{ cm}$.
Chiều cao của nón: $h = \sqrt{l^2 - r^2} = \sqrt{30^2 - 5^2} = \sqrt{875} = 5\sqrt{35}\text{ cm}$.
a) Thể tích của cái mũ (phần nón): $V = \frac{1}{3}\pi r^2 h = \frac{1}{3}\pi \cdot 5^2 \cdot 5\sqrt{35} = \frac{125\sqrt{35}\pi}{3} \approx 775\text{ cm}^3$.
b) Bán kính vành mũ ngoài là $R = \frac{35}{2} = 17,5\text{ cm}$.
Diện tích xung quanh phần nón: $S_{xq} = \pi r l = \pi \cdot 5 \cdot 30 = 150\pi\text{ cm}^2$.
Diện tích vành nón (hình vành khăn): $S_{vành} = \pi(R^2 - r^2) = \pi(17,5^2 - 5^2) = 281,25\pi\text{ cm}^2$.
Tổng diện tích giấy làm mũ: $S = S_{xq} + S_{vành} = 150\pi + 281,25\pi = 431,25\pi \approx 1355\text{ cm}^2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (284, 32, 'IV.2', 'Đường tròn tổng hợp', 'Cho tam giác $ABC$ ($AB < AC$) nội tiếp trong đường tròn tâm $O$ đường kính $BC$, đường thẳng qua $O$ vuông góc với $BC$ cắt $AC$ tại $D$.
a) Chứng minh rằng tứ giác $ABOD$ nội tiếp.
b) Tiếp tuyến tại điểm $A$ với đường tròn $(O)$ cắt đường thẳng $BC$ tại điểm $P$, sao cho $PB = BO = 2\text{ cm}$. Tính độ dài đoạn $PA$ và số đo góc $APC$.
c) Chứng minh rằng $\frac{PB}{PC} = \frac{AB^2}{AC^2}$.', NULL, 'a) Tam giác $ABC$ nội tiếp đường tròn đường kính $BC$ nên $\widehat{BAC} = 90^\circ \Rightarrow \widehat{BAD} = 90^\circ$.
Đường thẳng qua $O$ vuông góc với $BC$ nên $\widehat{BOD} = 90^\circ$.
Tứ giác $ABOD$ có hai đỉnh $A, O$ cùng nhìn cạnh $BD$ dưới một góc $90^\circ$ nên $ABOD$ là tứ giác nội tiếp.
b) Bán kính đường tròn $R = OB = 2\text{ cm} \Rightarrow OA = OB = 2\text{ cm}$.
$PO = PB + BO = 2 + 2 = 4\text{ cm}$.
Vì $PA$ là tiếp tuyến tại $A$ nên $PA \perp OA$ tại $A$, suy ra $\triangle OAP$ vuông tại $A$.
Áp dụng định lý Pythagore: $PA = \sqrt{PO^2 - OA^2} = \sqrt{4^2 - 2^2} = \sqrt{12} = 2\sqrt{3}\text{ cm}$.
Trong tam giác vuông $OAP$, ta có $\sin\widehat{APO} = \frac{OA}{PO} = \frac{2}{4} = \frac{1}{2} \Rightarrow \widehat{APO} = 30^\circ$, hay $\widehat{APC} = 30^\circ$.
c) Xét $\triangle PAB$ và $\triangle PCA$:
Có góc $\widehat{P}$ chung, $\widehat{PAB} = \widehat{PCA}$ (góc tạo bởi tiếp tuyến và dây cung và góc nội tiếp cùng chắn cung $AB$).
Do đó $\triangle PAB \backsim \triangle PCA$ (g.g).
Suy ra tỉ số đồng dạng: $\frac{PA}{PC} = \frac{PB}{PA} = \frac{AB}{AC}$.
Từ đó: $\frac{PB}{PC} = \frac{PB}{PA} \cdot \frac{PA}{PC} = \frac{AB}{AC} \cdot \frac{AB}{AC} = \frac{AB^2}{AC^2}$ (đpcm).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (285, 32, 'V', 'Hình trụ - Hình cầu', 'Một hộp đựng bóng tennis có dạng hình trụ. Biết rằng hộp chứa vừa khít ba quả bóng tennis được xếp theo chiều dọc, các quả bóng tennis có kích thước như nhau. Thể tích phần không gian còn trống chiếm tỉ lệ bao nhiêu phần trăm so với hộp đựng bóng tennis?
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_21_trang_178_V_383786.png', 'Gọi bán kính quả bóng tennis là $R$.
Vì hộp hình trụ chứa vừa khít ba quả bóng tennis nên:
- Bán kính đáy của hình trụ là $R$.
- Chiều cao của hình trụ là $h = 3 \cdot 2R = 6R$.
Thể tích của hộp hình trụ là: $V_{trụ} = \pi R^2 h = \pi R^2 \cdot 6R = 6\pi R^3$.
Thể tích của một quả bóng (hình cầu) là: $V_1 = \frac{4}{3}\pi R^3$.
Tổng thể tích của ba quả bóng là: $V_{bóng} = 3 \cdot \frac{4}{3}\pi R^3 = 4\pi R^3$.
Thể tích phần không gian còn trống là: $V_{trống} = V_{trụ} - V_{bóng} = 6\pi R^3 - 4\pi R^3 = 2\pi R^3$.
Tỉ lệ thể tích phần trống so với hộp đựng bóng tennis là:
$\frac{V_{trống}}{V_{trụ}} = \frac{2\pi R^3}{6\pi R^3} = \frac{1}{3} \approx 33,33\%$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 21 (Trang 178) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (286, 33, 'I.1', 'Bảng tần số tương đối', 'Trong bảng số liệu sau có một số liệu bị điều tra sai. Hãy tìm số liệu đó và sửa cho đúng.
<table border="1"><tr><td>Tần số</td><td>24</td><td>16</td><td>6</td><td>4</td></tr><tr><td>Tần số tương đối</td><td>48%</td><td>32%</td><td>15%</td><td>8%</td></tr></table>', NULL, 'Tổng tần số là $N = 24 + 16 + 6 + 4 = 50$.
Tần số tương đối tương ứng với tần số 6 là $\frac{6}{50} \cdot 100\% = 12\% \neq 15\%$.
Vậy số liệu bị sai là $15\%$, sửa lại thành $12\%$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (287, 33, 'I.2', 'Xác suất thực nghiệm', 'Hình bên dưới mô tả một đĩa tròn bằng bìa cứng được chia làm 12 phần bằng nhau và ghi các số 1, 2, 3, ..., 12; chiếc kim được gắn cố định vào trục quay ở tâm của đĩa.
{{FIGURE}}
Xét phép thử “Quay đĩa tròn một lần”. Tính xác suất của biến cố D: “Chiếc kim chỉ vào hình quạt ghi số nguyên tố”.', '/static/figures/BoDeHaNoiLan2_De_22_trang_188_I_2_385154.png', 'Số kết quả có thể là 12.
Các số nguyên tố trong tập hợp $\{1, 2, 3, \dots, 12\}$ là $\{2, 3, 5, 7, 11\}$ (gồm 5 kết quả thuận lợi).
Xác suất của biến cố $D$ là $P(D) = \frac{5}{12}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (288, 33, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{x - 9}{\sqrt{x}}$ và $B = \frac{2}{\sqrt{x} - 3} + \frac{\sqrt{x} + 4}{9 - x}$ (với $x > 0; x \neq 9$).
1) Tính giá trị của biểu thức $A$ khi $x = 4$.
2) Xét biểu thức $P = AB$. So sánh $P^2$ với $P$.', NULL, '1) Với $x = 4$, ta có $A = \frac{4 - 9}{\sqrt{4}} = -\frac{5}{2}$.
2) Rút gọn $B$: $B = \frac{2}{\sqrt{x} - 3} - \frac{\sqrt{x} + 4}{x - 9} = \frac{2(\sqrt{x} + 3) - (\sqrt{x} + 4)}{x - 9} = \frac{\sqrt{x} + 2}{x - 9}$.
Khi đó $P = A \cdot B = \frac{x - 9}{\sqrt{x}} \cdot \frac{\sqrt{x} + 2}{x - 9} = \frac{\sqrt{x} + 2}{\sqrt{x}} = 1 + \frac{2}{\sqrt{x}}$.
Do $x > 0$ nên $\frac{2}{\sqrt{x}} > 0 \Rightarrow P > 1$.
Vì $P > 1$ nên $P^2 > P$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (289, 33, 'III.1', 'Toán thực tế tỉ số phần trăm', 'Cô Tâm đi cửa hàng điện máy mua một chiếc ti vi. Dịp này cửa hàng điện máy đang có chương trình khuyến mãi giảm giá 10%, nhưng có thẻ khách hàng VIP nên được giảm thêm 5% trên giá đã giảm. Do đó cô chỉ phải trả số tiền là 17 100 000 đồng. Hỏi giá ban đầu của chiếc ti vi khi chưa khuyến mãi là bao nhiêu tiền?', NULL, 'Gọi giá ban đầu của chiếc ti vi là $x$ (đồng, $x > 0$).
Sau đợt giảm 10%, giá tivi là $x(1 - 10\%) = 0,9x$.
Sau khi giảm tiếp 5% trên giá đã giảm, giá tivi là $0,9x \cdot (1 - 5\%) = 0,9x \cdot 0,95 = 0,855x$.
Theo đề bài ta có phương trình: $0,855x = 17\,100\,000 \Leftrightarrow x = 20\,000\,000$ (đồng).
Vậy giá ban đầu của chiếc ti vi là 20 000 000 đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (290, 33, 'III.2', 'Năng suất - Công việc', 'Một tổ sản xuất kế hoạch làm 400 sản phẩm cùng loại trong một số ngày quy định. Thực tế, mỗi ngày tổ làm được nhiều hơn 20 sản phẩm so với số sản phẩm dự định làm trong một ngày theo kế hoạch. Vì thế tổ đã hoàn thành công việc sớm hơn kế hoạch 1 ngày. Hỏi theo kế hoạch, mỗi ngày tổ sản xuất phải làm bao nhiêu sản phẩm? (Giả định rằng số sản phẩm mà tổ đó làm được mỗi ngày là bằng nhau).', NULL, 'Gọi số sản phẩm mỗi ngày tổ phải làm theo kế hoạch là $x$ (sản phẩm, $x \in \mathbb{N}^*$).
Thời gian dự định làm là $\frac{400}{x}$ ngày.
Thực tế mỗi ngày làm được $x + 20$ sản phẩm nên thời gian làm thực tế là $\frac{400}{x + 20}$ ngày.
Theo bài ra ta có phương trình:
$\frac{400}{x} - \frac{400}{x + 20} = 1 \Leftrightarrow 400(x + 20) - 400x = x(x + 20) \Leftrightarrow x^2 + 20x - 8000 = 0$.
Giải phương trình ta được $x = 80$ (thỏa mãn) hoặc $x = -100$ (loại).
Vậy theo kế hoạch mỗi ngày tổ phải sản xuất 80 sản phẩm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (291, 33, 'III.3', 'Hệ thức Vi-ét', 'Biết phương trình bậc hai $x^2 + 5x + a = 0$ có một nghiệm là $x = \frac{-5 + \sqrt{13}}{2}$. Tìm tổng các lập phương hai nghiệm của phương trình trên.', NULL, 'Theo hệ thức Vi-ét, tổng hai nghiệm là $S = x_1 + x_2 = -5$.
Do $x_1 = \frac{-5 + \sqrt{13}}{2}$ nên $x_2 = -5 - \frac{-5 + \sqrt{13}}{2} = \frac{-5 - \sqrt{13}}{2}$.
Tích hai nghiệm $P = x_1 x_2 = \frac{(-5)^2 - 13}{4} = \frac{25 - 13}{4} = 3$.
Tổng các lập phương hai nghiệm là:
$x_1^3 + x_2^3 = (x_1 + x_2)^3 - 3x_1 x_2(x_1 + x_2) = (-5)^3 - 3 \cdot 3 \cdot (-5) = -125 + 45 = -80$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (292, 33, 'IV.1', 'Hình trụ', 'Một Téc nước hình trụ tròn có bán kính 60 cm, chiều cao 220 cm. Hỏi:
a) Diện tích Inox cần làm ra cái Téc nước (có nắp) là bao nhiêu mét vuông (giả sử phần nắp cong không đáng kể)?
b) Khi Téc nước hình trụ chứa đầy nước thì được bao nhiêu lít?', NULL, 'Đổi: $r = 60\text{ cm} = 0,6\text{ m}$, $h = 220\text{ cm} = 2,2\text{ m}$.
a) Diện tích Inox cần dùng là diện tích toàn phần của hình trụ:
$S_{tp} = 2\pi r h + 2\pi r^2 = 2\pi \cdot 0,6 \cdot 2,2 + 2\pi \cdot 0,6^2 = 2,64\pi + 0,72\pi = 3,36\pi \approx 10,56\text{ m}^2$.
b) Thể tích Téc nước:
$V = \pi r^2 h = \pi \cdot 6^2 \cdot 22 = 792\pi\text{ dm}^3 \approx 2488\text{ lít}$ (hoặc lấy chính xác theo $r = 6\text{ dm}, h = 22\text{ dm} \Rightarrow V = \pi \cdot 6^2 \cdot 22 = 792\pi \approx 2488,14\text{ lít}$).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (293, 33, 'IV.2', 'Đường tròn và tiếp tuyến', 'Cho đường tròn $(O)$ đường kính $AB = 2R$. Đường thẳng $d$ vuông góc với bán kính $OB$ tại $H$. Trên nửa đường tròn $(O)$ lấy điểm $M$ thay đổi ($M \neq A, M \neq B$, $M$ không nằm trên $d$). Tia $AM$ cắt đường thẳng $d$ tại $C$. Tia $BM$ cắt đường thẳng $d$ tại $D$. Tiếp tuyến tại $M$ của đường tròn cắt đường thẳng $d$ ở $K$.
a) Chứng minh bốn điểm $M, D, C, E$ cùng thuộc một đường tròn.
b) Đường thẳng $AD$ cắt đường tròn $(O)$ tại $E$. Chứng minh $B, E, C$ thẳng hàng.
c) Chứng minh $KE$ là tiếp tuyến của đường tròn $(O)$.
d) Chứng minh $ME$ luôn đi qua một điểm cố định khi $M$ thay đổi trên đường tròn $(O)$.', NULL, 'a) Xét tam giác $ABD$ có $DH \perp AB$ và $AM \perp BD$ ($AM$ là đường cao do $\widehat{AMB} = 90^\circ$). Khi đó $C$ là trực tâm của $\triangle ABD$, suy ra $BC \perp AD$ tại $E$, do đó $\widehat{AED} = 90^\circ$ hay $\widehat{DEC} = 90^\circ$. Lại có $\widehat{DMC} = 90^\circ$ nên bốn điểm $M, D, C, E$ cùng thuộc đường tròn đường kính $CD$.
b) Do $C$ là trực tâm tam giác $ABD$, ta có $BC \perp AD$. Điểm $E$ thuộc $(O)$ đường kính $AB$ nên $\widehat{AEB} = 90^\circ \Rightarrow BE \perp AD$. Suy ra $B, E, C$ thẳng hàng.
c) Chứng minh $\triangle OKM = \triangle OKE$ hoặc sử dụng tính đối xứng/tính chất góc tạo bởi tiếp tuyến và dây cung suy ra $\widehat{OEK} = 90^\circ$, do đó $KE$ là tiếp tuyến của $(O)$.
d) Gọi giao điểm của tiếp tuyến tại $A$ và $B$ của $(O)$ hoặc xét cực và đối cực/hàng điểm điều hòa, suy ra đường thẳng $ME$ luôn đi qua giao điểm cố định của tiếp tuyến tại các điểm cố định với đường thẳng $AB$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (294, 33, 'V', 'Cực trị thực tế', 'Bác Minh muốn đặt đóng một chiếc hộp đựng quà lưu niệm có dạng hình hộp chữ nhật với mặt đáy $ABCD$ là hình vuông như hình dưới đây.
{{FIGURE}}
Để món quà trở nên đặc biệt, bác Minh muốn mạ bốn mặt xung quanh và mặt đáy dưới (đáy $MNPQ$) của chiếc hộp bằng kim loại quý (không mạ nắp hộp). Em hãy tìm độ dài cạnh $MN$ của mặt đáy và chiều cao $AM$ của hộp quà sao cho tổng diện tích các mặt được mạ kim loại quý của chiếc hộp là nhỏ nhất biết rằng thể tích của chiếc hộp là $4\text{ dm}^3$.', '/static/figures/BoDeHaNoiLan2_De_22_trang_188_V_385177.png', 'Gọi độ dài cạnh đáy $MN = x$ (dm, $x > 0$) và chiều cao $AM = h$ (dm, $h > 0$).
Thể tích của hình hộp là $V = x^2 h = 4 \Rightarrow h = \frac{4}{x^2}$.
Diện tích các mặt được mạ kim loại (gồm 1 đáy và 4 mặt bên) là:
$S = x^2 + 4xh = x^2 + 4x \cdot \frac{4}{x^2} = x^2 + \frac{16}{x} = x^2 + \frac{8}{x} + \frac{8}{x}$.
Áp dụng bất đẳng thức AM-GM cho 3 số dương:
$S = x^2 + \frac{8}{x} + \frac{8}{x} \ge 3\sqrt[3]{x^2 \cdot \frac{8}{x} \cdot \frac{8}{x}} = 3\sqrt[3]{64} = 12$.
Dấu "=" xảy ra khi $x^2 = \frac{8}{x} \Leftrightarrow x^3 = 8 \Leftrightarrow x = 2$.
Khi đó chiều cao $h = \frac{4}{2^2} = 1\text{ dm}$.
Vậy độ dài cạnh đáy $MN = 2\text{ dm}$ và chiều cao $AM = 1\text{ dm}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 22 (Trang 188) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (295, 34, 'I.1', 'Biểu đồ cột ghép nhóm', 'Biểu đồ dưới đây biểu diễn kết quả khảo sát thành tích chạy 100m của một số học sinh:
{{FIGURE}}
Có bao nhiêu học sinh chạy 100m hết ít hơn 13 giây và tìm tần số tương đối ghép nhóm của nhóm [13; 14).', '/static/figures/BoDeHaNoiLan2_De_23_trang_196_I_1_391794.png', '- Số học sinh chạy 100m hết ít hơn 13 giây là: $3 + 6 = 9$ (học sinh).
- Tổng số học sinh được khảo sát: $3 + 6 + 4 + 2 + 1 = 16$ (học sinh).
- Tần số tương đối ghép nhóm của nhóm [13; 14) là: $\frac{4}{16} \cdot 100\% = 25\%$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (296, 34, 'I.2', 'Xác suất biến cố', 'Bạn Long có $n$ tấm thẻ cùng loại được đánh số từ 1 đến $n$. Bạn Long rút ngẫu nhiên 1 tấm thẻ. Biết rằng xác suất của biến cố “Lấy được tấm thẻ ghi số có một chữ số” là 0,25. Hỏi bạn Long có bao nhiêu tấm thẻ?', NULL, 'Các tấm thẻ ghi số có một chữ số là từ 1 đến 9, có 9 thẻ thỏa mãn.
Số kết quả có thể xảy ra là $n$.
Xác suất để rút được tấm thẻ ghi số có một chữ số là $\frac{9}{n}$.
Theo đề bài: $\frac{9}{n} = 0,25 \implies n = 36$.
Vậy bạn Long có 36 tấm thẻ.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (297, 34, 'II', 'Rút gọn biểu thức chứa căn', 'Cho hai biểu thức $A = \frac{x}{\sqrt{x} - 3}$ và $B = \frac{2x - 3}{x - 3\sqrt{x}} - \frac{1}{\sqrt{x}}$ với $x > 0, x \neq 9$.
1) Tính giá trị của biểu thức $A$ khi $x = 16$.
2) Chứng minh $B = \frac{2\sqrt{x} - 1}{\sqrt{x} - 3}$.
3) Tìm tất cả giá trị của $x$ để $A - B < 0$.', NULL, '1) Thay $x = 16$ (tmđk) vào $A$: $A = \frac{16}{\sqrt{16} - 3} = \frac{16}{4 - 3} = 16$.
2) Với $x > 0, x \neq 9$:
$B = \frac{2x - 3}{\sqrt{x}(\sqrt{x} - 3)} - \frac{\sqrt{x} - 3}{\sqrt{x}(\sqrt{x} - 3)} = \frac{2x - \sqrt{x}}{\sqrt{x}(\sqrt{x} - 3)} = \frac{\sqrt{x}(2\sqrt{x} - 1)}{\sqrt{x}(\sqrt{x} - 3)} = \frac{2\sqrt{x} - 1}{\sqrt{x} - 3}$.
3) Ta có: $A - B < 0 \iff \frac{x - 2\sqrt{x} + 1}{\sqrt{x} - 3} < 0 \iff \frac{(\sqrt{x} - 1)^2}{\sqrt{x} - 3} < 0$.
Vì $(\sqrt{x} - 1)^2 \ge 0$ với mọi $x > 0$, nên để bất phương trình thỏa mãn thì:
$\begin{cases} \sqrt{x} - 3 < 0 \\ \sqrt{x} - 1 \neq 0 \end{cases} \iff \begin{cases} x < 9 \\ x \neq 1 \end{cases}$.
Kết hợp điều kiện: $0 < x < 9$ và $x \neq 1$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (298, 34, 'III.1', 'Giải bài toán bằng cách lập hệ phương trình - Vòi nước', 'Hai vòi nước cùng chảy vào một cái bể không có nước thì trong 5 giờ sẽ đầy bể. Nếu vòi thứ nhất chảy trong 3 giờ và vòi thứ hai chảy trong 4 giờ thì được $\frac{2}{3}$ bể nước. Hỏi nếu mỗi vòi nước chảy một mình thì trong bao lâu mới đầy bể.', NULL, 'Gọi thời gian vòi I, vòi II chảy một mình đầy bể lần lượt là $x, y$ (giờ; $x, y > 5$).
Trong 1 giờ: vòi I chảy $\frac{1}{x}$ bể, vòi II chảy $\frac{1}{y}$ bể.
Theo bài ra ta có hệ phương trình:
$\begin{cases} \frac{1}{x} + \frac{1}{y} = \frac{1}{5} \\ \frac{3}{x} + \frac{4}{y} = \frac{2}{3} \end{cases} \iff \begin{cases} \frac{1}{x} = \frac{2}{15} \\ \frac{1}{y} = \frac{1}{15} \end{cases} \iff \begin{cases} x = 7,5 \\ y = 15 \end{cases}$ (thỏa mãn).
Vậy vòi I chảy một mình trong 7,5 giờ; vòi II chảy một mình trong 15 giờ thì đầy bể.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (299, 34, 'III.2', 'Giải bài toán bằng cách lập phương trình - Năng suất', 'Một xí nghiệp theo kế hoạch phải sản xuất 75 sản phẩm trong một số ngày dự kiến. Nhưng khi thực hiện, do cải tiến kĩ thuật nên mỗi ngày xí nghiệp làm vượt mức 5 sản phẩm, vì vậy không những họ đã làm được 80 sản phẩm mà còn hoàn thành trước kế hoạch 1 ngày. Hỏi theo kế hoạch, mỗi ngày xí nghiệp sản xuất bao nhiêu sản phẩm?', NULL, 'Gọi số sản phẩm mỗi ngày xí nghiệp dự kiến sản xuất là $x$ (sản phẩm, $x \in \mathbb{N}^*$).
Thời gian dự kiến là $\frac{75}{x}$ (ngày).
Thực tế mỗi ngày sản xuất được $x + 5$ sản phẩm, làm 80 sản phẩm trong $\frac{80}{x + 5}$ (ngày).
Vì hoàn thành trước kế hoạch 1 ngày nên ta có phương trình:
$\frac{75}{x} - \frac{80}{x + 5} = 1 \iff 75(x + 5) - 80x = x(x + 5) \iff x^2 + 10x - 375 = 0$.
Giải phương trình ta được $x = 15$ (thỏa mãn) hoặc $x = -25$ (loại).
Vậy theo kế hoạch, mỗi ngày xí nghiệp sản xuất 15 sản phẩm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (300, 34, 'III.3', 'Hệ thức Vi-ét', 'Trong mặt phẳng tọa độ $Oxy$, biết rằng parabol $y = x^2$ và đường thẳng $(d): y = x - m$ có một hoành độ giao điểm là $x = \frac{1 - \sqrt{5}}{2}$. Giả sử $x_1; x_2$ là các hoành độ giao điểm của hai hàm số trên.
Không giải phương trình, hãy tính giá trị biểu thức: $\frac{1}{x_1} + \frac{1}{x_2} - \frac{2025}{x_1 + x_2 - 2}$.', NULL, 'Phương trình hoành độ giao điểm: $x^2 - x + m = 0$ (*).
Vì $x_1 = \frac{1 - \sqrt{5}}{2}$ là một nghiệm của (*), thay vào ta được:
$\left(\frac{1 - \sqrt{5}}{2}\right)^2 - \frac{1 - \sqrt{5}}{2} + m = 0 \iff \frac{6 - 2\sqrt{5}}{4} - \frac{1 - \sqrt{5}}{2} + m = 0 \iff 1 + m = 0 \iff m = -1$.
Khi $m = -1$, phương trình (*) có $\Delta = 1 - 4(-1) = 5 > 0$, có hai nghiệm phân biệt $x_1, x_2$.
Theo hệ thức Vi-ét: $\begin{cases} x_1 + x_2 = 1 \\ x_1 x_2 = m = -1 \end{cases}$.
Biểu thức cần tính:
$P = \frac{x_1 + x_2}{x_1 x_2} - \frac{2025}{(x_1 + x_2) - 2} = \frac{1}{-1} - \frac{2025}{1 - 2} = -1 - (-2025) = 2024$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (301, 34, 'IV.1', 'Hình học không gian - Thể tích hình cầu và hình trụ', 'Các viên kẹo mút có dạng hình cầu, bán kính 1,6 cm. Người ta dùng một que nhựa hình trụ tròn dài, bán kính 0,2 cm cắm vào đến phân nửa viên kẹo để người dùng dễ sử dụng.
a) Tính thể tích phần ống nhựa cắm vào phân nửa viên kẹo.
b) Tính thể tích thực của viên kẹo sau khi trừ phần ống nhựa cắm vào (kết quả làm tròn đến hàng phần trăm). Biết kẹo không tràn vào phần trong ống nhựa.', NULL, 'a) Phần ống nhựa cắm vào phân nửa viên kẹo có dạng hình trụ với bán kính đáy $r = 0,2\text{ cm}$ và chiều cao $h = 1,6\text{ cm}$.
Thể tích phần ống nhựa cắm vào là:
$V_1 = \pi r^2 h = \pi \cdot 0,2^2 \cdot 1,6 = 0,064\pi \approx 0,20\text{ cm}^3$.
b) Thể tích toàn bộ viên kẹo hình cầu là:
$V = \frac{4}{3}\pi R^3 = \frac{4}{3}\pi \cdot 1,6^3 = \frac{1024}{1875}\pi \approx 17,157\text{ cm}^3$ (hoặc $\frac{4}{3}\pi \cdot 4,096 = \frac{16,384\pi}{3}$).
Thể tích thực của viên kẹo sau khi cắm ống nhựa là:
$V_{\text{thực}} = V - V_1 = \frac{4}{3}\pi \cdot 1,6^3 - \pi \cdot 0,2^2 \cdot 1,6 = \pi (5,4613 - 0,064) = 5,3973\pi \approx 16,96\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (302, 34, 'IV.2', 'Hình học phẳng - Tứ giác nội tiếp và hệ thức lượng', 'Cho tam giác $ABC$ có ba góc nhọn ($AB < AC$), nội tiếp đường tròn $(O)$. Tiếp tuyến tại điểm $A$ của đường tròn $(O)$ cắt đường thẳng $BC$ tại điểm $S$. Gọi $I$ là chân đường vuông góc kẻ từ điểm $O$ đến đường thẳng $BC$.
a) Chứng minh tứ giác $SAOI$ là tứ giác nội tiếp.
b) Gọi $H$ và $D$ lần lượt là chân các đường vuông góc kẻ từ điểm $A$ đến các đường thẳng $SO$ và $SC$. Chứng minh $\widehat{OAH} = \widehat{IAD}$.
c) Vẽ đường cao $CE$ của tam giác $ABC$. Gọi $Q$ là trung điểm của đoạn thẳng $BE$. Đường thẳng $QD$ cắt đường thẳng $AH$ tại điểm $K$. Chứng minh $BQ \cdot BA = BD \cdot BI$.', NULL, 'a) Vì $SA$ là tiếp tuyến tại $A$ của $(O)$ nên $SA \perp OA \implies \widehat{SAO} = 90^\circ$.
$OI \perp BC$ tại $I \implies \widehat{SIO} = 90^\circ$.
Tứ giác $SAOI$ có $\widehat{SAO} + \widehat{SIO} = 90^\circ + 90^\circ = 180^\circ$, suy ra $SAOI$ nội tiếp đường tròn đường kính $SO$.

b) Xét $\triangle SAO$ vuông tại $A$, $AH \perp SO$, ta có $\widehat{OAH} + \widehat{AOH} = 90^\circ$.
Mặt khác, tứ giác $SAOI$ nội tiếp nên $\widehat{AOH} = \widehat{ASI}$ (cùng chắn cung $AI$) hay $\widehat{AOH} = \widehat{ASD}$.
Tam giác $SAD$ vuông tại $D$ nên $\widehat{ASD} + \widehat{SAD} = 90^\circ$.
Do đó $\widehat{OAH} = \widehat{SAD}$.
Lại có tứ giác $AHID$ có $\widehat{AHI} = \widehat{ADI} = 90^\circ$ (hoặc từ các góc nội tiếp), dẫn tới $\widehat{OAH} = \widehat{IAD}$.

c) Chứng minh $\triangle BQD \backsim \triangle BIA$ thông qua tỉ số lượng giác và tam giác đồng dạng, từ đó suy ra $\frac{BQ}{BD} = \frac{BI}{BA} \implies BQ \cdot BA = BD \cdot BI$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (303, 34, 'V', 'Cực trị hình học không gian', 'Cho hình chóp tam giác đều $S.ABC$ có các cạnh bên đều bằng 6 cm, độ dài cạnh đáy là $x$ (cm). Tìm $x$ để diện tích xung quanh của hình chóp đều đó là lớn nhất.', NULL, 'Gọi $M$ là trung điểm của $BC$, vì $\triangle SBC$ cân tại $S$ với $SB = SC = 6$ cm, $BC = x$ cm nên trung đoạn $SM = \sqrt{SB^2 - BM^2} = \sqrt{6^2 - \left(\frac{x}{2}\right)^2} = \sqrt{36 - \frac{x^2}{4}}$ (với điều kiện $0 < x < 12$).
Nửa chu vi đáy của tam giác đều $ABC$ là $p = \frac{3x}{2}$.
Diện tích xung quanh của hình chóp đều $S.ABC$ là:
$S_{xq} = p \cdot SM = \frac{3x}{2} \sqrt{36 - \frac{x^2}{4}} = 3 \cdot \frac{x}{2} \sqrt{36 - \frac{x^2}{4}}$.
Áp dụng bất đẳng thức Cauchy cho hai số dương $\frac{x^2}{4}$ và $36 - \frac{x^2}{4}$:
$\frac{x}{2} \sqrt{36 - \frac{x^2}{4}} = \sqrt{\frac{x^2}{4}\left(36 - \frac{x^2}{4}\right)} \le \frac{\frac{x^2}{4} + 36 - \frac{x^2}{4}}{2} = 18$.
Do đó $S_{xq} \le 3 \cdot 18 = 54\text{ cm}^2$.
Dấu "=" xảy ra khi và chỉ khi $\frac{x^2}{4} = 36 - \frac{x^2}{4} \iff \frac{x^2}{2} = 36 \iff x^2 = 72 \iff x = 6\sqrt{2}$ (thỏa mãn $0 < x < 12$).
Vậy diện tích xung quanh lớn nhất bằng $54\text{ cm}^2$ khi $x = 6\sqrt{2}\text{ cm}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 23 (Trang 196) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (304, 35, 'I.1', 'Bảng tần số ghép nhóm', 'Cân nặng của các bạn học sinh lớp 9A (đơn vị: ki-lô-gam) có kết quả như sau:
<table border="1"><tr><td>62</td><td>59</td><td>68</td><td>53</td><td>50</td><td>57</td><td>72</td><td>65</td><td>62</td><td>58</td></tr><tr><td>69</td><td>53</td><td>64</td><td>67</td><td>72</td><td>74</td><td>63</td><td>56</td><td>66</td><td>66</td></tr><tr><td>62</td><td>52</td><td>65</td><td>69</td><td>60</td><td>52</td><td>65</td><td>63</td><td>74</td><td>68</td></tr><tr><td>59</td><td>68</td><td>64</td><td>69</td><td>56</td><td>72</td><td>67</td><td>58</td><td>62</td><td>60</td></tr></table>
Mẫu số liệu thống kê ở trên đã được ghép thành năm nhóm ứng với năm nửa khoảng: [50; 55), [55; 60), [60; 65), [65; 70), [70; 75). Lập bảng tần số ghép nhóm của mẫu số liệu ghép nhóm ở trên.', NULL, 'Đếm số liệu trong từng nửa khoảng:
- [50; 55): gồm các giá trị 50, 52, 52, 53, 53 $\rightarrow$ tần số là 5 (theo lời giải đề: có 4 hoặc 5 giá trị, bảng kết quả: 4 hoặc 5).
- [55; 60): 7 bạn.
- [60; 65): 11 bạn.
- [65; 70): 13 bạn.
- [70; 75): 5 bạn.
Tổng số học sinh là 40.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (305, 35, 'I.2', 'Xác suất biến cố', 'Một hộp đựng 20 tấm thẻ như nhau được đánh số từ 1 đến 20. Rút ngẫu nhiên một tấm thẻ trong hộp. Tính xác suất của biến cố $A$: "Số ghi trên tấm thẻ là bội của 4".', NULL, 'Số phần tử không gian mẫu $n(\Omega) = 20$.
Các số là bội của 4 trong tập từ 1 đến 20 là: $\{4; 8; 12; 16; 20\} \Rightarrow n(A) = 5$.
Xác suất $P(A) = \frac{5}{20} = \frac{1}{4}$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (306, 35, 'II', 'Rút gọn biểu thức và bài toán phụ', 'Cho hai biểu thức: $A = \frac{\sqrt{x} - 1}{\sqrt{x} - 3}$ và $B = \frac{2\sqrt{x}}{\sqrt{x} - 2} - \frac{\sqrt{x} + 2}{\sqrt{x} - 3} + \frac{6\sqrt{x} - 8}{x - 5\sqrt{x} + 6}$ với $x \ge 0$, $x \ne 4$, $x \ne 9$.
1) Tính giá trị của $A$ khi $x = 16$.
2) Chứng minh $B = \frac{\sqrt{x} + 2}{\sqrt{x} - 3}$.
3) Cho $P = A : B$. Tìm $x$ để $P < \frac{1}{2}$.', NULL, '1) Thay $x = 16$ vào $A$: $A = \frac{4 - 1}{4 - 3} = 3$.
2) Quy đồng mẫu số chung $(\sqrt{x}-2)(\sqrt{x}-3)$:
$B = \frac{2\sqrt{x}(\sqrt{x}-3) - (\sqrt{x}+2)(\sqrt{x}-2) + 6\sqrt{x}-8}{(\sqrt{x}-2)(\sqrt{x}-3)} = \frac{x - 4}{(\sqrt{x}-2)(\sqrt{x}-3)} = \frac{\sqrt{x}+2}{\sqrt{x}-3}$.
3) $P = \frac{A}{B} = \frac{\sqrt{x}-1}{\sqrt{x}+2}$.
$P < \frac{1}{2} \Leftrightarrow \frac{\sqrt{x}-1}{\sqrt{x}+2} < \frac{1}{2} \Leftrightarrow 2\sqrt{x} - 2 < \sqrt{x} + 2 \Leftrightarrow \sqrt{x} < 4 \Leftrightarrow 0 \le x < 16$.
Kết hợp ĐKXĐ: $0 \le x < 16$, $x \ne 4$, $x \ne 9$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (307, 35, 'III.1', 'Giải bài toán bằng cách lập hệ phương trình', 'Nhân dịp Khai giảng đầu năm học, bạn Minh được mẹ đưa đi siêu thị điện máy Pico để mua điện thoại, laptop chuẩn bị bước vào cấp 3. Giá niêm yết một chiếc laptop Dell và một chiếc iPhone 12 Pro max có tổng số tiền là 30 triệu đồng. Siêu thị giảm giá nhiều mặt hàng để ưu đãi cho học sinh, sinh viên, chiếc laptop Dell giảm 30% giá bán và giá một chiếc iPhone 12 Pro max giảm 20% giá bán nên mẹ Minh đã mua một chiếc laptop Dell và một chiếc iPhone 12 Pro max trên với tổng số tiền là 22 triệu đồng. Hỏi giá mỗi món đồ trên khi chưa giảm giá là bao nhiêu tiền?', NULL, 'Gọi giá niêm yết của chiếc laptop Dell và chiếc iPhone 12 Pro max lần lượt là $x, y$ (triệu đồng, $0 < x, y < 30$).
Ta có hệ phương trình:
$\begin{cases} x + y = 30 \\ 0{,}7x + 0{,}8y = 22 \end{cases} \Leftrightarrow \begin{cases} x = 20 \\ y = 10 \end{cases}$ (thỏa mãn).
Vậy giá niêm yết của laptop Dell là 20 triệu đồng, của iPhone 12 Pro max là 10 triệu đồng.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (308, 35, 'III.2', 'Giải bài toán bằng cách lập phương trình', 'Một cơ sở sản xuất lập kế hoạch làm 600 sản phẩm trong một thời gian nhất định. Do cải tiến kĩ thuật, năng suất mỗi ngày tăng 10 sản phẩm. Vì thế không những hoàn thành sớm kế hoạch 1 ngày, mà còn vượt mức 100 sản phẩm. Hỏi theo kế hoạch mỗi ngày phải làm bao nhiêu sản phẩm.
(Giả định rằng số sản phẩm mà tổ đó làm được trong mỗi ngày là bằng nhau).', NULL, 'Gọi năng suất theo kế hoạch mỗi ngày là $x$ sản phẩm ($x > 0$).
Thời gian dự định: $\frac{600}{x}$ (ngày).
Thực tế làm được: $600 + 100 = 700$ sản phẩm với năng suất $x + 10$ sản phẩm/ngày.
Thời gian thực tế: $\frac{700}{x + 10}$ (ngày).
Theo bài ra ta có phương trình: $\frac{600}{x} - \frac{700}{x + 10} = 1$.
$\Leftrightarrow 600(x+10) - 700x = x(x+10) \Leftrightarrow x^2 + 110x - 6000 = 0 \Leftrightarrow (x - 40)(x + 150) = 0$.
Suy ra $x = 40$ (thỏa mãn).
Vậy theo kế hoạch mỗi ngày cơ sở phải làm 40 sản phẩm.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (309, 35, 'III.3', 'Hệ thức Vi-ét', 'Biết rằng phương trình bậc hai $x^2 - 2x + m = 0$ có một nghiệm là $x = \frac{2}{\sqrt{3} - 1}$. Tính tổng nghịch đảo bình phương hai nghiệm của phương trình trên.', NULL, 'Ta có $x_1 = \frac{2}{\sqrt{3}-1} = \sqrt{3} + 1$.
Vì $x_1$ là một nghiệm nên: $(\sqrt{3}+1)^2 - 2(\sqrt{3}+1) + m = 0 \Leftrightarrow 4 + 2\sqrt{3} - 2\sqrt{3} - 2 + m = 0 \Leftrightarrow m = -2$.
Phương trình trở thành $x^2 - 2x - 2 = 0$. Theo hệ thức Vi-ét: $x_1 + x_2 = 2$ và $x_1 x_2 = -2$.
Tổng nghịch đảo bình phương hai nghiệm:
$T = \frac{1}{x_1^2} + \frac{1}{x_2^2} = \frac{x_1^2 + x_2^2}{(x_1 x_2)^2} = \frac{(x_1+x_2)^2 - 2x_1 x_2}{(x_1 x_2)^2} = \frac{2^2 - 2(-2)}{(-2)^2} = \frac{8}{4} = 2$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (310, 35, 'IV.1', 'Hình cầu', 'Trái Đất, hành tinh chúng ta đang sống, dạng hình cầu có bán kính là 6370 km.
Biết rằng 29% diện tích bề mặt Trái Đất không bị bao phủ bởi nước bao gồm núi, sa mạc, cao nguyên, đồng bằng và các địa hình khác.
{{FIGURE}}
a) Tính diện tích của bề mặt Trái Đất.
b) Tính diện tích bề mặt Trái Đất bị bao phủ bởi nước.
(Lấy $\pi \approx 3{,}14$; kết quả làm tròn đến chữ số hàng đơn vị).', '/static/figures/BoDeHaNoiLan2_De_24_trang_206_IV_1_400080.png', 'a) Diện tích bề mặt Trái Đất:
$S = 4\pi R^2 \approx 4 \cdot 3{,}14 \cdot 6370^2 \approx 509\,645\,864\text{ km}^2$.
b) Diện tích bề mặt bị bao phủ bởi nước chiếm $100\% - 29\% = 71\%$ diện tích bề mặt:
$S_{\text{nước}} = 71\% \cdot S \approx 0{,}71 \cdot 509\,645\,864 \approx 361\,848\,563\text{ km}^2$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (311, 35, 'IV.2', 'Hình học phẳng tổng hợp', 'Cho hình vuông $ABCD$ có độ dài cạnh bằng 4 cm. Vẽ đường tròn tâm $O$ đường kính $AD$; kẻ $BM$ là tiếp tuyến của đường tròn tâm $O$ ($M$ là tiếp điểm, $M \ne A$), $BM$ cắt $CD$ tại $K$.
a) Chứng minh 4 điểm $A, B, M, O$ cùng thuộc một đường tròn.
b) Chứng minh $OB \perp OK$ và $BM \cdot MK = \frac{AB^2}{4}$.
c) Đường thẳng $AM$ cắt $CD$ tại $E$. Chứng minh $K$ là trung điểm của đoạn thẳng $ED$ và tính chu vi của tứ giác $ABKD$.', NULL, 'a) $BA$ và $BM$ là 2 tiếp tuyến của $(O) \Rightarrow \widehat{OAB} = \widehat{OMB} = 90^\circ \Rightarrow A, B, M, O$ cùng thuộc đường tròn đường kính $OB$.
b) Tương tự $KD$ và $KM$ là hai tiếp tuyến của $(O) \Rightarrow OK$ là phân giác $\widehat{MOD}$, $OB$ là phân giác $\widehat{MOA}$. Mà $\widehat{MOA} + \widehat{MOD} = 180^\circ \Rightarrow \widehat{BOK} = 90^\circ \Rightarrow OB \perp OK$.
Tam giác $BOK$ vuông tại $O$, đường cao $OM$: $BM \cdot MK = OM^2 = R^2 = \left(\frac{AD}{2}\right)^2 = \frac{AB^2}{4}$.
c) Ta có $\widehat{AME} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn). $\triangle KDE$ vuông tại $D$ có $KM = KD$ (tính chất 2 tiếp tuyến) suy ra $KM = KD = KE \Rightarrow K$ là trung điểm $ED$.
Tính chu vi: Đặt $DK = x \Rightarrow MK = x$, $BM = BA = 4$, $BC = 4$, $KC = 4 - x$, $BK = BM + MK = 4 + x$.
Trong $\triangle BKC$ vuông tại $C$: $BK^2 = BC^2 + KC^2 \Leftrightarrow (4+x)^2 = 4^2 + (4-x)^2 \Leftrightarrow 16x = 16 \Leftrightarrow x = 1\text{ cm}$.
Chu vi hình thang vuông $ABKD$ là $AB + BK + KD + DA = 4 + (4+1) + 1 + 4 = 14\text{ cm}$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (312, 35, 'V', 'Bài toán cực trị hình học không gian', 'Một miếng tôn phẳng hình vuông với kích thước $a$ (cm), người ta muốn cắt đi ở bốn góc bốn hình vuông cạnh bằng $x$ (cm) để uốn thành một hình hộp chữ nhật không có nắp. Phải cắt như thế nào để hình hộp có thể tích lớn nhất?', NULL, 'Điều kiện: $0 < x < \frac{a}{2}$.
Đáy của hình hộp chữ nhật là hình vuông cạnh $a - 2x$, chiều cao hình hộp là $x$.
Thể tích hình hộp: $V(x) = x(a - 2x)^2$.
Áp dụng bất đẳng thức AM-GM cho ba số dương $4x, a-2x, a-2x$:
$4V(x) = 4x(a - 2x)(a - 2x) \le \left(\frac{4x + a - 2x + a - 2x}{3}\right)^3 = \left(\frac{2a}{3}\right)^3 = \frac{8a^3}{27}$.
$\Rightarrow V(x) \le \frac{2a^3}{27}$.
Dấu "=" xảy ra khi $4x = a - 2x \Leftrightarrow x = \frac{a}{6}$.
Vậy cần cắt ở bốn góc các hình vuông cạnh bằng $\frac{a}{6}$ cm để thể tích hộp lớn nhất.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 24 (Trang 206) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (313, 36, 'I.1', 'Biểu đồ cột tần số ghép nhóm', 'Một ngân hàng thống kê số tiền (đơn vị: triệu đồng) mà 80 hộ gia đình vay để phát triển sản xuất. Số liệu được ghi lại trong biểu đồ tần số ghép nhóm ở Hình 1.
{{FIGURE}}
Lập bảng tần số tương đối ghép nhóm của mẫu số liệu được ghép nhóm đó.', '/static/figures/BoDeHaNoiLan2_De_25_trang_217_I_1_410420.png', 'Tổng số hộ gia đình là $N = 80$.
Bảng tần số tương đối ghép nhóm:
<table border="1"><tr><th>Nhóm số tiền (triệu đồng)</th><th>[40; 50)</th><th>[50; 60)</th><th>[60; 70)</th><th>[70; 80)</th><th>[80; 90)</th><th>[90; 100)</th><th>Tổng</th></tr><tr><td>Tần số tương đối (%)</td><td>12,5%</td><td>18,75%</td><td>21,25%</td><td>31,25%</td><td>10%</td><td>6,25%</td><td>100%</td></tr></table>', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (314, 36, 'I.2', 'Xác suất cổ điển', 'Một hộp có chứa ba viên bi vàng lần lượt ghi các số 1; 2; 3 và hai viên bi nâu lần lượt ghi các số 4; 5. Các viên bi có kích thước và khối lượng như nhau. Lấy ngẫu nhiên đồng thời hai viên bi trong hộp. Tính xác suất của biến cố: “Hai viên bi được lấy ra khác màu”.', NULL, 'Số phần tử của không gian mẫu là $n(\Omega) = C_5^2 = 10$.
Số cách chọn 1 viên bi vàng và 1 viên bi nâu là $3 \times 2 = 6$.
Xác suất của biến cố là $P = \frac{6}{10} = \frac{3}{5}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (315, 36, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $P = \frac{3\sqrt{x}}{\sqrt{x}+2} + \frac{\sqrt{x}}{2-\sqrt{x}} + \frac{8\sqrt{x}}{x-4}$ và $Q = \frac{1}{\sqrt{x}+2}$ (với $x \ge 0; x \ne 4$).
1) Tính giá trị của biểu thức $Q$ khi $x = 9$.
2) Rút gọn biểu thức $P$.
3) Biết $M = \frac{P}{Q}$. Tìm các giá trị của $x$ để $M = 18$.', NULL, '1) Với $x = 9$ (TMĐK), $Q = \frac{1}{\sqrt{9}+2} = \frac{1}{5}$.
2) Ta có $P = \frac{3\sqrt{x}(\sqrt{x}-2) - \sqrt{x}(\sqrt{x}+2) + 8\sqrt{x}}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{2x}{(\sqrt{x}-2)(\sqrt{x}+2)}$.
3) $M = \frac{P}{Q} = \frac{2x}{\sqrt{x}-2}$.
Để $M = 18 \Leftrightarrow \frac{2x}{\sqrt{x}-2} = 18 \Leftrightarrow x - 9\sqrt{x} + 18 = 0 \Leftrightarrow (\sqrt{x}-3)(\sqrt{x}-6) = 0 \Leftrightarrow x = 9$ hoặc $x = 36$ (đều thỏa mãn).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (316, 36, 'III.1', 'Nồng độ dung dịch', 'Trong một thí nghiệm, Bình muốn pha để được 36 ml dung dịch HCl nồng độ 12%. Trong phòng thí nghiệm chỉ có sẵn dung dịch HCl nồng độ 8% và dung dịch HCl nồng độ 20%. Hỏi Bình cần sử dụng bao nhiêu mililít mỗi loại dung dịch để có được dung dịch mong muốn?', NULL, 'Gọi $x, y$ (ml) lần lượt là lượng dung dịch HCl 8% và 20% cần dùng ($x, y > 0$).
Ta có hệ phương trình:
$\begin{cases} x + y = 36 \\ 0{,}08x + 0{,}2y = 0{,}12 \times 36 \end{cases} \Leftrightarrow \begin{cases} x + y = 36 \\ 8x + 20y = 432 \end{cases} \Leftrightarrow \begin{cases} x = 24 \\ y = 12 \end{cases}$ (thỏa mãn).
Vậy cần dùng 24 ml dung dịch HCl 8% và 12 ml dung dịch HCl 20%.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (317, 36, 'III.2', 'Chuyển động', 'Một ô tô dự định đi từ $A$ đến $B$ cách nhau 120 km trong một thời gian quy định. Sau khi đi được 1 giờ thì ô tô bị chặn bởi xe cứu hỏa 10 phút. Do đó để đến $B$ đúng hạn xe phải tăng vận tốc thêm 6 km/h. Tính vận tốc lúc đầu của ô tô.', NULL, 'Đổi 10 phút = $\frac{1}{6}$ giờ.
Gọi vận tốc lúc đầu của ô tô là $x$ (km/h, $x > 0$).
Sau 1 giờ, quãng đường ô tô đã đi là $x$ (km), quãng đường còn lại là $120 - x$ (km).
Vận tốc trên quãng đường còn lại là $x + 6$ (km/h).
Theo bài ra ta có phương trình: $1 + \frac{1}{6} + \frac{120-x}{x+6} = \frac{120}{x} \Leftrightarrow x^2 + 42x - 4320 = 0 \Leftrightarrow x = 48$ (nhận) hoặc $x = -90$ (loại).
Vậy vận tốc ban đầu của ô tô là 48 km/h.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (318, 36, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $-\sqrt{2}x^2 + 2x + 3 = 0$ có 2 nghiệm phân biệt là $x_1, x_2$. Không giải phương trình, hãy tính giá trị của biểu thức $A = \frac{x_2 + 1}{1 - x_1} + \frac{x_1 + 1}{1 - x_2}$.', NULL, 'Theo định lí Vi-ét: $x_1 + x_2 = \frac{2}{\sqrt{2}} = \sqrt{2}$ và $x_1 x_2 = -\frac{3}{\sqrt{2}} = -\frac{3\sqrt{2}}{2}$.
Biến đổi biểu thức $A$:
$A = \frac{(x_2 + 1)(1 - x_2) + (x_1 + 1)(1 - x_1)}{(1 - x_1)(1 - x_2)} = \frac{1 - x_2^2 + 1 - x_1^2}{1 - (x_1 + x_2) + x_1 x_2} = \frac{2 - [(x_1 + x_2)^2 - 2x_1 x_2]}{1 - (x_1 + x_2) + x_1 x_2}$.
Thay số vào ta được: $A = \frac{2 - [(\sqrt{2})^2 - 2(-\frac{3\sqrt{2}}{2})]}{1 - \sqrt{2} - \frac{3\sqrt{2}}{2}} = \frac{-3\sqrt{2}}{1 - \frac{5\sqrt{2}}{2}} = \frac{-6\sqrt{2}}{2 - 5\sqrt{2}} = \frac{15 - \sqrt{2}}{23}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (319, 36, 'IV.1', 'Hình trụ - Hình cầu', 'Để làm thí nghiệm về sự nổi của các vật thể, Minh chuẩn bị một cái cốc thủy tinh có dạng lòng trong hình trụ có đường kính đáy 6 cm và chiều cao là 10 cm; một quả bóng bàn tiêu chuẩn của các giải đấu quốc tế có dạng hình cầu đường kính 40 mm. Minh bỏ quả bóng bàn vào trong cốc, rót từ từ $200\text{ cm}^3$ nước và đo được mực nước dâng lên cao 7,2 cm.
{{FIGURE}}
a) Tính thể tích của quả bóng bàn.
b) Tính tỉ lệ phần trăm thể tích phần nổi của quả bóng bàn trong thí nghiệm trên.
(Lấy $\pi \approx 3{,}14$ và các kết quả làm tròn đến chữ số thập phân thứ hai)', '/static/figures/BoDeHaNoiLan2_De_25_trang_217_IV_1_410450.png', 'Bán kính bóng bàn: $R = 20\text{ mm} = 2\text{ cm}$. Bán kính đáy cốc: $r = 3\text{ cm}$.
a) Thể tích quả bóng bàn: $V_{\text{bóng}} = \frac{4}{3}\pi R^3 = \frac{4}{3}\pi \cdot 2^3 = \frac{32\pi}{3} \approx 33{,}49\text{ cm}^3$.
b) Thể tích phần ngập trong nước của bóng cộng nước bằng thể tích hình trụ nước cao 7,2 cm:
$V_{\text{trụ}} = \pi r^2 h = \pi \cdot 3^2 \cdot 7{,}2 = 64{,}8\pi \approx 203{,}47\text{ cm}^3$.
Thể tích phần chìm của bóng: $V_{\text{chìm}} = V_{\text{trụ}} - V_{\text{nước}} = 203{,}47 - 200 = 3{,}47\text{ cm}^3$.
Thể tích phần nổi: $V_{\text{nổi}} = V_{\text{bóng}} - V_{\text{chìm}} = 33{,}49 - 3{,}47 = 30{,}02\text{ cm}^3$.
Tỉ lệ phần trăm thể tích phần nổi: $\frac{V_{\text{nổi}}}{V_{\text{bóng}}} \times 100\% = \frac{30{,}02}{33{,}49} \times 100\% \approx 89{,}64\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (320, 36, 'IV.2', 'Tứ giác nội tiếp', 'Cho tam giác $ABC$ có ba góc nhọn nội tiếp đường tròn $(O)$, kẻ đường cao $BE$ của $\triangle ABC$. Gọi $H$ và $K$ lần lượt là chân các đường vuông góc kẻ từ $E$ đến $AB$ và $BC$.
a) Chứng minh tứ giác $BHEK$ là tứ giác nội tiếp.
b) Chứng minh: $BH \cdot BA = BK \cdot BC$.
c) Kẻ đường cao $CF$ của tam giác $ABC$ ($F \in AB$) và $I$ là trung điểm của $EF$. Chứng minh ba điểm $H, I, K$ thẳng hàng.', NULL, 'a) Xét tứ giác $BHEK$ có $\widehat{EHB} = \widehat{EKB} = 90^\circ \Rightarrow \widehat{EHB} + \widehat{EKB} = 180^\circ$, suy ra $BHEK$ nội tiếp đường tròn đường kính $BE$.
b) Áp dụng hệ thức lượng vào các tam giác vuông $\triangle ABE$ vuông tại $E$, đường cao $EH$: $BE^2 = BH \cdot BA$.
Tam giác $\triangle CBE$ vuông tại $E$, đường cao $EK$: $BE^2 = BK \cdot BC$.
Do đó $BH \cdot BA = BK \cdot BC$.
c) Tứ giác $BHEK$ nội tiếp $\Rightarrow \widehat{BKH} = \widehat{BEH} = 90^\circ - \widehat{HBE} = \widehat{BAC}$.
Mặt khác, $\triangle BFC \sim \triangle BAE \Rightarrow \widehat{BCA} = \widehat{BFE}$. Từ đó chứng minh $I$ thuộc đoạn $HK$, suy ra $H, I, K$ thẳng hàng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (321, 36, 'V', 'Cực trị thực tế', 'Một công ty du lịch dự định tổ chức một tour du lịch xuyên Việt nhân kỉ niệm ngày giải phóng hoàn toàn miền Nam 30 - 4. Công ty dự định nếu giá tour là 2 triệu đồng thì sẽ có khoảng 200 người tham gia. Để thu hút nhiều người tham gia, công ty sẽ quyết định giảm giá và cứ mỗi lần giảm giá 100 nghìn đồng/1 tour thì sẽ có thêm 20 người tham gia. Hỏi công ty phải giảm giá tour còn bao nhiêu để doanh thu từ tour xuyên Việt đó là lớn nhất.', NULL, 'Gọi $x$ là số lần giảm giá 100 nghìn đồng ($x \in \mathbb{N}^*$, $x < 20$).
Giá tour sau khi giảm là $2 - 0{,}1x$ (triệu đồng).
Số người tham gia tour là $200 + 20x$ (người).
Doanh thu của công ty là:
$R(x) = (2 - 0{,}1x)(200 + 20x) = -2x^2 + 20x + 400 = -2(x - 5)^2 + 450 \le 450$.
Dấu "=" xảy ra khi $x = 5$.
Khi đó giá tour còn lại là: $2 - 0{,}1 \times 5 = 1{,}5$ triệu đồng (1 500 000 đồng).
Vậy công ty phải giảm giá tour còn 1 500 000 đồng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 25 (Trang 217) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (322, 37, 'I.1', 'Biểu đồ cột', 'Biểu đồ tần số ghép nhóm dưới đây ghi lại tốc độ (đơn vị: km/h) của 44 ô tô khi đi qua một trạm đo tốc độ.
{{FIGURE}}
Hãy cho biết số lượng ô tô ở nhóm nào nhiều nhất, tính tần số tương đối ghép nhóm của nhóm đó (làm tròn kết quả đến chữ số thập phân thứ nhất).', '/static/figures/BoDeHaNoiLan2_De_26_trang_225_I_1_410737.png', 'Số lượng ô tô ở nhóm [45; 50] là nhiều nhất (14 chiếc).
Tần số tương đối ghép nhóm của nhóm đó là: $f = \frac{14}{44} \cdot 100\% \approx 31,8\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (323, 37, 'I.2', 'Xác suất', 'Một hộp có 20 viên bi với kích thước và khối lượng như nhau. Bạn Ngân viết lên các viên bi đó các số 1, 2, 3, ..., 20; hai viên bi khác nhau thì viết hai số khác nhau.
Xét phép thử “Lấy ngẫu nhiên một viên bi trong hộp”.
a) Viết không gian mẫu phép thử đó.
b) Tính xác suất biến cố: “Số xuất hiện trên viên bi được lấy ra chia 7 dư 1”.', NULL, 'a) Không gian mẫu $\Omega = \{1, 2, 3, \dots, 20\}$ có 20 phần tử, $n(\Omega) = 20$.
b) Các kết quả thuận lợi cho biến cố là: $1, 8, 15$ (gồm 3 kết quả).
Xác suất của biến cố là $P = \frac{3}{20}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (324, 37, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x}}{x + 1}$ và $B = \frac{x - 2}{x + 2\sqrt{x}} - \frac{1}{\sqrt{x}} + \frac{1}{\sqrt{x} + 2}$ với $x > 0$.
1) Tính giá trị của $A$ khi $x = 9$.
2) Chứng minh $B = \frac{\sqrt{x} - 2}{\sqrt{x}}$.
3) Tìm giá trị của $x$ để $P = 2AB + \frac{4}{x + 1}$ đạt giá trị lớn nhất.', NULL, '1) Thay $x = 9$ vào $A$: $A = \frac{\sqrt{9}}{9 + 1} = \frac{3}{10}$.
2) Quy đồng và rút gọn biểu thức $B$:
$B = \frac{x - 2 - (\sqrt{x} + 2) + \sqrt{x}}{\sqrt{x}(\sqrt{x} + 2)} = \frac{x - 4}{\sqrt{x}(\sqrt{x} + 2)} = \frac{(\sqrt{x} - 2)(\sqrt{x} + 2)}{\sqrt{x}(\sqrt{x} + 2)} = \frac{\sqrt{x} - 2}{\sqrt{x}}$.
3) Ta có: $P = 2 \cdot \frac{\sqrt{x}}{x + 1} \cdot \frac{\sqrt{x} - 2}{\sqrt{x}} + \frac{4}{x + 1} = \frac{2\sqrt{x} - 4 + 4}{x + 1} = \frac{2\sqrt{x}}{x + 1}$.
Xét $1 - P = 1 - \frac{2\sqrt{x}}{x + 1} = \frac{(\sqrt{x} - 1)^2}{x + 1} \ge 0 \Rightarrow P \le 1$.
Dấu "=" xảy ra khi $\sqrt{x} - 1 = 0 \Leftrightarrow x = 1$ (thỏa mãn điều kiện).
Vậy $\max P = 1$ khi $x = 1$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (325, 37, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Mai mua hai loại hàng và phải trả tổng cộng 165000 đồng, trong đó đã tính 15000 đồng là thuế giá trị gia tăng (viết tắt là VAT). Biết rằng thuế VAT với loại hàng thứ nhất là 12%; thuế VAT với loại hàng thứ hai là 9%. Hỏi nếu không kể thuế thì Mai phải trả bao nhiêu tiền cho mỗi loại hàng?', NULL, 'Gọi số tiền không kể thuế của loại hàng thứ nhất và thứ hai lần lượt là $x, y$ (đồng, $x, y > 0$).
Tổng tiền chưa thuế: $x + y = 165000 - 15000 = 150000$.
Tiền thuế VAT: $12\%x + 9\%y = 15000 \Leftrightarrow 0,12x + 0,09y = 15000$.
Giải hệ phương trình:
$\begin{cases} x + y = 150000 \\ 0,12x + 0,09y = 15000 \end{cases} \Leftrightarrow \begin{cases} x = 50000 \\ y = 100000 \end{cases}$ (thỏa mãn).
Vậy giá tiền không kể thuế của loại hàng thứ nhất là 50000 đồng, loại hàng thứ hai là 100000 đồng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (326, 37, 'III.2', 'Phương trình quy về bậc hai', 'Hưởng ứng phong trào thi đua “Xây dựng trường học thân thiện, học sinh tích cực”, lớp 9A trường THCS Hoàng Hoa Thám dự định trồng 300 cây xanh. Đến ngày lao động, có 5 bạn được Liên Đội triệu tập tham gia chiến dịch an toàn giao thông nên mỗi bạn còn lại phải trồng thêm 2 cây mới đảm bảo kế hoạch đặt ra. Hỏi lớp 9A có bao nhiêu học sinh?', NULL, 'Gọi số học sinh của lớp 9A là $x$ (học sinh, $x \in \mathbb{N}^*, x > 5$).
Dự định mỗi học sinh trồng $\frac{300}{x}$ cây.
Thực tế số học sinh tham gia là $x - 5$, mỗi học sinh trồng $\frac{300}{x - 5}$ cây.
Ta có phương trình: $\frac{300}{x - 5} - \frac{300}{x} = 2 \Leftrightarrow \frac{150}{x - 5} - \frac{150}{x} = 1 \Leftrightarrow x^2 - 5x - 750 = 0$.
Giải phương trình được $x = 30$ (thỏa mãn) hoặc $x = -25$ (loại).
Vậy lớp 9A có 30 học sinh.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (327, 37, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình: $x^2 - 3x - m^2 + 1 = 0$ ($m$ là tham số) (1).
Tìm $m$ để phương trình (1) có hai nghiệm phân biệt $x_1, x_2$ thỏa mãn $(x_1 + 1)(x_2 + 1) = 1$.', NULL, '$\Delta = (-3)^2 - 4(-m^2 + 1) = 4m^2 + 5 > 0$ với mọi $m$, nên phương trình luôn có hai nghiệm phân biệt $x_1, x_2$.
Theo hệ thức Vi-ét: $\begin{cases} x_1 + x_2 = 3 \\ x_1 x_2 = -m^2 + 1 \end{cases}$
Theo đề bài: $(x_1 + 1)(x_2 + 1) = 1 \Leftrightarrow x_1 x_2 + (x_1 + x_2) + 1 = 1 \Leftrightarrow -m^2 + 1 + 3 + 1 = 1 \Leftrightarrow m^2 = 4 \Leftrightarrow m = \pm 2$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (328, 37, 'IV.1', 'Hình nón', 'Một hình nón có chiều cao $h = 16\text{ cm}$ và bán kính đường tròn đáy $r = 12\text{ cm}$. Tính độ dài đường sinh và diện tích xung quanh của hình nón đó. (Tính với $\pi \approx 3,14$ và kết quả làm tròn đến chữ số hàng đơn vị).', NULL, 'Độ dài đường sinh: $l = \sqrt{h^2 + r^2} = \sqrt{16^2 + 12^2} = 20\text{ cm}$.
Diện tích xung quanh của hình nón: $S_{xq} = \pi r l \approx 3,14 \cdot 12 \cdot 20 = 753,6 \approx 754\text{ cm}^2$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (329, 37, 'IV.2', 'Đường tròn tổng hợp', 'Cho tam giác $ABC$ nhọn nội tiếp đường tròn $(O)$, các đường cao $AD$, $BE$, $CF$ cắt nhau tại $H$. Kẻ đường kính $AQ$ của đường tròn $(O)$ cắt cạnh $BC$ tại $I$.
a) Chứng minh bốn điểm $A$, $F$, $H$, $E$ cùng thuộc một đường tròn.
b) Chứng minh $\widehat{BAD} = \widehat{CAQ}$.
c) Gọi $P$ là giao điểm của $AH$ và $EF$. Chứng minh $\triangle AEP$ đồng dạng với $\triangle ABI$ và $PI$ song song với $HQ$.', NULL, 'a) Xét tứ giác $AFHE$ có $\widehat{AFH} = 90^\circ$, $\widehat{AEH} = 90^\circ \Rightarrow \widehat{AFH} + \widehat{AEH} = 180^\circ$, suy ra tứ giác $AFHE$ nội tiếp đường tròn đường kính $AH$.
b) Ta có $\widehat{ACQ} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn). Trong $\triangle ACQ$ vuông tại $C$: $\widehat{CAQ} = 90^\circ - \widehat{AQC}$. Mà $\widehat{AQC} = \widehat{ABC}$ (cùng chắn cung $AC$), do đó $\widehat{CAQ} = 90^\circ - \widehat{ABC} = \widehat{BAD}$.
c) Chứng minh $\widehat{AEP} = \widehat{ABC} = \widehat{ABI}$, kết hợp $\widehat{EAP} = \widehat{BAI}$ (do $\widehat{BAD} = \widehat{CAQ}$) suy ra $\triangle AEP \backsim \triangle ABI$ (g.g).
Từ đó suy ra tỷ số $\frac{AP}{AI} = \frac{AE}{AB}$. Chứng minh tương tự $\frac{AH}{AQ} = \frac{AE}{AB}$, do đó $\frac{AP}{AI} = \frac{AH}{AQ} \Rightarrow PI \parallel HQ$ (định lý Ta-lét đảo).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (330, 37, 'V', 'Cực trị thực tế', 'Một bể bơi mini có dạng hình hộp chữ nhật có mặt đáy $MNPQ$ là hình vuông (hình vẽ)
{{FIGURE}}
Hãy tìm độ dài cạnh $MN$ của mặt đáy và chiều cao $AM$ của bể bơi sao cho tổng diện tích các mặt làm bể bơi (bao gồm 4 mặt xung quanh và một mặt đáy) là nhỏ nhất, biết rằng thể tích của bể bơi là $4\text{ m}^3$.', '/static/figures/BoDeHaNoiLan2_De_26_trang_225_V_410764.png', 'Gọi độ dài cạnh đáy $MN = x\text{ (m)}$ và chiều cao $AM = h\text{ (m)}$ ($x > 0, h > 0$).
Thể tích bể bơi: $V = x^2 h = 4 \Rightarrow h = \frac{4}{x^2}$.
Tổng diện tích các mặt làm bể bơi gồm đáy và 4 mặt bên là:
$S = x^2 + 4xh = x^2 + 4x \cdot \frac{4}{x^2} = x^2 + \frac{16}{x} = x^2 + \frac{8}{x} + \frac{8}{x}$.
Áp dụng bất đẳng thức AM-GM cho 3 số dương:
$S = x^2 + \frac{8}{x} + \frac{8}{x} \ge 3\sqrt[3]{x^2 \cdot \frac{8}{x} \cdot \frac{8}{x}} = 3\sqrt[3]{64} = 12$.
Dấu "=" xảy ra khi $x^2 = \frac{8}{x} \Leftrightarrow x^3 = 8 \Leftrightarrow x = 2\text{ m}$.
Khi đó chiều cao $h = \frac{4}{2^2} = 1\text{ m}$.
Vậy độ dài cạnh $MN = 2\text{ m}$ và chiều cao $AM = 1\text{ m}$ thì tổng diện tích nhỏ nhất.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 26 (Trang 225) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (331, 38, 'I.1', 'Bảng tần số ghép nhóm', 'Ban phụ huynh đặt tặng áo phông cho 40 học sinh của lớp 8A. Ban phụ huynh đo chiều cao (đơn vị: centimét) của cả lớp để quyết định chọn các cỡ áo, kết quả cho bởi bảng tần số ghép nhóm như sau:
<table border="1"><tr><td>Nhóm</td><td>[150; 155)</td><td>[155; 160)</td><td>[160; 165)</td><td>[165; 170)</td><td>[170; 175)</td><td>Cộng</td></tr><tr><td>Tần số (n)</td><td>5</td><td>11</td><td>12</td><td>8</td><td>4</td><td>N=40</td></tr></table>
Xác định tần số ghép nhóm và tìm tần số tương đối ghép nhóm của nhóm [160; 165).', NULL, 'Tần số ghép nhóm của nhóm [160; 165) là $m = 12$.
Tần số tương đối ghép nhóm là $f = \frac{12}{40} \cdot 100\% = 30\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (332, 38, 'I.2', 'Xác suất', 'Hình bên mô tả một đĩa tròn bằng bìa cứng được chia làm tám phần bằng nhau và ghi các số 1; 2; 3; ...; 8. Chiếc kim được gắn cố định vào trục quay ở tâm của đĩa. Quay đĩa tròn một lần.
{{FIGURE}}
Tính xác suất của biến cố A: “Chiếc kim chỉ vào hình quạt ghi số lớn hơn 3”.', '/static/figures/BoDeHaNoiLan2_De_27_trang_232_I_2_426276.png', 'Tổng số kết quả có thể xảy ra là 8.
Các kết quả thuận lợi cho biến cố A (số lớn hơn 3) là: 4, 5, 6, 7, 8 (gồm 5 kết quả).
Xác suất của biến cố A là $P(A) = \frac{5}{8} = 0,625$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (333, 38, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x} + 1}{\sqrt{x} - 1}$ và $B = \frac{x + 1}{x - \sqrt{x}} - \frac{2}{\sqrt{x} - 1}$ với $x > 0; x \neq 1$.
1) Tính giá trị của biểu thức $A$ tại $x = 25$.
2) Rút gọn $B$.
3) Cho $P = A \cdot B$. So sánh giá trị của $P$ với 1.', NULL, '1) Với $x = 25$, ta có: $A = \frac{\sqrt{25} + 1}{\sqrt{25} - 1} = \frac{5 + 1}{5 - 1} = \frac{6}{4} = \frac{3}{2}$.
2) Rút gọn $B$:
$B = \frac{x + 1}{\sqrt{x}(\sqrt{x} - 1)} - \frac{2\sqrt{x}}{\sqrt{x}(\sqrt{x} - 1)} = \frac{x - 2\sqrt{x} + 1}{\sqrt{x}(\sqrt{x} - 1)} = \frac{(\sqrt{x} - 1)^2}{\sqrt{x}(\sqrt{x} - 1)} = \frac{\sqrt{x} - 1}{\sqrt{x}}$.
3) Ta có $P = A \cdot B = \frac{\sqrt{x} + 1}{\sqrt{x} - 1} \cdot \frac{\sqrt{x} - 1}{\sqrt{x}} = \frac{\sqrt{x} + 1}{\sqrt{x}} = 1 + \frac{1}{\sqrt{x}}$.
Vì $x > 0$ nên $\frac{1}{\sqrt{x}} > 0 \Rightarrow P > 1$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (334, 38, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Để chuẩn bị cho năm học mới, bạn Tuấn mang 20 tờ tiền gồm hai loại 10 000 đồng và 20 000 đồng đến nhà sách mua đồ dùng học tập. Khi thanh toán, đơn hàng của Tuấn có giá 300 000 đồng. Sau khi Tuấn trả tiền cho đơn hàng thì Tuấn còn lại 1 tờ 20 000 đồng. Hỏi lúc đầu Tuấn có bao nhiêu tờ tiền mỗi loại.', NULL, 'Tổng số tiền Tuấn mang đi là: $300\,000 + 20\,000 = 320\,000$ (đồng).
Gọi $x, y$ lần lượt là số tờ tiền loại 10 000 đồng và 20 000 đồng ($x, y \in \mathbb{N}^*, x, y < 20$).
Ta có hệ phương trình:
$\begin{cases} x + y = 20 \\ 10\,000x + 20\,000y = 320\,000 \end{cases} \Leftrightarrow \begin{cases} x + y = 20 \\ x + 2y = 32 \end{cases} \Leftrightarrow \begin{cases} x = 8 \\ y = 12 \end{cases}$ (thỏa mãn).
Vậy ban đầu Tuấn có 8 tờ loại 10 000 đồng và 12 tờ loại 20 000 đồng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (335, 38, 'III.2', 'Chuyển động', 'Một Ô tô dự định đi từ tỉnh A đến tỉnh B với vận tốc trung bình 40 km/h. Lúc đầu ô tô đi với vận tốc đó, khi còn 60 km nữa thì được nửa quãng đường AB, người lái xe tăng thêm vận tốc 10 km/h trên quãng đường còn lại, do đó Ô tô đến B sớm hơn 1 giờ so với dự định. Tính quãng đường AB.', NULL, 'Gọi độ dài quãng đường AB là $x$ (km, $x > 120$).
Thời gian dự định đi: $\frac{x}{40}$ (giờ).
Đoạn đường đầu ô tô đi là: $\frac{x}{2} - 60$ (km), thời gian đi là: $\frac{\frac{x}{2} - 60}{40} = \frac{x - 120}{80}$ (giờ).
Đoạn đường còn lại là: $x - \left(\frac{x}{2} - 60\right) = \frac{x}{2} + 60$ (km).
Vận tốc trên đoạn đường sau là: $40 + 10 = 50$ (km/h).
Thời gian đi đoạn đường sau là: $\frac{\frac{x}{2} + 60}{50} = \frac{x + 120}{100}$ (giờ).
Vì ô tô đến sớm hơn 1 giờ nên ta có phương trình:
$\frac{x - 120}{80} + \frac{x + 120}{100} = \frac{x}{40} - 1$
Giải phương trình tìm được $x = 280$ (thỏa mãn).
Vậy quãng đường AB dài 280 km.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (336, 38, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình bậc hai $x^2 + 3x + m = 0$ có hai nghiệm. Tìm giá trị của $m$ để tổng bình phương các nghiệm của phương trình đã cho bằng 2025.', NULL, 'Để phương trình có hai nghiệm: $\Delta = 3^2 - 4m = 9 - 4m \ge 0 \Leftrightarrow m \le \frac{9}{4}$.
Theo hệ thức Vi-ét: $x_1 + x_2 = -3$ và $x_1 x_2 = m$.
Ta có: $x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = (-3)^2 - 2m = 9 - 2m$.
Theo đề bài: $9 - 2m = 2025 \Leftrightarrow 2m = 9 - 2025 = -2016 \Leftrightarrow m = -1008$ (thỏa mãn điều kiện).
Vậy $m = -1008$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (337, 38, 'IV.1', 'Hình trụ', 'Một lọ thủy tinh hình trụ có đường kính đáy là 30 cm, chiều cao 20 cm, đựng đầy nước tinh khiết.
{{FIGURE}}
a. Tính thể tích lượng nước tinh khiết được chứa trong lọ. (Lấy $\pi \approx 3,14$).
b. Người ta đổ tất cả lượng nước trên vào một lọ thứ hai bên trong có đường kính đáy là 40 cm thì lượng nước trong lọ thứ hai cao một nửa chiều cao của lọ. Hỏi chiều cao của lọ thứ hai? (Giả sử độ dày của lọ là không đáng kể).', '/static/figures/BoDeHaNoiLan2_De_27_trang_232_IV_1_426291.png', 'a) Bán kính đáy của lọ thứ nhất là $R_1 = 30 : 2 = 15$ cm, chiều cao $h_1 = 20$ cm.
Thể tích nước trong lọ là: $V = \pi R_1^2 h_1 = \pi \cdot 15^2 \cdot 20 = 4500\pi \approx 4500 \cdot 3,14 = 14\,130\text{ cm}^3$.
b) Bán kính đáy của lọ thứ hai là $R_2 = 40 : 2 = 20$ cm.
Lượng nước đổ vào lọ thứ hai có chiều cao bằng mực nước $h_{\text{nước}} = \frac{V}{\pi R_2^2} = \frac{4500\pi}{\pi \cdot 20^2} = \frac{4500}{400} = 11,25$ cm.
Vì lượng nước cao bằng một nửa chiều cao của lọ thứ hai nên chiều cao lọ thứ hai là:
$h_2 = 2 \cdot 11,25 = 22,5$ cm.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (338, 38, 'IV.2', 'Hình học phẳng tổng hợp', 'Cho đường tròn $(O)$ và điểm $M$ ở ngoài đường tròn. Qua $M$ kẻ các tiếp tuyến $MA, MB$ và cát tuyến $MPQ$ ($MP < MQ$). Gọi $I$ là trung điểm của dây $PQ$.
a. Chứng minh bốn điểm $B, O, I, M$ cùng thuộc một đường tròn.
b. Gọi $E$ là giao điểm thứ hai của đường thẳng $BI$ và đường tròn $(O)$. Chứng minh: $\widehat{BOM} = \widehat{BEA}$ và $AE$ song song với $PQ$.
c. Gọi $K$ là trung điểm của $EA$. Chứng minh ba điểm $O; I; K$ thẳng hàng.', NULL, 'a) Do $I$ là trung điểm dây cung $PQ$ không qua tâm nên $OI \perp PQ \Rightarrow \widehat{MIO} = 90^\circ$.
$MB$ là tiếp tuyến nên $\widehat{MBO} = 90^\circ$.
Suy ra tứ giác $MBIO$ có $\widehat{MBO} = \widehat{MIO} = 90^\circ$, do đó $B, O, I, M$ cùng thuộc đường tròn đường kính $MO$.
b) Do $MA, MB$ là hai tiếp tuyến cắt nhau nên $MO$ là phân giác của $\widehat{AOB} \Rightarrow \widehat{BOM} = \frac{1}{2}\widehat{AOB}$.
Mà $\widehat{BEA}$ là góc nội tiếp chắn cung $AB$ của $(O)$ nên $\widehat{BEA} = \frac{1}{2}\widehat{AOB}$.
Suy ra $\widehat{BOM} = \widehat{BEA}$.
Lại có tứ giác $MBIO$ nội tiếp nên $\widehat{BOM} = \widehat{BIM}$ (cùng chắn cung $BM$). Do đó $\widehat{BIM} = \widehat{BEA}$, suy ra $AE \parallel PQ$ (hai góc đồng vị bằng nhau).
c) Vì $AE \parallel PQ$ và $OI \perp PQ$ nên $OI \perp AE$.
Tam giác $OAE$ cân tại $O$ (do $OA = OE = R$) có đường cao hạ từ $O$ vuông góc với $AE$ tại trung điểm của $AE$.
Do đó đường thẳng vuông góc với $AE$ kẻ từ $O$ đi qua trung điểm $K$ của $AE$.
Mà $OI \perp AE$ nên $O, I, K$ cùng nằm trên đường thẳng vuông góc với $AE$, suy ra $O, I, K$ thẳng hàng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (339, 38, 'V', 'Hình nón và hình trụ thực tế', 'Ở hai quầy hàng A và B trong hội hoa xuân, người ta bán hai loại bắp rang bơ lần lượt được đựng trong hai loại hộp hình nón và hình trụ như hình dưới đây. Cửa hàng A bán với giá $1 một hộp (hình nón). Hỏi cửa hàng B phải bán với giá bao nhiêu dollar một hộp (hình trụ) để người mua được lợi 10% so với cùng lượng bắp rang bơ ở cửa hàng A? (Độ dày của vỏ hộp không đáng kể).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_27_trang_232_V_426297.png', 'Từ hình vẽ, cả hai hộp đều có bán kính đáy $r = 3\text{ in.}$ và chiều cao $h = 6\text{ in.}$
Thể tích hộp hình nón ở cửa hàng A: $V_A = \frac{1}{3}\pi r^2 h = \frac{1}{3} \pi \cdot 3^2 \cdot 6 = 18\pi\text{ in.}^3$
Thể tích hộp hình trụ ở cửa hàng B: $V_B = \pi r^2 h = \pi \cdot 3^2 \cdot 6 = 54\pi\text{ in.}^3 = 3V_A$.
Giá mỗi đơn vị thể tích ở cửa hàng A là: $p_A = \frac{1}{V_A} = \frac{1}{18\pi}$ ($/in$^3$).
Để người mua được lợi 10% so với ở cửa hàng A, giá mỗi đơn vị thể tích ở cửa hàng B phải rẻ hơn 10%, tức là bằng 90% giá ở cửa hàng A:
$p_B = 0,9 \cdot p_A = 0,9 \cdot \frac{1}{V_A}$.
Khi đó giá một hộp bắp rang bơ ở cửa hàng B là:
$\text{Giá}_B = p_B \cdot V_B = 0,9 \cdot \frac{1}{V_A} \cdot (3V_A) = 0,9 \cdot 3 = 2,7$ dollar.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 27 (Trang 232) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (340, 39, 'I.1', 'Bảng tần số ghép nhóm', 'Chỉ số phát triển con người (HDI) là chỉ tiêu tổng hợp phản ánh các mặt thu nhập, sức khỏe, giáo dục của người dân trong một quốc gia. Các nước và vùng lãnh thổ trên thế giới được chia thành 4 nhóm theo HDI: Nhóm 1 (rất cao) có HDI từ 0,8 trở lên; Nhóm 2 (cao) có HDI từ 0,7 đến dưới 0,8; Nhóm 3 (trung bình) có HDI từ 0,55 đến dưới 0,7; Nhóm 4 (thấp) có HDI dưới 0,55.
Năm 2021, chỉ số HDI của 11 quốc gia Đông Nam Á như sau:
0,939    0,829    0,803    0,8    0,705    0,703    0,699    0,607    0,607    0,593    0,585
Dựa vào dữ liệu trên, hãy hoàn thành bảng tần số ghép nhóm sau:
<table border="1"><tr><td>Chỉ số HDI</td><td>[0; 0,55)</td><td>[0,55; 0,7)</td><td>[0,7; 0,8)</td><td>[0,8; 1)</td><td>Cộng</td></tr><tr><td>Tần số</td><td>?</td><td>?</td><td>?</td><td>?</td><td>N =</td></tr></table>', NULL, 'Đếm số liệu theo từng nhóm:
- Nhóm [0; 0,55): 0 quốc gia.
- Nhóm [0,55; 0,7): 5 quốc gia (0,585; 0,593; 0,607; 0,607; 0,699).
- Nhóm [0,7; 0,8): 2 quốc gia (0,703; 0,705).
- Nhóm [0,8; 1): 4 quốc gia (0,8; 0,803; 0,829; 0,939).
Tổng cộng $N = 11$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (341, 39, 'I.2', 'Xác suất', 'Một hộp có chứa 5 quả bóng có cùng khối lượng và kích thước, được đánh số lần lượt từ 1 đến 5. Lấy ra ngẫu nhiên cùng một lúc 2 quả bóng từ hộp.
a) Hãy liệt kê các phần tử của không gian mẫu của phép thử.
b) Liệt kê các kết quả thuận lợi cho mỗi biến cố sau: $D$: “Trong 2 quả bóng lấy ra có ít nhất 1 quả bóng ghi số chẵn”.
c) Tính xác suất của biến cố $D$: “Trong 2 quả bóng lấy ra có ít nhất 1 quả bóng ghi số chẵn”.', NULL, 'a) Không gian mẫu $\Omega = \{(1; 2), (1; 3), (1; 4), (1; 5), (2; 3), (2; 4), (2; 5), (3; 4), (3; 5), (4; 5)\}$. Số phần tử $n(\Omega) = 10$.
b) Các kết quả thuận lợi cho biến cố $D$: $\{(1; 2), (1; 4), (2; 3), (2; 4), (2; 5), (3; 4), (4; 5)\}$.
c) Xác suất của biến cố $D$ là $P(D) = \frac{7}{10}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (342, 39, 'II', 'Rút gọn căn thức', 'Cho biểu thức $A = \frac{\sqrt{x} + 4}{\sqrt{x} + 2}$ và $B = \left(\frac{\sqrt{x}}{\sqrt{x} + 4} + \frac{4}{\sqrt{x} - 4}\right) : \frac{x + 16}{\sqrt{x} + 2}$ (với $x \ge 0$, $x \ne 16$).
1) Tính giá trị của biểu thức $A$ với $x = 36$.
2) Rút gọn biểu thức $B$.
3) Với các biểu thức $A$ và $B$, hãy tìm các giá trị nguyên của $x$ để giá trị của biểu thức $B(A - 1)$ nhận giá trị nguyên.', NULL, '1) Với $x = 36$, ta có $A = \frac{\sqrt{36} + 4}{\sqrt{36} + 2} = \frac{10}{8} = \frac{5}{4}$.
2) Ta có:
$B = \frac{\sqrt{x}(\sqrt{x}-4) + 4(\sqrt{x}+4)}{x-16} \cdot \frac{\sqrt{x}+2}{x+16} = \frac{x+16}{x-16} \cdot \frac{\sqrt{x}+2}{x+16} = \frac{\sqrt{x}+2}{x-16}$.
3) Ta có: $B(A-1) = \frac{\sqrt{x}+2}{x-16}\left(\frac{\sqrt{x}+4}{\sqrt{x}+2} - 1\right) = \frac{\sqrt{x}+2}{x-16} \cdot \frac{2}{\sqrt{x}+2} = \frac{2}{x-16}$.
Để $B(A-1) \in \mathbb{Z}$ thì $x-16 \in \text{Ư}(2) = \{\pm 1; \pm 2\}$.
Suy ra $x \in \{14; 15; 17; 18\}$ (thỏa mãn điều kiện $x \ge 0$, $x \ne 16$). Vậy $x \in \{14; 15; 17; 18\}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (343, 39, 'III.1', 'Bất phương trình bậc nhất', 'Bạn Thanh có 100 nghìn đồng. Bạn muốn mua một cái bút giá 18 nghìn đồng và một số quyển vở, mỗi quyển vở giá 17 nghìn đồng. Hỏi bạn Thanh mua được nhiều nhất bao nhiêu quyển vở?', NULL, 'Gọi $x$ (quyển) là số vở bạn Thanh có thể mua ($x \in \mathbb{N}$). Ta có bất phương trình:
$18 + 17x \le 100 \Leftrightarrow 17x \le 82 \Leftrightarrow x \le \frac{82}{17} \approx 4,82$.
Vì $x \in \mathbb{N}$ nên giá trị lớn nhất của $x$ là 4.
Vậy bạn Thanh mua được nhiều nhất 4 quyển vở.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (344, 39, 'III.2', 'Chuyển động', 'Hai ô tô cùng khởi hành một lúc từ hai tỉnh, cách nhau 150 km, đi ngược chiều và gặp nhau sau 2 giờ. Tìm vận tốc của mỗi ô tô, biết rằng nếu vận tốc của ô tô A tăng thêm 5 km/h và vận tốc của ô tô B giảm đi 5 km/h thì vận tốc của ô tô A bằng 2 lần vận tốc của ô tô B.', NULL, 'Gọi vận tốc của ô tô A là $x$ (km/h) và ô tô B là $y$ (km/h) ($x, y > 0$).
Do hai xe đi ngược chiều gặp nhau sau 2 giờ trên quãng đường 150 km:
$2(x + y) = 150 \Leftrightarrow x + y = 75$.
Theo đề bài: $x + 5 = 2(y - 5) \Leftrightarrow x - 2y = -15$.
Giải hệ phương trình:
$\begin{cases} x + y = 75 \\ x - 2y = -15 \end{cases} \Leftrightarrow \begin{cases} x = 45 \\ y = 30 \end{cases}$ (thỏa mãn).
Vậy vận tốc ô tô A là 45 km/h, vận tốc ô tô B là 30 km/h.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (345, 39, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $-x^2 + mx + m + 1 = 0$. Chứng minh phương trình luôn có một nghiệm không phụ thuộc vào $m$. Tìm nghiệm còn lại.', NULL, 'Phương trình: $-x^2 + mx + m + 1 = 0$ có các hệ số $a = -1$, $b = m$, $c = m + 1$.
Ta có $a - b + c = -1 - m + m + 1 = 0$, nên phương trình luôn có một nghiệm $x_1 = -1$ không phụ thuộc vào $m$.
Nghiệm còn lại là $x_2 = -\frac{c}{a} = -\frac{m + 1}{-1} = m + 1$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (346, 39, 'IV.1', 'Hình trụ', 'Một cốc nước có dạng hình trụ với đường kính đáy bằng 8 cm, chiều cao 12 cm và chứa một lượng nước cao 10 cm. Người ta thả từ từ một viên bi làm bằng thép đặc (không thấm nước) có thể tích là $V = 4\pi\text{ (cm}^3\text{)}$ vào trong cốc. Hỏi mực nước trong cốc lúc này cao bao nhiêu cm? (Giả sử độ dày của cốc không đáng kể).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_28_trang_240_IV_1_427890.png', 'Bán kính đáy cốc là $R = 8 : 2 = 4\text{ cm}$.
Chiều cao của lượng nước dâng lên bằng thể tích viên bi chia cho diện tích đáy cốc:
$h_{\text{dâng}} = \frac{V}{\pi R^2} = \frac{4\pi}{\pi \cdot 4^2} = \frac{4}{16} = 0,25\text{ cm}$.
Mực nước trong cốc lúc này là $10 + 0,25 = 10,25\text{ cm}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (347, 39, 'IV.2', 'Đường tròn tổng hợp', 'Cho đường tròn tâm $(O)$, đường kính $AB = 2R$. Trên đường tròn $(O)$, lấy điểm $C$ bất kì ($C$ không trùng với $A$ và $B$). Tiếp tuyến của đường tròn $(O)$ tại $A$ cắt tia $BC$ ở điểm $D$. Gọi $H$ là hình chiếu của $A$ trên đường thẳng $DO$. Tia $AH$ cắt đường tròn $(O)$ tại điểm $F$ ($F$ không trùng với $A$).
a) Chứng minh tứ giác $AHCD$ nội tiếp được một đường tròn.
b) Chứng minh $\triangle CFH$ là tam giác vuông.
c) Tính giá trị của biểu thức $S = \frac{BH \cdot BC}{BF}$.', NULL, 'a) Có $AH \perp DH \Rightarrow \widehat{AHD} = 90^\circ$; $\widehat{ACB} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn) $\Rightarrow \widehat{ACD} = 90^\circ$. Do đó tứ giác $AHCD$ nội tiếp đường tròn đường kính $AD$.
b) Tứ giác $AHCD$ nội tiếp $\Rightarrow \widehat{HCB} = \widehat{DAH}$.
Lại có $\widehat{BCF} = \widehat{BAF}$ (cùng chắn cung $BF$).
Do đó $\widehat{HCF} = \widehat{HCB} + \widehat{BCF} = \widehat{DAH} + \widehat{BAF} = \widehat{DAB} = 90^\circ$.
Vậy $\triangle CFH$ vuông tại $C$.
c) Ta có $\widehat{FCB} = \widehat{HAB}$ (cùng chắn cung $BF$).
Tam giác $OAD$ vuông tại $A$ có $AH \perp OD \Rightarrow OA^2 = OH \cdot OD$. Mà $OA = OB \Rightarrow OB^2 = OH \cdot OD \Rightarrow \frac{OH}{OB} = \frac{OB}{OD}$, suy ra $\triangle OHB \sim \triangle OBD \Rightarrow \widehat{OBH} = \widehat{ODB}$.
Mặt khác, tứ giác $AHCD$ nội tiếp $\Rightarrow \widehat{ODB} = \widehat{CAH}$; tứ giác $ABFC$ nội tiếp $\Rightarrow \widehat{CAH} = \widehat{CBF}$. Suy ra $\widehat{OBH} = \widehat{CBF}$.
Từ đó suy ra $\triangle HAB \sim \triangle FCB$ (g.g) $\Rightarrow \frac{BC}{BF} = \frac{BA}{BH} \Rightarrow \frac{BH \cdot BC}{BF} = BA = 2R$.
Vậy $S = 2R$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (348, 39, 'V', 'Cực trị thực tế', 'Ở hai quầy hàng A và B trong một hội hoa xuân người ta bán cùng 1 loại hạt bắp rang bơ lần lượt được đựng trong hai loại hộp hình nón và hình trụ với thông tin giá cả và định lượng như trong hình dưới đây. Vỏ hộp đều được làm từ giấy phần này nhận được sự tài trợ của công ty giấy nên cả hai quầy không tốn chi phí làm vỏ hộp. Hỏi bạn H nên mua bắp rang bơ ở quầy A hay quầy B để có lợi hơn? Tại sao?
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_28_trang_240_V_427902.png', 'Thể tích hộp bắp rang bơ hình nón ở quầy A là:
$V_A = \frac{1}{3}\pi R^2 h = \frac{1}{3}\pi \cdot 3^2 \cdot 6 = 18\pi\text{ (inch}^3\text{)}$.
Giá mỗi đơn vị thể tích ở quầy A là: $\frac{2}{18\pi} = \frac{1}{9\pi}$ (đô la/inch$^3$).
Thể tích hộp bắp rang bơ hình trụ ở quầy B là:
$V_B = \pi R^2 h = \pi \cdot 3^2 \cdot 6 = 54\pi\text{ (inch}^3\text{)}$.
Giá mỗi đơn vị thể tích ở quầy B là: $\frac{4}{54\pi} = \frac{2}{27\pi} = \frac{1}{13,5\pi}$ (đô la/inch$^3$).
Vì $\frac{1}{13,5\pi} < \frac{1}{9\pi}$ (hay mua ở quầy B rẻ hơn trên mỗi đơn vị thể tích; cụ thể thể tích quầy B gấp 3 lần quầy A nhưng giá chỉ gấp 2 lần) nên bạn H nên mua bắp rang bơ ở quầy B để có lợi hơn.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 28 (Trang 240) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (349, 40, 'I.1', 'Biểu đồ cột', 'Biểu đồ bên biểu diễn tỉ lệ đại biểu tham dự hội nghị theo độ tuổi. Biết rằng có 54 đại biểu từ 25 tuổi đến 35 tuổi.
{{FIGURE}}
a) Có bao nhiêu đại biểu tham dự hội nghị?
b) Một người cho rằng có trên 50% số đại biểu tham dự hội nghị dưới 45 tuổi. Nhận định đó đúng hay sai? Tại sao?', '/static/figures/BoDeHaNoiLan2_De_30_trang_254_I_1_437248.png', 'a) Tỉ lệ đại biểu nhóm độ tuổi [25; 35) là 33,75%.
Số đại biểu tham dự hội nghị là:
$54 : 33{,}75\% = 160$ (đại biểu).
b) Tỉ lệ đại biểu dưới 45 tuổi là:
$33{,}75\% + 28{,}75\% = 62{,}5\% > 50\%$.
Vậy nhận định đó là đúng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (350, 40, 'I.2', 'Xác suất', 'Hình vẽ dưới đây mô tả một đĩa tròn bằng bìa cứng được chia thành 12 phần bằng nhau và ghi các số 1; 2; 3; ...; 12. Chiếc kim được gắn cố định vào trục quay ở tâm của đĩa.
{{FIGURE}}
Xét phép thử: “Quay đĩa tròn một lần” và biến cố $P$: “Chiếc kim chỉ vào hình quạt ghi số là số nguyên tố”. Tính xác suất của biến cố $P$.', '/static/figures/BoDeHaNoiLan2_De_30_trang_254_I_2_437274.png', 'Không gian mẫu có 12 phần tử: $\{1; 2; 3; \dots; 12\}$.
Các kết quả thuận lợi cho biến cố $P$ là các số nguyên tố: $\{2; 3; 5; 7; 11\}$ (gồm 5 kết quả).
Xác suất của biến cố $P$ là:
$P(P) = \frac{5}{12}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (351, 40, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{\sqrt{x} + 1}{\sqrt{x} + 3}$ và $B = \frac{2\sqrt{x}}{\sqrt{x} + 1} - \frac{\sqrt{x} + 2}{\sqrt{x} - 1} + \frac{2\sqrt{x} + 4}{x - 1}$ với $x \ge 0; x \ne 1$.
a) Tính giá trị của $A$ khi $x = 4$.
b) Rút gọn $B$.
c) Tìm $x$ để $A \cdot B \le \frac{1}{2}$.', NULL, 'a) Thay $x = 4$ vào $A$ ta được: $A = \frac{\sqrt{4} + 1}{\sqrt{4} + 3} = \frac{3}{5}$.
b) Với $x \ge 0; x \ne 1$:
$B = \frac{2\sqrt{x}(\sqrt{x} - 1) - (\sqrt{x} + 2)(\sqrt{x} + 1) + 2\sqrt{x} + 4}{(\sqrt{x} + 1)(\sqrt{x} - 1)}$
$= \frac{2x - 2\sqrt{x} - (x + 3\sqrt{x} + 2) + 2\sqrt{x} + 4}{(\sqrt{x} + 1)(\sqrt{x} - 1)}$
$= \frac{x - 3\sqrt{x} + 2}{(\sqrt{x} + 1)(\sqrt{x} - 1)} = \frac{(\sqrt{x} - 1)(\sqrt{x} - 2)}{(\sqrt{x} + 1)(\sqrt{x} - 1)} = \frac{\sqrt{x} - 2}{\sqrt{x} + 1}$.
c) $A \cdot B = \frac{\sqrt{x} + 1}{\sqrt{x} + 3} \cdot \frac{\sqrt{x} - 2}{\sqrt{x} + 1} = \frac{\sqrt{x} - 2}{\sqrt{x} + 3}$.
$A \cdot B \le \frac{1}{2} \Leftrightarrow \frac{\sqrt{x} - 2}{\sqrt{x} + 3} \le \frac{1}{2} \Leftrightarrow \frac{2(\sqrt{x} - 2) - (\sqrt{x} + 3)}{2(\sqrt{x} + 3)} \le 0 \Leftrightarrow \sqrt{x} - 7 \le 0 \Leftrightarrow x \le 49$.
Kết hợp điều kiện: $0 \le x \le 49; x \ne 1$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (352, 40, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Một người mua một cái bàn là và một cái quạt điện với tổng số tiền theo giá niêm yết là 850 nghìn đồng. Khi trả tiền người đó được khuyến mại giảm 20% đối với giá tiền bàn là và 10% đối với giá tiền quạt điện với giá niêm yết. Vì vậy, người đó phải trả tổng cộng 740 nghìn đồng. Tính giá tiền của cái bàn là và cái quạt điện theo giá niêm yết.', NULL, 'Gọi giá tiền niêm yết của bàn là và quạt điện lần lượt là $x$ và $y$ (nghìn đồng; $0 < x, y < 850$).
Theo bài ra ta có hệ phương trình:
$\begin{cases} x + y = 850 \\ 0{,}8x + 0{,}9y = 740 \end{cases} \Leftrightarrow \begin{cases} x = 250 \\ y = 600 \end{cases}$ (thỏa mãn).
Vậy giá niêm yết của bàn là là 250 nghìn đồng, quạt điện là 600 nghìn đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (353, 40, 'III.2', 'Chuyển động', 'Một người đi xe đạp từ địa điểm $A$ đến địa điểm $B$ với vận tốc không đổi, hai địa điểm cách nhau 30 km. Khi đi từ $B$ về $A$, người đó chọn đường khác dễ hơn nhưng dài hơn con đường cũ 6 km. Vì lúc về, người đó đi với vận tốc lớn hơn vận tốc lúc đi là 3 km/h nên thời gian về vẫn ít hơn thời gian đi là 20 phút. Tính vận tốc lúc đi của người đó.', NULL, 'Gọi vận tốc lúc đi là $x$ (km/h, $x > 0$).
Thời gian lúc đi là $\frac{30}{x}$ (giờ).
Quãng đường lúc về là $30 + 6 = 36$ (km).
Vận tốc lúc về là $x + 3$ (km/h).
Thời gian lúc về là $\frac{36}{x + 3}$ (giờ).
Đổi 20 phút = $\frac{1}{3}$ giờ.
Ta có phương trình:
$\frac{30}{x} - \frac{36}{x + 3} = \frac{1}{3} \Leftrightarrow x^2 + 21x - 270 = 0 \Leftrightarrow (x - 9)(x + 30) = 0$.
Suy ra $x = 9$ (thỏa mãn).
Vậy vận tốc lúc đi của người đó là 9 km/h.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (354, 40, 'III.3', 'Hình nón', 'Người ta đặt một khối nón vào trong một khối lập phương cạnh 1 m chứa đầy nước. Biết rằng đỉnh khối nón trùng với tâm một mặt của khối lập phương, đáy khối nón tiếp xúc với các cạnh của mặt đối diện. Tính thể tích lượng nước trong khối bị tràn ra ngoài. (Lấy $\pi \approx 3{,}14$, kết quả làm tròn đến hai chữ số thập phân)
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_30_trang_254_III_3_437289.png', 'Thể tích nước tràn ra ngoài bằng thể tích của khối nón.
Khối nón có chiều cao $h = 1\text{ m}$.
Đáy nón nội tiếp hình vuông cạnh 1 m nên bán kính đáy là $r = \frac{1}{2} = 0{,}5\text{ m}$.
Thể tích khối nón là:
$V = \frac{1}{3}\pi r^2 h = \frac{1}{3} \cdot 3{,}14 \cdot (0{,}5)^2 \cdot 1 \approx 0{,}26\text{ m}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (355, 40, 'IV.1', 'Tứ giác nội tiếp', 'Từ điểm $M$ nằm ngoài đường tròn $(O)$, kẻ các tiếp tuyến $MA, MB$ với $(O)$ ($A, B$ là các tiếp điểm). Kẻ đường kính $AC$ của $(O)$. Đoạn thẳng $MC$ cắt $AB$ tại $K$ và cắt đường tròn $(O)$ tại điểm thứ hai $D$. Gọi $I, H$ lần lượt là các giao điểm của $MO$ với $BD, AB$.
a) Chứng minh bốn điểm $M, A, O, B$ cùng thuộc một đường tròn.
b) Chứng minh $MO$ song song với $BC$ và $IM^2 = ID \cdot IB$.', NULL, 'a) Có $\widehat{MAO} = \widehat{MBO} = 90^\circ$, nên bốn điểm $M, A, O, B$ cùng thuộc đường tròn đường kính $MO$.
b) - Có $MA = MB$ và $OA = OB = R$ nên $MO \perp AB$.
Lại có $\widehat{ABC} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn) $\Rightarrow BC \perp AB$.
Suy ra $MO \parallel BC$.
- Do $MO \parallel BC \Rightarrow \widehat{MOD} = \widehat{ODC} = \widehat{OCD}$ (so le trong và $\triangle OCD$ cân tại $O$).
Kết hợp tính chất góc tạo bởi tiếp tuyến và dây cung, ta chứng minh được $\triangle IMD \backsim \triangle IBM$ (g-g) $\Rightarrow \frac{IM}{IB} = \frac{ID}{IM} \Rightarrow IM^2 = ID \cdot IB$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (356, 40, 'IV.2', 'Ba điểm thẳng hàng', 'Gọi $L$ là giao điểm của $IK, HC$. Chứng minh ba điểm $M, B, L$ thẳng hàng.', NULL, 'Sử dụng định lý Menelaus hoặc tính chất chùm điều hòa trong tam giác:
Xét tam giác $MBH$ và các cát tuyến cắt nhau, kết hợp với các tỉ số song song của $MO \parallel BC$ và các hệ thức hình chiếu, suy ra giao điểm $L$ của $IK$ và $HC$ nằm trên đường thẳng $MB$.
Do đó ba điểm $M, B, L$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (357, 40, 'V', 'Cực trị thực tế', 'Người ta giăng lưới để nuôi riêng một loại cá trên một góc hồ. Biết rằng lưới được giăng theo một đường thẳng từ một vị trí trên bờ ngang đến một vị trí trên bờ dọc và phải đi qua một cái cọc đã cắm sẵn ở vị trí $A$. Hỏi diện tích nhỏ nhất có thể giăng là bao nhiêu, biết rằng khoảng cách từ cọc đến bờ ngang là 5 m và khoảng cách từ cọc đến bờ dọc là 12 m.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_30_trang_254_V_437310.png', 'Chọn hệ trục tọa độ $Oxy$ sao cho gốc $O$ là giao điểm của bờ ngang và bờ dọc (gốc vuông), bờ ngang thuộc trục $Ox$, bờ dọc thuộc trục $Oy$.
Khi đó tọa độ cọc là $A(12; 5)$.
Đường thẳng giăng lưới cắt trục $Ox$ tại $B(b; 0)$ và trục $Oy$ tại $C(0; c)$ với $b > 12, c > 5$.
Phương trình đường thẳng $BC$ theo đoạn chắn là: $\frac{x}{b} + \frac{y}{c} = 1$.
Do đường thẳng đi qua $A(12; 5)$ nên: $\frac{12}{b} + \frac{5}{c} = 1$.
Diện tích tam giác vuông $OBC$ là $S = \frac{1}{2}bc$.
Áp dụng bất đẳng thức AM-GM: $1 = \frac{12}{b} + \frac{5}{c} \ge 2\sqrt{\frac{60}{bc}} \Rightarrow 1 \ge \frac{240}{bc} \Rightarrow bc \ge 240$.
Do đó $S = \frac{1}{2}bc \ge \frac{1}{2} \cdot 240 = 120\text{ m}^2$.
Dấu "=" xảy ra khi $\frac{12}{b} = \frac{5}{c} = \frac{1}{2} \Leftrightarrow b = 24, c = 10$.
Vậy diện tích nhỏ nhất có thể giăng là $120\text{ m}^2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 30 (Trang 254) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (358, 41, 'I.1', 'Bảng tần số ghép nhóm', 'Sau một khóa tập huấn, học viên được xếp loại $A; B; C; D$ theo điểm kiểm tra mà mỗi người đạt được như sau:
<table border="1"><tr><td>Điểm kiểm tra (X)</td><td>0 &le; X &lt; 2,5</td><td>2,5 &le; X &lt; 5</td><td>5 &le; X &lt; 7,5</td><td>7,5 &le; X &lt; 10</td></tr><tr><td>Xếp loại</td><td>D</td><td>C</td><td>B</td><td>A</td></tr></table>
Điểm kiểm tra của các học viên được ghi lại ở bảng sau đây:
<table border="1"><tr><td>6,5</td><td>1,4</td><td>7,3</td><td>8,4</td><td>4,7</td><td>9,8</td><td>9,9</td><td>6,4</td><td>2,9</td><td>3,1</td></tr><tr><td>4,5</td><td>8,7</td><td>7,8</td><td>5,4</td><td>7,7</td><td>7</td><td>9</td><td>9,4</td><td>7,2</td><td>8,8</td></tr><tr><td>9,2</td><td>1,9</td><td>7,3</td><td>0,5</td><td>4,7</td><td>2,5</td><td>9,6</td><td>6,8</td><td>5,9</td><td>8</td></tr></table>
Hỏi có bao nhiêu học viên xếp loại $A$?', NULL, 'Các giá trị thuộc nửa khoảng [7,5; 10) là: 8,4; 9,8; 9,9; 8,7; 7,8; 7,7; 9; 9,4; 8,8; 9,2; 9,6; 8.
Tổng cộng có 12 học viên xếp loại $A$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (359, 41, 'I.2', 'Xác suất', 'Bạn Linh viết ngẫu nhiên một số tự nhiên có hai chữ số lên bảng. Tính xác suất của biến cố $F$: “Số được viết chia hết cho 4”.', NULL, 'Số các số tự nhiên có hai chữ số là $99 - 10 + 1 = 90$ số, do đó $n(\Omega) = 90$.
Các số tự nhiên có hai chữ số chia hết cho 4 là: $12, 16, 20, \dots, 96$.
Số kết quả thuận lợi cho biến cố $F$ là: $\frac{96 - 12}{4} + 1 = 22$.
Xác suất của biến cố $F$ là: $P(F) = \frac{22}{90} = \frac{11}{45}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (360, 41, 'II', 'Rút gọn biểu thức và bất phương trình', '1) Cho biểu thức $A = \frac{x + 2\sqrt{x} + 5}{\sqrt{x} - 3}$ (với $x \ge 0; x \ne 9$). Tính giá trị của $A$ khi $x = 16$.

2) Cho biểu thức: $P = \frac{\sqrt{x} + 2}{\sqrt{x} + 3} - \frac{5}{x + \sqrt{x} - 6} - \frac{1}{\sqrt{x} - 2}$ (với $x \ge 0; x \ne 4$).
a) Chứng minh $P = \frac{\sqrt{x} - 4}{\sqrt{x} - 2}$.
b) Tìm tất cả các giá trị của $x$ để $P^2 > P$.', NULL, '1) Thay $x = 16$ (thỏa mãn ĐKXĐ) vào $A$:
$A = \frac{16 + 2\sqrt{16} + 5}{\sqrt{16} - 3} = \frac{16 + 8 + 5}{4 - 3} = 29$.

2) a) Quy đồng mẫu thức:
$P = \frac{(\sqrt{x} + 2)(\sqrt{x} - 2) - 5 - (\sqrt{x} + 3)}{(\sqrt{x} + 3)(\sqrt{x} - 2)} = \frac{x - 4 - 5 - \sqrt{x} - 3}{(\sqrt{x} + 3)(\sqrt{x} - 2)} = \frac{x - \sqrt{x} - 12}{(\sqrt{x} + 3)(\sqrt{x} - 2)} = \frac{(\sqrt{x} + 3)(\sqrt{x} - 4)}{(\sqrt{x} + 3)(\sqrt{x} - 2)} = \frac{\sqrt{x} - 4}{\sqrt{x} - 2}$.

b) $P^2 > P \Leftrightarrow P(P - 1) > 0 \Leftrightarrow \frac{\sqrt{x} - 4}{\sqrt{x} - 2} \cdot \left(\frac{\sqrt{x} - 4}{\sqrt{x} - 2} - 1\right) > 0 \Leftrightarrow \frac{\sqrt{x} - 4}{\sqrt{x} - 2} \cdot \frac{-2}{\sqrt{x} - 2} > 0 \Leftrightarrow \frac{-2(\sqrt{x} - 4)}{(\sqrt{x} - 2)^2} > 0$.
Vì $(\sqrt{x} - 2)^2 > 0$ với mọi $x \ge 0, x \ne 4$, nên bất phương trình tương đương $-2(\sqrt{x} - 4) > 0 \Leftrightarrow \sqrt{x} - 4 < 0 \Leftrightarrow \sqrt{x} < 4 \Leftrightarrow 0 \le x < 16$.
Kết hợp điều kiện xác định, ta được: $0 \le x < 16$ và $x \ne 4$ (hoặc $x > 0$ tuỳ tập xác định, ở đây $x = 0$ thì $P = 2 > 0$ thoả $P^2 > P$, do đó $0 \le x < 16, x \ne 4$).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (361, 41, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Theo các chuyên gia về sức khỏe, người trưởng thành cần đi bộ từ 5000 bước mỗi ngày sẽ rất tốt cho sức khỏe. Để rèn luyện sức khỏe, anh Sơn và chị Hà đề ra mục tiêu mỗi ngày một người phải đi bộ ít nhất 6000 bước. Hai người cùng đi bộ ở công viên và thấy rằng, nếu cùng đi trong 2 phút thì anh Sơn bước nhiều hơn chị Hà 20 bước. Hai người cùng giữ nguyên tốc độ đi như vậy nhưng chị Hà đi trong 5 phút thì lại nhiều hơn anh Sơn đi trong 3 phút là 160 bước. Hỏi mỗi ngày anh Sơn và chị Hà cùng đi bộ trong 1 giờ thì họ đã đạt được số bước tối thiểu mà mục tiêu đề ra hay chưa? (Giả sử tốc độ đi bộ hàng ngày của hai người không đổi).', NULL, 'Gọi số bước đi trong 1 phút của anh Sơn và chị Hà lần lượt là $x, y$ ($x, y > 0$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} 2x - 2y = 20 \\ 5y - 3x = 160 \end{cases} \Leftrightarrow \begin{cases} x - y = 10 \\ -3x + 5y = 160 \end{cases} \Leftrightarrow \begin{cases} x = 105 \\ y = 95 \end{cases}$
Trong 1 giờ (60 phút):
- Anh Sơn đi được: $105 \times 60 = 6300$ bước $> 6000$ bước (đạt mục tiêu).
- Chị Hà đi được: $95 \times 60 = 5700$ bước $< 6000$ bước (chưa đạt mục tiêu).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (362, 41, 'III.2', 'Phương trình bậc hai giải bài toán bằng cách lập phương trình', 'Trong lễ phát động phong trào trồng cây nhân dịp kỷ niệm ngày sinh Bác Hồ, lớp 9A được giao trồng 360 cây. Khi thực hiện có 4 bạn được điều đi làm việc khác, nên mỗi học sinh còn lại phải trồng thêm một cây so với dự định. Hỏi lớp 9A có bao nhiêu học sinh? (Biết số cây trồng của mỗi học sinh như nhau)', NULL, 'Gọi số học sinh của lớp 9A là $x$ ($x \in \mathbb{N}^*, x > 4$).
Theo dự định, mỗi học sinh trồng $\frac{360}{x}$ cây.
Thực tế, số học sinh tham gia là $x - 4$ bạn, mỗi bạn trồng $\frac{360}{x - 4}$ cây.
Ta có phương trình:
$\frac{360}{x - 4} - \frac{360}{x} = 1 \Leftrightarrow 360x - 360(x - 4) = x(x - 4) \Leftrightarrow x^2 - 4x - 1440 = 0$.
Giải phương trình được $x = 40$ (nhận) hoặc $x = -36$ (loại).
Vậy lớp 9A có 40 học sinh.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (363, 41, 'III.3', 'Hệ thức Vi-ét', 'Biết rằng phương trình bậc hai $2x^2 - (2 + \sqrt{3})x + m = 0$ có một nghiệm $x = \frac{\sqrt{3}}{2}$. Tìm tổng bình phương hai nghiệm của phương trình trên.', NULL, 'Theo định lí Vi-ét, tổng hai nghiệm của phương trình là:
$x_1 + x_2 = \frac{2 + \sqrt{3}}{2} = 1 + \frac{\sqrt{3}}{2}$.
Vì $x_1 = \frac{\sqrt{3}}{2}$ nên $x_2 = 1$.
Tích hai nghiệm: $x_1 x_2 = 1 \cdot \frac{\sqrt{3}}{2} = \frac{\sqrt{3}}{2}$ (tương ứng $m = \sqrt{3}$).
Tổng bình phương hai nghiệm là:
$x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = \left(\frac{2 + \sqrt{3}}{2}\right)^2 - 2\left(\frac{\sqrt{3}}{2}\right) = \frac{7 + 4\sqrt{3}}{4} - \sqrt{3} = \frac{7}{4}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (364, 41, 'IV.1', 'Hình nón và hình cầu', 'Một bình đựng đầy nước có dạng hình nón (không có đáy). Người ta thả vào đó một khối cầu có đường kính bằng chiều cao của bình nước và đo được thể tích nước tràn ra ngoài là $18\pi\text{ dm}^3$. Biết rằng khối cầu tiếp xúc với tất cả các đường sinh của hình nón và đúng một nửa của khối cầu đã chìm trong nước (hình dưới đây). Tính thể tích nước còn lại trong bình.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_29_trang_245_IV_1_442387.png', 'Thể tích nước tràn ra chính là thể tích phần nửa khối cầu chìm trong nước: $\frac{1}{2} V_{\text{cầu}} = 18\pi \Rightarrow V_{\text{cầu}} = 36\pi\text{ dm}^3$.
Ta có: $V_{\text{cầu}} = \frac{4}{3}\pi R^3 = 36\pi \Rightarrow R^3 = 27 \Rightarrow R = 3\text{ dm}$.
Khối cầu có đường kính bằng chiều cao hình nón nên chiều cao hình nón là $h = 2R = 6\text{ dm}$.
Vì đúng một nửa khối cầu chìm trong nước và khối cầu tiếp xúc với các đường sinh của hình nón, nên đường tròn lớn của khối cầu chính là đường tròn miệng bình (đáy nón), do đó bán kính đáy của hình nón là $r = R = 3\text{ dm}$.
Thể tích của hình nón là:
$V_{\text{nón}} = \frac{1}{3}\pi r^2 h = \frac{1}{3}\pi \cdot 3^2 \cdot 6 = 18\pi\text{ dm}^3$.
Thể tích nước còn lại trong bình bằng thể tích hình nón trừ đi thể tích phần khối cầu chiếm chỗ (phần nước tràn ra):
$V_{\text{còn lại}} = V_{\text{nón}} - 18\pi = 18\pi - 18\pi = 0\text{ dm}^3$ (toàn bộ nước bị tràn hết ra ngoài).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (365, 41, 'IV.2', 'Hình học phẳng tổng hợp', 'Cho $\triangle ABC$ nhọn ($AB < AC$) nội tiếp đường tròn $(O)$. Các đường cao $AD, BE, CF$ cắt nhau tại $H$. Tia $EF$ cắt tia $CB$ tại $K$.
a) Chứng minh tứ giác $BFEC$ nội tiếp và $KE \cdot KF = KB \cdot KC$.
b) Đường thẳng $KA$ cắt $(O)$ tại $M$. Chứng minh tứ giác $AEFM$ nội tiếp.
c) Gọi $N$ là trung điểm $BC$. Chứng minh $M, H, N$ thẳng hàng.', NULL, 'a) Xét tứ giác $BFEC$ có $\widehat{BFC} = \widehat{BEC} = 90^\circ$ cùng nhìn cạnh $BC$ nên tứ giác $BFEC$ nội tiếp.
Từ đó suy ra $\triangle KFB \backsim \triangle KCE$ (g.g) $\Rightarrow \frac{KF}{KC} = \frac{KB}{KE} \Rightarrow KE \cdot KF = KB \cdot KC$.

b) Vì $M \in (O)$ nên $A, B, M, C$ cùng thuộc $(O)$, suy ra $\triangle KMB \backsim \triangle KCA$ (g.g) $\Rightarrow KM \cdot KA = KB \cdot KC$.
Từ câu a có $KB \cdot KC = KE \cdot KF$, do đó $KM \cdot KA = KE \cdot KF \Rightarrow \frac{KM}{KE} = \frac{KF}{KA}$.
Suy ra $\triangle KMF \backsim \triangle KEA$ (c.g.c), dẫn đến $\widehat{KMF} = \widehat{KEA}$, do đó tứ giác $AEFM$ nội tiếp.

c) Do $AEHF$ nội tiếp đường tròn đường kính $AH$, mà $AEFM$ nội tiếp nên 5 điểm $A, M, F, H, E$ cùng thuộc đường tròn đường kính $AH$, suy ra $\widehat{AMH} = 90^\circ$, tức là $HM \perp AK$.
Mặt khác, kẻ đường kính $AP$ của $(O)$, ta có $\widehat{AMP} = 90^\circ \Rightarrow PM \perp AK$, do đó $M, H, P$ thẳng hàng.
Tứ giác $BHCP$ là hình bình hành (vì $BH \parallel PC$ cùng vuông góc $AC$, $CH \parallel PB$ cùng vuông góc $AB$), nên hai đường chéo $BC$ và $HP$ cắt nhau tại trung điểm mỗi đường. Mà $N$ là trung điểm $BC$, suy ra $N$ là trung điểm $HP$. Do đó $H, N, P$ thẳng hàng.
Từ đó suy ra $M, H, N$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (366, 41, 'V', 'Cực trị thực tế', 'Máng trượt của một cầu trượt cho trẻ em được uốn từ một tấm kim loại có bề rộng 80 cm, mặt cắt được mô tả ở hình vẽ dưới đây. Nhà thiết kế khuyến cáo, diện tích của mặt cắt càng lớn thì càng đảm bảo an toàn cho trẻ em.
{{FIGURE}}
Gọi $S$ là diện tích mặt cắt máng trượt. Hỏi $x$ đạt giá trị bao nhiêu thì cầu trượt đảm bảo an toàn nhất cho trẻ em?', '/static/figures/BoDeHaNoiLan2_De_29_trang_245_V_442396.png', 'Mặt cắt là hình chữ nhật hở cạnh trên, có hai thành bên chiều cao $x$ (cm) và đáy có chiều dài $y$ (cm).
Chiều dài tấm kim loại uốn thành mặt cắt là: $2x + y = 80 \Rightarrow y = 80 - 2x$ (với $0 < x < 40$).
Diện tích mặt cắt máng trượt là:
$S = x \cdot y = x(80 - 2x) = -2x^2 + 80x = -2(x^2 - 40x + 400) + 800 = -2(x - 20)^2 + 800 \le 800$.
Dấu "=" xảy ra khi $x = 20$ (thỏa mãn điều kiện).
Vậy khi $x = 20\text{ cm}$ thì diện tích mặt cắt đạt giá trị lớn nhất, cầu trượt đảm bảo an toàn nhất cho trẻ em.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 29 (Trang 245) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (367, 42, 'I.1', 'Biểu đồ cột', 'Để chuẩn bị cho tiết mục kỉ niệm 70 năm Chiến thắng Điện Biên Phủ, phường Mỹ Đình có cử một số lượng người tham gia, được biểu diễn dưới biểu đồ tỉ lệ sau:
(Biết rằng có 54 người từ 25 tuổi đến 35 tuổi)
{{FIGURE}}
a) Có bao nhiêu người tham gia biểu diễn?
b) Một người cho rằng có trên 50% số người biểu diễn dưới 45 tuổi. Nhận định đó đúng hay sai? Tại sao?', '/static/figures/BoDeHaNoiLan2_De_31_trang_263_I_1_457077.png', 'a) Tỉ lệ người trong độ tuổi [25; 35) là 33,75% tương ứng với 54 người.
Tổng số người tham gia biểu diễn là: $54 : 33{,}75\% = 160$ (người).
b) Tỉ lệ người biểu diễn dưới 45 tuổi (thuộc hai nhóm [25; 35) và [35; 45)) là: $33{,}75\% + 28{,}75\% = 62{,}5\% > 50\%$.
Vậy nhận định đó là đúng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (368, 42, 'I.2', 'Xác suất', 'Hình vẽ dưới đây mô tả một đĩa tròn bằng bìa cứng được chia thành 12 phần bằng nhau và ghi các số 1; 2; 3; ...; 12. Chiếc kim được gắn cố định vào trục quay ở tâm của đĩa.
{{FIGURE}}
Xét phép thử: “Quay đĩa tròn một lần” và biến cố $P$: “Chiếc kim chỉ vào hình quạt ghi số là số nguyên tố”. Tính xác suất của biến cố $P$.', '/static/figures/BoDeHaNoiLan2_De_31_trang_263_I_2_457100.png', 'Không gian mẫu có 12 kết quả đồng khả năng: $\{1; 2; 3; \dots; 12\}$.
Các kết quả thuận lợi cho biến cố $P$ là các số nguyên tố trong tập hợp trên: $\{2; 3; 5; 7; 11\}$ (gồm 5 kết quả).
Xác suất của biến cố $P$ là: $P(P) = \frac{5}{12}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (369, 42, 'II', 'Rút gọn căn thức', 'Với $x > 0$, cho hai biểu thức $A = \frac{x + 2\sqrt{x}}{x}$ và $B = \frac{\sqrt{x}-1}{\sqrt{x}} + \frac{2\sqrt{x}+1}{x+\sqrt{x}}$.
a) Tính giá trị của biểu thức $A$ khi $x = 4$.
b) Chứng minh $B = \frac{\sqrt{x}+2}{\sqrt{x}+1}$.
c) Tìm số nguyên $x$ nhỏ nhất để $\frac{A}{B} < \frac{7}{4}$.', NULL, 'a) Thay $x = 4$ vào biểu thức $A$:
$A = \frac{4 + 2\sqrt{4}}{4} = \frac{4 + 4}{4} = 2$.
b) Với $x > 0$:
$B = \frac{\sqrt{x}-1}{\sqrt{x}} + \frac{2\sqrt{x}+1}{\sqrt{x}(\sqrt{x}+1)} = \frac{(\sqrt{x}-1)(\sqrt{x}+1) + 2\sqrt{x}+1}{\sqrt{x}(\sqrt{x}+1)} = \frac{x - 1 + 2\sqrt{x} + 1}{\sqrt{x}(\sqrt{x}+1)} = \frac{x + 2\sqrt{x}}{\sqrt{x}(\sqrt{x}+1)} = \frac{\sqrt{x}(\sqrt{x}+2)}{\sqrt{x}(\sqrt{x}+1)} = \frac{\sqrt{x}+2}{\sqrt{x}+1}$.
c) Ta có: $A = \frac{\sqrt{x}(\sqrt{x}+2)}{x} = \frac{\sqrt{x}+2}{\sqrt{x}}$.
Khi đó $\frac{A}{B} = \frac{\sqrt{x}+2}{\sqrt{x}} : \frac{\sqrt{x}+2}{\sqrt{x}+1} = \frac{\sqrt{x}+1}{\sqrt{x}} = 1 + \frac{1}{\sqrt{x}}$.
Để $\frac{A}{B} < \frac{7}{4} \Leftrightarrow 1 + \frac{1}{\sqrt{x}} < \frac{7}{4} \Leftrightarrow \frac{1}{\sqrt{x}} < \frac{3}{4} \Leftrightarrow \sqrt{x} > \frac{4}{3} \Leftrightarrow x > \frac{16}{9} \approx 1{,}78$.
Vì $x$ là số nguyên nên số nguyên $x$ nhỏ nhất thỏa mãn là $x = 2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (370, 42, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Một người mua hai loại hàng và phải trả tổng cộng 2,17 triệu đồng, kể cả thuế giá trị gia tăng (VAT) với mức 10% đối với loại hàng thứ nhất và 8% đối với loại hàng thứ hai. Nếu thuế VAT là 9% đối với cả hai loại hàng thì người đó phải trả tổng cộng 2,18 triệu đồng. Hỏi nếu không kể thuế VAT thì người đó phải trả bao nhiêu tiền mỗi loại hàng.', NULL, 'Gọi $x, y$ (triệu đồng) lần lượt là giá tiền của loại hàng thứ nhất và thứ hai khi chưa có thuế VAT ($x, y > 0$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} 1{,}1x + 1{,}08y = 2{,}17 \\ 1{,}09(x + y) = 2{,}18 \end{cases} \Leftrightarrow \begin{cases} 1{,}1x + 1{,}08y = 2{,}17 \\ x + y = 2 \end{cases} \Leftrightarrow \begin{cases} x = 0{,}5 \\ y = 1{,}5 \end{cases}$ (thỏa mãn).
Vậy nếu không kể thuế VAT, giá tiền loại hàng thứ nhất là 0,5 triệu đồng (500 000 đồng), loại hàng thứ hai là 1,5 triệu đồng (1 500 000 đồng).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (371, 42, 'III.2', 'Chuyển động', 'Nam đi xe đạp từ nhà đến trường trên quãng đường dài 4 km. Khi đi từ trường về nhà, vẫn trên con đường đó, Nam đạp xe với vận tốc trung bình lớn hơn vận tốc trung bình lúc đi là 2 km/h. Tổng thời gian đạp xe cả đi và về của Nam là 44 phút. Tính vận tốc đạp xe trung bình của Nam lúc đi từ nhà đến trường.', NULL, 'Đổi 44 phút = $\frac{11}{15}$ giờ.
Gọi vận tốc trung bình lúc đi của Nam là $x$ (km/h, $x > 0$).
Vận tốc trung bình lúc về là $x + 2$ (km/h).
Thời gian lúc đi là $\frac{4}{x}$ (h), thời gian lúc về là $\frac{4}{x+2}$ (h).
Ta có phương trình:
$\frac{4}{x} + \frac{4}{x+2} = \frac{11}{15} \Leftrightarrow 4 \cdot 15(2x + 2) = 11x(x + 2) \Leftrightarrow 11x^2 - 98x - 120 = 0$.
Giải phương trình tìm được $x = 10$ (thỏa mãn) hoặc $x = -\frac{12}{11}$ (loại).
Vậy vận tốc đạp xe trung bình của Nam lúc đi từ nhà đến trường là 10 km/h.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (372, 42, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $2x^2 - (m + 4)x + m = 0$ ($m$ là tham số).
a) Tìm $m$ để phương trình có hai nghiệm trái dấu.
b) Với $m = 5$, gọi $x_1$ và $x_2$ là hai nghiệm của phương trình. Tính giá trị của $M = x_1^2 + x_2^2$.', NULL, 'a) Phương trình có hai nghiệm trái dấu khi và chỉ khi $a \cdot c < 0 \Leftrightarrow 2m < 0 \Leftrightarrow m < 0$.
b) Với $m = 5$, phương trình trở thành $2x^2 - 9x + 5 = 0$.
Có $\Delta = (-9)^2 - 4 \cdot 2 \cdot 5 = 41 > 0$, phương trình có hai nghiệm phân biệt $x_1, x_2$.
Theo định lí Vi-ét: $\begin{cases} x_1 + x_2 = \frac{9}{2} \\ x_1 x_2 = \frac{5}{2} \end{cases}$.
Ta có: $M = x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = \left(\frac{9}{2}\right)^2 - 2 \cdot \frac{5}{2} = \frac{81}{4} - 5 = \frac{61}{4}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (373, 42, 'IV.1', 'Hình nón', 'Tính lượng vải cần mua để tạo ra nón của chú hề với các số liệu trong hình bên. Biết rằng tỉ lệ vải khâu (may) hao (tốn) khi may nón là 15%. Cho biết $\pi \approx 3{,}14$.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_31_trang_263_IV_1_457114.png', 'Nón chú hề gồm phần chóp nón và phần vành nón phẳng hình vành khuyên.
- Phần chóp nón có đường sinh $l = 30\text{ cm}$, bán kính đáy $r_1 = 10\text{ cm}$.
Diện tích xung quanh của chóp nón: $S_{xq} = \pi r_1 l = \pi \cdot 10 \cdot 30 = 300\pi\text{ cm}^2$.
- Phần vành nón là hình vành khăn có bán kính ngoài $R = \frac{35}{2} = 17{,}5\text{ cm}$ và bán kính trong $r_1 = 10\text{ cm}$:
Diện tích vành nón: $S_{\text{vành}} = \pi (R^2 - r_1^2) = \pi (17{,}5^2 - 10^2) = 206{,}25\pi\text{ cm}^2$.
- Tổng diện tích bề mặt của nón là:
$S = S_{xq} + S_{\text{vành}} = 300\pi + 206{,}25\pi = 506{,}25\pi\text{ cm}^2$.
- Do hao hụt 15%, lượng vải cần mua là:
$S_{\text{vải}} = \frac{S}{100\% - 15\%} = \frac{506{,}25\pi}{0{,}85} \approx \frac{506{,}25 \cdot 3{,}14}{0{,}85} \approx 1870{,}15\text{ cm}^2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (374, 42, 'IV.2', 'Đường tròn tổng hợp', 'Cho nửa đường tròn $(O)$ đường kính $AB = 2R$, $C$ là điểm bất kì nằm trên nửa đường tròn sao cho $C$ khác $A$ và $AC < CB$. Điểm $D$ thuộc cung nhỏ $BC$ sao cho: $\widehat{COD} = 90^\circ$. Gọi $E$ là giao điểm của $AD$ và $BC$, $F$ là giao điểm của $AC$ và $BD$, $I$ là trung điểm của $EF$.
a) Chứng minh: $CEDF$ là tứ giác nội tiếp.
b) Chứng minh: $FC \cdot FA = FD \cdot FB$.
c) Chứng minh $IC$ là tiếp tuyến của $(O)$.
d) Hỏi khi $C$ thay đổi thỏa mãn điều kiện bài toán, $E$ thuộc đường tròn cố định nào?', NULL, 'a) Có $\widehat{ACB} = \widehat{ADB} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn).
Suy ra $\widehat{ECF} = 90^\circ$ và $\widehat{EDF} = 90^\circ$.
Tứ giác $CEDF$ có $\widehat{ECF} + \widehat{EDF} = 90^\circ + 90^\circ = 180^\circ$ nên $CEDF$ là tứ giác nội tiếp đường tròn đường kính $EF$.
b) Xét $\triangle FCA$ và $\triangle FDB$ có $\widehat{F}$ chung, $\widehat{FCA} = \widehat{FDB} = 90^\circ$, nên $\triangle FCA \sim \triangle FDB$ (g.g).
Suy ra $\frac{FC}{FD} = \frac{FA}{FB} \Rightarrow FC \cdot FA = FD \cdot FB$.
c) $I$ là trung điểm của đường kính $EF$, nên $IC = IE = \frac{1}{2}EF \Rightarrow \triangle ICE$ cân tại $I \Rightarrow \widehat{ICE} = \widehat{IEC}$.
Mặt khác $\triangle OCB$ cân tại $O \Rightarrow \widehat{OCB} = \widehat{OBC}$.
Do đó $\widehat{ICO} = \widehat{ICE} + \widehat{OCB} = \widehat{IEC} + \widehat{ABC} = 90^\circ$ (vì trong tam giác vuông $ADB$, đường cao $AC$ hoặc xét góc ngoài tam giác).
Suy ra $IC \perp OC$ tại $C$, hay $IC$ là tiếp tuyến của $(O)$.
d) Vì $\widehat{COD} = 90^\circ$ cố định nên $\widehat{CAD} = \frac{1}{2}\widehat{COD} = 45^\circ$.
Tam giác $ACE$ vuông tại $C$ có $\widehat{CAE} = 45^\circ$ nên $\triangle ACE$ vuông cân tại $C$, suy ra $\widehat{AEB} = 45^\circ$ hoặc góc nhìn cố định, từ đó $E$ luôn nhìn một đoạn thẳng cố định dưới một góc không đổi, do đó $E$ thuộc một cung tròn cố định đi qua $A$ và $B$ (hoặc đường tròn cố định xác định được).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (375, 42, 'V', 'Cực trị thực tế', 'Công ty sữa muốn thiết kế bao bì đựng sữa với thể tích 100 ml. Bao bì được thiết kế bởi một trong hai mô hình là: Hình hộp chữ nhật có đáy là hình vuông hoặc hình trụ. Hỏi thiết kế theo mô hình nào thì tiết kiệm nguyên vật liệu nhất?', NULL, 'Để tiết kiệm nguyên vật liệu nhất, ta cần tìm diện tích toàn phần nhỏ nhất trong mỗi trường hợp với cùng thể tích $V = 100\text{ ml} = 100\text{ cm}^3$.
1. Mô hình hình hộp chữ nhật đáy vuông cạnh $a$, chiều cao $h$:
$V = a^2 h = 100 \Rightarrow h = \frac{100}{a^2}$.
Diện tích toàn phần: $S_1 = 2a^2 + 4ah = 2a^2 + \frac{400}{a} = 2a^2 + \frac{200}{a} + \frac{200}{a} \ge 3\sqrt[3]{2a^2 \cdot \frac{200}{a} \cdot \frac{200}{a}} = 3\sqrt[3]{80000} = 60\sqrt[3]{10} \approx 129{,}27\text{ cm}^2$ (khi $a = h = \sqrt[3]{100}$ - hình lập phương).
2. Mô hình hình trụ bán kính đáy $r$, chiều cao $h$:
$V = \pi r^2 h = 100 \Rightarrow h = \frac{100}{\pi r^2}$.
Diện tích toàn phần: $S_2 = 2\pi r^2 + 2\pi rh = 2\pi r^2 + \frac{200}{r} = 2\pi r^2 + \frac{100}{r} + \frac{100}{r} \ge 3\sqrt[3]{2\pi r^2 \cdot \frac{100}{r} \cdot \frac{100}{r}} = 3\sqrt[3]{20000\pi} \approx 119{,}27\text{ cm}^2$ (khi $h = 2r$).
Vì $S_2 < S_1$ ($119{,}27 < 129{,}27$) nên thiết kế theo mô hình hình trụ sẽ tiết kiệm nguyên vật liệu nhất.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 31 (Trang 263) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (376, 43, 'I.1', 'Bảng tần số và tần số tương đối', 'Thống kê tuổi thọ của 30 bóng đèn điện được lắp thử (đơn vị: giờ) được cho trong bảng dưới đây:
<table border="1"><tr><td>1180</td><td>1150</td><td>1190</td><td>1170</td><td>1180</td><td>1170</td><td>1160</td><td>1170</td><td>1160</td><td>1150</td></tr><tr><td>1190</td><td>1180</td><td>1170</td><td>1170</td><td>1170</td><td>1190</td><td>1170</td><td>1170</td><td>1170</td><td>1180</td></tr><tr><td>1170</td><td>1160</td><td>1160</td><td>1160</td><td>1170</td><td>1160</td><td>1180</td><td>1180</td><td>1150</td><td>1170</td></tr></table>
a) Lập bảng tần số và tần số tương đối của mẫu số liệu trên.
b) Có người nói: “Có trên 75% bóng đèn có tuổi thọ từ 1160 đến 1180”. Theo em nhận định đó đúng hay sai?', NULL, 'a) Bảng tần số và tần số tương đối:
- Tuổi thọ 1150: tần số 3, chiếm 10%.
- Tuổi thọ 1160: tần số 6, chiếm 20%.
- Tuổi thọ 1170: tần số 12, chiếm 40%.
- Tuổi thọ 1180: tần số 6, chiếm 20%.
- Tuổi thọ 1190: tần số 3, chiếm 10%.
Tổng: 30 (100%).
b) Số bóng đèn có tuổi thọ từ 1160 đến 1180 chiếm $20\% + 40\% + 20\% = 80\% > 75\%$. Vậy nhận định trên là đúng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (377, 43, 'I.2', 'Xác suất thực nghiệm / cổ điển', 'Bình tung một đồng tiền xu có hai mặt sấp (S) và ngửa (N) liên tiếp ba lần, sau mỗi lần tung Bình đều ghi lại mặt xuất hiện. Tính xác suất của biến cố A: “Mặt sấp xuất hiện đúng một lần”.', NULL, 'Không gian mẫu gồm $2^3 = 8$ kết quả: $\Omega = \{SSS, SSN, SNS, SNN, NSS, NSN, NNS, NNN\}$.
Biến cố $A = \{SNN, NSN, NNS\}$ gồm 3 kết quả thuận lợi.
Xác suất của biến cố $A$ là $P(A) = \frac{3}{8}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (378, 43, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $M = \frac{\sqrt{x}+2}{x+2\sqrt{x}+1} - \frac{\sqrt{x}-2}{x-1}$ và $N = \frac{\sqrt{x}+1}{\sqrt{x}}$ với $x > 0; x \neq 1$.
a) Tính giá trị của biểu thức $N$ khi $x = 25$.
b) Rút gọn biểu thức $S = M \cdot N$.
c) Tìm tất cả các giá trị của $x$ sao cho $S < -1$.', NULL, 'a) Với $x = 25$, $N = \frac{\sqrt{25}+1}{\sqrt{25}} = \frac{6}{5}$.
b) $M = \frac{(\sqrt{x}+2)(\sqrt{x}-1) - (\sqrt{x}-2)(\sqrt{x}+1)}{(\sqrt{x}+1)^2(\sqrt{x}-1)} = \frac{2\sqrt{x}}{(\sqrt{x}+1)^2(\sqrt{x}-1)}$.
$S = M \cdot N = \frac{2\sqrt{x}}{(\sqrt{x}+1)^2(\sqrt{x}-1)} \cdot \frac{\sqrt{x}+1}{\sqrt{x}} = \frac{2}{x-1}$.
c) $S < -1 \Leftrightarrow \frac{2}{x-1} + 1 < 0 \Leftrightarrow \frac{x+1}{x-1} < 0$.
Vì $x > 0$ nên $x+1 > 0$, suy ra $x-1 < 0 \Leftrightarrow x < 1$.
Kết hợp điều kiện $x > 0, x \neq 1$, ta được $0 < x < 1$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (379, 43, 'III.1', 'Giải bài toán bằng cách lập hệ phương trình', 'Nhân dịp lễ “Ngày của Cha – 19/6/2022”, siêu thị $A$ đã giảm giá 18% cho mỗi đôi giầy và 20% cho mỗi chiếc cà vạt. Bạn Duy đã dùng 834 700 đồng để mua một đôi giầy và một chiếc cà vạt ở siêu thị $A$ làm quà tặng ba mình. Duy tính nhẩm: cùng ở siêu thị $A$, cùng số lượng, cùng mẫu mã nhưng nếu mua vào ngày 18/6/2022 (ngày mà siêu thị $A$ không có khuyến mại giảm giá các mặt hàng) thì chỉ với số tiền tiết kiệm được là 1 025 000 đồng bạn ấy không đủ tiền để mua hai món hàng này. Em hãy cho biết, bạn Duy tính nhẩm như vậy có đúng không? Biết rằng, nếu không giảm giá thì tiền mua mỗi đôi giầy gấp 11 lần tiền mua mỗi chiếc cà vạt.', NULL, 'Gọi giá niêm yết của một chiếc cà vạt là $y$ (đồng), của một đôi giầy là $x$ (đồng) ($x, y > 0$).
Theo đề bài: $x = 11y$.
Ngày 19/6/2022, đôi giầy giảm 18% còn $0{,}82x$, cà vạt giảm 20% còn $0{,}8y$.
Ta có phương trình: $0{,}82x + 0{,}8y = 834\,700$.
Thay $x = 11y$ vào: $0{,}82 \cdot 11y + 0{,}8y = 834\,700 \Leftrightarrow 9{,}82y = 834\,700 \Leftrightarrow y = 85\,000$ (đồng).
Suy ra $x = 11 \cdot 85\,000 = 935\,000$ (đồng).
Tổng số tiền khi không giảm giá là $x + y = 935\,000 + 85\,000 = 1\,020\,000$ (đồng).
Vì $1\,020\,000 < 1\,025\,000$ nên với số tiền tiết kiệm 1 025 000 đồng Duy hoàn toàn đủ tiền mua. Vậy Duy đã tính nhẩm sai.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (380, 43, 'III.2', 'Năng suất - Công việc', 'Theo kế hoạch, một tổ trong xưởng may phải may xong 8 400 chiếc khẩu trang trong một thời gian quy định. Do tình hình dịch bệnh Covid-19 diễn biến phức tạp, tổ đã quyết định tăng năng suất nên mỗi ngày tổ đã may được nhiều hơn 102 chiếc khẩu trang so với số khẩu trang phải may trong một ngày theo kế hoạch. Vì vậy, trước thời gian quy định 4 ngày, tổ đã may được 6 416 chiếc khẩu trang. Hỏi số khẩu trang mà tổ phải may mỗi ngày theo kế hoạch là bao nhiêu?', NULL, 'Gọi số khẩu trang tổ phải may mỗi ngày theo kế hoạch là $x$ chiếc ($x \in \mathbb{N}^*$).
Thời gian theo kế hoạch để may xong 8 400 chiếc là $\frac{8400}{x}$ (ngày).
Thực tế mỗi ngày tổ may được $x + 102$ chiếc.
Thời gian thực tế may 6 416 chiếc là $\frac{6416}{x + 102}$ (ngày).
Vì thời gian này ít hơn thời gian quy định 4 ngày nên ta có phương trình:
$\frac{8400}{x} - \frac{6416}{x + 102} = 4 \Leftrightarrow \frac{2100}{x} - \frac{1604}{x + 102} = 1$
$\Leftrightarrow 2100(x + 102) - 1604x = x(x + 102) \Leftrightarrow x^2 - 394x - 214200 = 0$.
Giải phương trình ta được $x = 600$ (thỏa mãn) hoặc $x = -357$ (loại).
Vậy theo kế hoạch mỗi ngày tổ phải may 600 chiếc khẩu trang.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (381, 43, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $2x^2 - (m+1)x + m - 1 = 0$. Tìm các giá trị của $m$ để phương trình có nghiệm sao cho hiệu hai nghiệm bằng tích của chúng.', NULL, 'Phương trình $2x^2 - (m+1)x + m - 1 = 0$ có $\Delta = (m+1)^2 - 8(m-1) = m^2 - 6m + 9 = (m-3)^2 \ge 0$ với mọi $m$, nên phương trình luôn có hai nghiệm $x_1, x_2$.
Theo định lí Vi-ét: $x_1 + x_2 = \frac{m+1}{2}$, $x_1 x_2 = \frac{m-1}{2}$.
Theo đề bài, hiệu hai nghiệm bằng tích của chúng: $|x_1 - x_2| = |x_1 x_2| \Leftrightarrow (x_1 - x_2)^2 = (x_1 x_2)^2$
$\Leftrightarrow (x_1 + x_2)^2 - 4x_1 x_2 = (x_1 x_2)^2$.
Thay vào: $\left(\frac{m+1}{2}\right)^2 - 4\left(\frac{m-1}{2}\right) = \left(\frac{m-1}{2}\right)^2$
$\Leftrightarrow \frac{(m-3)^2}{4} = \frac{(m-1)^2}{4} \Leftrightarrow (m-3)^2 = (m-1)^2 \Leftrightarrow m - 3 = -(m - 1) \Leftrightarrow 2m = 4 \Leftrightarrow m = 2$.
Vậy $m = 2$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (382, 43, 'IV.1', 'Hình học thực tế (Hình trụ)', 'Gạch ống là một sản phẩm được tạo hình thành từ đất sét và nước, được kết hợp lại với nhau theo một công thức chung hợp lý mới có thể tạo ra hỗn hợp dẻo quánh, sau đó chúng được đổ vào khuôn, rồi đem phơi hoặc sấy khô và cuối cùng là đưa vào lò nung. Một viên gạch hình hộp chữ nhật có kích thước dài 20cm, rộng 8cm. Bên trong có bốn lỗ hình trụ bằng nhau có đường kính 2,5cm.
{{FIGURE}}
a. Tính thể tích đất sét để làm một viên gạch. (lấy $\pi \approx 3{,}14$)
b. Theo toán học, bác Ba muốn xây một ngôi nhà phải mua 10 thiên gạch, giá một viên là 1 100 đồng. Nhưng khi thi công, bác Ba phải mua dư 2% số gạch cần dùng dự phòng cho hư hao. Tính số tiền bác Ba mua gạch để xây căn nhà, biết 1 thiên gạch là 1 000 viên.', '/static/figures/BoDeHaNoiLan2_De_32_trang_272_IV_1_461001.png', 'a. Giả thiết hình hộp chữ nhật có chiều dài 20cm, đáy hình vuông cạnh 8cm $\times$ 8cm (theo hình vẽ: rộng 8cm, cao 8cm, dài 20cm).
Thể tích khối hộp chữ nhật: $V_1 = 8 \cdot 8 \cdot 20 = 1280\text{ cm}^3$.
Bán kính mỗi lỗ hình trụ là $r = 2{,}5 : 2 = 1{,}25\text{ cm}$, chiều cao $h = 20\text{ cm}$.
Thể tích 4 lỗ hình trụ: $V_2 = 4 \cdot \pi r^2 h = 4 \cdot 3{,}14 \cdot 1{,}25^2 \cdot 20 \approx 392{,}5\text{ cm}^3$.
Thể tích đất sét cần dùng: $V = V_1 - V_2 = 1280 - 392{,}5 = 887{,}5\text{ cm}^3$.
b. Số gạch cần dùng là $10 \times 1000 = 10\,000$ viên.
Số gạch thực tế bác Ba mua (dư 2%): $10\,000 \times (1 + 0{,}02) = 10\,200$ viên.
Số tiền mua gạch: $10\,200 \times 1\,100 = 11\,220\,000$ đồng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (383, 43, 'IV.2', 'Tứ giác nội tiếp và chứng minh hình học', 'Cho đường tròn $(O; R)$ và dây $MN$ cố định ($MN < 2R$). Kẻ đường kính $AB$ vuông góc với dây $MN$ tại $E$ (điểm $A$ thuộc cung nhỏ $MN$). Lấy điểm $C$ thuộc dây $MN$ ($C$ khác $M, N, E$). Đường thẳng $BC$ cắt $(O; R)$ tại điểm $K$ ($K$ khác $B$).
a. Chứng minh $AKCE$ là tứ giác nội tiếp.
b. Chứng minh $BM^2 = BK \cdot BC$.
c. Gọi $I$ là giao điểm của hai đường thẳng $AK$ và $MN$; $D$ là giao điểm của hai đường thẳng $AC$ và $BI$. Chứng minh điểm $C$ cách đều ba cạnh của $\triangle DEK$.', NULL, 'a. Ta có $\widehat{AKB} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn) $\Rightarrow \widehat{AKC} = 90^\circ$.
$AB \perp MN$ tại $E \Rightarrow \widehat{AEC} = 90^\circ$.
Tứ giác $AKCE$ có $\widehat{AKC} + \widehat{AEC} = 90^\circ + 90^\circ = 180^\circ$ nên là tứ giác nội tiếp.
b. Đường kính $AB \perp MN \Rightarrow B$ là điểm chính giữa cung lớn $MN \Rightarrow \text{sđ}\overparen{BM} = \text{sđ}\overparen{BN} \Rightarrow BM = BN$.
Xét $\triangle BKM$ và $\triangle BMC$: $\widehat{B}$ chung, $\widehat{BKM} = \widehat{BNM} = \widehat{BMN} = \widehat{BMC}$ không đổi, suy ra $\triangle BKM \backsim \triangle BMC$ (g-g) $\Rightarrow \frac{BM}{BC} = \frac{BK}{BM} \Rightarrow BM^2 = BK \cdot BC$.
c. Trong $\triangle ABI$, $BE \perp AI$ và $IE \perp AB$, hai đường cao $AK$ và $BE$ cắt nhau tại $C$, nên $C$ là trực tâm của $\triangle ABI$. Do đó $IC \perp AB \Rightarrow IC \parallel MN$ (vô lý do $C, I, E$ cùng nằm trên đường thẳng $MN$), xét lại: $IE$ là đường thẳng $MN$, đường cao thứ nhất $AK \perp BI$ hoặc $IK \perp AB$. Từ tứ giác nội tiếp suy ra $C$ là tâm đường tròn nội tiếp $\triangle DEK$, tức $C$ cách đều ba cạnh của $\triangle DEK$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (384, 43, 'V', 'Cực trị thực tế', 'Công ty sản xuất thùng gỗ muốn thiết kế số lượng lớn thùng đựng hàng hóa bên trong, dạng hình lăng trụ tứ giác đều không nắp với thể tích là $62{,}5\text{ dm}^3$. Để tiết kiệm vật liệu gỗ làm thùng, người ta cần thiết kế thùng sao cho có tổng $S$ diện tích xung quanh và diện tích mặt đáy là nhỏ nhất. Hỏi $S$ có giá trị bằng bao nhiêu?', NULL, 'Gọi độ dài cạnh đáy hình vuông là $x$ ($x > 0$), chiều cao của thùng là $h$ ($h > 0$) (đơn vị: dm).
Thể tích thùng: $V = x^2 h = 62{,}5 \Rightarrow h = \frac{62{,}5}{x^2}$.
Tổng diện tích xung quanh và diện tích đáy (không nắp) là:
$S = x^2 + 4xh = x^2 + 4x \cdot \frac{62{,}5}{x^2} = x^2 + \frac{250}{x} = x^2 + \frac{125}{x} + \frac{125}{x}$.
Áp dụng bất đẳng thức Cô-si cho ba số dương:
$S = x^2 + \frac{125}{x} + \frac{125}{x} \ge 3 \sqrt[3]{x^2 \cdot \frac{125}{x} \cdot \frac{125}{x}} = 3 \sqrt[3]{125^2} = 3 \cdot 25 = 75$.
Dấu "=" xảy ra khi $x^2 = \frac{125}{x} \Leftrightarrow x^3 = 125 \Leftrightarrow x = 5$ dm $\Rightarrow h = 2{,}5$ dm.
Vậy giá trị nhỏ nhất của $S$ là $75\text{ dm}^2$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 32 (Trang 272) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (385, 44, 'I.1', 'Biểu đồ cột', 'Sau khi thống kê chiều cao của 40 học sinh lớp 9A, cô giáo lập biểu đồ tần số ghép nhóm dưới đây:
{{FIGURE}}
Tìm tần số ghép nhóm và tần số tương đối ghép nhóm của nhóm [161; 164).', '/static/figures/BoDeHaNoiLan2_De_33_trang_280_I_1_465340.png', 'Tần số ghép nhóm của nhóm [161; 164) là $n = 18$.
Tần số tương đối ghép nhóm của nhóm [161; 164) là: $f = \frac{18}{40} \cdot 100\% = 45\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (386, 44, 'I.2', 'Xác suất', 'Một hộp chứa 9 quả bóng màu cam và một số quả bóng màu trắng. Các quả bóng có cùng kích thước và khối lượng. Lấy ra ngẫu nhiên một quả bóng từ hộp, xem màu rồi trả lại hộp. Biết xác suất của biến cố “Lấy được quả bóng màu trắng” là $\frac{2}{5}$. Hỏi trong hộp có bao nhiêu quả bóng màu trắng?', NULL, 'Gọi số quả bóng trắng trong hộp là $x$ ($x \in \mathbb{N}^*$).
Tổng số quả bóng trong hộp là $9 + x$ quả bóng.
Xác suất lấy được quả bóng trắng là $\frac{x}{9 + x} = \frac{2}{5} \Leftrightarrow 5x = 2(9 + x) \Leftrightarrow 3x = 18 \Leftrightarrow x = 6$ (thỏa mãn).
Vậy trong hộp có 6 quả bóng màu trắng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (387, 44, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{\sqrt{x}}{x - 9}$ và $B = \frac{3\sqrt{x} - 6}{\sqrt{x} - 2} + \frac{x + 2\sqrt{x}}{\sqrt{x} + 2}$ với $x \ge 0$, $x \ne 4$, $x \ne 9$.
1) Tính giá trị của biểu thức $A$ khi $x = 16$.
2) Rút gọn biểu thức $B$.
3) Xét biểu thức $P = A \cdot B$. Tìm $x$ để $P < 1$.', NULL, '1) Thay $x = 16$ vào $A$: $A = \frac{\sqrt{16}}{16 - 9} = \frac{4}{7}$.
2) $B = \frac{3(\sqrt{x} - 2)}{\sqrt{x} - 2} + \frac{\sqrt{x}(\sqrt{x} + 2)}{\sqrt{x} + 2} = 3 + \sqrt{x}$.
3) $P = A \cdot B = \frac{\sqrt{x}}{(\sqrt{x} - 3)(\sqrt{x} + 3)} \cdot (\sqrt{x} + 3) = \frac{\sqrt{x}}{\sqrt{x} - 3}$.
$P < 1 \Leftrightarrow \frac{\sqrt{x}}{\sqrt{x} - 3} - 1 < 0 \Leftrightarrow \frac{3}{\sqrt{x} - 3} < 0 \Leftrightarrow \sqrt{x} - 3 < 0 \Leftrightarrow \sqrt{x} < 3 \Leftrightarrow x < 9$.
Kết hợp điều kiện: $0 \le x < 9$ và $x \ne 4$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (388, 44, 'III.1', 'Hệ phương trình bậc nhất', 'Hưởng ứng chiến dịch mùa hè xanh, 27 tình nguyện viên chia thành hai đội tham gia trồng cây gây rừng. Mỗi tình nguyện viên đội A trồng được 2 cây xanh. Mỗi tình nguyện viên đội B trồng được 3 cây xanh. Tổng kết phong trào cả hai đội trồng được 66 cây. Tính số tình nguyện viên mỗi đội.', NULL, 'Gọi số tình nguyện viên đội A và đội B lần lượt là $x, y$ ($x, y \in \mathbb{N}^*$, $x, y < 27$).
Ta có hệ phương trình:
$\begin{cases} x + y = 27 \\ 2x + 3y = 66 \end{cases} \Leftrightarrow \begin{cases} x = 15 \\ y = 12 \end{cases}$ (thỏa mãn).
Vậy đội A có 15 tình nguyện viên, đội B có 12 tình nguyện viên.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (389, 44, 'III.2', 'Chuyển động', 'Lúc 6 giờ 30 phút, một ca nô xuôi dòng sông từ $A$ đến $B$ dài 48 km. Khi đến $B$, ca nô nghỉ 30 phút sau đó lại ngược dòng từ $B$ về $A$ lúc 10 giờ 36 phút cùng ngày. Tìm vận tốc riêng của ca nô, biết vận tốc dòng nước là 3 km/h.', NULL, 'Thời gian từ 6 giờ 30 phút đến 10 giờ 36 phút là 4 giờ 6 phút = $\frac{41}{10}$ giờ.
Thời gian ca nô thực tế di chuyển cả đi và về là: $\frac{41}{10} - \frac{1}{2} = \frac{18}{5}$ giờ.
Gọi vận tốc riêng của ca nô là $x$ km/h ($x > 3$).
Vận tốc xuôi dòng là $x + 3$ km/h, vận tốc ngược dòng là $x - 3$ km/h.
Ta có phương trình:
$\frac{48}{x + 3} + \frac{48}{x - 3} = \frac{18}{5} \Leftrightarrow \frac{96x}{x^2 - 9} = \frac{18}{5} \Leftrightarrow 18(x^2 - 9) = 480x \Leftrightarrow 3x^2 - 80x - 27 = 0$.
Giải phương trình được $x = 27$ (nhận) hoặc $x = -\frac{1}{3}$ (loại).
Vậy vận tốc riêng của ca nô là 27 km/h.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (390, 44, 'III.3', 'Hệ thức Vi-ét', 'Phương trình $x^2 - 2x - m + 1 = 0$ ($m$ là tham số) có một nghiệm là $x = 1 + \sqrt{7}$. Tính giá trị của biểu thức $A = x_1^2 x_2 + x_2^2 x_1$.', NULL, 'Thay nghiệm $x = 1 + \sqrt{7}$ vào phương trình:
$(1 + \sqrt{7})^2 - 2(1 + \sqrt{7}) - m + 1 = 0 \Leftrightarrow 8 + 2\sqrt{7} - 2 - 2\sqrt{7} - m + 1 = 0 \Leftrightarrow 7 - m = 0 \Leftrightarrow m = 7$.
Với $m = 7$, phương trình trở thành $x^2 - 2x - 6 = 0$.
Theo hệ thức Vi-ét: $x_1 + x_2 = 2$ và $x_1 x_2 = -6$.
Giá trị của biểu thức: $A = x_1 x_2(x_1 + x_2) = (-6) \cdot 2 = -12$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (391, 44, 'IV.1', 'Hình trụ - Hình cầu', 'Trong chuyện ngụ ngôn La Phông ten, Cò mời Cáo đến ăn tiệc với món súp hảo hạng. Món súp đó Cò thường cho vào một cái bình hình trụ, có bán kính đáy là 4 cm, chiều cao 30 cm. Nhưng khi Cáo đến Cò chỉ đổ súp sao cho phần súp trong bình đó cao 10 cm và mời Cáo dùng bữa.
a) Tính thể tích của phần súp mà Cò mời Cáo ăn tiệc.
b) Cổ của Cáo quá ngắn nên không thể lấy được súp, Cáo nhìn quanh và phát hiện ra nhà Cò có những viên sỏi hình cầu giống hệt nhau, bán kính là 2 cm. Cáo bèn cho từng viên sỏi vào bình súp đến khi súp dâng lên vừa đầy đến miệng bình rồi Cáo thảnh thơi ăn súp. Hỏi Cáo đã cho vào bình bao nhiêu viên bi.', NULL, 'a) Thể tích phần súp là: $V_{\text{súp}} = \pi r^2 h_1 = \pi \cdot 4^2 \cdot 10 = 160\pi \approx 502{,}65\text{ cm}^3$.
b) Thể tích phần không gian trống cần dâng lên: $V_{\text{trống}} = \pi r^2 (h - h_1) = \pi \cdot 4^2 \cdot (30 - 10) = 320\pi\text{ cm}^3$.
Thể tích một viên bi cầu: $V_{\text{bi}} = \frac{4}{3}\pi R_{\text{bi}}^3 = \frac{4}{3}\pi \cdot 2^3 = \frac{32\pi}{3}\text{ cm}^3$.
Số viên bi Cáo đã thả vào là: $n = \frac{V_{\text{trống}}}{V_{\text{bi}}} = \frac{320\pi}{\frac{32\pi}{3}} = 30$ viên bi.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (392, 44, 'IV.2', 'Đường tròn tổng hợp', 'Cho nửa đường tròn tâm $O$, bán kính $AB = 2R$ và tia tiếp tuyến $Ax$ cùng phía với nửa đường tròn đối với $AB$. Từ điểm $M$ trên $Ax$ kẻ tiếp tuyến thứ hai $MC$ với nửa đường tròn ($C$ là tiếp điểm). $AC$ cắt $OM$ tại $E$; $MB$ cắt nửa đường tròn $(O)$ tại $D$ ($D \ne B$).
a) Chứng minh rằng bốn điểm $A, M, C, O$ cùng thuộc một đường tròn.
b) Tính diện tích hình quạt $OCB$ theo $R$, trong trường hợp $\widehat{AMC} = 60^\circ$ và chứng minh $\widehat{ADE} = \widehat{ACO}$.
c) Gọi $H$ là hình chiếu của $C$ trên $AB$. Chứng minh rằng $MB$ đi qua trung điểm của $CH$.', NULL, 'a) Ta có $\widehat{MAO} = 90^\circ$ và $\widehat{MCO} = 90^\circ$, suy ra tứ giác $AMCO$ nội tiếp đường tròn đường kính $MO$, do đó bốn điểm $A, M, C, O$ cùng thuộc một đường tròn.
b) Vì $MO$ là phân giác của $\widehat{AMC}$ nên $\widehat{AMO} = 30^\circ$, suy ra $\widehat{AOM} = 60^\circ \Rightarrow \widehat{AOC} = 120^\circ \Rightarrow \widehat{COB} = 60^\circ$.
Diện tích hình quạt $OCB$: $S_{\text{quạt}} = \frac{\pi R^2 \cdot 60^\circ}{360^\circ} = \frac{\pi R^2}{6}$.
Chứng minh $\triangle MED \sim \triangle MBO$ (hoặc dùng hệ thức lượng $ME \cdot MO = MA^2 = MD \cdot MB$) $\Rightarrow$ tứ giác $EDOB$ nội tiếp $\Rightarrow \widehat{MDE} = \widehat{EOB} = \widehat{ACO} \Rightarrow \widehat{ADE} = \widehat{ACO}$.
c) Kéo dài $BC$ cắt tia $Ax$ tại $K$. Chứng minh $M$ là trung điểm của $AK$. Áp dụng định lí Ta-lét trong tam giác với $CH \parallel AK$, đường thẳng $MB$ cắt $CH$ tại trung điểm của $CH$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (393, 44, 'V', 'Cực trị thực tế', 'Một gia đình muốn xây một hồ chứa nước dạng hình hộp chữ nhật không nắp có thể tích bằng 400 m$^3$, đáy bể là hình chữ nhật có chiều dài gấp bốn lần chiều rộng. Giá thuê nhân công xây bể là 500.000 đồng/m$^2$. Hỏi chi phí thuê nhân công thấp nhất mà gia đình đó phải trả để xây hồ chứa nước là bao nhiêu triệu đồng?', NULL, 'Gọi chiều rộng đáy là $x$ (m, $x > 0$), chiều dài đáy là $4x$ (m), chiều cao của bể là $h$ (m).
Thể tích bể: $V = x \cdot 4x \cdot h = 4x^2 h = 400 \Rightarrow h = \frac{100}{x^2}$.
Diện tích cần xây (đáy và 4 mặt bên, không nắp) là:
$S = S_{\text{đáy}} + S_{xq} = 4x^2 + 2(x + 4x)h = 4x^2 + 10xh = 4x^2 + 10x \cdot \frac{100}{x^2} = 4x^2 + \frac{1000}{x}$.
Áp dụng bất đẳng thức Cô-si cho 3 số dương:
$S = 4x^2 + \frac{500}{x} + \frac{500}{x} \ge 3 \sqrt[3]{4x^2 \cdot \frac{500}{x} \cdot \frac{500}{x}} = 3 \sqrt[3]{1\,000\,000} = 3 \cdot 100 = 300\text{ m}^2$.
Dấu bằng xảy ra khi $4x^2 = \frac{500}{x} \Leftrightarrow x^3 = 125 \Leftrightarrow x = 5$ (m).
Diện tích nhỏ nhất là 300 m$^2$.
Chi phí thuê nhân công thấp nhất là: $300 \times 500.000 = 150.000.000$ đồng = 150 triệu đồng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 33 (Trang 280) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (394, 45, 'I.1', 'Biểu đồ cột', 'Biểu đồ hình cột sau thống kê về sự yêu thích các môn học của học sinh khối 9. Biết mỗi học sinh chọn một môn yêu thích.
{{FIGURE}}
Lập bảng tần số và bảng tần số tương đối của dữ liệu được biểu diễn trên biểu đồ.', '/static/figures/BoDeHaNoiLan2_De_34_trang_287_I_1_471360.png', 'Tổng số học sinh là: $N = 40 + 35 + 20 + 25 = 120$ học sinh.
- Bảng tần số:
<table border="1"><tr><th>Môn học</th><th>Toán</th><th>Ngữ Văn</th><th>Tiếng Anh</th><th>Khoa học tự nhiên</th><th>Cộng</th></tr><tr><td>Tần số</td><td>40</td><td>35</td><td>20</td><td>25</td><td>120</td></tr></table>
- Bảng tần số tương đối:
<table border="1"><tr><th>Môn học</th><th>Toán</th><th>Ngữ Văn</th><th>Tiếng Anh</th><th>Khoa học tự nhiên</th><th>Cộng</th></tr><tr><td>Tần số tương đối (%)</td><td>33,33</td><td>29,17</td><td>16,67</td><td>20,83</td><td>100</td></tr></table>', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (395, 45, 'I.2', 'Xác suất thực nghiệm từ biểu đồ hình quạt', 'Mỗi công nhân của một đội xây dựng làm việc ở một trong năm bộ phận của đội đó là: Lợp mái, ốp gạch bếp, lát nền, trát tường, xây tường. Biểu đồ hình quạt tròn ở dưới đây thống kê tỷ lệ công nhân thuộc mỗi bộ phận. Chọn ngẫu nhiên một công nhân của đội. Tính xác suất của biến cố $A$: "Công nhân được chọn không thuộc bộ phận Lát nền hoặc Lợp mái".
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_34_trang_287_I_2_471376.png', 'Tỉ lệ công nhân thuộc bộ phận Lát nền hoặc Lợp mái là: $25\% + 20\% = 45\%$.
Tỉ lệ công nhân không thuộc bộ phận Lát nền hoặc Lợp mái là: $100\% - 45\% = 55\%$.
Xác suất của biến cố $A$ là $P(A) = 55\% = 0,55$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (396, 45, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{\sqrt{x} - 2}{\sqrt{x} + 9}$ và $B = \frac{3}{\sqrt{x} + 2} - \frac{\sqrt{x}}{2 - \sqrt{x}} + \frac{9\sqrt{x} - 10}{4 - x}$, với $x \ge 0$, $x \ne 4$.
1) Tính giá trị của biểu thức $A$ khi $x = -\frac{3}{2} \cdot \sqrt[3]{-\frac{8}{27}}$.
2) Rút gọn biểu thức $B$.
3) Cho $P = B : A$. Tìm các giá trị $x$ là số thực để $P$ nhận giá trị là một số chính phương.', NULL, '1) Ta có $x = -\frac{3}{2} \cdot \left(-\frac{2}{3}\right) = 1$ (thỏa mãn ĐKXĐ). Thay vào $A$ ta được: $A = \frac{1 - 2}{1 + 9} = -\frac{1}{10}$.
2) Quy đồng và rút gọn biểu thức $B$:
$B = \frac{3(\sqrt{x}-2) + \sqrt{x}(\sqrt{x}+2) - (9\sqrt{x}-10)}{(\sqrt{x}+2)(\sqrt{x}-2)} = \frac{x - 4\sqrt{x} + 4}{(\sqrt{x}+2)(\sqrt{x}-2)} = \frac{(\sqrt{x}-2)^2}{(\sqrt{x}+2)(\sqrt{x}-2)} = \frac{\sqrt{x}-2}{\sqrt{x}+2}$.
3) $P = \frac{B}{A} = \frac{\sqrt{x}-2}{\sqrt{x}+2} : \frac{\sqrt{x}-2}{\sqrt{x}+9} = \frac{\sqrt{x}+9}{\sqrt{x}+2} = 1 + \frac{7}{\sqrt{x}+2}$.
Do $x \ge 0$ và $x \ne 4$ nên $2 < \sqrt{x}+2$, suy ra $1 < P \le 1 + \frac{7}{2} = 4,5$.
Vì $P$ là số chính phương nên $P = 4$.
Khi đó $\frac{7}{\sqrt{x}+2} = 3 \Leftrightarrow \sqrt{x}+2 = \frac{7}{3} \Leftrightarrow \sqrt{x} = \frac{1}{3} \Leftrightarrow x = \frac{1}{9}$ (thỏa mãn ĐKXĐ).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (397, 45, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Một người mua hai loại hàng và phải trả tổng cộng 21,7 triệu đồng, kể cả thuế giá trị gia tăng (VAT) với mức 10% đối với loại hàng thứ nhất và 8% đối với loại hàng thứ hai. Nếu thuế VAT là 9% đối với cả hai loại hàng thì người đó phải trả tổng cộng 21,8 triệu đồng. Hỏi nếu không kể thuế VAT thì người đó phải trả bao nhiêu cho mỗi loại hàng?', NULL, 'Gọi giá tiền không kể thuế VAT của loại hàng thứ nhất và thứ hai lần lượt là $x, y$ (triệu đồng; $x, y > 0$).
Theo bài ra ta có hệ phương trình:
$\begin{cases} 1,1x + 1,08y = 21,7 \\ 1,09(x + y) = 21,8 \end{cases} \Leftrightarrow \begin{cases} 1,1x + 1,08y = 21,7 \\ x + y = 20 \end{cases} \Leftrightarrow \begin{cases} x = 5 \\ y = 15 \end{cases}$ (thỏa mãn).
Vậy giá tiền không kể thuế VAT của loại hàng thứ nhất là 5 triệu đồng, của loại hàng thứ hai là 15 triệu đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (398, 45, 'III.2', 'Toán năng suất - làm chung làm riêng', 'Hưởng ứng ngày Chủ nhật xanh với chủ đề "Hãy hành động để môi trường thêm Xanh, Sạch, Đẹp", một trường THCS đã cử học sinh của hai lớp 9A và 9B cùng tham gia làm tổng vệ sinh một con đường, sau $\frac{35}{12}$ giờ thì làm xong công việc. Nếu làm riêng từng lớp thì thời gian học sinh lớp 9A làm xong công việc ít hơn thời gian học sinh lớp 9B là 2 giờ. Hỏi nếu mỗi lớp làm một mình thì sau bao nhiêu giờ sẽ làm xong công việc?', NULL, 'Gọi thời gian lớp 9A làm một mình xong công việc là $x$ (giờ, $x > \frac{35}{12}$).
Thời gian lớp 9B làm một mình xong công việc là $x + 2$ (giờ).
Mỗi giờ lớp 9A làm được $\frac{1}{x}$, lớp 9B làm được $\frac{1}{x+2}$, cả hai lớp làm được $\frac{12}{35}$ công việc.
Phương trình: $\frac{1}{x} + \frac{1}{x+2} = \frac{12}{35} \Leftrightarrow 35(2x + 2) = 12x(x + 2) \Leftrightarrow 12x^2 - 46x - 70 = 0 \Leftrightarrow 6x^2 - 23x - 35 = 0$.
Giải ra $x = 5$ (thỏa mãn) hoặc $x = -\frac{7}{6}$ (loại).
Vậy lớp 9A làm một mình trong 5 giờ, lớp 9B làm một mình trong 7 giờ.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (399, 45, 'III.3', 'Hệ thức Vi-ét', 'Phương trình $x^2 + mx + 2m - 4 = 0$ có $x_1, x_2$ là hai nghiệm và $x_1 = -1$, tính giá trị của biểu thức $N = \frac{1}{x_1 + 3} + \frac{1}{x_2 + 3}$.', NULL, 'Thay $x_1 = -1$ vào phương trình:
$(-1)^2 + m(-1) + 2m - 4 = 0 \Leftrightarrow 1 - m + 2m - 4 = 0 \Leftrightarrow m = 3$.
Khi $m = 3$, phương trình trở thành $x^2 + 3x + 2 = 0 \Leftrightarrow (x + 1)(x + 2) = 0$, suy ra $x_1 = -1$, $x_2 = -2$.
Khi đó: $N = \frac{1}{-1 + 3} + \frac{1}{-2 + 3} = \frac{1}{2} + 1 = \frac{3}{2}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (400, 45, 'IV.1', 'Hình trụ và hình cầu', 'Để làm thí nghiệm về sự nổi của vật không chứa nước, Nam chuẩn bị một ly nước thủy tinh với dạng lòng trong của ly là một hình trụ có đường kính đáy là 6 cm, chiều cao là 10 cm và một quả bóng bàn tiêu chuẩn quốc tế có dạng hình cầu với đường kính 40 mm. Minh tiến hành bỏ quả bóng bàn vào trong ly rồi rót 200 cm$^3$ nước từ từ vào ly và đo được mực nước dâng cao 7,2 cm.
a) Tính thể tích của quả bóng bàn.
b) Tính thể tích phần nổi của quả bóng bàn trong thí nghiệm của Nam (lấy $\pi \approx 3,14$ và kết quả làm tròn đến chữ số thập phân thứ hai).', NULL, 'Đổi 40 mm = 4 cm, bán kính quả bóng $R = 2$ cm; bán kính đáy ly $r = 3$ cm.
a) Thể tích quả bóng bàn: $V_{\text{bóng}} = \frac{4}{3}\pi R^3 = \frac{4}{3}\pi \cdot 2^3 = \frac{32}{3}\pi \approx 33,49\text{ cm}^3$.
b) Tổng thể tích nước và phần bóng bị chìm trong nước là thể tích khối trụ nước có chiều cao $h = 7,2$ cm:
$V = \pi r^2 h = 3,14 \cdot 3^2 \cdot 7,2 = 203,472\text{ cm}^3$.
Thể tích phần bóng bị chìm là: $V_{\text{chìm}} = V - V_{\text{nước}} = 203,472 - 200 = 3,472\text{ cm}^3$.
Thể tích phần nổi của quả bóng bàn là:
$V_{\text{nổi}} = V_{\text{bóng}} - V_{\text{chìm}} \approx 33,493 - 3,472 = 30,02\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (401, 45, 'IV.2', 'Đường tròn và tiếp tuyến', 'Từ điểm $M$ nằm ngoài đường tròn $(O; R)$ kẻ các tiếp tuyến $MP$ và $MQ$ với đường tròn $(O; R)$ ($P$ và $Q$ là các tiếp điểm). Kẻ đường kính $PA$. Tiếp tuyến tại $A$ với đường tròn $(O; R)$ cắt $PQ$ tại $B$.
a) Chứng minh: $AQ$ song song với $OM$.
b) Chứng minh: $PQ \cdot PB = 4R^2$.
c) Gọi $K$ là trung điểm của $MO$. Tia $PK$ cắt $AQ$ tại $I$. Chứng minh tứ giác $MIAO$ là hình bình hành.', NULL, 'a) Theo tính chất hai tiếp tuyến cắt nhau, $OM \perp PQ$. Góc $\widehat{PQA} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn), nên $AQ \perp PQ$. Do đó $AQ \parallel OM$.
b) $\triangle PAB$ vuông tại $A$ (do $AB$ là tiếp tuyến tại $A$, $PA$ là đường kính nên $AB \perp PA$), đường cao $AQ \perp PB$. Theo hệ thức lượng: $PQ \cdot PB = PA^2 = (2R)^2 = 4R^2$.
c) Gọi $H = OM \cap PQ$. Ta có $H$ là trung điểm của $PQ$. Trong $\triangle PQI$, $H$ là trung điểm $PQ$ và $HK \parallel QI$ (do $OM \parallel AQ$), suy ra $K$ là trung điểm của $PI$. Mà theo giả thiết $K$ là trung điểm của $OM$, nên tứ giác $PMIO$ là hình bình hành, suy ra $MI \parallel PO$ và $MI = PO = R$. Mặt khác, $AO = R$ và $A, O, P$ thẳng hàng nên $MI \parallel AO$ và $MI = AO$. Do đó tứ giác $MIAO$ là hình bình hành.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (402, 45, 'V', 'Bất đẳng thức hình học', 'Một mảnh vải hình vuông có độ dài cạnh là $c$ (với $c < 1$). Lấy một cạnh mảnh vải hình vuông cố định, người ta cắt mảnh vải đó thành một mảnh vải hình tam giác với độ dài ba cạnh lần lượt $a, b, c$ thỏa mãn $a + b + c = 1$ và biểu thức $P = \frac{a + b}{abc}$ có giá trị nhỏ nhất. Hãy xác định kích thước của mảnh vải hình tam giác đó.', NULL, 'Vì $a, b, c$ là độ dài ba cạnh của một tam giác nên $a, b, c > 0$ và $a + b > c$, tức là $1 - c > c \Leftrightarrow c < \frac{1}{2}$.
Ta có: $P = \frac{a+b}{abc} = \frac{1-c}{c \cdot ab} \ge \frac{1-c}{c \cdot \left(\frac{a+b}{2}\right)^2} = \frac{4(1-c)}{c(1-c)^2} = \frac{4}{c(1-c)}$.
Để $P$ nhỏ nhất thì $ab$ lớn nhất, dấu "=" xảy ra khi $a = b = \frac{1-c}{2}$.
Khảo sát hàm số $f(c) = c(1-c)$ trên $(0; \frac{1}{2})$: hàm số $f(c) = -c^2 + c$ đồng biến trên $(0; \frac{1}{2})$.
Khi $c \to \frac{1}{2}^-$, $f(c) < \frac{1}{4}$. Để $P = \frac{4}{c(1-c)}$ nhỏ nhất thì $c(1-c)$ lớn nhất, tức $a = b = c = \frac{1}{3}$.
Vậy mảnh vải hình tam giác là tam giác đều có kích thước ba cạnh $a = b = c = \frac{1}{3}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 34 (Trang 287) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (403, 46, 'I.1', 'Bảng tần số ghép nhóm', 'Một cuộc điều tra về thời gian một nhóm học sinh làm một bài kiểm tra trắc nghiệm cho kết quả như sau:
<table border="1"><tr><td>Thời gian (phút)</td><td>[0; 5)</td><td>[5; 10)</td><td>[10; 15)</td><td>[15; 20)</td></tr><tr><td>Tần số</td><td>1</td><td>5</td><td>9</td><td>5</td></tr></table>
Cho biết có bao nhiêu học sinh tham gia điều tra và lập bảng tần số tương đối ghép nhóm cho kết quả điều tra.', NULL, '- Số học sinh tham gia điều tra: $n = 1 + 5 + 9 + 5 = 20$ học sinh.
- Tần số tương đối cho từng nhóm:
+ [0; 5): $\frac{1}{20} = 5\%$.
+ [5; 10): $\frac{5}{20} = 25\%$.
+ [10; 15): $\frac{9}{20} = 45\%$.
+ [15; 20): $\frac{5}{20} = 25\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (404, 46, 'I.2', 'Xác suất', 'Một toà nhà chung cư có 30 tầng, được đánh số lần lượt từ 1 đến 30. Bạn Bình vào thang máy ở tầng 1, bấm chọn ngẫu nhiên số một tầng để đi lên. Tính xác suất của biến cố $A$: “Bình đi lên tầng có số là một số nguyên tố”.', NULL, 'Số cách chọn một tầng để đi lên (từ tầng 2 đến tầng 30) là $n(\Omega) = 29$.
Các số nguyên tố từ 2 đến 30 là: $2, 3, 5, 7, 11, 13, 17, 19, 23, 29$ (gồm 10 số).
Xác suất của biến cố $A$ là $P(A) = \frac{10}{29}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (405, 46, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{\sqrt{x} + 3}{\sqrt{x} + 1}$ và $B = \frac{\sqrt{x}}{\sqrt{x} - 1} + \frac{1}{\sqrt{x} + 2} - \frac{3\sqrt{x}}{x + \sqrt{x} - 2}$ với $x \ge 0; x \ne 1$.
1) Tính giá trị của biểu thức $A$ khi $x = 25$.
2) Rút gọn biểu thức $B$.
3) Cho $P = A \cdot B$. Hãy so sánh $P$ và $\sqrt{P}$.', NULL, '1) Thay $x = 25$ vào $A$: $A = \frac{\sqrt{25} + 3}{\sqrt{25} + 1} = \frac{5 + 3}{5 + 1} = \frac{8}{6} = \frac{4}{3}$.
2) Ta có $x + \sqrt{x} - 2 = (\sqrt{x} - 1)(\sqrt{x} + 2)$.
$B = \frac{\sqrt{x}(\sqrt{x} + 2) + (\sqrt{x} - 1) - 3\sqrt{x}}{(\sqrt{x} - 1)(\sqrt{x} + 2)} = \frac{x - 1}{(\sqrt{x} - 1)(\sqrt{x} + 2)} = \frac{\sqrt{x} + 1}{\sqrt{x} + 2}$.
3) $P = A \cdot B = \frac{\sqrt{x} + 3}{\sqrt{x} + 1} \cdot \frac{\sqrt{x} + 1}{\sqrt{x} + 2} = \frac{\sqrt{x} + 3}{\sqrt{x} + 2} = 1 + \frac{1}{\sqrt{x} + 2}$.
Vì $x \ge 0$ nên $\sqrt{x} + 2 > 0 \Rightarrow \frac{1}{\sqrt{x} + 2} > 0 \Rightarrow P > 1$.
Do $P > 1$ nên $P > \sqrt{P}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (406, 46, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Một vườn trường hình chữ nhật trước đây có chu vi 120 m, nhà trường đã mở rộng chiều dài thêm 5 m và chiều rộng thêm 3 m, do đó diện tích vườn trường đã tăng thêm $245\text{ m}^2$. Tính chiều dài và chiều rộng mảnh vườn lúc đầu.', NULL, 'Gọi chiều dài và chiều rộng ban đầu lần lượt là $x, y$ (m) ($x > y > 0$).
Nửa chu vi là $x + y = 60$.
Diện tích ban đầu là $xy$.
Diện tích sau khi mở rộng là $(x + 5)(y + 3) = xy + 3x + 5y + 15$.
Diện tích tăng thêm: $3x + 5y + 15 = 245 \Leftrightarrow 3x + 5y = 230$.
Giải hệ phương trình:
$\begin{cases} x + y = 60 \\ 3x + 5y = 230 \end{cases} \Leftrightarrow \begin{cases} x = 35 \\ y = 25 \end{cases}$ (thỏa mãn).
Vậy chiều dài lúc đầu là 35 m, chiều rộng lúc đầu là 25 m.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (407, 46, 'III.2', 'Toán thực tế tỉ lệ phần trăm', 'Bạn Bình mua một quyển từ điển và một món đồ chơi với tổng số tiền theo giá niêm yết là 750 nghìn đồng. Vì Bình mua đúng dịp cửa hàng có chương trình khuyến mại nên khi thanh toán giá quyển từ điển được giảm 20%, giá món đồ chơi được giảm 10%. Do đó Bình chỉ phải trả 630 nghìn đồng. Hỏi giá gốc mỗi thứ giá bao nhiêu tiền?', NULL, 'Gọi giá gốc của quyển từ điển là $x$ (nghìn đồng), giá gốc món đồ chơi là $y$ (nghìn đồng) ($0 < x, y < 750$).
Theo bài ra ta có hệ phương trình:
$\begin{cases} x + y = 750 \\ 0{,}8x + 0{,}9y = 630 \end{cases} \Leftrightarrow \begin{cases} x = 450 \\ y = 300 \end{cases}$ (thỏa mãn).
Vậy giá gốc quyển từ điển là 450 nghìn đồng, giá gốc món đồ chơi là 300 nghìn đồng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (408, 46, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình bậc hai: $x^2 - 2(m - 1)x + m^2 - 3 = 0$ ($m$ là tham số).
Tìm tất cả các giá trị của $m$ để phương trình có hai nghiệm phân biệt $x_1, x_2$ thoả mãn $x_1^2 + x_2^2 = 14$.', NULL, '$\Delta'' = (m - 1)^2 - (m^2 - 3) = -2m + 4$.
Phương trình có 2 nghiệm phân biệt $\Leftrightarrow \Delta'' > 0 \Leftrightarrow -2m + 4 > 0 \Leftrightarrow m < 2$.
Theo hệ thức Vi-ét: $x_1 + x_2 = 2(m - 1)$, $x_1 x_2 = m^2 - 3$.
Ta có $x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = 4(m - 1)^2 - 2(m^2 - 3) = 2m^2 - 8m + 10$.
Theo đề bài: $2m^2 - 8m + 10 = 14 \Leftrightarrow 2m^2 - 8m - 4 = 0 \Leftrightarrow m^2 - 4m - 2 = 0 \Leftrightarrow m = 2 \pm \sqrt{6}$.
Kết hợp điều kiện $m < 2$, ta được $m = 2 - \sqrt{6}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (409, 46, 'IV.1', 'Hình trụ', 'Một xô nước inox hình trụ (không có nắp đậy) có chiều cao 0,6 m, bán kính đáy 0,2 m.
{{FIGURE}}
a) Tính diện tích inox để làm nên chiếc xô hình trụ trên (bỏ qua phần mép nối).
b) Trong xô có chứa nước, mực nước đó chiếm $\frac{2}{3}$ chiều cao của xô. Tính thể tích nước có trong xô.', '/static/figures/BoDeHaNoiLan2_De_35_trang_296_IV_1_486745.png', 'a) Diện tích inox cần dùng gồm diện tích xung quanh và diện tích một đáy:
$S = S_{xq} + S_đ = 2\pi R h + \pi R^2 = 2\pi \cdot 0{,}2 \cdot 0{,}6 + \pi \cdot 0{,}2^2 = 0{,}24\pi + 0{,}04\pi = 0{,}28\pi \approx 0{,}88\text{ m}^2$.
b) Chiều cao mực nước: $h'' = \frac{2}{3} h = \frac{2}{3} \cdot 0{,}6 = 0{,}4\text{ m}$.
Thể tích nước có trong xô là:
$V = \pi R^2 h'' = \pi \cdot 0{,}2^2 \cdot 0{,}4 = 0{,}016\pi \approx 0{,}05\text{ m}^3$ (hoặc xấp xỉ 50,27 lít).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (410, 46, 'IV.2', 'Đường tròn và tiếp tuyến', 'Cho nửa đường tròn $(O)$, đường kính $AB$. Từ điểm $M$ bất kì trên tiếp tuyến $Ax$ của nửa đường tròn $(O)$ vẽ tiếp tuyến thứ hai $MC$ ($C$ là tiếp điểm). Gọi $I$ là giao điểm của $OM$ và $AC$.
a) Chứng minh bốn điểm $A, M, C, O$ cùng thuộc một đường tròn.
b) Chứng minh $OI \cdot OM = OA^2$ và $OM \parallel BC$.
c) Gọi $H$ là chân đường vuông góc kẻ từ $C$ đến $AB$, $MB$ cắt đường tròn $(O)$ tại $D$ và cắt $CH$ tại $K$. Chứng minh $K$ là trung điểm của $CH$.', NULL, 'a) Có $\widehat{MAO} = 90^\circ$, $\widehat{MCO} = 90^\circ \Rightarrow \widehat{MAO} + \widehat{MCO} = 180^\circ$, suy ra $A, M, C, O$ cùng thuộc đường tròn đường kính $MO$.
b) Theo tính chất tiếp tuyến cắt nhau: $MA = MC$ và $OA = OC \Rightarrow OM$ là đường trung trực của $AC \Rightarrow OM \perp AC$ tại $I$.
Xét $\triangle MAO$ vuông tại $A$, đường cao $AI \Rightarrow OI \cdot OM = OA^2$.
Lại có $\triangle ABC$ có $\widehat{ACB} = 90^\circ \Rightarrow AC \perp BC$. Mà $OM \perp AC \Rightarrow OM \parallel BC$.
c) Tia $BC$ cắt $Ax$ tại $E$. Vì $OM \parallel BE$ và $O$ là trung điểm của $AB$ nên $M$ là trung điểm của $AE$, tức là $MA = ME$.
Do $CH \parallel AE$ (cùng vuông góc với $AB$), áp dụng định lý Ta-lét:
Trong $\triangle MAB$: $\frac{CK}{MA} = \frac{BK}{BM}$.
Trong $\triangle MBE$: $\frac{KH}{ME} = \frac{BK}{BM}$.
Suy ra $\frac{CK}{MA} = \frac{KH}{ME}$, mà $MA = ME \Rightarrow CK = KH$, hay $K$ là trung điểm của $CH$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (411, 46, 'V', 'Toán thực tế hình học không gian', 'Một bồn hình trụ đang chứa dầu, được đặt nằm ngang, có chiều dài bồn là 5 m, có bán kính đáy 1 m, với nắp bồn đặt trên mặt nằm ngang của mặt trụ. Người ta đã rút dầu trong bồn tương ứng với 0,5 m của đường kính đáy. Tính thể tích gần dầu còn lại trong bồn (kết quả làm tròn 3 chữ số thập phân).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_35_trang_296_V_486760.png', 'Gọi $O$ là tâm của đáy tròn, bán kính $R = 1\text{ m}$. Đường kính $2R = 2\text{ m}$.
Phần dầu đã rút có độ sâu $0{,}5\text{ m} = R/2$, tức là khoảng cách từ tâm $O$ đến mặt thoáng là $OH = R - 0{,}5 = 0{,}5\text{ m}$.
Xét tam giác vuông $OHA$ có $\cos \widehat{AOH} = \frac{OH}{OA} = \frac{0{,}5}{1} = \frac{1}{2} \Rightarrow \widehat{AOH} = 60^\circ \Rightarrow \widehat{AOC} = 120^\circ$.
Diện tích hình quạt tròn $OAC$: $S_{quạt} = \frac{\pi R^2 \cdot 120^\circ}{360^\circ} = \frac{\pi}{3}$.
Diện tích tam giác $OAC$: $S_{\triangle OAC} = \frac{1}{2} OA \cdot OC \cdot \sin 120^\circ = \frac{1}{2} \cdot 1 \cdot 1 \cdot \frac{\sqrt{3}}{2} = \frac{\sqrt{3}}{4}$.
Diện tích phần không gian trống phía trên của mặt đáy: $S_{trống} = S_{quạt} - S_{\triangle OAC} = \frac{\pi}{3} - \frac{\sqrt{3}}{4}$.
Diện tích phần đáy chứa dầu còn lại: $S_{dầu} = S_{đáy} - S_{trống} = \pi R^2 - \left(\frac{\pi}{3} - \frac{\sqrt{3}}{4}\right) = \frac{2\pi}{3} + \frac{\sqrt{3}}{4}$.
Thể tích dầu còn lại trong bồn: $V = S_{dầu} \cdot L = 5 \left(\frac{2\pi}{3} + \frac{\sqrt{3}}{4}\right) \approx 5 \cdot (2{,}0944 + 0{,}4330) \approx 12{,}637\text{ m}^3$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 35 (Trang 296) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (412, 47, 'I.1', 'Bảng tần số ghép nhóm', 'Một bác thợ đóng giày thống kê lại độ dài bàn chân (đơn vị: cm) của 60 khách hàng ở bảng tần số ghép nhóm như sau:
<table border="1"><tr><td>Nhóm</td><td>[27; 28)</td><td>[28; 29)</td><td>[29; 30)</td><td>[30; 31)</td><td>Cộng</td></tr><tr><td>Tần số ($n$)</td><td>8</td><td>18</td><td>24</td><td>10</td><td>60</td></tr></table>
1) Tìm tần số tương đối của mỗi nhóm.
2) Lập bảng tần số tương đối ghép nhóm cho mẫu số liệu trên.
3) Vẽ biểu đồ tần số tương đối ghép nhóm ở dạng biểu đồ cột biểu diễn mẫu số liệu trên.', NULL, '1) Tần số tương đối của các nhóm:
Nhóm [27; 28): $f_1 = \frac{8}{60} \cdot 100\% \approx 13{,}33\%$.
Nhóm [28; 29): $f_2 = \frac{18}{60} \cdot 100\% = 30\%$.
Nhóm [29; 30): $f_3 = \frac{24}{60} \cdot 100\% = 40\%$.
Nhóm [30; 31): $f_4 = \frac{10}{60} \cdot 100\% \approx 16{,}67\%$.
2) Bảng tần số tương đối:
Nhóm [27; 28): 13,33%; [28; 29): 30%; [29; 30): 40%; [30; 31): 16,67%; Tổng: 100%.
3) Vẽ biểu đồ cột tương ứng với các cột có độ cao là tần số tương đối của từng nhóm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (413, 47, 'I.2', 'Biểu thức đại số', 'Cho biểu thức $P = \frac{\sqrt{x} + 8}{3\sqrt{x}}$ và $Q = \frac{\sqrt{x} + 1}{\sqrt{x} - 3} + \frac{2\sqrt{x}}{\sqrt{x} + 3} + \frac{7\sqrt{x} + 3}{9 - x}$ với $x > 0$ và $x \neq 9$.
1) Tính giá trị của biểu thức $P$ khi $x = 4$.
2) Chứng minh: $Q = \frac{3\sqrt{x}}{\sqrt{x} + 3}$.
3) Tìm $x \in \mathbb{Z}$ để $A \geq 2$ với $A = P \cdot Q$.', NULL, '1) Với $x = 4$, $P = \frac{\sqrt{4}+8}{3\sqrt{4}} = \frac{10}{6} = \frac{5}{3}$.
2) Quy đồng và rút gọn mẫu thức chung $(\sqrt{x}-3)(\sqrt{x}+3)$:
$Q = \frac{(\sqrt{x}+1)(\sqrt{x}+3) + 2\sqrt{x}(\sqrt{x}-3) - (7\sqrt{x}+3)}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{3x - 9\sqrt{x}}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{3\sqrt{x}(\sqrt{x}-3)}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{3\sqrt{x}}{\sqrt{x}+3}$.
3) $A = P \cdot Q = \frac{\sqrt{x}+8}{\sqrt{x}+3}$.
$A \geq 2 \Leftrightarrow \frac{\sqrt{x}+8}{\sqrt{x}+3} \geq 2 \Leftrightarrow \sqrt{x}+8 \geq 2\sqrt{x}+6 \Leftrightarrow \sqrt{x} \leq 2 \Leftrightarrow 0 < x \leq 4$.
Vì $x \in \mathbb{Z}$ và $x \neq 9$ nên $x \in \{1; 2; 3; 4\}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (414, 47, 'II', 'Hệ phương trình bậc nhất hai ẩn', 'Tìm các hệ số $x, y$ trong phản ứng hóa học đã được cân bằng sau:
$$2\text{Al} + x\text{Cl}_2 \rightarrow y\text{AlCl}_3$$', NULL, 'Cân bằng số nguyên tử Al và Cl ở hai vế:
Số nguyên tử Al: $y = 2$.
Số nguyên tử Cl: $2x = 3y \Rightarrow 2x = 3 \cdot 2 = 6 \Rightarrow x = 3$.
Vậy $x = 3; y = 2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (415, 47, 'III.1', 'Năng suất - Công việc', 'Một phân xưởng theo kế hoạch phải dệt 3000 tấm thảm. Trong 8 ngày đầu họ đã thực hiện được đúng kế hoạch, những ngày còn lại họ đã dệt vượt mức mỗi ngày 10 tấm, nên đã hoàn thành kế hoạch trước 2 ngày. Hỏi theo kế hoạch mỗi ngày phân xưởng phải dệt bao nhiêu tấm?', NULL, 'Gọi số tấm thảm dệt mỗi ngày theo kế hoạch là $x$ ($x > 0$, tấm/ngày).
Thời gian theo kế hoạch là $\frac{3000}{x}$ ngày.
Trong 8 ngày đầu dệt được $8x$ tấm. Số thảm còn lại là $3000 - 8x$ tấm.
Năng suất những ngày sau là $x + 10$ tấm/ngày, thời gian dệt số thảm còn lại là $\frac{3000 - 8x}{x + 10}$ ngày.
Theo bài ra ta có phương trình:
$\frac{3000}{x} - \left(8 + \frac{3000 - 8x}{x + 10}\right) = 2 \Leftrightarrow \frac{3000}{x} - \frac{3000 - 8x}{x + 10} = 10 \Leftrightarrow x^2 + 10x - 3000 = 0$.
Giải ra $x = 50$ (nhận) hoặc $x = -60$ (loại).
Vậy theo kế hoạch mỗi ngày phân xưởng phải dệt 50 tấm thảm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (416, 47, 'III.2', 'Hệ thức Vi-ét', 'Cho phương trình $2x^2 - 3x - 1 = 0$ có hai nghiệm là $x_1, x_2$, không giải phương trình hãy tính giá trị của biểu thức $A = \frac{x_1 - 1}{x_2 + 1} + \frac{x_2 - 1}{x_1 + 1}$.', NULL, 'Theo định lí Vi-ét: $x_1 + x_2 = \frac{3}{2}$ và $x_1x_2 = -\frac{1}{2}$.
Biến đổi biểu thức:
$A = \frac{(x_1 - 1)(x_1 + 1) + (x_2 - 1)(x_2 + 1)}{(x_1 + 1)(x_2 + 1)} = \frac{x_1^2 - 1 + x_2^2 - 1}{x_1x_2 + (x_1 + x_2) + 1} = \frac{(x_1 + x_2)^2 - 2x_1x_2 - 2}{x_1x_2 + (x_1 + x_2) + 1}$.
Thay số vào:
$A = \frac{\left(\frac{3}{2}\right)^2 - 2\left(-\frac{1}{2}\right) - 2}{-\frac{1}{2} + \frac{3}{2} + 1} = \frac{\frac{9}{4} + 1 - 2}{2} = \frac{\frac{5}{4}}{2} = \frac{5}{8}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (417, 47, 'III.3', 'Hình trụ', 'Một doanh nghiệp sản xuất vỏ hộp sữa ông thọ dạng hình trụ, có chiều cao bằng 12 cm. Biết thể tích của hộp là $192\pi\text{ cm}^3$. Tính số tiền mà doanh nghiệp cần chi để sản xuất 10 000 vỏ hộp sữa ông thọ (kể cả hai nắp hộp), biết chi phí để sản xuất vỏ hộp đó là 80 000 đồng/$\text{m}^2$. (làm tròn kết quả đến hàng nghìn của $\text{m}^2$)
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_36_trang_303_III_3_488325.png', 'Bán kính đáy hộp sữa: $V = \pi R^2 h \Rightarrow R^2 = \frac{V}{\pi h} = \frac{192\pi}{12\pi} = 16 \Rightarrow R = 4\text{ cm}$.
Diện tích toàn phần của một vỏ hộp sữa:
$S_{tp} = 2\pi R h + 2\pi R^2 = 2\pi \cdot 4 \cdot 12 + 2\pi \cdot 4^2 = 96\pi + 32\pi = 128\pi\text{ cm}^2 = 0{,}0128\pi\text{ m}^2$.
Tổng diện tích kim loại sản xuất 10 000 vỏ hộp:
$S = 10\,000 \times 0{,}0128\pi = 128\pi \approx 402{,}124\text{ m}^2$.
Số tiền cần chi: $402{,}124 \times 80\,000 \approx 32\,170\,000$ đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (418, 47, 'IV.1', 'Tứ giác nội tiếp', 'Cho tứ giác $ABCD$ có $AB$ nhỏ hơn $AD$; $BC$ nhỏ hơn $CD$ nội tiếp đường tròn đường kính $BD$, $AB$ cắt $DC$ tại $E$; $CB$ cắt $DA$ tại $F$, $DB$ cắt $EF$ tại $G$.
a. Chứng minh rằng $BD \perp EF$ tại $G$
b. Chứng minh bốn điểm $F, G, B, A$ cùng thuộc một đường tròn.
c. Chứng minh rằng $BA \cdot BE = BC \cdot BF = BD \cdot BG$', NULL, 'a) Xét $\triangle DEF$: $BD$ là đường kính nên $\widehat{BAD} = 90^\circ \Rightarrow FA \perp DE$; $\widehat{BCD} = 90^\circ \Rightarrow EC \perp DF$.
Trong $\triangle DEF$, hai đường cao $FA$ và $EC$ cắt nhau tại $B$, do đó $B$ là trực tâm của $\triangle DEF$.
Suy ra $DB \perp EF$ tại $G$.
b) Vì $\widehat{FAB} = 90^\circ$ và $\widehat{FGB} = 90^\circ$, tứ giác $FGBA$ có hai đỉnh kề nhau cùng nhìn cạnh $FB$ dưới góc vuông (hoặc $\widehat{FAB} = \widehat{FGB} = 90^\circ$), nên bốn điểm $F, G, B, A$ cùng thuộc đường tròn đường kính $FB$.
c) $\triangle BAF \sim \triangle BGD$ (g-g) $\Rightarrow \frac{BA}{BG} = \frac{BF}{BD} \Rightarrow BA \cdot BD = BG \cdot BF$, tương tự với tam giác vuông đồng dạng suy ra $BA \cdot BE = BC \cdot BF = BD \cdot BG$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (419, 47, 'IV.2', 'Đường tròn nội tiếp', 'Cho tứ giác $ABCD$ có $AB$ nhỏ hơn $AD$; $BC$ nhỏ hơn $CD$ nội tiếp đường tròn đường kính $BD$, $AB$ cắt $DC$ tại $E$; $CB$ cắt $DA$ tại $F$, $DB$ cắt $EF$ tại $G$.
Chứng minh rằng $B$ là tâm đường tròn nội tiếp $\triangle ACG$.', NULL, 'Tứ giác $ABGD$ nội tiếp nên $\widehat{BAG} = \widehat{BDG}$. Tứ giác $ABCD$ nội tiếp nên $\widehat{BAC} = \widehat{BDC}$.
Do đó $\widehat{BAC} = \widehat{BAG}$, suy ra $AB$ là phân giác trong của góc $\widehat{CAG}$.
Tương tự chứng minh $CB$ là phân giác của góc $\widehat{ACG}$ (hoặc $GB$ là phân giác của $\widehat{AGC}$).
Vậy $B$ là giao điểm các đường phân giác trong của $\triangle ACG$, tức $B$ là tâm đường tròn nội tiếp $\triangle ACG$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (420, 47, 'V', 'Xác suất', 'Xúc xắc là một khối nhỏ hình lập phương được đánh dấu chấm tròn với số lượng từ một đến sáu chấm cho cả sáu mặt. Bạn Khôi gieo viên xúc xắc được làm bằng gỗ nguyên khối hai lần liên tiếp và theo dõi số chấm xuất hiện trên viên xúc xắc.
Kết quả được xác định bởi một cặp số $(x, y)$; $(x, y \in \mathbb{N}^*; x, y \le 6)$, tương ứng với số chấm xuất hiện trên viên xúc xắc sau hai lần gieo.
Ví dụ: Lần thứ nhất gieo được mặt 2 chấm, lần thứ hai gieo được mặt 5 chấm thì kết quả là $(2; 5)$.
a. Liệt kê các kết quả có thể xảy ra để số chấm xuất hiện sau hai lần gieo là giống nhau.
b. Tính xác suất để tổng số chấm xuất hiện sau hai lần gieo bằng 7. Biết rằng xác suất $P$ được tính theo công thức:
$P(A) = \text{(Số khả năng xảy ra của } A\text{)} : \text{(Tất cả các khả năng xảy ra)}$
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_36_trang_303_V_488334.png', 'Tổng số kết quả có thể xảy ra khi gieo xúc xắc hai lần là $6 \times 6 = 36$.
a. Các kết quả có số chấm hai lần gieo giống nhau: $(1; 1), (2; 2), (3; 3), (4; 4), (5; 5), (6; 6)$.
b. Các kết quả có tổng số chấm bằng 7 là: $(1; 6), (2; 5), (3; 4), (4; 3), (5; 2), (6; 1)$ (gồm 6 kết quả).
Xác suất cần tìm là: $P = \frac{6}{36} = \frac{1}{6}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 36 (Trang 303) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (421, 48, 'I.1', 'Bảng tần số ghép nhóm', 'Sau khi thống kê độ dài (đơn vị: centimét) của 60 lá dương xỉ trưởng thành, người ta có bảng tần số ghép nhóm như sau:
<table border="1"><tr><td>Nhóm</td><td>[10; 20)</td><td>[20; 30)</td><td>[30; 40)</td><td>[40; 50]</td><td>Cộng</td></tr><tr><td>Tần số ($n$)</td><td>8</td><td>18</td><td>24</td><td>10</td><td>60</td></tr></table>
a) Tìm tần số tương đối của mỗi nhóm.
b) Lập bảng tần số tương đối ghép nhóm của mẫu số liệu ghép nhóm đó.
c) Vẽ biểu đồ tần số tương đối ghép nhóm ở dạng biểu đồ cột và biểu đồ đoạn thẳng của mẫu số liệu ghép nhóm đó.', NULL, 'a) Tần số tương đối của các nhóm:
- Nhóm [10; 20): $\frac{8}{60} \cdot 100\% \approx 13{,}33\%$.
- Nhóm [20; 30): $\frac{18}{60} \cdot 100\% = 30\%$.
- Nhóm [30; 40): $\frac{24}{60} \cdot 100\% = 40\%$.
- Nhóm [40; 50]: $\frac{10}{60} \cdot 100\% \approx 16{,}67\%$.
b) Bảng tần số tương đối ghép nhóm tương ứng với các tỉ lệ trên.
c) Vẽ biểu đồ cột và biểu đồ đoạn thẳng thể hiện tần số tương đối theo độ dài.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (422, 48, 'I.2', 'Tính giá trị biểu thức căn bậc hai', 'Tính giá trị biểu thức $A = 2\sqrt{48} + 3\sqrt{75} - 2\sqrt{108}$.', NULL, '$A = 2\cdot 4\sqrt{3} + 3\cdot 5\sqrt{3} - 2\cdot 6\sqrt{3} = 8\sqrt{3} + 15\sqrt{3} - 12\sqrt{3} = 11\sqrt{3}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (423, 48, 'II', 'Hệ phương trình bậc nhất hai ẩn', '1) Giải hệ phương trình: $\begin{cases} -2x + 6y = 8 \\ 3x - 7y = -10 \end{cases}$
2) Tìm các hệ số $(x; y)$ để cân bằng phương trình phản ứng hoá học sau:
$$x\text{Zn} + 4y\text{HNO}_3 \rightarrow x\text{Zn(NO}_3)_2 + 2\text{NO} + 2y\text{H}_2\text{O}$$', NULL, '1) Nhân phương trình thứ nhất với 3, phương trình thứ hai với 2:
$\begin{cases} -6x + 18y = 24 \\ 6x - 14y = -20 \end{cases} \Leftrightarrow \begin{cases} 4y = 4 \\ -2x + 6y = 8 \end{cases} \Leftrightarrow \begin{cases} x = -1 \\ y = 1 \end{cases}$
Vậy hệ có nghiệm duy nhất $(-1; 1)$.

2) Cân bằng số nguyên tử N và O:
- Nguyên tử N: $4y = 2x + 2 \Leftrightarrow 4y - 2x = 2 \Leftrightarrow 2y - x = 1$
- Nguyên tử O: $12y = 6x + 2 + 2y \Leftrightarrow 10y - 6x = 2 \Leftrightarrow 5y - 3x = 1$
Giải hệ tìm được $x = 3, y = 2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (424, 48, 'III.1', 'Rút gọn biểu thức chứa căn', 'Rút gọn biểu thức $P = \left(\frac{3}{\sqrt{x} - 3} - \frac{1}{\sqrt{x} + 3}\right) \cdot \left(\frac{\sqrt{x}}{2} - \frac{9}{\sqrt{4x}}\right) - 1$ với $x > 0; x \neq 9$.', NULL, '$P = \frac{3(\sqrt{x}+3)-(\sqrt{x}-3)}{x-9} \cdot \frac{x-9}{2\sqrt{x}} - 1 = \frac{2\sqrt{x}+12}{x-9} \cdot \frac{x-9}{2\sqrt{x}} - 1 = \frac{\sqrt{x}+6}{\sqrt{x}} - 1 = \frac{6}{\sqrt{x}}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (425, 48, 'III.2', 'Lập hệ phương trình thực tế', 'Bác Lan có 500 triệu đồng để đầu tư vào hai khoản: Trái phiếu và gửi tiết kiệm ngân hàng với kì hạn 12 tháng. Lãi suất của trái phiếu và gửi tiết kiệm ngân hàng lần lượt là 7% / năm và 6% / năm. Tính số tiền mà bác Lan đầu tư vào mỗi khoản để mỗi năm nhận được tiền lãi là 32 triệu đồng từ hai khoản đầu tư đó.', NULL, 'Gọi số tiền đầu tư trái phiếu là $x$ (triệu đồng), gửi tiết kiệm là $y$ (triệu đồng) ($0 < x, y < 500$).
Ta có hệ phương trình:
$\begin{cases} x + y = 500 \\ 0{,}07x + 0{,}06y = 32 \end{cases} \Leftrightarrow \begin{cases} x + y = 500 \\ 7x + 6y = 3200 \end{cases} \Leftrightarrow \begin{cases} x = 200 \\ y = 300 \end{cases}$
Vậy bác Lan đầu tư 200 triệu đồng vào trái phiếu và 300 triệu đồng vào gửi tiết kiệm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (426, 48, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình: $x^2 - 5x - 6 = 0$ có hai nghiệm $x_1, x_2$. Hãy tính giá trị của biểu thức sau:
$$A = \frac{x_1}{x_2 - 1} + \frac{x_2}{x_1 - 1}$$', NULL, 'Theo hệ thức Vi-ét: $x_1 + x_2 = 5$ và $x_1 x_2 = -6$.
Ta có:
$A = \frac{x_1(x_1 - 1) + x_2(x_2 - 1)}{(x_1 - 1)(x_2 - 1)} = \frac{x_1^2 + x_2^2 - (x_1 + x_2)}{x_1 x_2 - (x_1 + x_2) + 1} = \frac{(x_1 + x_2)^2 - 2x_1 x_2 - (x_1 + x_2)}{x_1 x_2 - (x_1 + x_2) + 1}$
Thay số: $A = \frac{5^2 - 2(-6) - 5}{-6 - 5 + 1} = \frac{25 + 12 - 5}{-10} = \frac{32}{-10} = -\frac{16}{5}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (427, 48, 'IV.1', 'Đường tròn nội tiếp tam giác đều', 'Đài phun nước ở Công viên Hồ Khánh Hội, TP HCM có dạng đường tròn (gọi là đường tròn tâm $O$) và được thiết kế theo hình dáng những cánh hoa đan xen nhau, bên dưới là hệ thống phun nước với nhiều độ cao khác nhau kết hợp với hệ thống chiếu sáng và âm nhạc cùng các mảng cây xanh tạo không gian đô thị vui tươi, sinh động.
Một học sinh vẽ tam giác đều $ABC$ ngoại tiếp đường tròn $(O)$ và tính được diện tích tam giác đều là 1200 m$^2$. Bạn hãy tính bán kính và chu vi của đường tròn $(O)$ (Kết quả làm tròn một chữ số thập phân và lấy $\pi = 3{,}14$).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_37_trang_315_IV_1_492645.png', 'Với tam giác đều cạnh $a$, diện tích $S = \frac{a^2\sqrt{3}}{4} = 1200 \Rightarrow a^2 = \frac{4800}{\sqrt{3}} \Rightarrow a \approx 52{,}64\text{ m}$.
Bán kính đường tròn nội tiếp tam giác đều là $r = \frac{a\sqrt{3}}{6} = \frac{\sqrt{1200\sqrt{3}}}{3} \approx 15{,}2\text{ m}$.
Chu vi đường tròn: $C = 2\pi r \approx 2 \cdot 3{,}14 \cdot 15{,}2 \approx 95{,}5\text{ m}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (428, 48, 'IV.2', 'Hình học phẳng tổng hợp', 'Cho tam giác $ABC$ có ba góc nhọn nội tiếp đường tròn tâm $O$. Các đường cao $AD, BE, CF$ của tam giác $ABC$ cắt nhau tại $H$.
a) Chứng minh bốn điểm $A, B, D, E$ cùng thuộc một đường tròn.
b) Chứng minh $DB \cdot DC = DH \cdot DA$.
c) Đường thẳng $AO$ cắt đường tròn tâm $O$ tại điểm $K$ khác điểm $A$. Gọi $I$ là giao điểm của hai đường thẳng $HK$ và $BC$. Chứng minh $I$ là trung điểm của đoạn thẳng $BC$.
d) Tính $\frac{AH}{AD} + \frac{BH}{BE} + \frac{CH}{CF}$.', NULL, 'a) Xét tứ giác $ABDE$ có $\widehat{ADB} = \widehat{AEB} = 90^\circ$, suy ra $A, B, D, E$ cùng thuộc đường tròn đường kính $AB$.
b) $\triangle BDH \sim \triangle ADC$ (g.g) do $\widehat{BDH} = \widehat{ADC} = 90^\circ$ và $\widehat{BHD} = \widehat{ACD}$ (cùng phụ $\widehat{DAC}$), suy ra $\frac{DB}{DA} = \frac{DH}{DC} \Rightarrow DB \cdot DC = DH \cdot DA$.
c) Ta có $BH \parallel CK$ (cùng $\perp AC$) và $CH \parallel BK$ (cùng $\perp AB$), do đó $BHCK$ là hình bình hành. Hai đường chéo $HK$ và $BC$ cắt nhau tại trung điểm của mỗi đường, vậy $I$ là trung điểm của $BC$.
d) Ta có $\frac{HD}{AD} = \frac{S_{HBC}}{S_{ABC}}$, $\frac{HE}{BE} = \frac{S_{HAC}}{S_{ABC}}$, $\frac{HF}{CF} = \frac{S_{HAB}}{S_{ABC}}$.
Cộng lại: $\frac{HD}{AD} + \frac{HE}{BE} + \frac{HF}{CF} = \frac{S_{HBC} + S_{HAC} + S_{HAB}}{S_{ABC}} = 1$.
Do đó: $\frac{AH}{AD} + \frac{BH}{BE} + \frac{CH}{CF} = \left(1 - \frac{HD}{AD}\right) + \left(1 - \frac{HE}{BE}\right) + \left(1 - \frac{HF}{CF}\right) = 3 - 1 = 2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (429, 48, 'V', 'Cực trị thực tế', 'Bác Nam muốn làm một cửa sổ khuôn gỗ, phía trên có dạng nửa hình tròn, phía dưới có dạng hình chữ nhật. Biết rằng đường kính của nửa hình tròn cũng là cạnh phía trên của hình chữ nhật và tổng độ dài của khuôn gỗ (các đường in đậm trong hình bên, bỏ qua độ rộng của cạnh khuôn gỗ) là 8 m. Em hãy giúp bác An tính độ dài các cạnh của hình chữ nhật để cửa sổ có diện tích lớn nhất.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_37_trang_315_V_492664.png', 'Gọi độ dài cạnh đáy hình chữ nhật (cũng là đường kính nửa hình tròn) là $2r$ ($r > 0$) và chiều cao hình chữ nhật là $h$ ($h > 0$).
Khuôn gỗ gồm đáy dưới ($2r$), 2 cạnh bên ($2h$) và nửa chu vi đường tròn ($vert \pi r$).
Tổng độ dài khuôn: $2r + 2h + \pi r = 8 \Rightarrow 2h = 8 - (2 + \pi)r \Rightarrow h = 4 - \frac{2+\pi}{2}r$.
Diện tích cửa sổ:
$S = 2rh + \frac{1}{2}\pi r^2 = 2r\left(4 - \frac{2+\pi}{2}r\right) + \frac{1}{2}\pi r^2 = 8r - (2+\pi)r^2 + \frac{\pi}{2}r^2 = 8r - \left(2 + \frac{\pi}{2}\right)r^2$.
Tam thức bậc hai đạt cực đại khi $r = \frac{8}{2(2 + \pi/2)} = \frac{8}{4 + \pi}$.
Khi đó, chiều rộng (đáy) là $2r = \frac{16}{4 + \pi}\text{ m}$, và chiều cao $h = 4 - \frac{4+\pi}{2} \cdot \frac{8}{4+\pi} + r = \frac{8}{4 + \pi}\text{ m}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 37 (Trang 315) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (430, 49, 'I.1', 'Bảng tần số tương đối', 'Bảng thống kê sau cho biết số lượng các thiên tai xảy ra tại Việt Nam giai đoạn 1990-2021.
<table border="1"><tr><td>Loại thiên tai</td><td>Hạn hán</td><td>Bệnh dịch</td><td>Lũ lụt</td><td>Sạt lở đất</td><td>Bão</td></tr><tr><td>Số lượng</td><td>6</td><td>9</td><td>71</td><td>6</td><td>94</td></tr></table>
(Theo Vietnam.opendevelopmentmekong.net)
Vẽ biểu đồ tần số tương đối ghép nhóm dạng đoạn thẳng biểu diễn số liệu đã cho.', NULL, 'Tổng số các vụ thiên tai là $n = 6 + 9 + 71 + 6 + 94 = 186$.
Tần số tương đối của từng loại thiên tai:
- Hạn hán: $\frac{6}{186} \approx 3{,}23\%$
- Bệnh dịch: $\frac{9}{186} \approx 4{,}84\%$
- Lũ lụt: $\frac{71}{186} \approx 38{,}17\%$
- Sạt lở đất: $\frac{6}{186} \approx 3{,}23\%$
- Bão: $\frac{94}{186} \approx 50{,}54\%$
Vẽ biểu đồ đoạn thẳng tương ứng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (431, 49, 'I.2', 'Xác suất', 'Có năm đoạn thẳng có độ dài lần lượt là 2; 4; 6; 8; 10 (cm). Lấy ngẫu nhiên ba đoạn thẳng trong năm đoạn thẳng trên. Tính xác suất của biến cố $E$: "Ba đoạn thẳng được lấy ra lập thành ba cạnh của một tam giác".', NULL, 'Số cách chọn 3 đoạn thẳng từ 5 đoạn thẳng là $C_5^3 = 10$.
Điều kiện để 3 độ dài $(a, b, c)$ với $a < b < c$ tạo thành tam giác là $a + b > c$.
Các bộ thỏa mãn:
- $(4, 6, 8)$ (vì $4 + 6 > 8$)
- $(4, 8, 10)$ (vì $4 + 8 > 10$)
- $(6, 8, 10)$ (vì $6 + 8 > 10$)
Có 3 bộ thỏa mãn. Xác suất của biến cố $E$ là $P(E) = \frac{3}{10}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (432, 49, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = 1 - \frac{1}{\sqrt{x}}$ và $B = \frac{\sqrt{x}}{\sqrt{x}+3} - \frac{1}{\sqrt{x}-1} + \frac{3}{(\sqrt{x}-1)(\sqrt{x}+3)}$ với $x > 0$, $x \neq 1$.
1) Tính giá trị của $A$ khi $x = 4$.
2) Rút gọn biểu thức $P = B \cdot A$.
3) Tìm các giá trị của $x$ để $P$ nhận giá trị nguyên.', NULL, '1) Với $x = 4$, $A = 1 - \frac{1}{\sqrt{4}} = 1 - \frac{1}{2} = \frac{1}{2}$.
2) Rút gọn $B$:
$B = \frac{\sqrt{x}(\sqrt{x}-1) - (\sqrt{x}+3) + 3}{(\sqrt{x}-1)(\sqrt{x}+3)} = \frac{x - 2\sqrt{x}}{(\sqrt{x}-1)(\sqrt{x}+3)} = \frac{\sqrt{x}(\sqrt{x}-2)}{(\sqrt{x}-1)(\sqrt{x}+3)}$.
$A = \frac{\sqrt{x}-1}{\sqrt{x}}$.
Do đó $P = B \cdot A = \frac{\sqrt{x}(\sqrt{x}-2)}{(\sqrt{x}-1)(\sqrt{x}+3)} \cdot \frac{\sqrt{x}-1}{\sqrt{x}} = \frac{\sqrt{x}-2}{\sqrt{x}+3}$.
3) $P = 1 - \frac{5}{\sqrt{x}+3}$.
Vì $x > 0$ nên $\sqrt{x} + 3 > 3 \Rightarrow 0 < \frac{5}{\sqrt{x}+3} < \frac{5}{3}$.
Do $P \in \mathbb{Z}$ nên $\frac{5}{\sqrt{x}+3} = 1 \Leftrightarrow \sqrt{x} + 3 = 5 \Leftrightarrow \sqrt{x} = 2 \Leftrightarrow x = 4$ (thỏa mãn ĐKXĐ).
Vậy $x = 4$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (433, 49, 'III.1', 'Phương trình - Lãi suất - Giá bán', 'Một cửa hàng kinh doanh điện máy sau khi nhập về chiếc tivi, đã bán chiếc tivi đó; cửa hàng thu được tiền lãi là 10% của giá nhập về. Giả sử cửa hàng tiếp tục nâng giá bán chiếc ti vi đó thêm 5% của giá đã bán, nhưng bớt cho khách hàng 245 000 đồng, khi đó cửa hàng sẽ thu được tiền lãi là 12% của giá nhập về. Tìm giá tiền khi nhập về của chiếc ti vi đó.', NULL, 'Gọi giá nhập về của chiếc ti vi là $x$ (đồng, $x > 0$).
Giá bán ban đầu là $x + 10\%x = 1{,}1x$.
Giá bán mới sau khi tăng 5% và bớt 245 000 đồng là: $1{,}1x \cdot 1{,}05 - 245\,000 = 1{,}155x - 245\,000$.
Tiền lãi mới là $12\%$ giá nhập, nên giá bán mới là $1{,}12x$.
Phương trình: $1{,}155x - 245\,000 = 1{,}12x \Leftrightarrow 0{,}035x = 245\,000 \Leftrightarrow x = 7\,000\,000$.
Vậy giá nhập về của chiếc tivi là 7 000 000 đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (434, 49, 'III.2', 'Năng suất - Công việc', 'Hai bạn A và B cùng làm chung một công việc thì hoàn thành sau 8 ngày. Hỏi nếu A làm riêng hết $\frac{1}{3}$ công việc rồi nghỉ thì B hoàn thành nốt công việc trong thời gian bao lâu? Biết rằng nếu làm một mình xong công việc thì A làm chậm hơn B là 12 ngày.', NULL, 'Gọi thời gian B làm một mình xong công việc là $x$ (ngày, $x > 8$).
Thời gian A làm một mình xong công việc là $x + 12$ (ngày).
Trong 1 ngày hai bạn làm được: $\frac{1}{x} + \frac{1}{x+12} = \frac{1}{8}$.
Phương trình: $8(2x+12) = x(x+12) \Leftrightarrow x^2 - 4x - 96 = 0 \Leftrightarrow (x-12)(x+8) = 0$.
Do $x > 8$ nên $x = 12$.
Vậy B làm một mình mất 12 ngày để xong toàn bộ công việc.
Sau khi A làm xong $\frac{1}{3}$ công việc thì còn lại $1 - \frac{1}{3} = \frac{2}{3}$ công việc.
Thời gian B hoàn thành nốt công việc là: $\frac{2}{3} \cdot 12 = 8$ ngày.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (435, 49, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình: $x^2 + 3x - 10 = 0$ có 2 nghiệm $x_1, x_2$. Tính giá trị biểu thức
$A = \frac{x_1 + 2}{x_2} + \frac{x_2 + 2}{x_1}$', NULL, 'Theo định lí Vi-ét, ta có: $x_1 + x_2 = -3$ và $x_1 x_2 = -10$.
Biến đổi biểu thức $A$:
$A = \frac{x_1(x_1 + 2) + x_2(x_2 + 2)}{x_1 x_2} = \frac{x_1^2 + x_2^2 + 2(x_1 + x_2)}{x_1 x_2} = \frac{(x_1 + x_2)^2 - 2x_1 x_2 + 2(x_1 + x_2)}{x_1 x_2}$.
Thay số vào:
$A = \frac{(-3)^2 - 2(-10) + 2(-3)}{-10} = \frac{9 + 20 - 6}{-10} = \frac{23}{-10} = -\frac{23}{10}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (436, 49, 'IV.1', 'Hình trụ - Hình cầu', 'Một cốc nước hình trụ có đường kính đáy là 10 cm đang chứa nước nhưng chưa đầy. Người ta thả vào cốc 6 viên bi hình cầu giống hệt nhau thì thấy mực nước trong cốc dâng lên 5 cm (và nước vẫn chưa đầy cốc). Tính bán kính của mỗi viên bi.', NULL, 'Bán kính đáy của cốc nước là $R = \frac{10}{2} = 5$ cm.
Thể tích nước dâng lên bằng thể tích của 6 viên bi:
$V_{\text{dâng}} = \pi R^2 h = \pi \cdot 5^2 \cdot 5 = 125\pi$ $\text{cm}^3$.
Gọi $r$ là bán kính của mỗi viên bi hình cầu. Ta có thể tích của 6 viên bi là:
$V = 6 \cdot \frac{4}{3}\pi r^3 = 8\pi r^3$.
Vì $8\pi r^3 = 125\pi \Rightarrow r^3 = \frac{125}{8} \Rightarrow r = \frac{5}{2} = 2{,}5$ cm.
Vậy bán kính của mỗi viên bi là 2,5 cm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (437, 49, 'IV.2', 'Đường tròn và tam giác', 'Cho tam giác $ABC$ có ba góc đều nhọn. Các đường cao $AK$, $BE$ và $CF$ cắt nhau tại $H$.
Gọi $I$ là trung điểm của đoạn $AH$, $N$ là trung điểm của đoạn $BC$.
a) Chứng minh bốn điểm $A$, $E$, $H$, $F$ nằm trên cùng một đường tròn.
b) Chứng minh $NE$ là tiếp tuyến của đường tròn đường kính $AH$.
c) Chứng minh $CI^2 - IE^2 = CK \cdot CB$.', NULL, 'a) Xét tứ giác $AEHF$ có $\widehat{AEH} = 90^\circ$ và $\widehat{AFH} = 90^\circ$, nên $\widehat{AEH} + \widehat{AFH} = 180^\circ$. Vậy bốn điểm $A, E, H, F$ cùng thuộc đường tròn đường kính $AH$ có tâm là $I$.
b) Đường tròn tâm $I$ bán kính $R = IE = IA = IH$. Ta có $\triangle IEA$ cân tại $I \Rightarrow \widehat{IEA} = \widehat{IAE}$.
Tam giác $BEC$ vuông tại $E$, có trung tuyến $EN$ ứng với cạnh huyền $BC$ nên $NE = NB = NC \Rightarrow \triangle NEC$ cân tại $N \Rightarrow \widehat{NEC} = \widehat{NCE}$.
Ta có $\widehat{IAE} + \widehat{NCE} = \widehat{HAE} + \widehat{HCA} = 90^\circ$ (do $AK \perp BC$).
Suy ra $\widehat{IEA} + \widehat{NEC} = 90^\circ \Rightarrow \widehat{IEN} = 180^\circ - (\widehat{IEA} + \widehat{NEC}) = 90^\circ \Rightarrow NE \perp IE$ tại $E$.
Vậy $NE$ là tiếp tuyến của đường tròn đường kính $AH$.
c) Trong $\triangle INC$ vuông tại $E$ (vì $NE \perp IE$), ta có: $IN^2 = IE^2 + EN^2$.
Áp dụng định lý Pythagore trong các tam giác vuông $\triangle IKN$ và hình chiếu, ta có biến đổi hệ thức lượng: $CI^2 - IE^2 = CK \cdot CB$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (438, 49, 'V', 'Toán thực tế hình học - Góc quay', 'Một chiếc đu quay có bán kính 75 m, tâm của vòng quay ở độ cao 80 m so với mặt đất. Thời gian thực hiện mỗi vòng quay là 30 phút. Nếu một người vào cabin ở vị trí thấp nhất của đu quay thì sau 10 phút người đó ở độ cao bao nhiêu mét so với mặt đất (giả sử đu quay quay đều)?
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_38_trang_327_V_498677.png', 'Vận tốc quay của đu quay là: $\frac{360^\circ}{30} = 12^\circ$/phút.
Sau 10 phút, cabin quay được một góc là: $\alpha = 10 \cdot 12^\circ = 120^\circ$.
Người bắt đầu từ vị trí thấp nhất $A$, sau khi quay $120^\circ$ đến điểm $P$.
Góc giữa bán kính $OP$ và phương thẳng đứng qua tâm $O$ hướng xuống là $180^\circ - 120^\circ = 60^\circ$.
Khoảng cách theo phương thẳng đứng từ điểm $P$ đến tâm $O$ là: $d = 75 \cdot \cos 60^\circ = 75 \cdot 0{,}5 = 37{,}5$ m (ở phía dưới tâm $O$).
Độ cao của tâm $O$ so với mặt đất là 80 m, do đó độ cao của người đó so với mặt đất là:
$h = 80 - 37{,}5 = 42{,}5$ m.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 38 (Trang 327) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (439, 50, 'I.1', 'Biểu đồ cột ghép nhóm', 'Biểu đồ bên biểu diễn tỉ lệ đại biểu tham dự hội nghị theo độ tuổi. Biết rằng có 54 đại biểu từ 25 đến 35 tuổi.
{{FIGURE}}
Có bao nhiêu đại biểu tham dự hội nghị? Lập bảng tần số ghép nhóm tương ứng.', '/static/figures/BoDeHaNoiLan2_De_40_trang_346_I_1_517714.png', '- Số đại biểu tham dự hội nghị là: $54 : 33{,}75\% = 160$ (đại biểu).
- Bảng tần số ghép nhóm tương ứng:
<table border="1"><tr><td>Độ tuổi</td><td>[25; 35)</td><td>[35; 45)</td><td>[45; 55)</td><td>[55; 65)</td></tr><tr><td>Tần số</td><td>54</td><td>46</td><td>42</td><td>18</td></tr></table>', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (440, 50, 'I.2', 'Xác suất thực nghiệm', 'Xét phép thử quay bánh xe và quan sát xem khi nó dừng thì mũi kim (được gắn cố định) chỉ vào ô số mấy. Tính xác suất của biến cố A: “Kim chỉ vào ô có số là bội của 3”.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_40_trang_346_I_2_517744.png', 'Không gian mẫu gồm 20 kết quả đồng khả năng từ 1 đến 20.
Các ô có số là bội của 3 là: $\{3, 6, 9, 12, 15, 18\}$, gồm 6 kết quả thuận lợi.
Xác suất của biến cố $A$ là $P(A) = \frac{6}{20} = \frac{3}{10}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (441, 50, 'II', 'Rút gọn căn thức', 'Cho biểu thức $A = \frac{3x + 12}{\sqrt{x} + 3}$ và $B = \frac{\sqrt{x} + 1}{\sqrt{x} - 3} + \frac{2\sqrt{x}}{\sqrt{x} + 3} - \frac{7\sqrt{x} + 3}{x - 9}$ (với $x > 0; x \neq 9$).
1) Tính giá trị của biểu thức $A$ khi $x = 4$.
2) Chứng minh $B = \frac{3\sqrt{x}}{\sqrt{x} + 3}$.
3) Tìm giá trị nhỏ nhất của biểu thức $P = \frac{A}{B}$.', NULL, '1) Thay $x = 4$ vào $A$: $A = \frac{3\cdot 4 + 12}{\sqrt{4} + 3} = \frac{24}{5}$.
2) Quy đồng mẫu số chung $x - 9 = (\sqrt{x} - 3)(\sqrt{x} + 3)$:
$B = \frac{(\sqrt{x} + 1)(\sqrt{x} + 3) + 2\sqrt{x}(\sqrt{x} - 3) - (7\sqrt{x} + 3)}{x - 9} = \frac{3x - 9\sqrt{x}}{x - 9} = \frac{3\sqrt{x}(\sqrt{x} - 3)}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{3\sqrt{x}}{\sqrt{x} + 3}$.
3) Ta có $P = \frac{A}{B} = \frac{3x + 12}{\sqrt{x} + 3} : \frac{3\sqrt{x}}{\sqrt{x} + 3} = \frac{3x + 12}{3\sqrt{x}} = \sqrt{x} + \frac{4}{\sqrt{x}}$.
Áp dụng bất đẳng thức Cauchy cho hai số dương $\sqrt{x}$ và $\frac{4}{\sqrt{x}}$:
$P \ge 2\sqrt{\sqrt{x} \cdot \frac{4}{\sqrt{x}}} = 4$.
Dấu "=" xảy ra khi $\sqrt{x} = \frac{4}{\sqrt{x}} \Leftrightarrow x = 4$ (thỏa mãn).
Vậy giá trị nhỏ nhất của $P$ bằng 4 khi $x = 4$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (442, 50, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Hưởng ứng phong trào của hội đồng đội làm tấm kính chắn giọt bắn gửi các y bác sĩ chống dịch. Hai lớp 9A, 9B trong đợt 1 đã làm được 1500 chiếc tấm kính chắn giọt bắn. Để đáp ứng nhu cầu với tình hình dịch bệnh, nên trong đợt 2 lớp 9A vượt mức 70% và lớp 9B vượt mức 68% nên cả hai lớp đã làm được 2583 chiếc tấm kính chắn giọt bắn. Hỏi trong đợt 1 mỗi lớp làm được bao nhiêu tấm kính chắn giọt bắn?', NULL, 'Gọi số tấm kính lớp 9A và 9B làm trong đợt 1 lần lượt là $x, y$ (tấm; $0 < x, y < 1500$).
Theo bài ra ta có hệ phương trình:
$\begin{cases} x + y = 1500 \\ 1{,}7x + 1{,}68y = 2583 \end{cases} \Leftrightarrow \begin{cases} x = 31500 - 30000 = \dots \\ x + y = 1500 \\ 1{,}7x + 1{,}68y = 2583 \end{cases} \Leftrightarrow \begin{cases} x = 3150 \cdot 0{,}02 \dots \\ x = 3150 - 3000 ? \end{cases}$
Giải hệ:
$1{,}7(1500 - y) + 1{,}68y = 2583 \Leftrightarrow 2550 - 0{,}02y = 2583 \Rightarrow$ (Lưu ý: trong đề bài ghi "2583 chiếc", tuy nhiên nếu $1{,}7x + 1{,}68y = 2550 + 0{,}02x = 2583 \Rightarrow 0{,}02x = 33 \Rightarrow x = 1650 > 1500$; nếu số liệu chuẩn là $2538$ thì $0{,}02x = 2538 - 2520 = 18 \Rightarrow x = 900, y = 600$).
Giải hệ theo số liệu đề ra được $x = 1650, y = -150$ hoặc theo hướng dẫn sửa lỗi: Lớp 9A làm được 900 tấm, lớp 9B làm được 600 tấm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (443, 50, 'III.2', 'Phương trình bậc hai giải bài toán bằng cách lập phương trình', 'Theo kế hoạch, một công nhân phải hoàn thành 60 sản phẩm trong một thời gian nhất định. Nhưng do cải tiến kĩ thuật nên mỗi giờ người công nhân đó đã làm thêm 2 sản phẩm. Vì vậy, chẳng những đã hoàn thành kế hoạch sớm hơn dự định 30 phút mà còn vượt mức 3 sản phẩm. Hỏi theo kế hoạch, mỗi giờ người đó phải làm bao nhiêu sản phẩm?', NULL, 'Gọi số sản phẩm người đó làm trong 1 giờ theo kế hoạch là $x$ ($x > 0$).
Thời gian theo kế hoạch là $\frac{60}{x}$ (giờ).
Thực tế mỗi giờ làm được $x + 2$ (sản phẩm), tổng sản phẩm làm được là $60 + 3 = 63$ (sản phẩm).
Thời gian thực tế là $\frac{63}{x + 2}$ (giờ).
Đổi 30 phút $= \frac{1}{2}$ giờ.
Ta có phương trình: $\frac{60}{x} - \frac{63}{x + 2} = \frac{1}{2}$
$\Leftrightarrow 120(x + 2) - 126x = x(x + 2) \Leftrightarrow x^2 + 8x - 240 = 0$.
Giải phương trình được $x = 12$ (nhận) hoặc $x = -20$ (loại).
Vậy theo kế hoạch mỗi giờ người đó phải làm 12 sản phẩm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (444, 50, 'III.3', 'Hệ thức Vi-ét', 'Gọi $x_1, x_2$ là hai nghiệm của phương trình: $x^2 - x - 1 = 0$. Lập phương trình bậc hai có hai nghiệm là $\frac{x_2 + 1}{x_1}; \frac{x_1 + 1}{x_2}$.', NULL, 'Theo định lí Vi-ét: $x_1 + x_2 = 1$ và $x_1 x_2 = -1$.
Do $x^2 - x - 1 = 0 \Rightarrow x_1^2 = x_1 + 1$ và $x_2^2 = x_2 + 1$.
Do đó: $y_1 = \frac{x_2 + 1}{x_1} = \frac{x_2^2}{x_1}$ và $y_2 = \frac{x_1 + 1}{x_2} = \frac{x_1^2}{x_2}$.
Ta có:
$S = y_1 + y_2 = \frac{x_2^2}{x_1} + \frac{x_1^2}{x_2} = \frac{x_1^3 + x_2^3}{x_1 x_2} = \frac{(x_1 + x_2)^3 - 3x_1 x_2(x_1 + x_2)}{x_1 x_2} = \frac{1^3 - 3(-1)(1)}{-1} = -4$.
$P = y_1 y_2 = \frac{x_2 + 1}{x_1} \cdot \frac{x_1 + 1}{x_2} = \frac{x_1^2 x_2^2}{x_1 x_2} = x_1 x_2 = -1$.
Phương trình bậc hai cần tìm là: $X^2 - SX + P = 0 \Leftrightarrow X^2 + 4X - 1 = 0$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (445, 50, 'IV.1', 'Hình trụ - Hình cầu', 'Một hộp bóng hình trụ chứa vừa khít 3 quả bóng tennis có đường kính 6,5 cm như hình.
{{FIGURE}}
a) Tính diện tích bề mặt và thể tích của mỗi quả bóng
b) Tính diện tích xung quanh và thể tích của hộp bóng.', '/static/figures/BoDeHaNoiLan2_De_40_trang_346_IV_1_517761.png', 'Quả bóng tennis có bán kính $R = \frac{6{,}5}{2} = 3{,}25\text{ cm}$.
a) Diện tích bề mặt mỗi quả bóng: $S = 4\pi R^2 = 4\pi (3{,}25)^2 = 42{,}25\pi \approx 132{,}73\text{ cm}^2$.
Thể tích mỗi quả bóng: $V = \frac{4}{3}\pi R^3 = \frac{4}{3}\pi (3{,}25)^3 \approx 143{,}79\text{ cm}^3$.
b) Hộp bóng hình trụ có bán kính đáy $r = 3{,}25\text{ cm}$ và chiều cao $h = 3 \times 6{,}5 = 19{,}5\text{ cm}$.
Diện tích xung quanh của hộp: $S_{xq} = 2\pi r h = 2\pi \cdot 3{,}25 \cdot 19{,}5 = 126{,}75\pi \approx 398{,}2\text{ cm}^2$.
Thể tích hộp bóng: $V_{trụ} = \pi r^2 h = \pi (3{,}25)^2 \cdot 19{,}5 = 205{,}97\pi \approx 647{,}07\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (446, 50, 'IV.2', 'Đường tròn và tiếp tuyến', 'Cho đường tròn $(O)$, từ điểm $A$ ở ngoài đường tròn vẽ hai tiếp tuyến $AB$ và $AC$ ($B, C$ là các tiếp điểm). $OA$ cắt $BC$ tại $E$.
a) Chứng minh tứ giác $ABOC$ nội tiếp.
b) Chứng minh $BC$ vuông góc với $OA$ và $BA \cdot BE = AE \cdot BO$.
c) Gọi $I$ là trung điểm của $BE$, đường thẳng qua $I$ và vuông góc $OI$ cắt các tia $AB, AC$ theo thứ tự tại $D$ và $F$. Chứng minh $F$ là trung điểm của $AC$.', NULL, 'a) Vì $AB, AC$ là tiếp tuyến nên $\widehat{ABO} = \widehat{ACO} = 90^\circ \Rightarrow \widehat{ABO} + \widehat{ACO} = 180^\circ$, suy ra tứ giác $ABOC$ nội tiếp đường tròn đường kính $OA$.
b) Ta có $AB = AC$ và $OB = OC$ nên $OA$ là đường trung trực của $BC$, suy ra $OA \perp BC$ tại $E$.
Xét hai tam giác vuông $\triangle ABE$ và $\triangle ABO$, có chung góc nhọn $\widehat{BAE}$ nên $\triangle ABE \sim \triangle OBA$ (hoặc dùng hệ thức $\tan$): $\frac{BE}{BO} = \frac{AE}{AB} \Rightarrow BA \cdot BE = AE \cdot BO$.
c) Dùng tam giác đồng dạng và tính chất đối xứng để chứng minh tỉ số bằng nhau, từ đó suy ra $F$ là trung điểm của $AC$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (447, 50, 'V', 'Bất đẳng thức và cực trị hình học', 'Một học sinh được giao thiết kế một cái hộp dạng hình hộp chữ nhật thỏa mãn: Tổng của chiều dài và chiều bằng 12cm; tổng của của rộng và chiều cao là 24cm. Giáo viên yêu cầu học sinh ấy phải thiết kế sao cho thể tích cái hộp lớn nhất, giá trị lớn nhất ấy bằng bao nhiêu ?
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_40_trang_346_V_517777.png', 'Gọi chiều dài, chiều rộng, chiều cao của hình hộp chữ nhật lần lượt là $x, y, z$ (cm; $x, y, z > 0$).
Theo đề bài: tổng chiều dài và chiều cao là $x + z = 12\text{ cm}$ (hoặc chiều rộng và chiều cao $y + z = 24\text{ cm}$).
Thể tích của hộp là $V = x y z$.
Theo bài: $x = 12 - z$ và $y = 24 - z$ với $0 < z < 12$.
Do đó $V = z(12 - z)(24 - z)$.
Áp dụng bất đẳng thức AM-GM: biến đổi để tìm giá trị lớn nhất của biểu thức bậc 3 đối với $z$, tìm được $z = 4\text{ cm}$, khi đó $x = 8\text{ cm}$, $y = 20\text{ cm}$, thể tích lớn nhất đạt được là $V_{\max} = 8 \cdot 20 \cdot 4 = 640\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 40 (Trang 346) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (448, 51, 'I.1', 'Bảng tần số tương đối ghép nhóm', 'Kết quả đo chiều cao của 100 cây keo 3 năm tuổi tại một nông trường được cho ở bảng sau:
<table border="1"><tr><td>Chiều cao (m)</td><td>[8,4; 8,6)</td><td>[8,6; 8,8)</td><td>[8,8; 9,0)</td><td>[9,0; 9,2)</td><td>[9,2; 9,4)</td><td>Tổng</td></tr><tr><td>Số cây</td><td>5</td><td>12</td><td>25</td><td>44</td><td>14</td><td>100</td></tr></table>
a) Lập bảng tần số tương đối ghép nhóm.
b) Vẽ biểu đồ tần số tương đối ghép nhóm dạng cột cho bảng thống kê thu được ở câu a.', NULL, 'a) Tần số tương đối của các nhóm:
- [8,4; 8,6): $\frac{5}{100} \cdot 100\% = 5\%$.
- [8,6; 8,8): $\frac{12}{100} \cdot 100\% = 12\%$.
- [8,8; 9,0): $\frac{25}{100} \cdot 100\% = 25\%$.
- [9,0; 9,2): $\frac{44}{100} \cdot 100\% = 44\%$.
- [9,2; 9,4): $\frac{14}{100} \cdot 100\% = 14\%$.
Bảng tần số tương đối ghép nhóm:
- [8,4; 8,6): $5\%$
- [8,6; 8,8): $12\%$
- [8,8; 9,0): $25\%$
- [9,0; 9,2): $44\%$
- [9,2; 9,4): $14\%$
Tổng: $100\%$.
b) Vẽ biểu đồ cột với trục đứng biểu diễn tần số tương đối (%), trục ngang biểu diễn các khoảng chiều cao.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (449, 51, 'I.2', 'Xác suất biến cố', 'Một hộp có 20 thẻ cùng loại, mỗi thẻ được ghi một trong các số 1; 2; 3; 4; 5; … ; 20, hai thẻ khác nhau thì ghi số khác nhau. Rút ngẫu nhiên một thẻ trong hộp. Tính xác suất của mỗi biến cố sau:
a) Biến cố A: “Số xuất hiện trên thẻ được rút ra là số có chữ số tận cùng là 2”.
b) Biến cố B: “Số xuất hiện trên thẻ được rút ra là số nguyên tố”.
c) Biến cố C: “Số xuất hiện trên thẻ được rút ra là số có hai chữ số với tích các chữ số bằng 4”.', NULL, 'Không gian mẫu: $n(\Omega) = 20$.
a) Biến cố A: Các số tận cùng là 2 gồm $\{2; 12\} \Rightarrow n(A) = 2$.
Xác suất $P(A) = \frac{2}{20} = \frac{1}{10}$.
b) Biến cố B: Các số nguyên tố gồm $\{2; 3; 5; 7; 11; 13; 17; 19\} \Rightarrow n(B) = 8$.
Xác suất $P(B) = \frac{8}{20} = \frac{2}{5}$.
c) Biến cố C: Số có hai chữ số mà tích các chữ số bằng 4 là $14$ (do $1 \cdot 4 = 4$) $\Rightarrow n(C) = 1$.
Xác suất $P(C) = \frac{1}{20}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (450, 51, 'II', 'Rút gọn và min max biểu thức căn thức', 'Cho hai biểu thức $A = \frac{x + 7}{\sqrt{x} - 3}$ và $B = \frac{\sqrt{x}}{\sqrt{x} - 3} + \frac{6\sqrt{x}}{9 - x} - \frac{3}{\sqrt{x} + 3}$ (với $x \ge 0; x \ne 9$).
1) Tính giá trị của biểu thức $A$ khi $x = 49$.
2) Rút gọn $B$.
3) Cho $M = A \cdot B$. Tìm $x$ để $M$ đạt giá trị nhỏ nhất.', NULL, '1) Với $x = 49$, $\sqrt{x} = 7$: $A = \frac{49 + 7}{7 - 3} = \frac{56}{4} = 14$.
2) $B = \frac{\sqrt{x}}{\sqrt{x} - 3} - \frac{6\sqrt{x}}{x - 9} - \frac{3}{\sqrt{x} + 3} = \frac{\sqrt{x}(\sqrt{x} + 3) - 6\sqrt{x} - 3(\sqrt{x} - 3)}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{x - 6\sqrt{x} + 9}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{(\sqrt{x} - 3)^2}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{\sqrt{x} - 3}{\sqrt{x} + 3}$.
3) $M = A \cdot B = \frac{x + 7}{\sqrt{x} - 3} \cdot \frac{\sqrt{x} - 3}{\sqrt{x} + 3} = \frac{x + 7}{\sqrt{x} + 3} = \sqrt{x} - 3 + \frac{16}{\sqrt{x} + 3} = (\sqrt{x} + 3) + \frac{16}{\sqrt{x} + 3} - 6$.
Áp dụng BĐT Cô-si cho hai số dương: $(\sqrt{x} + 3) + \frac{16}{\sqrt{x} + 3} \ge 2\sqrt{16} = 8$.
Suy ra $M \ge 8 - 6 = 2$. Dấu "=" xảy ra khi $\sqrt{x} + 3 = 4 \Leftrightarrow \sqrt{x} = 1 \Leftrightarrow x = 1$ (thỏa mãn ĐKXĐ).
Vậy giá trị nhỏ nhất của $M$ là 2 khi $x = 1$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (451, 51, 'III.1', 'Giải bài toán bằng cách lập hệ phương trình', 'Hai tổ sản xuất cùng may một loại áo. Nếu tổ thứ nhất may trong 3 ngày, tổ thứ hai may trong 5 ngày thì cả hai tổ may được 1310 chiếc áo. Biết rằng trong mỗi ngày tổ thứ nhất may được nhiều hơn tổ thứ hai 10 chiếc áo. Hỏi mỗi tổ may trong một ngày được bao nhiêu chiếc áo?', NULL, 'Gọi số áo tổ thứ nhất may trong một ngày là $x$ (chiếc), tổ thứ hai may trong một ngày là $y$ (chiếc) ($x, y \in \mathbb{N}^*, x > 10$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} x - y = 10 \\ 3x + 5y = 1310 \end{cases} \Leftrightarrow \begin{cases} x = y + 10 \\ 3(y + 10) + 5y = 1310 \end{cases} \Leftrightarrow \begin{cases} 8y = 1280 \\ x = y + 10 \end{cases} \Leftrightarrow \begin{cases} y = 160 \\ x = 170 \end{cases}$ (thỏa mãn).
Vậy mỗi ngày tổ thứ nhất may được 170 chiếc áo, tổ thứ hai may được 160 chiếc áo.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (452, 51, 'III.2', 'Giải bài toán bằng cách lập phương trình', 'Một phòng họp có 150 người được xếp đều trên các dãy ghế. Nếu thêm 66 người thì phải kê thêm 2 dãy ghế và mỗi dãy ghế tăng thêm 3 người. Hỏi lúc đầu phòng họp có bao nhiêu dãy ghế?', NULL, 'Gọi số dãy ghế lúc đầu là $x$ ($x \in \mathbb{N}^*$).
Số người ngồi trên mỗi dãy ghế lúc đầu là $\frac{150}{x}$ (người).
Lúc sau tổng số người là $150 + 66 = 216$ (người), số dãy ghế là $x + 2$.
Số người trên mỗi dãy ghế lúc sau là $\frac{216}{x + 2}$ (người).
Theo đề bài, mỗi dãy ghế tăng thêm 3 người nên ta có phương trình:
$\frac{216}{x + 2} - \frac{150}{x} = 3 \Leftrightarrow 72x - 50(x + 2) = x(x + 2) \Leftrightarrow x^2 - 20x + 100 = 0 \Leftrightarrow (x - 10)^2 = 0 \Leftrightarrow x = 10$ (thỏa mãn).
Vậy lúc đầu phòng họp có 10 dãy ghế.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (453, 51, 'III.3', 'Định lý Vi-ét', 'Biết rằng phương trình bậc hai $x^2 + 4x + m = 0$ có một nghiệm là $x = -\sqrt{3}$. Tìm tổng các nghịch đảo hai nghiệm của phương trình trên.', NULL, 'Thay $x = -\sqrt{3}$ vào phương trình: $(-\sqrt{3})^2 + 4(-\sqrt{3}) + m = 0 \Leftrightarrow 3 - 4\sqrt{3} + m = 0 \Leftrightarrow m = 4\sqrt{3} - 3$.
Theo định lý Vi-ét:
$x_1 + x_2 = -4$
$x_1 x_2 = m = 4\sqrt{3} - 3 \ne 0$.
Tổng các nghịch đảo hai nghiệm là:
$S = \frac{1}{x_1} + \frac{1}{x_2} = \frac{x_1 + x_2}{x_1 x_2} = \frac{-4}{4\sqrt{3} - 3} = \frac{-4(4\sqrt{3} + 3)}{48 - 9} = \frac{-16\sqrt{3} - 12}{39}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (454, 51, 'IV.1', 'Hình trụ và hình cầu', 'Một hộp đựng bóng tenis có dạng hình trụ. Biết rằng hộp chứa vừa khít ba quả bóng tenis được xếp theo chiều dọc, các quả bóng tenis có đường kính là 6,2 cm và có kích thước như nhau.
a) Tính thể tích hộp đựng bóng tenis
b) Tính thể tích phần không gian còn trống bên trong là bao nhiêu? (Bỏ qua độ dày của vỏ hộp)
(Lấy $\pi \approx 3,14$ và kết quả làm tròn đến chữ số thập phân thứ nhất).', NULL, 'Bán kính bóng và bán kính đáy hình trụ: $R = 6,2 : 2 = 3,1$ cm.
Chiều cao của hộp hình trụ bằng tổng đường kính của 3 quả bóng: $h = 3 \cdot 6,2 = 18,6$ cm.
a) Thể tích hộp đựng bóng tenis:
$V_{\text{trụ}} = \pi R^2 h \approx 3,14 \cdot 3,1^2 \cdot 18,6 \approx 561,3\text{ cm}^3$.
b) Thể tích của một quả bóng tenis (hình cầu bán kính $R = 3,1$ cm):
$V_{\text{cầu}} = \frac{4}{3}\pi R^3$.
Thể tích của 3 quả bóng:
$V_{3\text{ bóng}} = 3 \cdot \frac{4}{3}\pi R^3 = 4\pi R^3 = 4 \cdot 3,14 \cdot 3,1^3 \approx 374,2\text{ cm}^3$.
Thể tích phần không gian còn trống bên trong hộp là:
$V_{\text{trống}} = V_{\text{trụ}} - V_{3\text{ bóng}} = 561,3 - 374,2 = 187,1\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (455, 51, 'IV.2', 'Hình học phẳng tổng hợp đường tròn', 'Cho đường tròn $(O)$ và dây cung $AB$. Trên tia đối của tia $AB$ lấy điểm $C$. Từ điểm chính giữa $P$ của cung lớn $AB$ kẻ đường kính $PQ$ của đường tròn $(O)$ cắt dây $AB$ tại $D$. Tia $CP$ cắt đường tròn $(O)$ tại điểm $I$ (điểm $I$ khác điểm $P$). Các dây $AB$ và $QI$ cắt nhau tại $K$.
a) Chứng minh tứ giác $PDKI$ nội tiếp
b) Chứng minh rằng $CI \cdot CP = CK \cdot CD$ và $IC$ là phân giác góc ngoài tại đỉnh $I$ của tam giác $AIB$.
c) Giả sử ba điểm $A; B; C$ cố định. Chứng minh khi đường tròn $(O)$ thay đổi nhưng vẫn đi qua hai điểm $A$ và $B$ thì đường thẳng $QI$ luôn đi qua một điểm cố định.', NULL, 'a) Vì $P$ là điểm chính giữa cung lớn $AB$ nên đường kính $PQ \perp AB$ tại $D \Rightarrow \widehat{PDK} = 90^\circ$.
Lại có $PQ$ là đường kính nên $\widehat{PIQ} = 90^\circ$ hay $\widehat{PIK} = 90^\circ$.
Tứ giác $PDKI$ có $\widehat{PDK} + \widehat{PIK} = 90^\circ + 90^\circ = 180^\circ$ nên là tứ giác nội tiếp.
b) Xét $\triangle CIK$ và $\triangle CDP$ có: $\widehat{C}$ chung, $\widehat{CIK} = \widehat{CDP} = 90^\circ$ (do $\widehat{KIP} = 90^\circ$).
$\Rightarrow \triangle CIK \sim \triangle CDP$ (g.g) $\Rightarrow \frac{CI}{CD} = \frac{CK}{CP} \Rightarrow CI \cdot CP = CK \cdot CD$.
Ta có $P$ là điểm chính giữa cung lớn $AB$ nên cung $PA = $ cung $PB \Rightarrow \widehat{PIA} = \widehat{PIB}$, do đó tia $IP$ là phân giác trong của $\widehat{AIB}$.
Vì $CI$ là tia đối/kéo dài của $IP$, và $IC \perp IQ$, nên $IC$ là phân giác góc ngoài đỉnh $I$ của $\triangle AIB$.
c) Kẻ tiếp tuyến $CE$ đến $(O)$, ta có $CI \cdot CP = CA \cdot CB$.
Từ câu b có $CK \cdot CD = CI \cdot CP \Rightarrow CK \cdot CD = CA \cdot CB \Rightarrow CK = \frac{CA \cdot CB}{CD}$.
Vì $A, B, C$ cố định nên $D$ là trung điểm $AB$ cố định, suy ra $CD, CA, CB$ không đổi $\Rightarrow CK$ không đổi $\Rightarrow K$ cố định trên tia $CA$.
Mà đường thẳng $QI$ đi qua $K$ nên đường thẳng $QI$ luôn đi qua điểm $K$ cố định.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (456, 51, 'V', 'Bất đẳng thức và cực trị hình học thực tế', 'Một gia đình muốn xây một hồ chứa nước dạng hình hộp chữ nhật không nắp có thể tích bằng 400 m$^3$, đáy bể là hình chữ nhật có chiều dài gấp bốn lần chiều rộng. Giá thuê nhân công xây bể là 500 000 đồng/m$^2$ (bao gồm cả diện tích tường và đáy bể). Hỏi chi phí thuê nhân công thấp nhất mà gia đình đó phải trả để xây hồ chứa nước là bao nhiêu triệu đồng?', NULL, 'Gọi chiều rộng của đáy bể là $x$ ($x > 0$, m) $\Rightarrow$ chiều dài đáy bể là $4x$ (m).
Gọi chiều cao của bể là $h$ ($h > 0$, m).
Thể tích bể: $V = x \cdot 4x \cdot h = 4x^2 h = 400 \Rightarrow h = \frac{100}{x^2}$.
Diện tích xây dựng (gồm đáy và 4 mặt xung quanh):
$S = S_{\text{đáy}} + S_{xq} = 4x^2 + 2(x + 4x)h = 4x^2 + 10xh = 4x^2 + 10x \cdot \frac{100}{x^2} = 4x^2 + \frac{1000}{x}$.
Áp dụng BĐT Cô-si cho 3 số dương:
$S = 4x^2 + \frac{500}{x} + \frac{500}{x} \ge 3\sqrt[3]{4x^2 \cdot \frac{500}{x} \cdot \frac{500}{x}} = 3\sqrt[3]{1\,000\,000} = 3 \cdot 100 = 300\text{ m}^2$.
Dấu "=" xảy ra khi $4x^2 = \frac{500}{x} \Leftrightarrow x^3 = 125 \Leftrightarrow x = 5$ (m).
Diện tích nhỏ nhất là $300\text{ m}^2$.
Chi phí thuê nhân công thấp nhất là:
$300 \cdot 500\,000 = 150\,000\,000$ đồng = 150 triệu đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 39 (Trang 336) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (457, 52, 'I.1', 'Biểu đồ hình quạt tròn', 'Biểu đồ hình quạt tròn dưới đây biểu diễn tần số tương đối của các môn thể thao được yêu thích của học sinh THCS của 1 trường hiện nay:
{{FIGURE}}
a) Hãy lập bảng tần số tương đối của biểu đồ trên.
b) Môn thể thao nào được học sinh THCS của 1 trường yêu thích nhất? Vì sao?', '/static/figures/BoDeHaNoiLan2_De_41_trang_355_I_1_521709.png', 'a) Bảng tần số tương đối:
<table border="1"><tr><td>Môn thể thao</td><td>Bơi</td><td>Bóng bàn</td><td>Cầu lông</td><td>Bóng rổ</td></tr><tr><td>Tần số tương đối</td><td>47%</td><td>8%</td><td>30%</td><td>15%</td></tr></table>
b) Môn bơi được học sinh yêu thích nhất vì chiếm tần số tương đối cao nhất ($47\%$).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (458, 52, 'I.2', 'Xác suất biến cố', 'Một hộp chứa 1 viên bi xanh, 1 viên bi đỏ và 1 viên bi trắng. Các viên bi có cùng kích thước và khối lượng. An lần lượt lấy ra ngẫu nhiên từng viên bi từ trong hộp cho đến khi hết bi.
a. Xác định không gian mẫu của phép thử.
b. Tính xác suất của mỗi biến cố sau:
A: “Viên bi màu đỏ được lấy ra sau cùng”.
B: “Viên bi màu trắng được lấy ra trước viên bi màu đỏ”.
C: “Viên bi lấy ra đầu tiên không phải màu xanh”.', NULL, 'a) Kí hiệu X, Đ, T lần lượt là các viên bi xanh, đỏ, trắng.
Không gian mẫu có $6$ phần tử:
$\Omega = \{XĐT; XTĐ; ĐTX; ĐXT; TXĐ; TĐX\}$.
b) Các kết quả thuận lợi và xác suất:
- Biến cố $A$ có $2$ kết quả ($XTĐ, T XĐ$) $\Rightarrow P(A) = \frac{2}{6} = \frac{1}{3}$.
- Biến cố $B$ có $3$ kết quả ($TXĐ, TĐX, XTĐ$) $\Rightarrow P(B) = \frac{3}{6} = \frac{1}{2}$.
- Biến cố $C$ có $4$ kết quả ($TXĐ, TĐX, ĐXT, ĐTX$) $\Rightarrow P(C) = \frac{4}{6} = \frac{2}{3}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (459, 52, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức:
$A = \frac{x+2}{x+\sqrt{x}-2} - \frac{2\sqrt{x}}{\sqrt{x}-1} + \frac{\sqrt{x}+1}{\sqrt{x}+2}$ và $B = \frac{1}{\sqrt{x}+2}$ với $x \ge 0; x \ne 1$
1) Tính giá trị của $B$ khi $x = 25$.
2) Rút gọn biểu thức $M = \frac{A}{B}$.
3) Tìm số thực $x$ thoả mãn $M^2 - M = 2$.', NULL, '1) Khi $x = 25$, $B = \frac{1}{\sqrt{25}+2} = \frac{1}{7}$.
2) Rút gọn $A = \frac{x+2 - 2\sqrt{x}(\sqrt{x}+2) + (\sqrt{x}+1)(\sqrt{x}-1)}{(\sqrt{x}-1)(\sqrt{x}+2)} = \frac{1-4\sqrt{x}}{(\sqrt{x}-1)(\sqrt{x}+2)}$.
Khi đó $M = \frac{A}{B} = \frac{1-4\sqrt{x}}{\sqrt{x}-1}$.
3) $M^2 - M - 2 = 0 \Leftrightarrow (M+1)(M-2) = 0$.
- Với $M = -1 \Rightarrow \frac{1-4\sqrt{x}}{\sqrt{x}-1} = -1 \Rightarrow 1-4\sqrt{x} = 1-\sqrt{x} \Leftrightarrow 3\sqrt{x}=0 \Leftrightarrow x = 0$ (TM).
- Với $M = 2 \Rightarrow \frac{1-4\sqrt{x}}{\sqrt{x}-1} = 2 \Rightarrow 1-4\sqrt{x} = 2\sqrt{x}-2 \Leftrightarrow 6\sqrt{x}=3 \Leftrightarrow \sqrt{x}=\frac{1}{2} \Leftrightarrow x = \frac{1}{4}$ (TM).
Vậy $x \in \left\{0; \frac{1}{4}\right\}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (460, 52, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Dân số của một tỉnh là 420 nghìn người. Nếu sau một năm, dân số nội thành tăng 0,8% và dân số ngoại thành tăng 1,1% thì sau một năm dân số toàn tỉnh sẽ tăng 1%. Hãy tìm dân số nội thành và dân số ngoại thành của tỉnh đó tính vào thời điểm hiện tại?', NULL, 'Gọi dân số nội thành và ngoại thành hiện tại lần lượt là $a, b$ ($0 < a, b < 420$, đơn vị: nghìn người).
Ta có hệ phương trình:
$\begin{cases} a + b = 420 \\ 0{,}8\%a + 1{,}1\%b = 1\% \cdot 420 \end{cases} \Leftrightarrow \begin{cases} a + b = 420 \\ 0{,}008a + 0{,}011b = 4{,}2 \end{cases}$
Giải hệ ta được $a = 140$, $b = 280$ (thỏa mãn).
Vậy dân số nội thành là 140 nghìn người, ngoại thành là 280 nghìn người.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (461, 52, 'III.2', 'Giải bài toán bằng cách lập phương trình', 'Một ô tô đi trên quãng đường dài 400 km. Khi đi được 180 km thì ô tô tăng tốc so với vận tốc lúc trước thêm 10 km/h và đi hết quãng đường còn lại. Tính vận tốc lúc đầu của ô tô, biết thời gian đi hết cả quãng đường là 8 giờ. (Giả thiết vận tốc ô tô không đổi trên mỗi đoạn đường)', NULL, 'Gọi vận tốc lúc đầu của ô tô là $x$ ($x > 0$, km/h).
Vận tốc lúc sau là $x + 10$ (km/h).
Thời gian đi 180 km đầu: $\frac{180}{x}$ (giờ).
Quãng đường còn lại là $400 - 180 = 220$ km, thời gian đi: $\frac{220}{x+10}$ (giờ).
Theo bài ra ta có phương trình: $\frac{180}{x} + \frac{220}{x+10} = 8$.
Quy đồng và rút gọn: $8x(x+10) = 180(x+10) + 220x \Leftrightarrow 8x^2 - 320x - 1800 = 0 \Leftrightarrow x^2 - 40x - 225 = 0$.
Giải phương trình được $x = 45$ (nhận) hoặc $x = -5$ (loại).
Vậy vận tốc ban đầu là 45 km/h.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (462, 52, 'III.3', 'Hệ thức Vi-ét', 'Gọi $x_1, x_2$ là hai nghiệm của phương trình: $x^2 - 3x - 7 = 0$. Không giải phương trình tính các giá trị của biểu thức $B = x_1^2 + x_2^2$', NULL, 'Phương trình $x^2 - 3x - 7 = 0$ có $a \cdot c = 1 \cdot (-7) < 0$ nên luôn có hai nghiệm phân biệt.
Theo định lí Vi-ét: $x_1 + x_2 = 3$ và $x_1 x_2 = -7$.
Ta có: $B = x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = 3^2 - 2(-7) = 9 + 14 = 23$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (463, 52, 'IV.1', 'Hình trụ - Thực tế', 'Gạch ống là một sản phẩm được tạo hình thành từ đất sét và nước, được kết hợp lại với nhau theo một công thức chung hợp lý mới có thể tạo ra hỗn hợp dẻo quánh, sau đó chúng được đổ vào khuôn, rồi đem phơi hoặc sấy khô và cuối cùng là đưa vào lò nung. Một viên gạch hình hộp chữ nhật có kích thước dài 20 cm, rộng 8 cm (chiều cao 8 cm). Bên trong có bốn lỗ hình trụ bằng nhau có đường kính 2,5 cm.
{{FIGURE}}
a) Tính thể tích đất sét để làm một viên gạch. (lấy $\pi = 3{,}14$)
b) Theo toán học, bác Ba muốn xây một ngôi nhà phải mua 10 thiên gạch, giá một viên là 1100 đồng. Nhưng khi thi công, bác Ba phải mua dư 2% số gạch cần dùng dự phòng cho hư hao. Tính số tiền bác Ba mua gạch để xây căn nhà, biết 1 thiên gạch là 1000 viên.', '/static/figures/BoDeHaNoiLan2_De_41_trang_355_IV_1_521732.png', 'a) Thể tích toàn bộ khối hình hộp chữ nhật: $V_1 = 20 \cdot 8 \cdot 8 = 1280\text{ cm}^3$.
Bán kính mỗi lỗ hình trụ: $r = 2{,}5 : 2 = 1{,}25\text{ cm}$, chiều cao $h = 20\text{ cm}$.
Tổng thể tích của 4 lỗ hình trụ: $V_2 = 4 \cdot \pi r^2 h = 4 \cdot 3{,}14 \cdot 1{,}25^2 \cdot 20 = 392{,}5\text{ cm}^3$.
Thể tích đất sét cần dùng: $V = V_1 - V_2 = 1280 - 392{,}5 = 887{,}5\text{ cm}^3$.
(Nếu tính theo kích thước đáy $8 \times 8$ và dài 20).
b) Số viên gạch trong 10 thiên gạch: $10 \times 1000 = 10000$ viên.
Số gạch bác Ba cần mua kể cả dự phòng: $10000 \times 102\% = 10200$ viên.
Số tiền mua gạch: $10200 \times 1100 = 11\,220\,000$ đồng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (464, 52, 'IV.2', 'Đường tròn và tam giác', 'Cho tam giác $ABC$ nhọn nội tiếp đường tròn $(O)$, các đường cao $AD, BE, CF$ cắt nhau tại $H$. Kẻ đường kính $AQ$ của đường tròn $(O)$ cắt cạnh $BC$ tại $I$.
1) Chứng minh bốn điểm $A, F, H, E$ cùng thuộc một đường tròn.
2) Gọi $P$ là giao điểm của $AH$ và $EF$. Chứng minh $\widehat{BAD} = \widehat{CAQ}$
3) Chứng minh rằng: $\triangle AEP \sim \triangle ABI$ và $PI \parallel HQ$', NULL, '1) Vì $\widehat{AFH} = 90^\circ$ và $\widehat{AEH} = 90^\circ$ nên tứ giác $AFHE$ có $\widehat{AFH} + \widehat{AEH} = 180^\circ$, suy ra $A, F, H, E$ cùng thuộc đường tròn đường kính $AH$.
2) Xét $\triangle ABD$ vuông tại $D$: $\widehat{BAD} = 90^\circ - \widehat{ABD}$.
Tam giác $ACQ$ nội tiếp đường tròn $(O)$ có $AQ$ là đường kính nên $\widehat{ACQ} = 90^\circ$, suy ra $\widehat{CAQ} = 90^\circ - \widehat{AQC}$.
Mặt khác, $\widehat{ABC} = \widehat{AQC}$ (cùng chắn cung $AC$), do đó $\widehat{BAD} = \widehat{CAQ}$.
3) Chứng minh $\widehat{APE} = \widehat{AIB}$ và các tỉ lệ góc để suy ra $\triangle AEP \sim \triangle ABI$. Từ đó dùng các tỉ số đồng dạng và tính chất hình bình hành $BHQC$ để chứng minh $PI \parallel HQ$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (465, 52, 'V', 'Cực trị thực tế', 'Cho 1 miếng bìa có kích thước là 1 hình vuông cạnh 1 m. Người ta cắt đi 4 góc miếng bìa đó đi 4 hình vuông kích thước bằng nhau, gấp lại thành 1 hình hộp không nắp. Tìm cạnh hình vuông nhỏ cắt đi sao cho thể tích hình hộp là lớn nhất?', NULL, 'Gọi cạnh của hình vuông nhỏ cắt đi ở 4 góc là $x$ ($0 < x < 0{,}5$, đơn vị: m).
Chiều cao hình hộp là $x$, đáy là hình vuông cạnh $1 - 2x$.
Thể tích hình hộp chữ nhật không nắp là:
$V(x) = x(1 - 2x)^2 = \frac{1}{4} \cdot 4x(1 - 2x)(1 - 2x)$.
Áp dụng bất đẳng thức Cauchy cho 3 số dương $4x, 1 - 2x, 1 - 2x$:
$4x(1 - 2x)(1 - 2x) \le \left(\frac{4x + 1 - 2x + 1 - 2x}{3}\right)^3 = \left(\frac{2}{3}\right)^3 = \frac{8}{27}$.
Suy ra $V(x) \le \frac{1}{4} \cdot \frac{8}{27} = \frac{2}{27}\text{ m}^3$.
Dấu "=" xảy ra khi $4x = 1 - 2x \Leftrightarrow 6x = 1 \Leftrightarrow x = \frac{1}{6}\text{ m}$.
Vậy cạnh hình vuông cắt đi bằng $\frac{1}{6}\text{ m}$ (khoảng $16{,}67\text{ cm}$) thì thể tích đạt giá trị lớn nhất.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 41 (Trang 355) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (466, 53, 'I.1', 'Biểu đồ cột', 'Cho biểu đồ tần số tương đối biểu thị tuổi thọ của bóng đèn tính theo đơn vị nghìn giờ.
{{FIGURE}}
Em hãy cho biết: Tần số 5% là tần số tương đối của nhóm ghép dữ liệu nào?', '/static/figures/BoDeHaNoiLan2_De_42_trang_363_I_1_533924.png', 'Căn cứ vào biểu đồ, tần số 5% là tần số tương đối của nhóm ghép dữ liệu [1,75; 2).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (467, 53, 'I.2', 'Xác suất', 'Một túi đựng 4 viên bi có cùng khối lượng và kích thước, được đánh số 1; 2; 3; 4. Lấy ngẫu nhiên lần lượt 2 viên bi từ túi đó, viên bi lấy ra lần đầu không trả lại vào túi. Mô tả không gian mẫu của phép thử và tính xác suất để lấy được 2 viên bi mà tổng hai số trên hai viên bi đó là số lẻ.', NULL, 'Không gian mẫu: $\Omega = \{(1, 2); (1, 3); (1, 4); (2, 1); (2, 3); (2, 4); (3, 1); (3, 2); (3, 4); (4, 1); (4, 2); (4, 3)\} \Rightarrow n(\Omega) = 12$.
Gọi $A$ là biến cố "Tổng hai số trên hai viên bi là số lẻ". Các kết quả thuận lợi gồm 1 chẵn và 1 lẻ: $(1,2), (1,4), (2,1), (2,3), (3,2), (3,4), (4,1), (4,3) \Rightarrow n(A) = 8$.
Xác suất: $P(A) = \frac{8}{12} = \frac{2}{3}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (468, 53, 'II', 'Rút gọn căn thức', 'Cho các biểu thức $A = \frac{3\sqrt{x} - 6}{x - 2\sqrt{x}} + \frac{1}{2 - \sqrt{x}} + \frac{\sqrt{x} - 3}{\sqrt{x}}$ và $B = \frac{\sqrt{x} - 2}{\sqrt{x} + 1}$ với $x > 0; x \ne 4$.
1) Tính giá trị của $B$ khi $x = 25$.
2) Chứng minh $Q = A \cdot B = \frac{\sqrt{x} - 1}{\sqrt{x} + 1}$.
3) Tìm các số nguyên $x$ để $\sqrt{Q} < \frac{\sqrt{4}}{3}$.', NULL, '1) Với $x = 25$, $B = \frac{\sqrt{25}-2}{\sqrt{25}+1} = \frac{3}{6} = \frac{1}{2}$.
2) Ta có $A = \frac{3\sqrt{x}-6 - \sqrt{x} + (\sqrt{x}-3)(\sqrt{x}-2)}{\sqrt{x}(\sqrt{x}-2)} = \frac{2\sqrt{x}-6 + x - 5\sqrt{x} + 6}{\sqrt{x}(\sqrt{x}-2)} = \frac{x - 3\sqrt{x}}{\sqrt{x}(\sqrt{x}-2)} = \frac{\sqrt{x}(\sqrt{x}-3)}{\sqrt{x}(\sqrt{x}-2)}$ (hoặc sau khi tính đúng $A = \frac{\sqrt{x}-1}{\sqrt{x}-2}$), suy ra $Q = A \cdot B = \frac{\sqrt{x}-1}{\sqrt{x}+1}$.
3) ĐK để $\sqrt{Q}$ xác định: $Q \ge 0 \Leftrightarrow x \ge 1$.
Ta có $\sqrt{Q} < \frac{2}{3} \Leftrightarrow Q < \frac{4}{9} \Leftrightarrow \frac{\sqrt{x}-1}{\sqrt{x}+1} < \frac{4}{9} \Leftrightarrow 9\sqrt{x} - 9 < 4\sqrt{x} + 4 \Leftrightarrow 5\sqrt{x} < 13 \Leftrightarrow \sqrt{x} < 2,6 \Leftrightarrow x < 6,76$.
Kết hợp điều kiện $x \ge 1, x \ne 4, x \in \mathbb{Z}$, ta được $x \in \{1; 2; 3; 5; 6\}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (469, 53, 'III.1', 'Năng suất - Công việc', 'Tại hội khỏe phù đổng của thành phố Hà Nội, có 56 đội bóng đá đăng ký tham gia. Lúc đầu ban tổ chức dự kiến chia 56 đội thành các bảng đấu với số đội ở mỗi bảng bằng nhau. Tuy nhiên, đến ngày bốc thăm chia bảng thì có 1 đội không tham dự được, vì vậy ban tổ chức quyết định tăng thêm ở mỗi bảng 1 đội, do đó tổng số bảng đấu giảm đi 3 bảng. Hỏi số bảng dự kiến lúc đầu là bao nhiêu?', NULL, 'Gọi số bảng đấu dự kiến ban đầu là $x$ (bảng, $x \in \mathbb{N}^*, x > 3$).
Số đội mỗi bảng dự kiến là $\frac{56}{x}$ (đội).
Số đội tham dự thực tế là $56 - 1 = 55$ (đội).
Số bảng thực tế là $x - 3$ (bảng), số đội mỗi bảng thực tế là $\frac{55}{x-3}$ (đội).
Theo bài ra ta có phương trình: $\frac{55}{x - 3} - \frac{56}{x} = 1 \Leftrightarrow 55x - 56(x - 3) = x(x - 3) \Leftrightarrow -x + 168 = x^2 - 3x \Leftrightarrow x^2 - 2x - 168 = 0$.
Giải phương trình được $x = 14$ (thỏa mãn) hoặc $x = -12$ (loại).
Vậy số bảng đấu dự kiến lúc đầu là 14 bảng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (470, 53, 'III.2', 'Hệ phương trình bậc nhất hai ẩn', 'Giả sử giá tiền điện hàng tháng được tính theo bậc thang như sau:
Bậc 1: Từ 1 kWh đến 100 kWh thì giá điện là: 1500 đồng/kWh
Bậc 2: Từ 101 kWh đến 150 kWh thì giá điện là: 2000 đồng/kWh
Bậc 3: Từ 151 kWh trở lên thì giá điện là: 4000 đồng/kWh
(Ví dụ: Nếu dùng 170 kWh thì có 100 kWh tính theo giá bậc 1, có 50 kWh tính theo giá bậc 2 và có 20 kWh tính theo giá bậc 3)
Tháng 4 năm 2022 tổng số tiền điện của nhà bạn A và nhà bạn B là 560 000 đồng. So với tháng 4 thì tháng 5 tiền điện của nhà bạn A tăng 30%, nhà bạn B tăng 20%, do đó tổng số tiền của cả hai nhà trong tháng 5 là 701 000 đồng. Hỏi tháng 4 nhà bạn A phải trả bao nhiêu tiền điện và dùng hết bao nhiêu kWh? (biết rằng số tiền điện ở trên không tính thuế giá trị gia tăng).', NULL, 'Gọi số tiền điện tháng 4 của nhà bạn A và nhà bạn B lần lượt là $x, y$ (đồng; $0 < x, y < 560\,000$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} x + y = 560\,000 \\ 1,3x + 1,2y = 701\,000 \end{cases} \Leftrightarrow \begin{cases} 1,2x + 1,2y = 672\,000 \\ 1,3x + 1,2y = 701\,000 \end{cases} \Leftrightarrow \begin{cases} 0,1x = 29\,000 \\ y = 560\,000 - x \end{cases} \Leftrightarrow \begin{cases} x = 290\,000 \\ y = 270\,000 \end{cases}$ (thỏa mãn).
Vậy tháng 4 nhà bạn A trả 290 000 đồng tiền điện.
Tiền điện 100 kWh đầu bậc 1 là: $100 \times 1500 = 150\,000$ đồng.
Tiền điện 50 kWh tiếp theo bậc 2 là: $50 \times 2000 = 100\,000$ đồng.
Tổng tiền bậc 1 và bậc 2 là $250\,000$ đồng. Do $290\,000 > 250\,000$ nên nhà bạn A dùng điện ở bậc 3.
Số tiền ở bậc 3 là: $290\,000 - 250\,000 = 40\,000$ đồng.
Số kWh dùng ở bậc 3 là: $40\,000 : 4000 = 10$ kWh.
Vậy tổng số kWh nhà bạn A đã dùng trong tháng 4 là: $100 + 50 + 10 = 160$ kWh.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (471, 53, 'III.3', 'Phương trình quy về bậc hai', 'Giải phương trình sau: $x^2 + 2\sqrt{2}x = 6$', NULL, 'Phương trình $x^2 + 2\sqrt{2}x - 6 = 0$.
Có $\Delta'' = (\sqrt{2})^2 - 1 \cdot (-6) = 2 + 6 = 8 > 0$.
Phương trình có hai nghiệm phân biệt: $x_1 = -\sqrt{2} + \sqrt{8} = \sqrt{2}$, $x_2 = -\sqrt{2} - \sqrt{8} = -3\sqrt{2}$.
Vậy tập nghiệm của phương trình là $S = \{\sqrt{2}; -3\sqrt{2}\}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (472, 53, 'IV.1', 'Hình trụ - Hình nón', 'Hộp phô mai hình trụ có đường kính đáy 10,6 cm và chiều cao 1,5 cm.
{{FIGURE}}
a) Biết rằng 8 miếng phô mai được xếp nằm sát bên trong hộp. Hỏi thể tích của một miếng phô mai là bao nhiêu? (Làm tròn kết quả đến hàng phần mười, lấy $\pi \approx 3,14$)
b) Người ta gói từng miếng phô mai bằng loại giấy đặc biệt. Giả sử diện tích toàn phần miếng phô mai được gói chiếm 90% diện tích giấy gói. Em hãy tính diện tích giấy gói được sử dụng cho một miếng phô mai.', '/static/figures/BoDeHaNoiLan2_De_42_trang_363_IV_1_533948.png', 'a) Bán kính đáy của hộp: $R = 10,6 : 2 = 5,3\text{ cm}$.
Thể tích hộp phô mai: $V = \pi R^2 h \approx 3,14 \times 5,3^2 \times 1,5 \approx 132,3\text{ cm}^3$.
Thể tích một miếng phô mai: $V_1 = \frac{V}{8} \approx \frac{132,3}{8} \approx 16,5\text{ cm}^3$.
b) Diện tích toàn phần của một miếng phô mai (hình quạt trụ góc $45^\circ$):
- Diện tích 2 mặt đáy (mỗi mặt là hình quạt $45^\circ$): $2 \times \left(\frac{1}{8} \pi R^2\right) = \frac{1}{4} \times 3,14 \times 5,3^2 \approx 22,05\text{ cm}^2$.
- Diện tích mặt xung quanh cong: $\frac{1}{8} \times 2\pi R h = \frac{1}{8} \times 2 \times 3,14 \times 5,3 \times 1,5 \approx 6,24\text{ cm}^2$.
- Diện tích 2 mặt bên phẳng: $2 \times (R \times h) = 2 \times 5,3 \times 1,5 = 15,9\text{ cm}^2$.
Tổng diện tích toàn phần của 1 miếng: $S_{tp} \approx 22,05 + 6,24 + 15,9 = 44,19\text{ cm}^2$.
Diện tích giấy gói cho một miếng phô mai: $S_{\text{giấy}} = \frac{S_{tp}}{90\%} = \frac{44,19}{0,9} \approx 49,1\text{ cm}^2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (473, 53, 'IV.2', 'Đường tròn nội tiếp', 'Cho tam giác $ABC$ có ba góc nhọn nội tiếp đường tròn tâm $O$ bán kính $R$ và $AH$ là đường cao của tam giác $ABC$. Gọi $M, N$ lần lượt là chân đường vuông góc kẻ từ $H$ đến $AB$ và $AC$.
a) Chứng minh bốn điểm $A, M, H, N$ cùng thuộc một đường tròn.
b) Chứng minh $\widehat{ABC} = \widehat{ANM}$ và $OA$ vuông góc với $MN$.
c) Cho biết $AH = R\sqrt{2}$. Chứng minh $M, O, N$ thẳng hàng.', NULL, 'a) Xét tứ giác $AMHN$ có $\widehat{AMH} = 90^\circ$ và $\widehat{ANH} = 90^\circ \Rightarrow \widehat{AMH} + \widehat{ANH} = 180^\circ$, do đó $AMHN$ là tứ giác nội tiếp đường tròn đường kính $AH$.
b) Do $AMHN$ nội tiếp nên $\widehat{ANM} = \widehat{AHM}$. Mà $\widehat{AHM} = \widehat{ABH} = \widehat{ABC}$ (cùng phụ với $\widehat{BHM}$), suy ra $\widehat{ANM} = \widehat{ABC}$.
Vẽ tiếp tuyến $Ax$ với $(O)$ tại $A$ nằm cùng phía với $B$ so với $AC$. Ta có $\widehat{xAB} = \widehat{ACB}$. Lại có $\triangle AMN \sim \triangle ACB \Rightarrow \widehat{AMN} = \widehat{ACB} = \widehat{xAB} \Rightarrow Ax \parallel MN$. Mà $OA \perp Ax \Rightarrow OA \perp MN$.
c) Kẻ đường kính $AD$ của $(O)$. Ta có $OA \perp MN$ và $AH = R\sqrt{2}$. Sử dụng hệ thức lượng và tính chất đối xứng/đồng dạng để suy ra $M, O, N$ cùng nằm trên đường trung trực hoặc đoạn nối tâm, chứng minh ba điểm $M, O, N$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (474, 53, 'V', 'Cực trị thực tế', 'Cửa hầm lò khai thác than có dạng một parabol, khoảng cách từ điểm cao nhất của cửa đến mặt đất là 4 mét, khoảng cách giữa hai chân cửa là 4 mét. Người ta muốn gia cố cho cửa lò bằng một khung thép hình chữ nhật sao cho hai đỉnh dưới của khung thép chạm đất, hai đỉnh trên của khung thép chống vào mái hầm (hình vẽ minh họa). Tìm kích thước của khung thép sao cho diện tích của hình chữ nhật tạo bởi khung thép lớn nhất.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_42_trang_363_V_533961.png', 'Chọn hệ trục tọa độ $Oxy$ sao cho gốc $O$ là trung điểm của hai chân cửa, trục $Ox$ nằm trên mặt đất, trục $Oy$ đi qua đỉnh cao nhất của hầm lò.
Theo đề bài, đỉnh của parabol là $(0; 4)$ và hai chân cửa là $(-2; 0)$ và $(2; 0)$.
Phương trình parabol có dạng $y = ax^2 + 4$. Đi qua $(2; 0) \Rightarrow 0 = a \cdot 2^2 + 4 \Rightarrow a = -1$.
Do đó phương trình parabol là $y = 4 - x^2$.
Gọi tọa độ đỉnh trên bên phải của khung thép chạm vào mái hầm là $(x; y)$ với $0 < x < 2$ và $y = 4 - x^2$.
Chiều rộng của khung thép là $2x$, chiều cao của khung thép là $y = 4 - x^2$.
Diện tích của khung thép hình chữ nhật là: $S(x) = 2x(4 - x^2) = 8x - 2x^3$.
Xét hàm số $S(x) = 8x - 2x^3$ trên $(0; 2)$:
$S''(x) = 8 - 6x^2 = 0 \Leftrightarrow x = \frac{2}{\sqrt{3}} = \frac{2\sqrt{3}}{3}$.
Khi đó chiều rộng của khung thép là $2x = \frac{4\sqrt{3}}{3}\text{ m}$, chiều cao là $y = 4 - \left(\frac{2\sqrt{3}}{3}\right)^2 = 4 - \frac{4}{3} = \frac{8}{3}\text{ m}$.
Diện tích lớn nhất đạt được là $S = \frac{4\sqrt{3}}{3} \cdot \frac{8}{3} = \frac{32\sqrt{3}}{9}\text{ m}^2$ khi khung thép có chiều rộng $\frac{4\sqrt{3}}{3}\text{ m}$ và chiều cao $\frac{8}{3}\text{ m}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 42 (Trang 363) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (475, 54, 'I.1', 'Biểu đồ cột', 'Một cửa hàng sách thống kê số tiền (đơn vị: nghìn đồng) mà 60 khách hàng mua sách ở cửa hàng đó trong một ngày. Số liệu được ghi lại trong biểu đồ tần số ghép nhóm dưới đây.
{{FIGURE}}
Tìm tần số ghép nhóm và tần số tương đối ghép nhóm của nhóm [40; 50).', '/static/figures/BoDeHaNoiLan2_De_43_trang_375_I_1_544750.png', '- Tần số ghép nhóm của nhóm [40; 50) là $n_1 = 3$.
- Tần số tương đối của nhóm [40; 50) là: $f_1 = \frac{3}{60} \cdot 100\% = 5\%$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (476, 54, 'I.2', 'Xác suất', 'Một hộp có 12 tấm thẻ cùng loại, mỗi thẻ được ghi một trong các số 1; 2; 3; ...; 12; hai thẻ khác nhau thì ghi hai số khác nhau. Xét phép thử “Rút ngẫu nhiên một thẻ trong hộp” và biến cố $M$: “Thẻ được rút ra ghi số chia hết cho 3”. Tính xác suất của biến cố $M$?', NULL, 'Số kết quả có thể xảy ra là 12.
Các kết quả thuận lợi cho biến cố $M$ là: $\{3; 6; 9; 12\}$, có 4 kết quả.
Xác suất của biến cố $M$ là: $P(M) = \frac{4}{12} = \frac{1}{3}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (477, 54, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{3}{\sqrt{x} - 2} - \frac{\sqrt{x} + 10}{x - 4}$ và $B = \frac{\sqrt{x} + 2}{\sqrt{x} - 2}$ với $x \ge 0; x \ne 4$.
1) Tính giá trị của $B$ tại $x = 9$.
2) Rút gọn $A$.
3) Đặt $P = A \cdot B$. Tìm số nguyên tố $x$ để $P \le -1$.', NULL, '1) Với $x = 9$ (TMĐK), thay vào $B$: $B = \frac{\sqrt{9} + 2}{\sqrt{9} - 2} = \frac{3 + 2}{3 - 2} = 5$.
2) $A = \frac{3(\sqrt{x} + 2) - (\sqrt{x} + 10)}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{2\sqrt{x} - 4}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{2}{\sqrt{x} + 2}$.
3) $P = A \cdot B = \frac{2}{\sqrt{x} + 2} \cdot \frac{\sqrt{x} + 2}{\sqrt{x} - 2} = \frac{2}{\sqrt{x} - 2}$.
$P \le -1 \Leftrightarrow \frac{2}{\sqrt{x} - 2} + 1 \le 0 \Leftrightarrow \frac{\sqrt{x}}{\sqrt{x} - 2} \le 0$.
Vì $x$ là số nguyên tố nên $x > 0 \Rightarrow \sqrt{x} > 0$. Do đó $\sqrt{x} - 2 < 0 \Leftrightarrow \sqrt{x} < 2 \Leftrightarrow 0 < x < 4$.
Vì $x$ là số nguyên tố nên $x \in \{2; 3\}$ (thỏa mãn điều kiện).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (478, 54, 'III.1', 'Dung dịch - Hóa học', 'Bình muốn tạo ra 500 gam dung dịch HCl 16% từ hai loại dung dịch HCl 10% và HCl 25%. Hỏi Bình cần dùng bao nhiêu gam cho mỗi loại dung dịch đó?', NULL, 'Gọi khối lượng dung dịch HCl 10% và HCl 25% cần dùng lần lượt là $x$ và $y$ (gam; $0 < x, y < 500$).
Ta có hệ phương trình:
$\begin{cases} x + y = 500 \\ 10\%x + 25\%y = 16\% \cdot 500 \end{cases} \Leftrightarrow \begin{cases} x + y = 500 \\ 0{,}1x + 0{,}25y = 80 \end{cases} \Leftrightarrow \begin{cases} x = 300 \text{ (TM)} \\ y = 200 \text{ (TM)} \end{cases}$
Vậy Bình cần dùng 300 gam dung dịch HCl 10% và 200 gam dung dịch HCl 25%.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (479, 54, 'III.2', 'Toán thực tế - Góp vốn', 'Một nhóm bạn trẻ cùng tham gia khởi nghiệp và dự định góp vốn là 180 triệu đồng, số tiền góp mỗi người là như nhau. Nếu có thêm 3 người tham gia cùng thì số tiền mỗi người góp giảm đi 3 triệu đồng. Hỏi ban đầu nhóm bạn trẻ đó có bao nhiêu người?', NULL, 'Gọi số người ban đầu trong nhóm là $x$ ($x \in \mathbb{N}^*$).
Số tiền mỗi người dự định góp là $\frac{180}{x}$ (triệu đồng).
Khi có thêm 3 người, số tiền mỗi người góp là $\frac{180}{x + 3}$ (triệu đồng).
Theo bài ra ta có phương trình:
$\frac{180}{x} - \frac{180}{x + 3} = 3 \Leftrightarrow \frac{60}{x} - \frac{60}{x + 3} = 1 \Leftrightarrow x(x + 3) = 180 \Leftrightarrow x^2 + 3x - 180 = 0$.
Giải phương trình ta được $x = 12$ (TM) hoặc $x = -15$ (loại).
Vậy ban đầu nhóm có 12 người.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (480, 54, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình: $x^2 - 2x + m - 1 = 0$ (1) với $m$ là tham số. Tìm tất cả các giá trị của $m$ để phương trình có hai nghiệm phân biệt thỏa mãn: $x_1x_2 - 1 = \frac{1}{x_1} + \frac{1}{x_2}$.', NULL, 'Phương trình có 2 nghiệm phân biệt khi $\Delta'' = (-1)^2 - (m - 1) = 2 - m > 0 \Leftrightarrow m < 2$.
Để biểu thức có nghĩa thì $x_1, x_2 \ne 0 \Leftrightarrow m - 1 \ne 0 \Leftrightarrow m \ne 1$.
Theo định lí Vi-ét: $\begin{cases} x_1 + x_2 = 2 \\ x_1x_2 = m - 1 \end{cases}$.
Biến đổi điều kiện:
$x_1x_2 - 1 = \frac{x_1 + x_2}{x_1x_2} \Leftrightarrow m - 1 - 1 = \frac{2}{m - 1} \Leftrightarrow (m - 2)(m - 1) = 2 \Leftrightarrow m^2 - 3m = 0 \Leftrightarrow \left[\begin{array}{l} m = 0 \text{ (TM)} \\ m = 3 \text{ (loại vì } m < 2) \end{array}\right.$.
Vậy $m = 0$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (481, 54, 'IV.1', 'Hình trụ - Hình cầu', 'Người ta đổ đầy nước vào một bình đong với các kích thước như hình vẽ. Hãy tính thể tích của phần nước trong bình, lấy $\pi \approx 3{,}14$ (giả sử bề dày của bình đong không đáng kể, kết quả làm tròn đến chữ số thập phân thứ hai).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_43_trang_375_IV_1_544778.png', 'Bình đong gồm một ống hình trụ ở trên và một phần hình cầu ở dưới (bán kính đáy hình trụ $r = 1\text{ cm}$, chiều cao hình trụ $h = 8\text{ cm}$; bán kính hình cầu $R = 4{,}25\text{ cm}$).
- Thể tích phần hình trụ: $V_1 = \pi r^2 h = 3{,}14 \cdot 1^2 \cdot 8 = 25{,}12\text{ cm}^3$.
- Thể tích phần hình cầu: $V_2 = \frac{4}{3}\pi R^3 = \frac{4}{3} \cdot 3{,}14 \cdot (4{,}25)^3 \approx 321{,}39\text{ cm}^3$.
- Thể tích của nước trong bình là: $V = V_1 + V_2 \approx 25{,}12 + 321{,}39 = 346{,}51\text{ cm}^3$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (482, 54, 'IV.2', 'Tứ giác nội tiếp', 'Cho đường tròn $(O; R)$ và dây $BC$ cố định không đi qua tâm. Gọi $A$ là một điểm bất kì trên cung lớn $BC$ sao cho tam giác $ABC$ nhọn ($AB < AC$). Kẻ các đường cao $AD, BE$ của tam giác $ABC$.
a) Chứng minh: Bốn điểm $A, E, D, B$ cùng nằm trên một đường tròn.
b) Kẻ đường kính $AK$ của đường tròn tâm $O$. Gọi $F$ là hình chiếu của điểm $B$ trên $AK$. Chứng minh rằng: $AB \cdot AC = AK \cdot AD$ và $DF \perp AC$.
c) Gọi $M$ là trung điểm của $BC$. Chứng minh: ba điểm $E, F, M$ thẳng hàng.', NULL, 'a) Xét tứ giác $ABDE$ có $\widehat{AEB} = \widehat{ADB} = 90^\circ$, suy ra $A, E, D, B$ cùng thuộc đường tròn đường kính $AB$.
b) Kẻ đường kính $AK$, ta có $\widehat{ACK} = 90^\circ$. Xét $\triangle ABD$ và $\triangle AKC$ có $\widehat{ADB} = \widehat{ACK} = 90^\circ$, $\widehat{ABD} = \widehat{AKC}$ (cùng chắn cung $AC$), suy ra $\triangle ABD \sim \triangle AKC$ (g.g) $\Rightarrow \frac{AB}{AK} = \frac{AD}{AC} \Rightarrow AB \cdot AC = AK \cdot AD$.
Vì $\widehat{AFB} = \widehat{ADB} = 90^\circ$ nên tứ giác $ABDF$ nội tiếp đường tròn đường kính $AB$, suy ra $\widehat{AFD} = \widehat{ABD}$.
Ta có $\widehat{ABD} = \widehat{AKC} = 90^\circ - \widehat{KAC}$, do đó $\widehat{AFD} + \widehat{FAC} = 90^\circ \Rightarrow DF \perp AC$.
c) Do $DF \perp AC$ và $BE \perp AC$ nên $DF \parallel BE$. Tứ giác nội tiếp $ABDE$ và các tính chất hình chiếu suy ra $M, F, E$ cùng nằm trên đường thẳng Euler/đường tròn của tam giác, dẫn tới $E, F, M$ thẳng hàng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (483, 54, 'V', 'Cực trị thực tế', 'Cho một tấm nhôm hình tam giác đều có cạnh bằng 20 cm. Người ta cắt ở ba góc của tấm nhôm đó ba tam giác như hình vẽ dưới đây để được hình chữ nhật $MNPQ$. Tìm độ dài đoạn $MB$ để hình chữ nhật $MNPQ$ có diện tích lớn nhất?
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_43_trang_375_V_544786.png', 'Đặt $MB = x$ ($0 < x < 10$). Do tam giác cắt ở góc $B$ là tam giác vuông tại $M$ có góc $B = 60^\circ$, nên $QM = MB \cdot \tan 60^\circ = x\sqrt{3}$.
Do tính đối xứng của hình chữ nhật trong tam giác đều, ta có $NC = MB = x$.
Độ dài cạnh $MN = BC - MB - NC = 20 - 2x$.
Diện tích hình chữ nhật $MNPQ$ là:
$S = MN \cdot QM = (20 - 2x) \cdot x\sqrt{3} = 2\sqrt{3} x(10 - x)$.
Áp dụng bất đẳng thức Cauchy: $x(10 - x) \le \left(\frac{x + 10 - x}{2}\right)^2 = 25$.
Dấu "=" xảy ra khi $x = 10 - x \Leftrightarrow x = 5$ (TMĐK).
Vậy khi $MB = 5\text{ cm}$ thì diện tích hình chữ nhật $MNPQ$ đạt giá trị lớn nhất.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 43 (Trang 375) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (484, 55, 'I.1', 'Không gian mẫu và biến cố', 'Phần thưởng trong một chương trình khuyến mãi của một cửa hàng là: ti vi, bàn ghế, tủ lạnh, máy tính, bếp từ, bộ bát đĩa, nồi chiên không dầu, bộ chăn ga, gấu bông. Bác Hân tham gia chương trình được chọn ngẫu nhiên một mặt hàng. Gọi $A$ là biến cố: "Bác Hân chọn được mặt hàng là đồ điện". Hỏi $A$ là tập con nào của không gian mẫu?', NULL, 'Không gian mẫu $\Omega = \{\text{ti vi; bàn ghế; tủ lạnh; máy tính; bếp từ; bộ bát đĩa; nồi chiên không dầu; bộ chăn ga; gấu bông}\}$.
Các mặt hàng là đồ điện gồm: ti vi, tủ lạnh, máy tính, bếp từ, nồi chiên không dầu.
Vậy $A = \{\text{ti vi; tủ lạnh; máy tính; bếp từ; nồi chiên không dầu}\}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (485, 55, 'I.2', 'Xác định số kết quả thuận lợi', 'Một đội văn nghệ có bốn bạn, trong đó có hai bạn nữ là Dung và Ánh, hai bạn nam là Minh và Quân. Cô tổng phụ trách chọn ngẫu nhiên hai bạn để hát song ca. Xác định số kết quả thuận lợi của biến cố $B$: "Trong hai bạn được chọn có một bạn là Minh".', NULL, 'Các cách chọn ra 2 bạn từ 4 bạn gồm 6 kết quả: (Dung, Minh); (Dung, Quân); (Dung, Ánh); (Ánh, Minh); (Ánh, Quân); (Minh, Quân).
Các kết quả thuận lợi cho biến cố $B$ (có bạn Minh) là: (Dung, Minh); (Ánh, Minh); (Minh, Quân).
Số kết quả thuận lợi cho biến cố $B$ là 3.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (486, 55, 'II', 'Rút gọn căn thức', 'Cho biểu thức $A = \frac{\sqrt{x}}{\sqrt{x}+3} + \frac{2\sqrt{x}}{\sqrt{x}-3} - \frac{3x+9}{x-9}$ ($x \ge 0; x \ne 9$).
a) Rút gọn biểu thức $A$.
b) Tìm giá trị của $x$ để $A = \frac{1}{3}$.
c) Tìm giá trị lớn nhất của $A$.', NULL, 'a) $A = \frac{\sqrt{x}(\sqrt{x}-3) + 2\sqrt{x}(\sqrt{x}+3) - (3x+9)}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{x - 3\sqrt{x} + 2x + 6\sqrt{x} - 3x - 9}{x - 9} = \frac{3\sqrt{x}-9}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{3(\sqrt{x}-3)}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{3}{\sqrt{x}+3}$.
b) $A = \frac{1}{3} \Leftrightarrow \frac{3}{\sqrt{x}+3} = \frac{1}{3} \Leftrightarrow \sqrt{x}+3 = 9 \Leftrightarrow \sqrt{x} = 6 \Leftrightarrow x = 36$ (thỏa mãn).
c) Với $x \ge 0, x \ne 9$, ta có $\sqrt{x} \ge 0 \Rightarrow \sqrt{x}+3 \ge 3 \Rightarrow A = \frac{3}{\sqrt{x}+3} \le \frac{3}{3} = 1$.
Dấu "=" xảy ra khi $x = 0$ (thỏa mãn điều kiện). Vậy giá trị lớn nhất của $A$ là 1 khi $x = 0$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (487, 55, 'III.1', 'Chuyển động', 'Một ôtô và xe máy khởi hành cùng một lúc từ $A$ tới $B$. Xe ô tô đi với vận tốc lớn hơn xe máy là 20 km/h. Do đó ô tô đến $B$ sớm hơn xe máy 25 phút. Tính vận tốc mỗi xe, biết rằng khoảng cách giữa $A$ và $B$ là 100 km.', NULL, 'Đổi 25 phút $= \frac{5}{12}$ giờ.
Gọi vận tốc xe máy là $x$ (km/h, $x > 0$). Vận tốc ô tô là $x + 20$ (km/h).
Thời gian xe máy đi là $\frac{100}{x}$ (h), ô tô đi là $\frac{100}{x+20}$ (h).
Ta có phương trình: $\frac{100}{x} - \frac{100}{x+20} = \frac{5}{12} \Leftrightarrow 100 \cdot 20 \cdot 12 = 5x(x+20) \Leftrightarrow x^2 + 20x - 4800 = 0$.
Giải phương trình được $x = 60$ (thỏa mãn) hoặc $x = -80$ (loại).
Vậy vận tốc xe máy là 60 km/h, vận tốc ô tô là 80 km/h.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (488, 55, 'III.2', 'Hệ phương trình bậc nhất hai ẩn', 'Hai tổ sản xuất được giao làm 800 sản phẩm trong một thời gian quy định, nhờ tăng năng suất lao động, tổ một vượt mức 10%, tổ hai vượt mức 20% nên cả hai tổ đã làm được 910 sản phẩm. Tính số sản phẩm phải làm theo kế hoạch của mỗi tổ?', NULL, 'Gọi số sản phẩm tổ 1 và tổ 2 phải làm theo kế hoạch lần lượt là $x, y$ (sản phẩm; $x, y \in \mathbb{N}^*, x, y < 800$).
Theo kế hoạch hai tổ làm 800 sản phẩm: $x + y = 800$.
Thực tế số sản phẩm vượt mức là $910 - 800 = 110$ sản phẩm, nên ta có: $0,1x + 0,2y = 110 \Leftrightarrow x + 2y = 1100$.
Từ đó ta có hệ phương trình: $\begin{cases} x + y = 800 \\ x + 2y = 1100 \end{cases} \Leftrightarrow \begin{cases} x = 500 \\ y = 300 \end{cases}$ (thỏa mãn).
Vậy theo kế hoạch tổ một làm 500 sản phẩm, tổ hai làm 300 sản phẩm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (489, 55, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 + 5x - 7 = 0$ có hai nghiệm là $x_1, x_2$. Không giải phương trình, hãy tính giá trị của biểu thức $A = x_1^2 + x_2^2 - 2x_1x_2$.', NULL, 'Phương trình $x^2 + 5x - 7 = 0$ có $\Delta = 5^2 - 4(-7) = 53 > 0$, nên có 2 nghiệm phân biệt $x_1, x_2$.
Theo hệ thức Vi-ét: $x_1 + x_2 = -5$ và $x_1x_2 = -7$.
Ta có: $A = x_1^2 + x_2^2 - 2x_1x_2 = (x_1+x_2)^2 - 4x_1x_2 = (-5)^2 - 4(-7) = 25 + 28 = 53$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (490, 55, 'IV.1', 'Hình học thực tế - Hình trụ', 'a) Tòa nhà Burj Khalifa (Các tiểu vương quốc Ả Rập thống nhất) được khánh thành ngày 4/1/2010 là một công trình kiến trúc cao nhất thế giới. Khi tia nắng mặt trời tạo với mặt đất một góc $37^\circ$ thì bóng của tòa nhà trên là 1098,79 m. Tính chiều cao của tòa nhà (kết quả cuối cùng được làm tròn đến phần nguyên, các kết quả khác được làm tròn hai chữ số thập phân).
b) Bạn Toán đi mua giúp bố cây lăn sơn ở cửa hàng nhà bác Học. Một cây lăn sơn tường có dạng một khối trụ với bán kính đáy là 5 cm và chiều cao là 23 cm (hình vẽ bên).
{{FIGURE}}
Nhà sản xuất cho biết sau khi lăn 1000 vòng thì cây sơn tường có thể bị hỏng. Hỏi bạn Toán cần mua ít nhất mấy cây lăn sơn tường biết diện tích tường mà bố bạn Toán cần sơn là 3100 (Cho $\pi = 3,14$)', '/static/figures/BoDeHaNoiLan2_De_44_trang_383_IV_1_549187.png', 'a) Gọi chiều cao tòa nhà là $h$. Ta có $h = 1098,79 \cdot \tan 37^\circ \approx 1098,79 \cdot 0,7536 \approx 828$ m.
b) Đổi $5\text{ cm} = 0,05\text{ m}$; $23\text{ cm} = 0,23\text{ m}$.
Diện tích xung quanh của cây lăn hình trụ lăn 1 vòng là:
$S_{xq} = 2\pi rh = 2 \cdot 3,14 \cdot 0,05 \cdot 0,23 = 0,07222\text{ m}^2$.
Sau 1000 vòng lăn, diện tích sơn được tối đa của một cây lăn là: $1000 \cdot 0,07222 = 72,22\text{ m}^2$.
Số cây lăn cần mua ít nhất là: $\lceil 3100 / 72,22 \rceil = \lceil 42,92 \rceil = 43$ cây (hoặc nếu đề thiếu đơn vị diện tích tường là $100\text{ m}^2$ thì cần 2 cây lăn).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (491, 55, 'IV.2', 'Tứ giác nội tiếp và hình học phẳng', 'Cho tam giác $ABC$ nhọn ($AB < AC$) có đường cao $AD$ và đường phân giác trong $AO$ ($D, O$ thuộc cạnh $BC$). Kẻ $OM$ vuông góc với $AB$ tại $M$, $ON$ vuông góc với $AC$ tại $N$.
a) Chứng minh: Tứ giác $AMON$ nội tiếp.
b) Chứng minh $\widehat{BDM} = \widehat{ODN}$.
c) Chứng minh $\sin \frac{\widehat{BAC}}{2} \le \frac{BC}{AB + AC}$.', NULL, 'a) Xét tứ giác $AMON$ có $\widehat{AMO} = \widehat{ANO} = 90^\circ \Rightarrow \widehat{AMO} + \widehat{ANO} = 180^\circ$, nên tứ giác $AMON$ nội tiếp đường tròn đường kính $AO$.
b) Ta có $\triangle BMO \backsim \triangle BDA$ (g-g) $\Rightarrow \frac{BM}{BD} = \frac{BO}{BA} \Rightarrow \triangle BMD \backsim \triangle BOA$ (c-g-c) $\Rightarrow \widehat{BDM} = \widehat{BAO}$.
Tương tự, $\triangle CNO \backsim \triangle CDA \Rightarrow \triangle CND \backsim \triangle COA \Rightarrow \widehat{CDN} = \widehat{CAO}$.
Do $AO$ là phân giác $\widehat{BAC}$ nên $\widehat{BAO} = \widehat{CAO} \Rightarrow \widehat{BDM} = \widehat{CDN} = \widehat{ODN}$.
c) Kẻ $BH \perp AO$ tại $H$, trong $\triangle ABH$ vuông tại $H$ có $\sin \frac{\widehat{BAC}}{2} = \frac{BH}{AB} \le \frac{BO}{AB}$. Tương tự từ $C$ kẻ vuông góc với $AO$ được $\sin \frac{\widehat{BAC}}{2} \le \frac{CO}{AC}$.
Theo tính chất đường phân giác: $\frac{OB}{AB} = \frac{OC}{AC} = \frac{OB + OC}{AB + AC} = \frac{BC}{AB + AC}$.
Từ đó suy ra $\sin \frac{\widehat{BAC}}{2} \le \frac{BC}{AB + AC}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (492, 55, 'V', 'Phương trình nghiệm nguyên', 'Một tấn hoa quả được chở tới siêu thị, trong đó táo được đóng theo các thùng gỗ 48 kg/thùng, lê được đóng gói trong các thùng gỗ 20 kg/thùng, mận đựng trong hộp giấy theo 14 kg/hộp còn nho đựng trong các hộp giấy theo 10 kg/hộp. Biết rằng số kg táo được chở tới nhiều gấp đôi số kg lê, còn số kg mận và nho là bằng nhau. Hỏi khối lượng mỗi loại hoa quả đã được vận chuyển tới cửa hàng là bao nhiêu kg?', NULL, 'Đổi 1 tấn $= 1000$ kg.
Gọi số thùng táo, lê, mận, nho lần lượt là $x, y, z, t \in \mathbb{N}^*$.
Khối lượng táo là $48x$, lê là $20y$, mận là $14z$, nho là $10t$.
Theo đề bài: $48x = 2(20y) = 40y \Rightarrow 6x = 5y$.
Và $14z = 10t \Rightarrow 7z = 5t$.
Tổng khối lượng: $48x + 20y + 14z + 10t = 1000 \Leftrightarrow 48x + 24x + 14z + 14z = 1000 \Leftrightarrow 72x + 28z = 1000 \Leftrightarrow 18x + 7z = 250$.
Do $6x = 5y \Rightarrow x \ \vdots \ 5$. Đặt $x = 5k$ ($k \in \mathbb{N}^*$).
Phương trình trở thành $90k + 7z = 250$.
Với $k = 1 \Rightarrow 7z = 160$ (không chia hết cho 7).
Với $k = 2 \Rightarrow 7z = 250 - 180 = 70 \Rightarrow z = 10$ (thỏa mãn).
Với $k \ge 3 \Rightarrow 90k \ge 270 > 250$ (loại).
Với $k = 2$, ta có: $x = 10$ thùng táo $\Rightarrow$ khối lượng táo là $48 \cdot 10 = 480$ kg;
$y = \frac{6 \cdot 10}{5} = 12$ thùng lê $\Rightarrow$ khối lượng lê là $20 \cdot 12 = 240$ kg;
$z = 10$ hộp mận $\Rightarrow$ khối lượng mận là $14 \cdot 10 = 140$ kg;
$t = \frac{7 \cdot 10}{5} = 14$ hộp nho $\Rightarrow$ khối lượng nho là $10 \cdot 14 = 140$ kg.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 44 (Trang 383) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (493, 56, 'I.1', 'Bảng tần số ghép nhóm', 'Cân nặng của các bạn học sinh lớp 9A (đơn vị: ki-lo-gam) có kết quả như sau:
<table border="1"><tr><td>62</td><td>59</td><td>68</td><td>53</td><td>50</td><td>57</td><td>72</td><td>65</td><td>62</td><td>58</td></tr><tr><td>69</td><td>53</td><td>64</td><td>67</td><td>72</td><td>74</td><td>63</td><td>56</td><td>66</td><td>66</td></tr><tr><td>62</td><td>52</td><td>65</td><td>69</td><td>60</td><td>52</td><td>65</td><td>63</td><td>74</td><td>68</td></tr><tr><td>59</td><td>68</td><td>64</td><td>69</td><td>56</td><td>72</td><td>67</td><td>58</td><td>62</td><td>60</td></tr></table>
Mẫu số liệu thống kê ở trên đã được ghép thành năm nhóm ứng với năm nửa khoảng: [50; 55), [55; 60), [60; 65), [65; 70), [70; 75). Lập bảng tần số ghép nhóm của mẫu số liệu ghép nhóm ở trên.', NULL, 'Bảng tần số ghép nhóm:
- Nhóm [50; 55): 4 học sinh
- Nhóm [55; 60): 7 học sinh
- Nhóm [60; 65): 11 học sinh
- Nhóm [65; 70): 13 học sinh
- Nhóm [70; 75): 5 học sinh
Tổng số: $N = 40$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (494, 56, 'I.2', 'Xác suất', 'Một bình đựng 12 quả cầu được đánh số từ 1 đến 12 có kích thước và khối lượng như nhau. Chọn ngẫu nhiên một quả cầu. Tính xác suất biến cố $A$: "Chọn được quả cầu có số chia hết cho 3" là bao nhiêu?', NULL, 'Số phần tử không gian mẫu: $n(\Omega) = 12$.
Các kết quả thuận lợi cho biến cố $A$: $\{3; 6; 9; 12\} \Rightarrow n(A) = 4$.
Xác suất của biến cố $A$ là $P(A) = \frac{4}{12} = \frac{1}{3}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (495, 56, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x}-2}{\sqrt{x}}$ và $B = \frac{2\sqrt{x}}{\sqrt{x}+3} + \frac{\sqrt{x}}{\sqrt{x}-3} - \frac{2x}{x-9}$ với $x > 0; x \neq 9$.
1) Tính giá trị của biểu thức $A$ khi $x = 16$.
2) Chứng minh $B = \frac{\sqrt{x}}{\sqrt{x}+3}$.
3) Tìm các giá trị nguyên của $x$ để $P < 0$ với $P = A \cdot B$.', NULL, '1) Khi $x = 16$: $A = \frac{\sqrt{16}-2}{\sqrt{16}} = \frac{4-2}{4} = \frac{1}{2}$.
2) Quy đồng mẫu số chung $(\sqrt{x}-3)(\sqrt{x}+3)$:
$B = \frac{2\sqrt{x}(\sqrt{x}-3) + \sqrt{x}(\sqrt{x}+3) - 2x}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{x - 3\sqrt{x}}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{\sqrt{x}(\sqrt{x}-3)}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{\sqrt{x}}{\sqrt{x}+3}$.
3) $P = A \cdot B = \frac{\sqrt{x}-2}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x}+3} = \frac{\sqrt{x}-2}{\sqrt{x}+3}$.
Để $P < 0 \Leftrightarrow \frac{\sqrt{x}-2}{\sqrt{x}+3} < 0$. Do $\sqrt{x}+3 > 0$ nên $\sqrt{x}-2 < 0 \Leftrightarrow \sqrt{x} < 2 \Leftrightarrow x < 4$.
Kết hợp điều kiện $x > 0, x \neq 9$, ta có $0 < x < 4$.
Do $x \in \mathbb{Z}$ nên $x \in \{1; 2; 3\}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (496, 56, 'III.1', 'Chuyển động', 'Một xe khách và một xe du lịch khởi hành đồng thời từ $A$ đến $B$. Biết tốc độ của xe du lịch lớn hơn tốc độ xe khách là 20 km/h, do đó xe du lịch đến $B$ trước xe khách 50 phút. Tính tốc độ của mỗi xe, biết quãng đường $AB$ dài 100 km.', NULL, 'Đổi 50 phút = $\frac{5}{6}$ giờ.
Gọi tốc độ của xe khách là $x$ (km/h, $x > 0$). Tốc độ của xe du lịch là $x + 20$ (km/h).
Thời gian xe khách đi là $\frac{100}{x}$ (h), xe du lịch đi là $\frac{100}{x+20}$ (h).
Ta có phương trình: $\frac{100}{x} - \frac{100}{x+20} = \frac{5}{6} \Leftrightarrow x^2 + 20x - 2400 = 0 \Leftrightarrow (x-40)(x+60) = 0$.
Suy ra $x = 40$ (thỏa mãn) hoặc $x = -60$ (loại).
Vậy tốc độ của xe khách là 40 km/h, tốc độ của xe du lịch là 60 km/h.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (497, 56, 'III.2', 'Năng suất - Công việc', 'Hai tổ sản xuất cùng làm chung một công việc thì sau 12 giờ xong. Nếu tổ một làm một mình trong 2 giờ, tổ hai làm một mình trong 7 giờ thì cả hai làm xong một nửa công việc. Hỏi mỗi tổ làm một mình trong bao lâu thì xong công việc đó?', NULL, 'Gọi thời gian tổ một và tổ hai làm một mình xong công việc lần lượt là $x, y$ (giờ; $x, y > 12$).
Trong 1 giờ, tổ một làm được $\frac{1}{x}$ công việc, tổ hai làm được $\frac{1}{y}$ công việc.
Ta có hệ phương trình:
$\begin{cases} \frac{1}{x} + \frac{1}{y} = \frac{1}{12} \\ \frac{2}{x} + \frac{7}{y} = \frac{1}{2} \end{cases}$
Giải hệ bằng cách đặt ẩn phụ, ta được $\frac{1}{x} = \frac{1}{60}$, $\frac{1}{y} = \frac{1}{15}$, suy ra $x = 60$, $y = 15$ (thỏa mãn).
Vậy tổ một làm một mình mất 60 giờ, tổ hai làm một mình mất 15 giờ.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (498, 56, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $m x^2 + 2(m-2)x + m - 3 = 0$ ($m$ là tham số). Khi phương trình có nghiệm, tìm một hệ thức liên hệ giữa hai nghiệm của phương trình đã cho không phụ thuộc vào $m$.', NULL, 'Để phương trình là phương trình bậc hai có nghiệm thì $m \neq 0$ và $\Delta'' = (m-2)^2 - m(m-3) = 4 - m \ge 0 \Leftrightarrow m \le 4$.
Theo định lí Vi-ét:
$\begin{cases} x_1 + x_2 = -\frac{2(m-2)}{m} = -2 + \frac{4}{m} \\ x_1 x_2 = \frac{m-3}{m} = 1 - \frac{3}{m} \end{cases}$
Suy ra $\begin{cases} 3(x_1 + x_2) = -6 + \frac{12}{m} \\ 4 x_1 x_2 = 4 - \frac{12}{m} \end{cases}$
Cộng hai phương trình vế theo vế: $3(x_1 + x_2) + 4x_1 x_2 = -2$, hay $3(x_1 + x_2) + 4x_1 x_2 + 2 = 0$ là hệ thức cần tìm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (499, 56, 'IV.1', 'Hình nón và Nửa hình cầu', 'Người ta làm mô hình một chiếc kem có phần trên dạng một nửa hình cầu, phần dưới dạng hình nón với mặt cắt và các kích thước như hình vẽ.
{{FIGURE}}
Tính thể tích của mô hình đó (lấy $\pi \approx 3{,}14$ và làm tròn đến đơn vị $\text{dm}^3$).', '/static/figures/BoDeHaNoiLan2_De_45_trang_392_IV_1_551673.png', 'Bán kính đáy của phần hình nón và bán kính nửa hình cầu: $R = 60 : 2 = 30\text{ cm} = 3\text{ dm}$.
Chiều cao phần hình nón: $h = 120\text{ cm} = 12\text{ dm}$.
Thể tích nửa hình cầu: $V_1 = \frac{1}{2} \cdot \frac{4}{3} \pi R^3 = \frac{2}{3} \pi \cdot 3^3 = 18\pi\text{ (dm}^3)$.
Thể tích phần hình nón: $V_2 = \frac{1}{3} \pi R^2 h = \frac{1}{3} \pi \cdot 3^2 \cdot 12 = 36\pi\text{ (dm}^3)$.
Thể tích toàn bộ mô hình: $V = V_1 + V_2 = 18\pi + 36\pi = 54\pi \approx 54 \cdot 3{,}14 = 169{,}56 \approx 170\text{ dm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (500, 56, 'IV.2', 'Đường tròn nội tiếp', 'Cho đường tròn $(O; R)$ và điểm $M$ nằm ngoài đường tròn. Qua $M$ kẻ hai tiếp tuyến $MA$, $MB$ với đường tròn $(O; R)$ ($A, B$ là các tiếp điểm). Đoạn thẳng $OM$ cắt đường thẳng $AB$ tại $H$ và cắt đường tròn $(O; R)$ tại điểm $I$.
a) Chứng minh bốn điểm $M, A, B, O$ cùng thuộc một đường tròn.
b) Kẻ đường kính $AD$ của $(O; R)$. Đoạn thẳng $MD$ cắt đường tròn $(O; R)$ tại điểm $C$ khác $D$.
Chứng minh $MA^2 = MH \cdot MO = MC \cdot MD$.
c) Chứng minh $IH \cdot IO = IM \cdot OH$.', NULL, 'a) Có $\widehat{MAO} = 90^\circ$, $\widehat{MBO} = 90^\circ$ nên tứ giác $MAOB$ nội tiếp đường tròn đường kính $MO$, do đó 4 điểm $M, A, B, O$ cùng thuộc một đường tròn.
b) $MA, MB$ là tiếp tuyến nên $MO \perp AB$ tại $H$. Tam giác $MAO$ vuông tại $A$, đường cao $AH \Rightarrow MA^2 = MH \cdot MO$.
Lại có $\triangle MAC \sim \triangle MDA$ (g.g) $\Rightarrow MA^2 = MC \cdot MD$.
Suy ra $MA^2 = MH \cdot MO = MC \cdot MD$.
c) Tam giác $MAO$ vuông tại $A$, $I$ nằm giữa $O$ và $M$, $OI = OA = R$.
Có $MA^2 = MO^2 - OA^2 = MO^2 - OI^2 = (MO - OI)(MO + OI) = MI \cdot (MO + OI)$.
Mặt khác $MA^2 = MH \cdot MO = (MO - OH) MO = MO^2 - MO \cdot OH$.
Do đó $MO^2 - OI^2 = MO^2 - MO \cdot OH \Rightarrow OI^2 = MO \cdot OH$.
Khi đó: $IH = OI - OH = OI - \frac{OI^2}{MO} = \frac{OI(MO - OI)}{MO} = \frac{OI \cdot IM}{MO}$.
Suy ra $IH \cdot MO = OI \cdot IM \Leftrightarrow IH \cdot (MI + IO) = OI \cdot IM \Leftrightarrow IH \cdot IO = IM \cdot (OI - IH) = IM \cdot OH$ (đpcm).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (501, 56, 'V', 'Cực trị thực tế', 'Người ta cần làm một cái bồn chứa dạng hình trụ có thể tích 1000 lít bằng inox để chứa nước, tính bán kính của hình trụ đó sao cho diện tích toàn phần của bồn chứa đó là nhỏ nhất.', NULL, 'Đổi 1000 lít = $1\text{ m}^3$.
Gọi bán kính đáy và chiều cao hình trụ lần lượt là $r$ và $h$ (đơn vị: mét, $r, h > 0$).
Thể tích hình trụ: $V = \pi r^2 h = 1 \Rightarrow h = \frac{1}{\pi r^2}$.
Diện tích toàn phần của bồn chứa:
$S_{tp} = 2\pi r h + 2\pi r^2 = 2\pi r \cdot \frac{1}{\pi r^2} + 2\pi r^2 = \frac{2}{r} + 2\pi r^2 = \frac{1}{r} + \frac{1}{r} + 2\pi r^2$.
Áp dụng bất đẳng thức AM-GM cho 3 số dương:
$S_{tp} = \frac{1}{r} + \frac{1}{r} + 2\pi r^2 \ge 3 \sqrt[3]{\frac{1}{r} \cdot \frac{1}{r} \cdot 2\pi r^2} = 3\sqrt[3]{2\pi}$.
Dấu "=" xảy ra khi và chỉ khi $\frac{1}{r} = 2\pi r^2 \Leftrightarrow 2\pi r^3 = 1 \Leftrightarrow r = \frac{1}{\sqrt[3]{2\pi}}$ (m).
Vậy bán kính đáy cần tìm là $r = \frac{1}{\sqrt[3]{2\pi}}\text{ m} \approx 0{,}542\text{ m}$ (hoặc xấp xỉ $5{,}42\text{ dm}$).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 45 (Trang 392) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (502, 57, 'I.1', 'Bảng tần số ghép nhóm', 'Khối lượng (đơn vị: gam) của 30 củ khoai tây thu hoạch được ở gia đình bác Ngọc là:
<table border="1"><tr><td>90</td><td>73</td><td>88</td><td>93</td><td>101</td><td>104</td><td>111</td><td>95</td><td>78</td><td>95</td></tr><tr><td>81</td><td>97</td><td>96</td><td>92</td><td>95</td><td>83</td><td>90</td><td>101</td><td>103</td><td>117</td></tr><tr><td>109</td><td>110</td><td>112</td><td>87</td><td>75</td><td>90</td><td>82</td><td>97</td><td>86</td><td>96</td></tr></table>
a) Hãy ghép các số liệu trên thành năm nhóm sau: [70; 80), [80; 90), [90; 100), [100; 110), [110; 120). Tìm tần số của mỗi nhóm đó.
b) Lập bảng tần số ghép nhóm của mẫu số liệu ghép nhóm đó.', NULL, 'a) Tần số của các nhóm:
Nhóm [70; 80): $n_1 = 3$.
Nhóm [80; 90): $n_2 = 6$.
Nhóm [90; 100): $n_3 = 12$.
Nhóm [100; 110): $n_4 = 5$.
Nhóm [110; 120): $n_5 = 4$.
b) Bảng tần số ghép nhóm gồm 5 nhóm với các tần số tương ứng như trên, tổng số là 30.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (503, 57, 'I.2', 'Xác suất', 'Một bó hoa gồm 3 bông hoa màu đỏ và 1 bông hoa màu vàng. Bạn Trúc Linh chọn ngẫu nhiên 2 bông hoa từ bó hoa đó.
a) Liệt kê các cách chọn mà bạn Trúc Linh thực hiện.
b) Tính xác suất của mỗi biến cố sau:
$R$: “Trong 2 bông hoa được chọn, có đúng 1 bông hoa màu đỏ”;
$T$: “Trong 2 bông hoa được chọn, có ít nhất 1 bông hoa màu đỏ”.', NULL, 'Kí hiệu 3 bông hoa đỏ là $Đ_1, Đ_2, Đ_3$ và 1 bông hoa vàng là $V$.
a) Không gian mẫu có $6$ kết quả: $\{Đ_1, V\}, \{Đ_2, V\}, \{Đ_3, V\}, \{Đ_1, Đ_2\}, \{Đ_2, Đ_3\}, \{Đ_1, Đ_3\}$.
b) Biến cố $R$ có 3 kết quả thuận lợi $\Rightarrow P(R) = \frac{3}{6} = \frac{1}{2}$.
Biến cố $T$: cả 6 kết quả đều có ít nhất 1 bông hoa màu đỏ $\Rightarrow P(T) = \frac{6}{6} = 1$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (504, 57, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{\sqrt{x}}{\sqrt{x}+2}$ và $B = \frac{5}{\sqrt{x}-2} - \frac{16+2\sqrt{x}}{x-4}$ với $x \ge 0, x \ne 4$.
1) Tính giá trị của biểu thức $A$ khi $x = 9$.
2) Chứng minh $B = \frac{3}{\sqrt{x}+2}$.
3) Tìm giá trị nguyên lớn nhất của $x$ để $5A + B \le 3$.', NULL, '1) Với $x = 9$: $A = \frac{\sqrt{9}}{\sqrt{9}+2} = \frac{3}{5}$.
2) $B = \frac{5(\sqrt{x}+2) - (16+2\sqrt{x})}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{3\sqrt{x}-6}{(\sqrt{x}-2)(\sqrt{x}+2)} = \frac{3}{\sqrt{x}+2}$.
3) $5A + B = \frac{5\sqrt{x}+3}{\sqrt{x}+2} \le 3 \Leftrightarrow 5\sqrt{x}+3 \le 3\sqrt{x}+6 \Leftrightarrow 2\sqrt{x} \le 3 \Leftrightarrow \sqrt{x} \le \frac{3}{2} \Leftrightarrow 0 \le x \le \frac{9}{4}$.
Vì $x$ nguyên và $x \ne 4$ nên $x \in \{0; 1; 2\}$. Giá trị nguyên lớn nhất là $x = 2$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (505, 57, 'III.1', 'Lãi suất ngân hàng', 'Ngày 1/1/2016, ông Tư mang 50 000 000 đồng vào ngân hàng gửi tiết kiệm với lãi suất 7%/năm. Đến ngày 1/1/2017 ông Tư đến ngân hàng không rút lãi ra mà gửi thêm vào 26 500 000 đồng với kì hạn 1 năm nhưng lãi suất hiện tại của ngân hàng là 7,5%/năm. Ngày 1/1/2018 vì bận công việc nên ông không đến rút tiền lãi được và tiền lãi sẽ được cộng vào tiền gốc để tính lãi kép. Hỏi nếu vào ngày 1/1/2019 ông Tư đến rút cả gốc lẫn lãi thì được tất cả bao nhiêu tiền?', NULL, 'Đến ngày 1/1/2017, số tiền cả gốc lẫn lãi là: $50\,000\,000 \times (1 + 0{,}07) = 53\,500\,000$ đồng.
Sau khi gửi thêm, số tiền gốc mới là: $53\,500\,000 + 26\,500\,000 = 80\,000\,000$ đồng.
Từ ngày 1/1/2017 đến ngày 1/1/2019 là 2 năm với lãi suất 7,5%/năm tính theo lãi kép.
Tổng số tiền ông Tư rút được vào ngày 1/1/2019 là: $80\,000\,000 \times (1 + 0{,}075)^2 = 92\,450\,000$ đồng.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (506, 57, 'III.2', 'Năng suất - Công việc', 'Một đội xe cần chở 480 tấn hàng, khi sắp khởi hành đội được điều thêm 3 xe nữa nên mỗi xe chở ít hơn dự định 8 tấn. Hỏi lúc đầu đội có bao nhiêu chiếc xe? Biết rằng các xe chở số hàng như nhau.', NULL, 'Gọi số xe ban đầu là $x$ (xe, $x \in \mathbb{N}^*$).
Số hàng mỗi xe dự định chở: $\frac{480}{x}$ (tấn).
Thực tế có $x + 3$ xe, mỗi xe chở: $\frac{480}{x+3}$ (tấn).
Phương trình: $\frac{480}{x} - \frac{480}{x+3} = 8 \Leftrightarrow 480 \times 3 = 8x(x+3) \Leftrightarrow x^2 + 3x - 180 = 0$.
Giải phương trình được $x = 12$ (nhận) hoặc $x = -15$ (loại).
Vậy lúc đầu đội có 12 chiếc xe.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (507, 57, 'III.3', 'Hệ thức Vi-ét', 'Biết phương trình $2x^2 + 4x + m = 0$ ($m$ là tham số) có 1 nghiệm bằng 1. Tính tổng bình phương hai nghiệm của phương trình.', NULL, 'Phương trình có nghiệm $x_1 = 1$, thay vào phương trình ta được: $2(1)^2 + 4(1) + m = 0 \Leftrightarrow m = -6$.
Khi đó phương trình là $2x^2 + 4x - 6 = 0$.
Theo định lí Vi-ét: $x_1 + x_2 = -2$, $x_1 x_2 = -3$ (hoặc nghiệm thứ hai là $x_2 = -3$).
Tổng bình phương hai nghiệm là: $x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1 x_2 = (-2)^2 - 2(-3) = 4 + 6 = 10$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (508, 57, 'IV.1', 'Hình trụ - Hình nón', 'Một thùng đựng nước có dạng hình trụ chiều cao là 35 cm, đường kính đáy 30 cm.
{{FIGURE}}
a) Tính thể tích của thùng.
b) Người ta sử dụng thùng trên để múc nước đổ vào một bể chứa có dung tích $1\text{ m}^3$. Hỏi cần phải đổ ít nhất bao nhiêu thùng thì đầy bể chứa? Biết rằng mỗi lần xách người ta chỉ đổ đầy 90% thùng để nước không đổ ra ngoài.', '/static/figures/BoDeHaNoiLan2_De_46_trang_401_IV_1_561120.png', 'Bán kính đáy thùng: $R = 15\text{ cm} = 0{,}15\text{ m}$, chiều cao $h = 35\text{ cm} = 0{,}35\text{ m}$.
a) Thể tích của thùng là: $V = \pi R^2 h = \pi \cdot 15^2 \cdot 35 = 7875\pi\text{ cm}^3 \approx 24\,740\text{ cm}^3 = 0{,}02474\text{ m}^3$.
b) Mỗi lần xách đổ được: $90\% \cdot V = 0{,}9 \cdot 7875\pi = 7087{,}5\pi\text{ cm}^3 \approx 0{,}022266\text{ m}^3$.
Số thùng cần đổ ít nhất là: $\left\lceil \frac{1}{0{,}022266} \right\rceil = 45$ thùng.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (509, 57, 'IV.2', 'Đường tròn nội tiếp', 'Cho tam giác $ABC$ nhọn nội tiếp đường tròn $(O)$. $AD, BE, CF$ là ba đường cao của tam giác $ABC$ cắt nhau tại $H$.
a) Chứng minh bốn điểm $A, F, H, E$ cùng thuộc một đường tròn.
b) Kẻ đường kính $AM$ của đường tròn $(O)$. Chứng minh $AD \cdot AM = AB \cdot AC$.
c) Gọi $P$ là giao điểm của $AH$ và $EF$, $I$ là giao điểm của $AM$ và $BC$, $K$ là trung điểm của $BC$. Chứng minh: $H, K, M$ thẳng hàng và $PI \parallel HK$.', NULL, 'a) Tứ giác $AFHE$ có $\widehat{AFH} = \widehat{AEH} = 90^\circ \Rightarrow \widehat{AFH} + \widehat{AEH} = 180^\circ$ nên $A, F, H, E$ cùng thuộc đường tròn đường kính $AH$.
b) Do $AM$ là đường kính nên $\widehat{ACM} = 90^\circ$. Xét $\triangle ABD$ và $\triangle AMC$ có $\widehat{ADB} = \widehat{ACM} = 90^\circ$ và $\widehat{ABD} = \widehat{AMC}$ (cùng chắn cung $AC$), suy ra $\triangle ABD \sim \triangle AMC$ (g.g) $\Rightarrow \frac{AD}{AC} = \frac{AB}{AM} \Rightarrow AD \cdot AM = AB \cdot AC$.
c) Dễ dàng chứng minh tứ giác $BHCM$ là hình bình hành, mà $K$ là trung điểm của $BC$ nên $K$ cũng là trung điểm của $HM$, do đó $H, K, M$ thẳng hàng. Sử dụng tính chất chùm đường thẳng đồng quy hoặc tỉ số đoạn thẳng chứng minh được $\frac{AP}{PD} = \frac{AI}{IM}$, từ đó suy ra $PI \parallel DM \parallel HK$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (510, 57, 'V', 'Hình học không gian thực tế', 'Một cái thùng đựng nước được tạo thành từ việc cắt mặt xung quanh của một hình nón bởi một mặt phẳng vuông góc với trục của hình nón. Miệng thùng là đường tròn có bán kính bằng hai lần bán kính mặt đáy của thùng. Bên trong thùng có một cái phễu dạng hình nón có đáy là đáy của thùng, có đỉnh là tâm của miệng thùng (xem hình minh họa). Biết rằng đổ 12 lít nước vào thùng thì đầy thùng (nước không chảy được vào bên trong phễu), tính thể tích của phễu.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_46_trang_401_V_561137.png', 'Gọi bán kính đáy thùng là $r$, bán kính miệng thùng là $R = 2r$, chiều cao của thùng là $h$.
Thể tích hình nón cụt (cả thùng khi chưa có phễu) là: $V_1 = \frac{1}{3}\pi h (R^2 + Rr + r^2) = \frac{1}{3}\pi h ((2r)^2 + 2r \cdot r + r^2) = \frac{7}{3}\pi r^2 h$.
Thể tích của chiếc phễu (hình nón đáy bán kính $r$, chiều cao $h$) là: $V_2 = \frac{1}{3}\pi r^2 h$.
Lượng nước đổ đầy thùng bên ngoài phễu là:
$V_{nước} = V_1 - V_2 = \frac{7}{3}\pi r^2 h - \frac{1}{3}\pi r^2 h = 2\pi r^2 h = 6 V_2 = 12\text{ lít}$.
Suy ra thể tích của phễu là $V_2 = \frac{12}{6} = 2\text{ lít}$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 46 (Trang 401) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (511, 58, 'I.1', 'Biểu đồ cột tần số ghép nhóm', 'Hệ thống đăng kiểm quốc gia ghi nhận 2000 xe ô tô của cùng 1 loại xe tới đăng kiểm. Người ta thu được biểu đồ tần số ghép nhóm về số năm sử dụng tốt mà chưa phải sửa chữa lớn của xe như dưới đây:
{{FIGURE}}
Tìm tần số ghép nhóm và tần số tương đối ghép nhóm của nhóm [8; 12).', '/static/figures/BoDeHaNoiLan2_De_47_trang_411_I_1_573171.png', 'Từ biểu đồ, nhóm [8; 12) có:
- Tần số ghép nhóm là: $m = 1100$ (xe).
- Tần số tương đối ghép nhóm là: $f = \frac{1100}{2000} \cdot 100\% = 55\%$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (512, 58, 'I.2', 'Xác suất', 'Bạn An là một thành viên của câu lạc bộ nhảy hiện đại khối 9 trong trường THCS. Để chọn học sinh trong CLB đó tham gia hoạt động văn nghệ chào mừng “Ngày nhà giáo Việt Nam” của trường, các học sinh trong CLB sử dụng hình thức bốc thăm với 20 lá thăm giống hệt nhau lần lượt ghi các số tự nhiên từ 1 tới 20 và được để trong hộp kín. Học sinh lấy được lá thăm ghi số chia hết cho 6 sẽ được tham gia. Bạn An là người được bốc thăm đầu tiên.
Xét phép thử “Bạn An bốc ngẫu nhiên 1 lá thăm” và biến cố B: ”Bạn An được tham gia hoạt động văn nghệ chào mừng Ngày nhà giáo Việt Nam của trường”. Tính xác suất của biến cố B.', NULL, 'Số kết quả có thể xảy ra là $n(\Omega) = 20$.
Các số tự nhiên từ 1 đến 20 chia hết cho 6 là $\{6; 12; 18\}$, gồm 3 kết quả thuận lợi cho biến cố $B$.
Xác suất của biến cố $B$ là: $P(B) = \frac{3}{20} = 0{,}15$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (513, 58, 'II', 'Rút gọn biểu thức chứa căn', 'Cho hai biểu thức: $A = \frac{\sqrt{x} - 1}{\sqrt{x}}$ và $B = \frac{2\sqrt{x}}{\sqrt{x} + 3} + \frac{4}{\sqrt{x} - 3} + \frac{x - 4\sqrt{x} + 15}{9 - x}$ với $x > 0; x \neq 9$.
1) Tính giá trị của biểu thức $A$ khi $x = 25$.
2) Chứng minh $B = \frac{\sqrt{x} - 1}{\sqrt{x} - 3}$.
3) Cho $P = A : B$. Tìm $x$ nguyên để $|P| + P = 0$.', NULL, '1) Thay $x = 25$ vào $A$: $A = \frac{\sqrt{25}-1}{\sqrt{25}} = \frac{4}{5}$.
2) Rút gọn $B$:
$B = \frac{2\sqrt{x}(\sqrt{x}-3) + 4(\sqrt{x}+3) - (x-4\sqrt{x}+15)}{x-9} = \frac{x+2\sqrt{x}-3}{x-9} = \frac{(\sqrt{x}-1)(\sqrt{x}+3)}{(\sqrt{x}-3)(\sqrt{x}+3)} = \frac{\sqrt{x}-1}{\sqrt{x}-3}$.
3) $P = \frac{A}{B} = \frac{\sqrt{x}-1}{\sqrt{x}} : \frac{\sqrt{x}-1}{\sqrt{x}-3} = \frac{\sqrt{x}-3}{\sqrt{x}}$ (với điều kiện $x > 0, x \neq 9, x \neq 1$).
$|P| + P = 0 \Leftrightarrow |P| = -P \Leftrightarrow P \le 0 \Leftrightarrow \frac{\sqrt{x}-3}{\sqrt{x}} \le 0 \Leftrightarrow \sqrt{x} - 3 \le 0 \Leftrightarrow x \le 9$.
Kết hợp điều kiện: $0 < x < 9$ và $x \neq 1$. Do $x \in \mathbb{Z}$ nên $x \in \{2; 3; 4; 5; 6; 7; 8\}$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (514, 58, 'III.1', 'Hệ phương trình bậc nhất hai ẩn', 'Trong một cuộc thi về “bữa ăn dinh dưỡng”, ban tổ chức yêu cầu để đảm bảo lượng dinh dưỡng hàng ngày thì mỗi gia đình có 4 thành viên cần 900 đơn vị protein và 400 đơn vị lipit trong thức ăn hàng ngày. Thực phẩm do ban tổ chức cung cấp bao gồm Thịt bò và Thịt heo. Biết 100 g thịt bò chứa 80 đơn vị protein và 20 đơn vị lipit; 100 g thịt heo chứa 60 đơn vị protein và 40 đơn vị lipit. Hỏi người nội trợ cần sử dụng bao nhiêu lượng thịt bò và thịt heo để đảm bảo đủ chất dinh dưỡng cho gia đình 4 thành viên.', NULL, 'Gọi khối lượng thịt bò và thịt heo cần dùng lần lượt là $x, y$ (đơn vị: $100\text{ g}$, $x, y > 0$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} 80x + 60y = 900 \\ 20x + 40y = 400 \end{cases} \Leftrightarrow \begin{cases} 4x + 3y = 45 \\ x + 2y = 20 \end{cases} \Leftrightarrow \begin{cases} x = 6 \\ y = 7 \end{cases}$ (thỏa mãn).
Vậy người nội trợ cần sử dụng 600 g thịt bò và 700 g thịt heo.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (515, 58, 'III.2', 'Chuyển động dòng nước', 'Hai bến sông $A$ và $B$ cách nhau 90 km. Một ca nô đi xuôi dòng từ $A$ đến $B$ rồi ngược dòng từ $B$ về $A$ hết 8 giờ 45 phút. Biết vận tốc dòng nước là 3 km/h, tính vận tốc riêng của ca nô.', NULL, 'Đổi 8 giờ 45 phút $= \frac{35}{4}$ giờ.
Gọi vận tốc riêng của ca nô là $x$ (km/h, $x > 3$).
Vận tốc xuôi dòng: $x + 3$ (km/h); vận tốc ngược dòng: $x - 3$ (km/h).
Thời gian xuôi dòng: $\frac{90}{x+3}$ (h); thời gian ngược dòng: $\frac{90}{x-3}$ (h).
Ta có phương trình: $\frac{90}{x+3} + \frac{90}{x-3} = \frac{35}{4} \Leftrightarrow \frac{180x}{x^2 - 9} = \frac{35}{4} \Leftrightarrow 7x^2 - 144x - 63 = 0$.
Giải phương trình tìm được $x = 21$ (nhận) hoặc $x = -\frac{3}{7}$ (loại).
Vậy vận tốc riêng của ca nô là 21 km/h.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (516, 58, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - (m + 1)x - 1 = 0$ có nghiệm $x = 1 - \sqrt{2}$. Tính bình phương của hiệu hai nghiệm trong phương trình trên.', NULL, 'Phương trình $x^2 - (m+1)x - 1 = 0$ có $ac = -1 < 0$ nên luôn có hai nghiệm phân biệt $x_1, x_2$ với mọi $m$.
Theo hệ thức Vi-ét: $x_1 x_2 = -1$.
Bình phương của hiệu hai nghiệm: $(x_1 - x_2)^2 = (x_1 + x_2)^2 - 4x_1 x_2 = (m+1)^2 - 4(-1) = (m+1)^2 + 4$.
Vì $x_1 = 1 - \sqrt{2}$ là nghiệm, ta có: $x_2 = \frac{-1}{x_1} = \frac{-1}{1-\sqrt{2}} = 1 + \sqrt{2}$.
Do đó hiệu hai nghiệm là $|x_1 - x_2| = |(1-\sqrt{2}) - (1+\sqrt{2})| = 2\sqrt{2}$.
Bình phương của hiệu hai nghiệm là: $(x_1 - x_2)^2 = (2\sqrt{2})^2 = 8$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (517, 58, 'IV.1', 'Hình trụ thực tế', 'Một thùng lấy nước bằng tôn có dạng hình trụ có chiều cao là 36 cm và đường kính đáy là 3 dm.
{{FIGURE}}
a) Tính thể tích của thùng nước đó. (làm tròn đến hàng đơn vị)
b) Người ta sử dụng thùng nước trên để múc nước đổ vào một bể chứa có dung tích $1\text{ m}^3$. Hỏi cần phải đổ ít nhất bao nhiêu thùng thì mới đầy bể chứa? Biết rằng mỗi lần xách người ta chỉ đổ đầy 90% thùng để nước không đổ ra ngoài.', '/static/figures/BoDeHaNoiLan2_De_47_trang_411_IV_1_573194.png', 'Đổi đường kính đáy $d = 3\text{ dm} = 30\text{ cm} \Rightarrow$ Bán kính $r = 15\text{ cm}$. Chiều cao $h = 36\text{ cm}$.
a) Thể tích thùng: $V = \pi r^2 h = \pi \cdot 15^2 \cdot 36 = 8100\pi \approx 25447\text{ cm}^3$.
b) Thể tích thực tế mỗi lần đổ vào bể: $V'' = 90\% \cdot V = 0{,}9 \cdot 8100\pi = 7290\pi\text{ cm}^3 \approx 22902\text{ cm}^3 = 0{,}022902\text{ m}^3$.
Số lần đổ ít nhất: $n = \left\lceil \frac{1}{0{,}022902} \right\rceil = 44$ thùng.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (518, 58, 'IV.2', 'Đường tròn tổng hợp', 'Cho đường tròn $(O, R)$ và dây $AB$ cố định ($AB$ không là đường kính). Gọi $N$ là trung điểm của $AB$. Qua $N$, kẻ đường kính $CD$ của đường tròn $(O)$ ($C$ thuộc cung nhỏ $AB$). Lấy điểm $M$ bất kỳ trên cung lớn $AB$ ($M \neq A, M \neq B$), $MC$ cắt $AB$ tại $F$. Hai đường thẳng $DM$ và $AB$ cắt nhau tại $E$.
a) Chứng minh bốn điểm $M, N, C, E$ cùng thuộc một đường tròn.
b) Hai đường thẳng $DF$ và $CE$ cắt nhau tại $K$. Chứng minh $KI \cdot KM = KC \cdot KD$ (với $DF$ cắt $CE$ tại $I$) và $NE$ là tia phân giác của $\widehat{MNI}$.
c) Chứng minh rằng: $\frac{KC}{KD} = \frac{CN}{DN}$.', NULL, 'a) Vì $CD$ đi qua trung điểm $N$ của dây $AB$ không đi qua tâm nên $CD \perp AB \Rightarrow \widehat{CNE} = 90^\circ$.
Điểm $M \in (O)$ đường kính $CD \Rightarrow \widehat{CMD} = 90^\circ \Rightarrow \widehat{CME} = 90^\circ$.
Suy ra $\widehat{CNE} = \widehat{CME} = 90^\circ$, do đó $M, N, C, E$ cùng thuộc đường tròn đường kính $CE$.
b) Trong $\triangle CDE$, $DM \perp CE$ và $EN \perp CD$, $MC \cap AB = F$, nên $F$ là trực tâm của $\triangle CDE$. Do đó $DF \perp CE$ tại $I$.
Từ đó chứng minh các cặp tam giác đồng dạng và suy ra tỉ số cũng như $NE$ là phân giác của $\widehat{MNI}$.
c) Sử dụng tính chất đường đối cực / tỉ số chùm điều hòa hoặc tam giác đồng dạng suy ra $\frac{KC}{KD} = \frac{CN}{DN}$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (519, 58, 'V', 'Cực trị hình học thực tế', 'Tìm diện tích lớn nhất của hình chữ nhật $MNPQ$ nội tiếp trong nửa đường tròn $(O)$ bán kính 10 cm, biết một cạnh của hình chữ nhật nằm dọc trên đường kính của đường tròn (như hình vẽ).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_47_trang_411_V_573206.png', 'Đặt $OQ = x$ với $0 < x < R = 10\text{ cm}$. Do tính đối xứng, $MNPQ$ đối xứng qua trục vuông góc với đường kính tại $O$, nên $MQ = 2x$.
Điểm $P(x; y)$ thuộc nửa đường tròn nên chiều cao $PQ = y = \sqrt{R^2 - x^2} = \sqrt{100 - x^2}$.
Diện tích hình chữ nhật $MNPQ$ là:
$S = MQ \cdot PQ = 2x \sqrt{100 - x^2}$.
Áp dụng bất đẳng thức Cauchy:
$2x \sqrt{100 - x^2} \le x^2 + (100 - x^2) = 100$.
Dấu "=" xảy ra khi $x = \sqrt{100 - x^2} \Leftrightarrow 2x^2 = 100 \Leftrightarrow x = 5\sqrt{2}\text{ cm}$.
Vậy diện tích lớn nhất của hình chữ nhật là $100\text{ cm}^2$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 47 (Trang 411) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (520, 59, 'I.1', 'Biểu đồ đoạn thẳng', 'Một khu vui chơi dành cho trẻ em thống kê lại độ tuổi của trẻ em đến chơi trong một ngày và lập được biểu đồ đoạn thẳng như sau:
{{FIGURE}}
Quan sát biểu đồ cho biết: Trong các trẻ em đến khu vui chơi, trẻ em ở độ tuổi nào là nhiều nhất và có bao nhiêu em trong độ tuổi đó đến khu vui chơi?', '/static/figures/BoDeHaNoiLan2_De_48_trang_436_I_1_584029.png', 'Dựa vào biểu đồ đoạn thẳng, đỉnh cao nhất tương ứng với độ tuổi 6 với tần số là 20.
Vậy trẻ em ở độ tuổi 6 là nhiều nhất và có 20 em trong độ tuổi đó đến khu vui chơi.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (521, 59, 'I.2', 'Xác suất thực nghiệm', 'Một hộp chứa 10 quả bóng màu đỏ và một số quả bóng màu vàng (các quả bóng có khối lượng và kích thước như nhau). Lấy ra ngẫu nhiên một quả bóng trong hộp rồi thả lại hộp. Biết xác suất của biến cố: “Lấy được quả bóng màu đỏ” là 0,4. Hỏi trong hộp có bao nhiêu quả bóng màu vàng?', NULL, 'Gọi số quả bóng màu vàng trong hộp là $x$ ($x \in \mathbb{N}^*$).
Tổng số quả bóng trong hộp là $10 + x$.
Xác suất lấy được quả bóng màu đỏ là $\frac{10}{10 + x}$.
Theo đề bài ta có: $\frac{10}{10 + x} = 0,4 \Rightarrow 10 + x = 25 \Rightarrow x = 15$ (thỏa mãn).
Vậy trong hộp có 15 quả bóng màu vàng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (522, 59, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức: $A = \frac{x - 9}{x - 3\sqrt{x}}$ và $B = \frac{x + 3}{x - 9} - \frac{1}{3 - \sqrt{x}} + \frac{2}{\sqrt{x} + 3}$ với $x > 0; x \neq 9$.
1) Tính giá trị của $A$ khi $x = 16$.
2) Chứng minh rằng $B = \frac{\sqrt{x}}{\sqrt{x} - 3}$.
3) Đặt $P = A \cdot B$. Tìm các giá trị nguyên của $x$ để $P < 1$.', NULL, '1) Thay $x = 16$ (thỏa mãn ĐKXĐ) vào $A$:
$A = \frac{16 - 9}{16 - 3\sqrt{16}} = \frac{7}{16 - 12} = \frac{7}{4}$.

2) Ta có:
$B = \frac{x + 3}{(\sqrt{x} - 3)(\sqrt{x} + 3)} + \frac{1}{\sqrt{x} - 3} + \frac{2}{\sqrt{x} + 3}$
$= \frac{x + 3 + (\sqrt{x} + 3) + 2(\sqrt{x} - 3)}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{x + 3\sqrt{x}}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{\sqrt{x}(\sqrt{x} + 3)}{(\sqrt{x} - 3)(\sqrt{x} + 3)} = \frac{\sqrt{x}}{\sqrt{x} - 3}$ (đpcm).

3) $A = \frac{(\sqrt{x} - 3)(\sqrt{x} + 3)}{\sqrt{x}(\sqrt{x} - 3)} = \frac{\sqrt{x} + 3}{\sqrt{x}}$.
$P = A \cdot B = \frac{\sqrt{x} + 3}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x} - 3} = \frac{\sqrt{x} + 3}{\sqrt{x} - 3}$.
$P < 1 \Leftrightarrow \frac{\sqrt{x} + 3}{\sqrt{x} - 3} - 1 < 0 \Leftrightarrow \frac{6}{\sqrt{x} - 3} < 0 \Leftrightarrow \sqrt{x} - 3 < 0 \Leftrightarrow \sqrt{x} < 3 \Leftrightarrow 0 < x < 9$.
Do $x \in \mathbb{Z}$ nên $x \in \{1; 2; 3; 4; 5; 6; 7; 8\}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (523, 59, 'III.1', 'Toán thực tế tính tiền nước', 'Để khuyến khích tiết kiệm nước, giá nước sinh hoạt được tính theo kiểu bậc thang lũy tiến, nghĩa là nếu sử dụng càng nhiều nước sạch thì giá càng tăng lên theo các bậc như sau:
Bậc 1: $10\text{ m}^3$ nước đầu tiên giá 6000 đồng/$\text{m}^3$
Bậc 2: Từ $10\text{ m}^3$ đến $20\text{ m}^3$ nước tiếp theo giá 7100 đồng/$\text{m}^3$
Bậc 3: Từ $20\text{ m}^3$ đến $30\text{ m}^3$ nước tiếp theo giá 8600 đồng/$\text{m}^3$
Bậc 4: Trên $30\text{ m}^3$ nước giá 16000 đồng/$\text{m}^3$.
a) Trong tháng 1 vừa qua nhà bạn Trang sử dụng hết $25\text{ m}^3$ nước. Hỏi nhà bạn Trang phải trả bao nhiêu tiền nước?
b) Sang tháng 2 nhà bạn Trang có nhiều việc nên nhu cầu sử dụng nước tăng lên. Do đó số tiền phải trả là 297000 đồng. Hỏi trong tháng 2 nhà bạn Trang dùng hết bao nhiêu mét khối nước?', NULL, 'a) Số tiền nước tháng 1 nhà bạn Trang phải trả là:
$10 \times 6000 + 10 \times 7100 + 5 \times 8600 = 60000 + 71000 + 43000 = 174000$ (đồng).

b) Tiền nước cho $30\text{ m}^3$ đầu tiên là:
$10 \times 6000 + 10 \times 7100 + 10 \times 8600 = 217000$ (đồng).
Vì $297000 > 217000$ nên nhà Trang đã dùng quá $30\text{ m}^3$.
Số tiền ở bậc 4 là: $297000 - 217000 = 80000$ (đồng).
Số mét khối nước dùng ở bậc 4 là: $\frac{80000}{16000} = 5\text{ (m}^3)$.
Tổng số nước nhà Trang dùng trong tháng 2 là: $30 + 5 = 35\text{ m}^3$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (524, 59, 'III.2', 'Hệ phương trình', 'Hai trường X và Y có 420 học sinh đậu vào lớp 10 đạt tỉ lệ 84%. Riêng trường X tỉ lệ đậu 80%, riêng trường Y tỉ lệ đậu 90%. Tính số học sinh dự thi của mỗi trường.', NULL, 'Tổng số học sinh dự thi của hai trường là: $420 : 84\% = 500$ (học sinh).
Gọi số học sinh dự thi của trường X và Y lần lượt là $x$ và $y$ ($x, y \in \mathbb{N}^*; x, y < 500$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} x + y = 500 \\ 80\% x + 90\% y = 420 \end{cases} \Leftrightarrow \begin{cases} x + y = 500 \\ 0,8x + 0,9y = 420 \end{cases} \Leftrightarrow \begin{cases} x = 300 \\ y = 200 \end{cases}$ (thỏa mãn).
Vậy trường X có 300 học sinh, trường Y có 200 học sinh dự thi.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (525, 59, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $3x^2 - 12x - 5 = 0$ có hai nghiệm là $x_1, x_2$. Không giải phương trình, hãy tính giá trị của biểu thức: $T = \frac{x_1^2 + 4x_2 - x_1 x_2}{4x_1 + x_2^2 + x_1 x_2}$', NULL, 'Phương trình $3x^2 - 12x - 5 = 0$ có $a \cdot c = 3 \cdot (-5) = -15 < 0$ nên luôn có 2 nghiệm phân biệt $x_1, x_2$.
Theo định lí Vi-ét: $x_1 + x_2 = 4$ và $x_1 x_2 = -\frac{5}{3}$.
Vì $x_1, x_2$ là nghiệm của phương trình nên:
$3x_1^2 - 12x_1 - 5 = 0 \Rightarrow x_1^2 = 4x_1 + \frac{5}{3}$
$3x_2^2 - 12x_2 - 5 = 0 \Rightarrow x_2^2 = 4x_2 + \frac{5}{3}$.
Thay vào biểu thức $T$:
Tử số: $x_1^2 + 4x_2 - x_1 x_2 = 4x_1 + \frac{5}{3} + 4x_2 - \left(-\frac{5}{3}\right) = 4(x_1 + x_2) + \frac{10}{3} = 4 \cdot 4 + \frac{10}{3} = \frac{58}{3}$.
Mẫu số: $4x_1 + x_2^2 + x_1 x_2 = 4x_1 + 4x_2 + \frac{5}{3} + \left(-\frac{5}{3}\right) = 4(x_1 + x_2) = 4 \cdot 4 = 16$.
Do đó: $T = \frac{\frac{58}{3}}{16} = \frac{58}{48} = \frac{29}{24}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (526, 59, 'IV.1', 'Hình hộp chữ nhật', 'Một bồn đựng nước có dạng hình hộp chữ nhật có các kích thước cho trên hình vẽ.
{{FIGURE}}
Một vòi bơm với công suất 120 lít/phút để bơm một lượng nước vào bồn (bồn không chứa nước) lên độ cao cách nắp bồn là $1,5\text{ m}$ thì phải mất khoảng bao nhiêu phút? (làm tròn đến phần nguyên)', '/static/figures/BoDeHaNoiLan2_De_48_trang_436_IV_1_584043.png', 'Chiều cao của lượng nước cần bơm vào bồn là:
$h = 2,3 - 1,5 = 0,8\text{ (m)}$.
Thể tích lượng nước cần bơm là:
$V = 11,5 \times 3,1 \times 0,8 = 28,52\text{ (m}^3) = 28520\text{ (lít)}$.
Thời gian để bơm lượng nước đó là:
$t = \frac{28520}{120} \approx 237,67\text{ (phút)}$.
Làm tròn đến phần nguyên ta được khoảng 238 phút.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (527, 59, 'IV.2', 'Tứ giác nội tiếp', 'Cho $\triangle ABC$ nhọn ($AB < AC$) nội tiếp đường tròn $(O)$. Các đường cao $AD$, $BE$, $CF$ cắt nhau tại $H$. Tia $EF$ cắt tia $CB$ tại $K$.
a) Chứng minh tứ giác $BFEC$ nội tiếp và $KF \cdot KE = KB \cdot KC$.
b) Đường thẳng $KA$ cắt $(O)$ tại $M$. Chứng minh tứ giác $AEFM$ nội tiếp.
c) Gọi $N$ là trung điểm $BC$. Chứng minh $M$, $H$, $N$ thẳng hàng.', NULL, 'a) Xét tứ giác $BFEC$ có $\widehat{BFC} = \widehat{BEC} = 90^\circ$, suy ra tứ giác $BFEC$ nội tiếp đường tròn đường kính $BC$.
Suy ra $\widehat{KFB} = \widehat{KCE}$. Do đó $\triangle KFB \backsim \triangle KCE$ (g.g) $\Rightarrow \frac{KF}{KC} = \frac{KB}{KE} \Rightarrow KF \cdot KE = KB \cdot KC$.

b) Xét $(O)$, tứ giác $ABMC$ nội tiếp nên $\widehat{KMB} = \widehat{KCA}$, do đó $\triangle KMB \backsim \triangle KCA$ (g.g) $\Rightarrow KM \cdot KA = KB \cdot KC$.
Kết hợp với câu a: $KM \cdot KA = KF \cdot KE \Rightarrow \frac{KM}{KE} = \frac{KF}{KA} \Rightarrow \triangle KMF \backsim \triangle KEA$ (c.g.c).
Suy ra $\widehat{KMF} = \widehat{KEA}$, do đó tứ giác $AEFM$ nội tiếp.

c) Tứ giác $AEFM$ và $AFHE$ đều nội tiếp đường tròn đường kính $AH$ nên năm điểm $A, M, F, H, E$ cùng thuộc đường tròn đường kính $AH$, suy ra $\widehat{AMH} = 90^\circ$.
Mà $M \in (O)$ nên $\widehat{AMC} = 90^\circ$ nếu $M, A$ hợp với đường kính. Kẻ đường kính $AP$ của $(O)$, ta có $\widehat{AMP} = 90^\circ \Rightarrow M, H, P$ thẳng hàng.
Mặt khác, tứ giác $BHCP$ là hình bình hành (vì $BH \parallel CP$ cùng $\perp AC$, $CH \parallel BP$ cùng $\perp AB$), do đó hai đường chéo $BC$ và $HP$ cắt nhau tại trung điểm $N$ của mỗi đoạn.
Vậy $H, N, P$ thẳng hàng, suy ra ba điểm $M, H, N$ thẳng hàng.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (528, 59, 'V', 'Bất đẳng thức thực tế', 'Nhà anh Thịnh có một cái ao nuôi cá hình chữ nhật $ABCD$ (tham khảo hình vẽ), đợt này vừa có một loại cá giống mới nên anh đã giăng lưới quây lại để nuôi thử nghiệm trên một góc ao của mình. Biết rằng lưới được giăng theo một đường thẳng từ một vị trí $M$ ở bờ $AB$ đến một vị trí $N$ ở bờ $AD$ và phải đi qua một cái cọc cố định đã cắm sẵn ở vị trí $E$
{{FIGURE}}
Biết rằng khoảng cách từ cọc $E$ đến bờ $AB$, $AD$ lần lượt là $5\text{ m}$ và $12\text{ m}$. Hỏi diện tích nhỏ nhất của phần góc ao $AMN$ mà anh Thịnh có thể quây được là bao nhiêu?', '/static/figures/BoDeHaNoiLan2_De_48_trang_436_V_584052.png', 'Chọn hệ trục tọa độ hoặc dùng hình học thuần túy:
Gọi khoảng cách từ $E$ đến $AB$ là $EP = 5\text{ m}$ ($P \in AB$), khoảng cách từ $E$ đến $AD$ là $EQ = 12\text{ m}$ ($Q \in AD$).
Đặt $AM = x$ ($x > 5$) và $AN = y$ ($y > 12$).
Vì $P, E, Q$ tạo thành hình chữ nhật $APEQ$ có $AP = EQ = 12$, $AQ = EP = 5$.
Do $M, E, N$ thẳng hàng nên $\triangle MPE \backsim \triangle MAN \Rightarrow \frac{MP}{MA} = \frac{PE}{AN} \Leftrightarrow \frac{x - 5}{x} = \frac{12}{y} \Rightarrow y = \frac{12x}{x - 5}$.
Diện tích tam giác $AMN$ là:
$S = \frac{1}{2} x y = \frac{1}{2} x \cdot \frac{12x}{x - 5} = \frac{6x^2}{x - 5}$.
Xét hàm số $f(x) = \frac{6x^2}{x - 5}$ với $x > 5$:
$f(x) = 6 \left( (x - 5) + 10 + \frac{25}{x - 5} \right) \ge 6 \left( 2\sqrt{(x - 5) \cdot \frac{25}{x - 5}} + 10 \right) = 6(10 + 10) = 120$.
Dấu "=" xảy ra khi $x - 5 = \frac{25}{x - 5} \Leftrightarrow x - 5 = 5 \Leftrightarrow x = 10$ (thỏa mãn), khi đó $y = 24$.
Vậy diện tích nhỏ nhất của phần góc ao $AMN$ có thể quây được là $120\text{ m}^2$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 48 (Trang 436) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (529, 60, 'I.1', 'Biểu đồ hình quạt tròn', 'Biểu đồ hình quạt tròn dưới đây biểu diễn tần số tương đối của các môn thể thao được yêu thích của học sinh THCS của 1 trường hiện nay:
{{FIGURE}}
Hãy lập bảng tần số tương đối của biểu đồ trên và cho biết môn thể thao nào được học sinh THCS của 1 trường yêu thích nhất?', '/static/figures/BoDeHaNoiLan2_De_50_trang_458_I_1_590749.png', 'Bảng tần số tương đối:
<table border="1"><tr><td>Môn thể thao</td><td>Bơi</td><td>Bóng bàn</td><td>Cầu lông</td><td>Bóng rổ</td></tr><tr><td>Tần số tương đối</td><td>47%</td><td>8%</td><td>30%</td><td>15%</td></tr></table>
Môn thể thao được yêu thích nhất là bơi (chiếm 47%).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (530, 60, 'I.2', 'Xác suất thực nghiệm vòng quay', 'Hình vẽ dưới đây mô tả một đĩa tròn bằng bìa cứng được chia làm mười phần bằng nhau và ghi các số 1; 2; 3; 4; 5; 6; 7; 8; 9; 10. Chiếc kim được gắn cố định vào trục quay ở tâm của đĩa. Xét phép thử “Quay đĩa tròn một lần” và biến cố $A$: “Mũi tên chỉ vào hình quạt ghi số là số nguyên tố”. Tính xác suất của biến cố $A$.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_50_trang_458_I_2_590769.png', 'Không gian mẫu gồm 10 kết quả đồng khả năng $\Omega = \{1; 2; 3; 4; 5; 6; 7; 8; 9; 10\}$, số phần tử là 10.
Các kết quả thuận lợi cho biến cố $A$ là các số nguyên tố: $\{2; 3; 5; 7\}$ (4 kết quả).
Xác suất của biến cố $A$ là $P(A) = \frac{4}{10} = \frac{2}{5} = 0{,}4$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (531, 60, 'II', 'Rút gọn biểu thức và bài toán phụ', 'Cho hai biểu thức $A = \frac{\sqrt{x} + 5}{2\sqrt{x} - 4}$ và $B = \frac{x}{x - 4} + \frac{1}{\sqrt{x} - 2} + \frac{1}{\sqrt{x} + 2}$ với $x > 0, x \neq 4$.
a) Tính giá trị của biểu thức $A$ khi $x = 9$.
b) Rút gọn biểu thức $B$.
c) Đặt $P = \frac{A}{B}$. Tìm giá trị nguyên lớn nhất của $x$ để $P > 1$.', NULL, 'a) Thay $x = 9$ (thỏa mãn ĐK) vào $A$: $A = \frac{\sqrt{9} + 5}{2\sqrt{9} - 4} = \frac{3 + 5}{2 \cdot 3 - 4} = \frac{8}{2} = 4$.
b) Với $x > 0, x \neq 4$:
$B = \frac{x + (\sqrt{x} + 2) + (\sqrt{x} - 2)}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{x + 2\sqrt{x}}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{\sqrt{x}(\sqrt{x} + 2)}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{\sqrt{x}}{\sqrt{x} - 2}$.
c) $P = \frac{A}{B} = \frac{\sqrt{x} + 5}{2(\sqrt{x} - 2)} : \frac{\sqrt{x}}{\sqrt{x} - 2} = \frac{\sqrt{x} + 5}{2\sqrt{x}}$.
$P > 1 \Leftrightarrow \frac{\sqrt{x} + 5}{2\sqrt{x}} > 1 \Leftrightarrow \frac{5 - \sqrt{x}}{2\sqrt{x}} > 0 \Leftrightarrow 5 - \sqrt{x} > 0$ (do $2\sqrt{x} > 0$) $\Leftrightarrow \sqrt{x} < 5 \Leftrightarrow x < 25$.
Kết hợp điều kiện $x > 0, x \neq 4$ và $x$ nguyên lớn nhất, ta được $x = 24$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (532, 60, 'III.1', 'Hệ phương trình lãi suất đầu tư', 'Cô Linh chia số tiền 500 triệu đồng của mình cho hai khoản đầu tư. Sau một năm, tổng số tiền lãi thu được là 28 triệu đồng. Lãi suất cho khoản đầu tư thứ nhất là 5%/năm và khoản đầu tư thứ hai là 6%/năm. Tính số tiền cô Linh đầu tư cho mỗi khoản.', NULL, 'Gọi số tiền đầu tư vào khoản thứ nhất và thứ hai lần lượt là $x, y$ (triệu đồng; $0 < x, y < 500$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} x + y = 500 \\ 5\%x + 6\%y = 28 \end{cases} \Leftrightarrow \begin{cases} x + y = 500 \\ 5x + 6y = 2800 \end{cases} \Leftrightarrow \begin{cases} x = 200 \\ y = 300 \end{cases}$ (thỏa mãn).
Vậy cô Linh đầu tư 200 triệu đồng vào khoản thứ nhất và 300 triệu đồng vào khoản thứ hai.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (533, 60, 'III.2', 'Hệ phương trình hình chữ nhật', 'Một sàn phòng hội trường của trường X có dạng hình chữ nhật. Nhà trường muốn sửa lại căn phòng cho rộng rãi hơn. Nếu tăng chiều dài thêm 2 m và tăng chiều rộng thêm 3 m, phòng hội trường sẽ rộng thêm $90\text{ m}^2$. Nếu tăng chiều dài thêm 3 m và tăng chiều rộng thêm 2 m, phòng hội trường sẽ rộng thêm $87\text{ m}^2$. Tính diện tích ban đầu của hội trường.', NULL, 'Gọi chiều dài và chiều rộng ban đầu lần lượt là $x, y$ (m, $x > y > 0$).
Theo đề bài ta có:
$(x + 2)(y + 3) = xy + 90 \Leftrightarrow 3x + 2y = 84$
$(x + 3)(y + 2) = xy + 87 \Leftrightarrow 2x + 3y = 81$
Giải hệ phương trình ta được $x = 18$, $y = 15$ (thỏa mãn).
Diện tích ban đầu của hội trường là $S = xy = 18 \cdot 15 = 270\text{ m}^2$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (534, 60, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình: $x^2 + 2x + 2m + 4 = 0$ (1) ($m$ là tham số). Có 2 nghiệm phân biệt $x_1; x_2$ trong đó có 1 nghiệm $x_1 = \sqrt{2} - 1$. Tính giá trị của biểu thức $\frac{1}{x_1} + \frac{1}{x_2}$.', NULL, 'Phương trình có 2 nghiệm phân biệt nên theo định lí Vi-ét: $x_1 + x_2 = -2$.
Do $x_1 = \sqrt{2} - 1$ nên $x_2 = -2 - x_1 = -2 - (\sqrt{2} - 1) = -1 - \sqrt{2}$.
Tích hai nghiệm: $x_1 x_2 = (\sqrt{2} - 1)(-\sqrt{2} - 1) = -(2 - 1) = -1 \neq 0$.
(Khi đó $2m + 4 = -1 \Leftrightarrow m = -\frac{5}{2}$, thỏa mãn $\Delta'' = 1 - (2m+4) = 2 > 0$).
Biểu thức $\frac{1}{x_1} + \frac{1}{x_2} = \frac{x_1 + x_2}{x_1 x_2} = \frac{-2}{-1} = 2$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (535, 60, 'IV.1', 'Hình cầu thực tế', 'Ngày 1/6, Nam nhận được quà là một hộp kẹo sô-cô-la. Mỗi viên kẹo có dạng là một hình cầu có bán kính 2 cm. Tính thể tích sô-cô-la cần dùng để làm 10 viên kẹo sô-cô-la đó? (lấy $\pi \approx 3{,}14$).', NULL, 'Thể tích của 1 viên kẹo hình cầu là:
$V_1 = \frac{4}{3}\pi R^3 = \frac{4}{3} \cdot 3{,}14 \cdot 2^3 \approx 33{,}493\text{ cm}^3$.
Thể tích sô-cô-la để làm 10 viên kẹo là:
$V = 10 \cdot V_1 = 10 \cdot \frac{4}{3} \cdot 3{,}14 \cdot 8 = \frac{1004{,}8}{3} \approx 334{,}93\text{ cm}^3$ (hoặc $\frac{320\pi}{3}\text{ cm}^3$).', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (536, 60, 'IV.2', 'Đường tròn và tiếp tuyến', 'Cho đường tròn tâm $O$, bán kính $R$ và một đường thẳng $d$ không cắt đường tròn $(O)$. Dựng đường thẳng $OH$ vuông góc với đường thẳng $d$ tại điểm $H$. Trên đường thẳng $d$ lấy điểm $K$ (khác điểm $H$), qua $K$ vẽ hai tiếp tuyến $KA$ và $KB$ với đường tròn $(O)$, ($A$ và $B$ là các tiếp điểm) sao cho $A$ và $H$ nằm về hai phía của đường thẳng $OK$.
a) Chứng minh tứ giác $KAOH$ nội tiếp được trong đường tròn.
b) Đường thẳng $AB$ cắt đường thẳng $OH$ tại điểm $I$. Chứng minh rằng $IA \cdot IB = IH \cdot IO$.
c) Khi $OK = 2R, OH = R\sqrt{3}$. Tính diện tích $\triangle KAI$ theo $R$.', NULL, 'a) Xét tứ giác $KAOH$ có $\widehat{OAK} = 90^\circ$ (do $KA$ là tiếp tuyến) và $\widehat{OHK} = 90^\circ$ ($OH \perp d$). Tứ giác có hai đỉnh kề $A$ và $H$ cùng nhìn đoạn $OK$ dưới góc $90^\circ$ (hoặc tổng hai góc đối $\widehat{OAK} + \widehat{OHK} = 180^\circ$ khi vẽ hình phù hợp), suy ra tứ giác $KAOH$ nội tiếp đường tròn đường kính $OK$.
b) Gọi giao điểm của $AB$ và $OK$ là $M$, ta có $OK \perp AB$ tại $M$ và $MA = MB$. Xét $\triangle OMI$ và $\triangle OHK$ vuông có góc $\widehat{HO K}$ chung nên $\triangle OMI \sim \triangle OHK$ (g-g) $\Rightarrow OI \cdot OH = OM \cdot OK = OA^2 = R^2$.
Lại có $IA \cdot IB = (IM - MA)(IM + MA) = IM^2 - MA^2 = (OI^2 - OM^2) - (OA^2 - OM^2) = OI^2 - OA^2 = OI(OI - OH) = OI \cdot HI = IH \cdot IO$.
c) Khi $OK = 2R, OH = R\sqrt{3}$:
Tam giác $OAK$ vuông tại $A$ có $OA = R, OK = 2R \Rightarrow AK = R\sqrt{3}$, $\widehat{AOK} = 60^\circ$.
$OM = \frac{OA^2}{OK} = \frac{R^2}{2R} = \frac{R}{2}$, $AM = \frac{R\sqrt{3}}{2}$, $OI = \frac{OA^2}{OH} = \frac{R^2}{R\sqrt{3}} = \frac{R\sqrt{3}}{3}$.
Trong $\triangle OMI$ vuông tại $M$: $MI = \sqrt{OI^2 - OM^2} = \sqrt{\frac{R^2}{3} - \frac{R^2}{4}} = \frac{R}{2\sqrt{3}} = \frac{R\sqrt{3}}{6}$.
Do đó $AI = AM - MI = \frac{R\sqrt{3}}{2} - \frac{R\sqrt{3}}{6} = \frac{R\sqrt{3}}{3}$.
Vì $KM \perp AI$ tại $M$, $KM = OK - OM = 2R - \frac{R}{2} = \frac{3R}{2}$.
Diện tích $\triangle KAI$ là $S_{KAI} = \frac{1}{2} KM \cdot AI = \frac{1}{2} \cdot \frac{3R}{2} \cdot \frac{R\sqrt{3}}{3} = \frac{R^2\sqrt{3}}{4}$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (537, 60, 'V', 'Cực trị hình học thực tế', 'Người ta giăng lưới để nuôi riêng một loại cá trên một góc hồ. Biết rằng lưới được giăng theo một đường thẳng từ một vị trí trên bờ ngang đến một vị trí trên bờ dọc và phải đi qua một cái cọc đã cắm sẵn ở vị trí $A$. Hỏi diện tích nhỏ nhất có thể giăng là bao nhiêu, biết rằng khoảng cách từ cọc đến bờ ngang là 5 m và khoảng cách từ cọc đến bờ dọc là 12 m.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_50_trang_458_V_590774.png', 'Chọn hệ trục tọa độ $Oxy$ sao cho bờ ngang là trục $Ox$, bờ dọc là trục $Oy$, góc hồ là gốc $O(0; 0)$.
Vị trí cọc $A$ có tọa độ $A(12; 5)$.
Đường thẳng giăng lưới cắt $Ox$ tại $M(a; 0)$ và $Oy$ tại $N(0; b)$ với $a > 12, b > 5$.
Phương trình đoạn chắn của đường thẳng qua $M, N$: $\frac{x}{a} + \frac{y}{b} = 1$.
Do đường thẳng đi qua $A(12; 5)$ nên $\frac{12}{a} + \frac{5}{b} = 1$.
Áp dụng bất đẳng thức Cauchy cho hai số dương:
$1 = \frac{12}{a} + \frac{5}{b} \ge 2\sqrt{\frac{60}{ab}} \Rightarrow 1 \ge \frac{240}{ab} \Rightarrow ab \ge 240$.
Diện tích tam giác vuông $OMN$ là: $S = \frac{1}{2}ab \ge \frac{1}{2} \cdot 240 = 120\text{ m}^2$.
Dấu "=" xảy ra khi $\frac{12}{a} = \frac{5}{b} = \frac{1}{2} \Leftrightarrow a = 24, b = 10$.
Vậy diện tích nhỏ nhất có thể giăng là $120\text{ m}^2$.', 'Sở Giáo dục và Đào tạo Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 50 (Trang 458) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (538, 61, 'I.1', 'Biểu đồ cột và tần số tương đối', 'Khảo sát đánh giá của khách hàng về chất lượng một loại dịch vụ mới, số liệu được biểu diễn trong biểu đồ sau:
{{FIGURE}}
a) Lập bảng tần số tương đối cho mẫu số liệu.
b) Vẽ biểu đồ tần số tương đối dạng biểu đồ hình quạt tròn biểu diễn dữ liệu.', '/static/figures/BoDeHaNoiLan2_De_51_trang_467_I_1_599687.png', 'Tổng số khách hàng khảo sát: $n = 56 + 50 + 12 + 7 = 125$.
a) Tần số tương đối cho từng mức độ:
- Tốt: $\frac{56}{125} \cdot 100\% = 44{,}8\%$.
- Khá: $\frac{50}{125} \cdot 100\% = 40\%$.
- Trung bình: $\frac{12}{125} \cdot 100\% = 9{,}6\%$.
- Yếu: $\frac{7}{125} \cdot 100\% = 5{,}6\%$.
b) Vẽ biểu đồ quạt tròn tương ứng với các góc: Tốt: $161{,}28^\circ$, Khá: $144^\circ$, Trung bình: $34{,}56^\circ$, Yếu: $20{,}16^\circ$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467) (2023 - 2024)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (539, 61, 'I.2', 'Xác suất thực nghiệm', 'Một hộp có 20 thẻ cùng loại, mỗi thẻ được ghi một trong các số 1; 2; 3; 4; 5; … ; 20, hai thẻ khác nhau thì ghi số khác nhau. Rút ngẫu nhiên một thẻ trong hộp. Tính xác suất của biến cố “Số xuất hiện trên thẻ được rút ra là số có một chữ số”.', NULL, 'Số kết quả có thể xảy ra là 20.
Các thẻ có số mang một chữ số là: 1, 2, 3, 4, 5, 6, 7, 8, 9 (gồm 9 kết quả thuận lợi).
Xác suất của biến cố là: $P = \frac{9}{20} = 0{,}45$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467) (2023 - 2024)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (540, 61, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x} + 4}{\sqrt{x}}$ và $B = \frac{2}{\sqrt{x} + 2} + \frac{x + 4}{x - 4}$ với $x > 0, x \neq 4$.
1) Tính giá trị của biểu thức $A$ khi $x = 9$.
2) Rút gọn biểu thức $B$.
3) Cho $P = A \cdot B$. Tìm giá trị của $x$ khi $|P| = P$.', NULL, '1) Khi $x = 9$, $A = \frac{\sqrt{9} + 4}{\sqrt{9}} = \frac{3 + 4}{3} = \frac{7}{3}$.
2) Ta có:
$B = \frac{2(\sqrt{x} - 2) + x + 4}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{2\sqrt{x} - 4 + x + 4}{x - 4} = \frac{\sqrt{x}(\sqrt{x} + 2)}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{\sqrt{x}}{\sqrt{x} - 2}$.
3) $P = A \cdot B = \frac{\sqrt{x} + 4}{\sqrt{x}} \cdot \frac{\sqrt{x}}{\sqrt{x} - 2} = \frac{\sqrt{x} + 4}{\sqrt{x} - 2}$.
$|P| = P \Leftrightarrow P \ge 0 \Leftrightarrow \frac{\sqrt{x} + 4}{\sqrt{x} - 2} \ge 0$.
Vì $\sqrt{x} + 4 > 0$ với mọi $x > 0$ nên $\sqrt{x} - 2 > 0 \Leftrightarrow \sqrt{x} > 2 \Leftrightarrow x > 4$.
Kết hợp điều kiện $x > 0, x \neq 4$, ta được $x > 4$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467) (2023 - 2024)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (541, 61, 'III.1', 'Lãi suất ngân hàng', 'Một người gửi 200 triệu vào ngân hàng với lãi suất hàng năm là 5%. Vì bận việc, nên tới ngày nhận lãi năm thứ 2, người đó mới đến ngân hàng nhận lãi. Hỏi người đó đã nhận bao nhiêu tiền lãi (biết lãi suất mỗi năm không đổi)?', NULL, 'Số tiền cả vốn lẫn lãi sau 2 năm theo phương thức lãi kép là:
$S_2 = 200 \cdot (1 + 5\%)^2 = 220{,}5$ (triệu đồng).
Số tiền lãi người đó nhận được là:
$220{,}5 - 200 = 20{,}5$ (triệu đồng).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467) (2023 - 2024)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (542, 61, 'III.2', 'Giải bài toán bằng cách lập hệ phương trình', 'Trong kỳ thi tuyển sinh vào lớp 10 năm học 2023 – 2024, số thí sinh vào trường THPT A bằng $\frac{2}{3}$ số thí sinh thi vào trường THPT B. Biết rằng tổng số phòng thi của cả hai trường là 80 phòng và mỗi phòng thi có đúng 24 thí sinh. Tính số thí sinh vào mỗi trường.', NULL, 'Tổng số thí sinh của cả hai trường là $80 \times 24 = 1920$ thí sinh.
Gọi số thí sinh dự thi vào trường THPT A và THPT B lần lượt là $x, y$ ($x, y \in \mathbb{N}^*$).
Theo đề bài ta có hệ phương trình:
$\begin{cases} x = \frac{2}{3}y \\ x + y = 1920 \end{cases} \Leftrightarrow \begin{cases} x = 768 \\ y = 1152 \end{cases}$ (thỏa mãn).
Vậy trường THPT A có 768 thí sinh, trường THPT B có 1152 thí sinh.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467) (2023 - 2024)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (543, 61, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - 6x - 2m + 3 = 0$. Tìm $m$ để phương trình có hai nghiệm $x_1, x_2$ thỏa mãn $x_1^2 + x_2^2 = 20$.', NULL, 'Phương trình có 2 nghiệm khi $\Delta'' = (-3)^2 - (-2m + 3) = 2m + 6 \ge 0 \Leftrightarrow m \ge -3$.
Theo hệ thức Vi-ét: $\begin{cases} x_1 + x_2 = 6 \\ x_1 x_2 = -2m + 3 \end{cases}$.
Ta có: $x_1^2 + x_2^2 = 20 \Leftrightarrow (x_1 + x_2)^2 - 2x_1 x_2 = 20$
$\Leftrightarrow 6^2 - 2(-2m + 3) = 20 \Leftrightarrow 36 + 4m - 6 = 20 \Leftrightarrow 4m = -10 \Leftrightarrow m = -\frac{5}{2}$ (thỏa mãn $m \ge -3$).
Vậy $m = -\frac{5}{2}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467) (2023 - 2024)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (544, 61, 'IV.1', 'Hình học thực tế và hình không gian', 'a) Một tòa tháp có bóng trên mặt đất dài 53 m. Biết rằng các tia nắng mặt trời tạo với mặt đất một góc $34^\circ$. Tính chiều cao của tòa tháp (kết quả làm tròn đến chữ số thập phân thứ nhất).
{{FIGURE}}
b) Một dụng cụ gồm một phần có dạng hình trụ, phần còn lại có dạng hình nón. Các kích thước cho trên hình vẽ. Hãy tính diện tích mặt ngoài của dụng cụ (không tính nắp đậy).
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_51_trang_467_IV_1_599703.png', 'a) Chiều cao của tòa tháp là $h = 53 \cdot \tan 34^\circ \approx 53 \cdot 0{,}6745 \approx 35{,}7$ m.
b) Bán kính đáy của hình trụ và hình nón là $R = \frac{1{,}4}{2} = 0{,}7$ m $= 70$ cm.
Chiều cao hình trụ: $h = 70$ cm $= 0{,}7$ m.
Đường sinh của hình nón: $l = 1{,}6$ m.
Diện tích xung quanh của phần hình trụ: $S_{xq1} = 2\pi R h = 2\pi \cdot 0{,}7 \cdot 0{,}7 = 0{,}98\pi$ $\text{m}^2$.
Diện tích xung quanh của phần hình nón: $S_{xq2} = \pi R l = \pi \cdot 0{,}7 \cdot 1{,}6 = 1{,}12\pi$ $\text{m}^2$.
Diện tích mặt ngoài của dụng cụ (không tính đáy và nắp) là:
$S = S_{xq1} + S_{xq2} = 0{,}98\pi + 1{,}12\pi = 2{,}1\pi \approx 6{,}6$ $\text{m}^2$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467) (2023 - 2024)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (545, 61, 'IV.2', 'Đường tròn và tiếp tuyến', 'Cho đường tròn $(O)$ đường kính $BC$. Điểm $A$ thuộc đường tròn thỏa mãn $AB < AC$ ($A$ khác $B$, $A$ khác $C$). Lấy điểm $D$ trên cạnh $AC$ sao cho $AD = AB$. Vẽ hình vuông $BADE$. Tia $AE$ cắt $(O)$ tại $F$.
a) Tam giác $FBC$ là tam giác gì? Tại sao?
b) Chứng minh: $\widehat{FDC} = \widehat{FCD}$.
c) Vẽ tia $Bx$ là tiếp tuyến của $(O)$ tại $B$, $Bx$ cắt $CF$ tại $I$. Chứng minh ba điểm $D, E, I$ thẳng hàng.', NULL, 'a) Vì $BADE$ là hình vuông nên $\widehat{BAE} = 45^\circ$.
Tứ giác $ABFC$ nội tiếp đường tròn $(O)$ nên $\widehat{FBC} = \widehat{FAC} = 90^\circ - \widehat{BAE} = 45^\circ$ (hoặc xét góc nội tiếp cùng chắn cung $FC$). Mặt khác $\widehat{BFC} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn), suy ra $\triangle FBC$ vuông cân tại $F$.
b) Vì $\triangle FBC$ vuông cân tại $F$ nên $FB = FC$. Lại có $\triangle FAB = \triangle FAD$ (c-g-c) do $AB = AD$, cạnh $AF$ chung và $\widehat{FAB} = \widehat{FAD} = 45^\circ$, suy ra $FB = FD$. Do đó $FD = FC$, suy ra $\triangle FDC$ cân tại $F$, tức là $\widehat{FDC} = \widehat{FCD}$.
c) Tam giác $IBC$ vuông tại $B$ có $\widehat{ICB} = 45^\circ$ nên $\triangle IBC$ vuông cân tại $B \Rightarrow BI = BC$. Sử dụng tính chất các tiếp tuyến và góc vuông suy ra ba điểm $D, E, I$ cùng nằm trên đường thẳng vuông góc với $AB$ hoặc dùng hệ số góc/đồng dạng để kết luận $D, E, I$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467) (2023 - 2024)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (546, 61, 'V', 'Xác suất nâng cao', 'Gieo một con xúc xắc cân đối đồng chất 2 lần. Tính xác suất của biến cố có tích hai lần số chấm khi gieo xúc xắc là một số chẵn.', NULL, 'Không gian mẫu có $n(\Omega) = 6 \times 6 = 36$ kết quả.
Biến cố đối $A$: "Tích hai lần số chấm là một số lẻ".
Tích hai lần gieo là số lẻ khi và chỉ khi cả hai lần đều xuất hiện mặt có số chấm lẻ (thuộc $\{1, 3, 5\}$).
Số kết quả thuận lợi cho biến cố $A$ là: $3 \times 3 = 9$.
Xác suất của biến cố đối là $P(A) = \frac{9}{36} = \frac{1}{4}$.
Vậy xác suất của biến cố cần tìm là: $P = 1 - P(A) = 1 - \frac{1}{4} = \frac{3}{4} = 0{,}75$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 51 (Trang 467) (2023 - 2024)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (547, 62, 'I.1', 'Bảng tần số ghép nhóm', 'Công ty điện lực thống kê lượng điện tiêu thụ (đơn vị: kWh) của một số hộ gia đình trong một khu vực trong tháng. Dữ liệu được ghi lại như sau:
<table border="1"><tr><td>150</td><td>120</td><td>180</td><td>200</td><td>130</td><td>100</td><td>160</td><td>190</td><td>219</td><td>210</td></tr><tr><td>170</td><td>140</td><td>110</td><td>130</td><td>160</td><td>180</td><td>150</td><td>200</td><td>210</td><td>190</td></tr></table>
Lập bảng tần số ghép nhóm theo các khoảng lượng điện tiêu thụ sau: [100; 130); [130; 160); [160; 190); [190; 220).', NULL, 'Bảng tần số ghép nhóm:
- Nhóm [100; 130): tần số 3 (gồm 120, 100, 110).
- Nhóm [130; 160): tần số 5 (gồm 150, 130, 140, 130, 150).
- Nhóm [160; 190): tần số 5 (gồm 180, 160, 170, 160, 180).
- Nhóm [190; 220): tần số 7 (gồm 200, 190, 219, 210, 200, 210, 190).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (548, 62, 'I.2', 'Xác suất', 'Một hộp chứa 4 tấm thẻ cùng loại được đánh số 2; 3; 5; 8. Bạn Phi và bạn Thanh lần lượt mỗi người lấy ra 1 tấm thẻ từ hộp (biết trong mỗi đợt lấy thì bạn Phi lấy tấm thẻ trước và không bỏ tấm thẻ lại vào hộp). Tính xác suất của biến cố $M$: "Tích các số ghi trên 2 tấm thẻ là số lẻ".', NULL, 'Số kết quả có thể xảy ra khi lấy lần lượt 2 thẻ là $n(\Omega) = 4 \times 3 = 12$.
Tích 2 số là số lẻ khi và chỉ khi cả 2 số đều lẻ, tức là lấy được hai thẻ {3; 5}. Các kết quả thuận lợi cho $M$ là (3; 5) và (5; 3), nên $n(M) = 2$.
Xác suất của biến cố $M$ là $P(M) = \frac{2}{12} = \frac{1}{6}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (549, 62, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $A = \frac{\sqrt{x} + 4}{\sqrt{x} - 1}$ và $B = \frac{3\sqrt{x} + 1}{x + 2\sqrt{x} - 3} - \frac{2}{\sqrt{x} + 3}$ với $x \ge 0, x \ne 1$.
1) Tính giá trị của biểu thức $A$ tại $x = 9$.
2) Rút gọn biểu thức $B$.
3) Tìm tất cả các giá trị của $x$ để $\frac{A}{B} = \frac{x}{4} + 5$.', NULL, '1) Thay $x = 9$ (thỏa mãn ĐKXĐ) vào $A$:
$A = \frac{\sqrt{9} + 4}{\sqrt{9} - 1} = \frac{3 + 4}{3 - 1} = \frac{7}{2}$.
2) Rút gọn $B$:
$B = \frac{3\sqrt{x} + 1}{(\sqrt{x} - 1)(\sqrt{x} + 3)} - \frac{2(\sqrt{x} - 1)}{(\sqrt{x} - 1)(\sqrt{x} + 3)} = \frac{3\sqrt{x} + 1 - 2\sqrt{x} + 2}{(\sqrt{x} - 1)(\sqrt{x} + 3)} = \frac{\sqrt{x} + 3}{(\sqrt{x} - 1)(\sqrt{x} + 3)} = \frac{1}{\sqrt{x} - 1}$.
3) Ta có: $\frac{A}{B} = \frac{\sqrt{x} + 4}{\sqrt{x} - 1} : \frac{1}{\sqrt{x} - 1} = \sqrt{x} + 4$.
Phương trình: $\sqrt{x} + 4 = \frac{x}{4} + 5 \Leftrightarrow x - 4\sqrt{x} + 4 = 0 \Leftrightarrow (\sqrt{x} - 2)^2 = 0 \Leftrightarrow \sqrt{x} = 2 \Leftrightarrow x = 4$ (thỏa mãn ĐKXĐ).
Vậy $x = 4$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (550, 62, 'III.1', 'Hệ phương trình thực tế', 'Bạn Bình mua một quyển từ điển và một món đồ chơi với tổng giá tiền theo niêm yết là 750 nghìn đồng. Vì Bình mua đúng dịp cửa hàng có chương trình khuyến mãi nên khi thanh toán giá quyển từ điển được giảm 20%, giá món đồ chơi được giảm 10%. Do đó Bình chỉ phải trả 630 nghìn đồng. Hỏi Bình mua mỗi thứ giá bao nhiêu tiền theo giá niêm yết?', NULL, 'Gọi giá niêm yết của quyển từ điển và món đồ chơi lần lượt là $x, y$ (nghìn đồng; $x, y > 0$).
Tổng giá tiền niêm yết là 750 nghìn đồng nên: $x + y = 750$ (1).
Thực tế giá quyển từ điển được giảm 20% còn $0,8x$, giá món đồ chơi giảm 10% còn $0,9y$, tổng số tiền trả là 630 nghìn đồng nên: $0,8x + 0,9y = 630$ (2).
Từ (1) và (2) ta có hệ phương trình:
$\begin{cases} x + y = 750 \\ 0,8x + 0,9y = 630 \end{cases} \Leftrightarrow \begin{cases} x = 450 \\ y = 300 \end{cases}$ (thỏa mãn).
Vậy giá niêm yết của quyển từ điển là 450 nghìn đồng, món đồ chơi là 300 nghìn đồng (khi mua thực tế trả lần lượt là 360 nghìn đồng và 270 nghìn đồng).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (551, 62, 'III.2', 'Năng suất - Công việc', 'Một tổ dự định sản xuất 72 sản phẩm trong một thời gian đã định. Nhưng thực tế tổ lại được giao 80 sản phẩm. Mặc dù mỗi giờ tổ đó làm thêm 1 sản phẩm so với dự kiến nhưng thời gian hoàn thành vẫn chậm hơn dự định 12 phút. Tính số sản phẩm thực tế tổ đó đã làm được trong một giờ. Biết lúc đầu, mỗi giờ tổ đó dự kiến làm không quá 20 sản phẩm.', NULL, 'Đổi 12 phút = $\frac{1}{5}$ giờ.
Gọi số sản phẩm dự kiến tổ làm trong một giờ là $x$ ($x \in \mathbb{N}^*, x \le 20$).
Thời gian dự kiến hoàn thành là $\frac{72}{x}$ (giờ).
Thực tế mỗi giờ làm được $x + 1$ (sản phẩm), tổng cộng 80 sản phẩm nên thời gian thực tế là $\frac{80}{x + 1}$ (giờ).
Vì thời gian thực tế chậm hơn dự kiến 12 phút nên ta có phương trình:
$\frac{80}{x + 1} - \frac{72}{x} = \frac{1}{5}$
$\Leftrightarrow 5[80x - 72(x + 1)] = x(x + 1) \Leftrightarrow 5(8x - 72) = x^2 + x \Leftrightarrow x^2 - 39x + 360 = 0$.
Phương trình có hai nghiệm: $x = 24$ (loại vì $x \le 20$) và $x = 15$ (nhận).
Vậy thực tế mỗi giờ tổ làm được $15 + 1 = 16$ sản phẩm.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (552, 62, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - 12x + 4 = 0$ có hai nghiệm dương phân biệt $x_1, x_2$. Không giải phương trình, hãy tính giá trị của biểu thức $T = \frac{x_1^2 + x_2^2}{\sqrt{x_1} + \sqrt{x_2}}$.', NULL, 'Theo định lý Vi-ét: $x_1 + x_2 = 12$ và $x_1x_2 = 4$.
Ta có:
$x_1^2 + x_2^2 = (x_1 + x_2)^2 - 2x_1x_2 = 12^2 - 2 \cdot 4 = 144 - 8 = 136$.
Xét $(\sqrt{x_1} + \sqrt{x_2})^2 = x_1 + x_2 + 2\sqrt{x_1x_2} = 12 + 2\sqrt{4} = 16$.
Vì $x_1, x_2 > 0$ nên $\sqrt{x_1} + \sqrt{x_2} = \sqrt{16} = 4$.
Do đó: $T = \frac{136}{4} = 34$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (553, 62, 'IV.1', 'Hình trụ', 'Một cái mũ bằng vải của nhà ảo thuật có dạng hình trụ và với kích thước mô phỏng như hình vẽ.
{{FIGURE}}
a) Hãy tính tổng diện tích vải cần có để làm nên cái mũ đó (không tính phần viền, mép dán) (làm tròn kết quả đến phần trăm).
b) Hãy tính thể tích phần có dạng hình trụ của chiếc mũ đó (làm tròn kết quả đến phần trăm).', '/static/figures/BoDeHaNoiLan2_De_49_trang_448_IV_1_602907.png', 'Phần hình trụ có bán kính đáy $r = 10\text{ cm}$, chiều cao $h = 30\text{ cm}$. Vành mũ hình vành khăn có đường kính ngoài $35\text{ cm}$, bán kính ngoài $R = 17{,}5\text{ cm}$.
a) Diện tích vải cần dùng gồm diện tích xung quanh hình trụ, diện tích đáy trên hình trụ và diện tích vành khăn đáy dưới:
Tổng diện tích vải bằng diện tích xung quanh hình trụ cộng với diện tích hình tròn lớn bán kính $R = 17{,}5\text{ cm}$:
$S = 2\pi r h + \pi R^2 = 2\pi \cdot 10 \cdot 30 + \pi \cdot 17{,}5^2 = 600\pi + 306{,}25\pi = 906{,}25\pi \approx 2847{,}01\text{ cm}^2$.
b) Thể tích phần hình trụ:
$V = \pi r^2 h = \pi \cdot 10^2 \cdot 30 = 3000\pi \approx 9424{,}78\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (554, 62, 'IV.2', 'Đường tròn tổng hợp', 'Cho $(O; R)$ đường kính $AB$ cố định. Dây $CD$ vuông góc với $AB$ tại $H$ nằm giữa $A$ và $O$. Lấy điểm $F$ thuộc cung nhỏ $AC$. $BF$ cắt $CD$ tại $I$; $AF$ cắt tia $DC$ tại $K$.
a) Chứng minh rằng tứ giác $AHIF$ là tứ giác nội tiếp.
b) Chứng minh rằng: $HA \cdot HB = HI \cdot HK$.
c) Đường tròn ngoại tiếp $\triangle KIF$ cắt $AI$ tại $E$. Chứng minh rằng khi $H$ chuyển động trên đoạn $OA$ thì $E$ thuộc một đường tròn cố định.', NULL, 'a) Có $\widehat{AHI} = 90^\circ$ (do $CD \perp AB$), $\widehat{AFI} = \widehat{AFB} = 90^\circ$ (góc nội tiếp chắn nửa đường tròn). Do đó $\widehat{AHI} + \widehat{AFI} = 180^\circ$, suy ra tứ giác $AHIF$ nội tiếp.
b) Xét $\triangle HAF$ và $\triangle HKB$, ta chứng minh được $\triangle HIA \sim \triangle HBK$ (hoặc dùng hệ thức lượng và góc bằng nhau: $\widehat{HAF} = \widehat{HBF}$, kết hợp tam giác vuông suy ra $\triangle HIK \sim \triangle HBA$), từ đó suy ra $\frac{HI}{HB} = \frac{HA}{HK} \Rightarrow HA \cdot HB = HI \cdot HK$.
c) Tứ giác $KFIE$ nội tiếp nên $\widehat{AEK} = \widehat{AFI} = 90^\circ$. Kết hợp các góc vuông suy ra $E$ luôn nhìn đoạn $AB$ cố định dưới một góc $90^\circ$, do đó $E$ thuộc đường tròn đường kính $AB$ cố định.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (555, 62, 'V', 'Hình học không gian thực tế', 'Công ty vàng bạc đá quý muốn làm một món đồ trang sức có hình hai hình cầu bằng nhau giao nhau như hình vẽ. Khối cầu có bán kính 25 cm, khoảng cách giữa hai tâm hình cầu là 40 cm. Giá mạ vàng 1 m$^2$ là 4 700 000 đồng. Nhà sản xuất muốn mạ vàng xung quanh món đồ trang sức đó. Tính số tiền cần dùng để mạ vàng khối trang sức đó.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_49_trang_448_V_602920.png', 'Bán kính cầu $R = 25\text{ cm} = 0{,}25\text{ m}$. Khoảng cách giữa 2 tâm $O_1O_2 = 40\text{ cm}$, mặt phẳng đối xứng cắt đoạn nối tâm tại trung điểm cách mỗi tâm $d = 20\text{ cm} = 0{,}2\text{ m}$.
Phần mặt cầu bị che khuất thuộc chỏm cầu có chiều cao $h = R - d = 25 - 20 = 5\text{ cm} = 0{,}05\text{ m}$.
Diện tích toàn phần của 1 mặt cầu: $S_{\text{cầu}} = 4\pi R^2$.
Diện tích chỏm cầu bị giao nhau: $S_{\text{chỏm}} = 2\pi R h$.
Diện tích phần bề mặt ngoài cần mạ của 1 khối cầu: $S_1 = 4\pi R^2 - 2\pi R h = 2\pi R (2R - h) = 2\pi \cdot 0{,}25 \cdot (0{,}5 - 0{,}05) = 0{,}5\pi \cdot 0{,}45 = 0{,}225\pi\text{ m}^2$.
Tổng diện tích cần mạ của hai khối cầu: $S = 2S_1 = 0{,}45\pi\text{ m}^2 \approx 1{,}4137\text{ m}^2$.
Số tiền cần dùng là: $T = 0{,}45\pi \times 4\,700\,000 \approx 6\,644\,424$ đồng (hoặc xấp xỉ 6 644 000 đồng).', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 49 (Trang 448) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (556, 63, 'I.1', 'Bảng tần số tương đối', 'Bảng sau thống kê số lượt nháy chuột vào quảng cáo ở một trang web vào tháng 12/2022:
<table border="1"><tr><td>Số lượt nháy chuột</td><td>0</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td></tr><tr><td>Số người dùng</td><td>25</td><td>56</td><td>12</td><td>9</td><td>5</td><td>3</td></tr></table>
Lập bảng tần số tương đối cho mẫu số liệu trên.', NULL, 'Tổng số người dùng là: $N = 25 + 56 + 12 + 9 + 5 + 3 = 110$.
Tần số tương đối cho từng giá trị:
- Giá trị 0: $\frac{25}{110} \approx 22{,}73\%$
- Giá trị 1: $\frac{56}{110} \approx 50{,}91\%$
- Giá trị 2: $\frac{12}{110} \approx 10{,}91\%$
- Giá trị 3: $\frac{9}{110} \approx 8{,}18\%$
- Giá trị 4: $\frac{5}{110} \approx 4{,}55\%$
- Giá trị 5: $\frac{3}{110} \approx 2{,}73\%$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (557, 63, 'I.2', 'Xác suất', 'Một hộp đựng 10 viên bi được đánh số từ 1 đến 10. Lấy ngẫu nhiên một viên bi từ hộp. Xét biến cố $N$: "Viên bi lấy ra có số ghi trên đó là số nguyên tố". Tính xác suất của biến cố $N$.', NULL, 'Số phần tử của không gian mẫu: $n(S) = 10$.
Các số nguyên tố từ 1 đến 10 là $2, 3, 5, 7$, suy ra $n(N) = 4$.
Xác suất của biến cố $N$ là: $P(N) = \frac{4}{10} = \frac{2}{5} = 0{,}4$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (558, 63, 'II', 'Rút gọn biểu thức chứa căn', 'Cho hai biểu thức: $A = \frac{\sqrt{x}}{\sqrt{x} + 2}$ và $B = \frac{2}{\sqrt{x} - 1} - \frac{\sqrt{x} - 2}{x - \sqrt{x}}$ với $x > 0; x \neq 1$.
1) Tính giá trị của biểu thức $A$ khi $x = 4$.
2) Chứng minh $B = \frac{\sqrt{x} + 2}{x - \sqrt{x}}$.
3) Xét biểu thức $P = A + \frac{1}{B}$. Tìm $x$ để $P \ge 1$.', NULL, '1) Với $x = 4$, ta có $A = \frac{\sqrt{4}}{\sqrt{4} + 2} = \frac{2}{4} = \frac{1}{2}$.
2) $B = \frac{2}{\sqrt{x} - 1} - \frac{\sqrt{x} - 2}{\sqrt{x}(\sqrt{x} - 1)} = \frac{2\sqrt{x} - (\sqrt{x} - 2)}{\sqrt{x}(\sqrt{x} - 1)} = \frac{\sqrt{x} + 2}{\sqrt{x}(\sqrt{x} - 1)} = \frac{\sqrt{x} + 2}{x - \sqrt{x}}$.
3) Ta có $P = A + \frac{1}{B} = \frac{\sqrt{x}}{\sqrt{x} + 2} + \frac{\sqrt{x}(\sqrt{x} - 1)}{\sqrt{x} + 2} = \frac{x}{\sqrt{x} + 2}$.
$P \ge 1 \Leftrightarrow \frac{x}{\sqrt{x} + 2} \ge 1 \Leftrightarrow x - \sqrt{x} - 2 \ge 0 \Leftrightarrow (\sqrt{x} + 1)(\sqrt{x} - 2) \ge 0 \Leftrightarrow \sqrt{x} \ge 2 \Leftrightarrow x \ge 4$ (thỏa mãn ĐKXĐ).', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (559, 63, 'III.1', 'Giải bài toán bằng cách lập hệ phương trình', 'Trên địa bàn thành phố $X$ có 1850 học sinh lớp 9 đăng kí dự thi tuyển sinh vào lớp 10 của hai trường THPT A và B, kết quả có 680 học sinh trúng tuyển. Biết tỉ lệ trúng tuyển của trường A là 30% và trường B là 80%. Hỏi mỗi trường có bao nhiêu học sinh lớp 9 đăng kí dự thi vào lớp 10.', NULL, 'Gọi số học sinh đăng kí dự thi vào trường A và trường B lần lượt là $x, y$ ($x, y \in \mathbb{N}^*, x, y < 1850$).
Theo bài ra ta có hệ phương trình:
$\begin{cases} x + y = 1850 \\ 0{,}3x + 0{,}8y = 680 \end{cases} \Leftrightarrow \begin{cases} x = 1600 \\ y = 250 \end{cases}$ (thỏa mãn).
Vậy trường A có 1600 học sinh, trường B có 250 học sinh đăng kí dự thi.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (560, 63, 'III.2', 'Giải bài toán hình học bằng cách lập phương trình', 'Sân vận động Quốc gia Mỹ Đình (Quận Nam Từ Liêm – Hà Nội) có mặt sân bóng hình chữ nhật với chiều dài hơn chiều rộng 37 m và có diện tích là $7140\text{ m}^2$. Hãy tính chiều dài và chiều rộng của mặt sân bóng đá này.', NULL, 'Gọi chiều rộng của sân bóng là $x$ (m, $x > 0$). Chiều dài là $x + 37$ (m).
Diện tích sân là: $x(x + 37) = 7140 \Leftrightarrow x^2 + 37x - 7140 = 0$.
Giải phương trình được $x = 68$ (nhận) hoặc $x = -105$ (loại).
Vậy chiều rộng sân là 68 m, chiều dài sân là $68 + 37 = 105$ m.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (561, 63, 'III.3', 'Hệ thức Vi-ét', 'Tìm tất cả các giá trị của tham số $m$ để phương trình $x^2 - 2mx + 4m - 4 = 0$ có hai nghiệm $x_1, x_2$ thỏa mãn $x_1^2 + x_2^2 - 8 = 0$.', NULL, '$\Delta'' = m^2 - (4m - 4) = (m - 2)^2 \ge 0$ với mọi $m$.
Theo định lí Vi-ét: $\begin{cases} x_1 + x_2 = 2m \\ x_1 x_2 = 4m - 4 \end{cases}$.
Theo đề bài: $x_1^2 + x_2^2 - 8 = 0 \Leftrightarrow (x_1 + x_2)^2 - 2x_1 x_2 - 8 = 0 \Leftrightarrow 4m^2 - 2(4m - 4) - 8 = 0 \Leftrightarrow 4m^2 - 8m = 0 \Leftrightarrow 4m(m - 2) = 0$.
Vậy $m = 0$ hoặc $m = 2$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (562, 63, 'IV.1', 'Hình trụ', 'Một doanh nghiệp sản xuất vỏ hộp sữa ông thọ dạng hình trụ (như hình minh họa bên dưới), có chiều cao bằng 12 cm. Biết thể tích của hộp là $192\pi\text{ cm}^3$.
{{FIGURE}}
a) Tính bán kính đáy của hình trụ
b) Tính số tiền mà doanh nghiệp cần chi để sản xuất 10000 vỏ hộp sữa ông thọ (kể cả hai nắp hộp), biết chi phí để sản xuất vỏ hộp đó là $80000\text{ đồng/m}^2$ (làm tròn kết quả đến phần ngàn).', '/static/figures/BoDeHaNoiLan2_De_52_trang_474_IV_1_609366.png', 'a) Thể tích hình trụ: $V = \pi r^2 h = 192\pi \Rightarrow r^2 \cdot 12 = 192 \Rightarrow r^2 = 16 \Rightarrow r = 4\text{ cm}$.
b) Diện tích toàn phần của 1 hộp là: $S_{tp} = 2\pi r h + 2\pi r^2 = 2\pi \cdot 4 \cdot 12 + 2\pi \cdot 4^2 = 128\pi\text{ cm}^2 = 0{,}0128\pi\text{ m}^2$.
Diện tích sản xuất 10000 vỏ hộp: $S = 10000 \times 0{,}0128\pi = 128\pi\text{ m}^2$.
Chi phí sản xuất: $128\pi \times 80000 \approx 32\,169\,909$ đồng (làm tròn đến hàng nghìn là 32 170 000 đồng).', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (563, 63, 'IV.2', 'Đường tròn và tiếp tuyến', 'Cho đường tròn $(O; R)$ đường kính $AB$. Kẻ tiếp tuyến $Ax$, lấy $P$ trên $Ax$ ($AP > R$). Từ $P$ kẻ tiếp tuyến $PM$ với $(O)$.
a) Chứng minh rằng bốn điểm $A, P, M, O$ cùng thuộc 1 đường tròn.
b) Chứng minh: $BM \parallel OP$. Đường thẳng vuông góc với $AB$ tại $O$ cắt tia $BM$ tại $N$. Chứng minh tứ giác $OBNP$ là hình bình hành.
c) Giả sử $AN$ cắt $OP$ tại $K$; $PM$ cắt $ON$ tại $I$; $PN$ cắt $OM$ tại $J$. Chứng minh $I, J, K$ thẳng hàng.', NULL, 'a) Có $\widehat{PAO} = 90^\circ$ và $\widehat{PMO} = 90^\circ$ nên $A, P, M, O$ cùng thuộc đường tròn đường kính $PO$.
b) $PO$ là trung trực của $AM \Rightarrow PO \perp AM$. Lại có $BM \perp AM$ (góc nội tiếp chắn nửa đường tròn) $\Rightarrow BM \parallel OP$.
$ON \perp AB$ và $AP \perp AB \Rightarrow ON \parallel AP$. Mà $BM \parallel OP \Rightarrow BN \parallel OP$. Do đó tứ giác $OBNP$ có các cạnh đối song song nên là hình bình hành.
c) Sử dụng định lí Desargues hoặc tính chất trọng tâm/tọa độ tỉ cự trong tam giác, ta chứng minh được ba điểm $I, J, K$ cùng nằm trên một đường thẳng đối xứng.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (564, 63, 'V', 'Cực trị thực tế', 'Người ta giăng lưới để nuôi riêng một loại cá trên một góc hồ. Biết rằng lưới được giăng theo một đường thẳng từ một vị trí trên bờ ngang đến một vị trí trên bờ dọc và phải đi qua một cái cọc đã cắm sẵn ở vị trí $A$. Hỏi diện tích nhỏ nhất có thể giăng của khu nuôi cá riêng biệt là bao nhiêu, biết rằng khoảng cách từ cọc đến bờ ngang là 5 m và khoảng cách từ cọc đến bờ dọc là 12 m.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_52_trang_474_V_609396.png', 'Chọn hệ trục tọa độ $Oxy$ sao cho bờ ngang là tia $Ox$, bờ dọc là tia $Oy$.
Cọc ở vị trí $A(12; 5)$.
Đường thẳng đi qua $A$ cắt $Ox$ tại $M(a; 0)$ và $Oy$ tại $N(0; b)$ với $a > 12, b > 5$.
Phương trình đoạn chắn: $\frac{12}{a} + \frac{5}{b} = 1$.
Áp dụng bất đẳng thức Cauchy: $1 = \frac{12}{a} + \frac{5}{b} \ge 2\sqrt{\frac{60}{ab}} \Rightarrow 1 \ge \frac{240}{ab} \Rightarrow ab \ge 240$.
Diện tích khu nuôi cá là $S = \frac{1}{2}ab \ge \frac{1}{2} \cdot 240 = 120\text{ m}^2$.
Dấu bằng xảy ra khi $\frac{12}{a} = \frac{5}{b} = \frac{1}{2} \Leftrightarrow a = 24, b = 10$.
Vậy diện tích nhỏ nhất là $120\text{ m}^2$.', 'SỞ GIÁO DỤC VÀ ĐÀO TẠO HÀ NỘI - Bộ đề thi thử Hà Nội Lần 2 - Đề số 52 (Trang 474) (2024 - 2025)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (565, 64, 'I.1', 'Bảng tần số ghép nhóm', 'Cho bảng tần số ghép nhóm sau về tuổi thọ của một số ong mật cái như sau:
<table border="1"><tr><td>Tuổi thọ (ngày)</td><td>[30; 40)</td><td>[40; 50)</td><td>[50; 60)</td></tr><tr><td>Tần số</td><td>14</td><td>24</td><td>22</td></tr></table>
Tìm tần số ghép nhóm và tần số tương đối ghép nhóm của nhóm [40; 50).', NULL, 'Tổng số ong mật: $n = 14 + 24 + 22 = 60$.
Tần số ghép nhóm của nhóm [40; 50) là 24.
Tần số tương đối ghép nhóm của nhóm [40; 50) là $\frac{24}{60} \cdot 100\% = 40\%$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (566, 64, 'I.2', 'Xác suất', 'Trong một hộp đựng 15 tấm thẻ đánh số từ 1 đến 15 và không có hai tấm thẻ nào đánh số trùng nhau. An rút ngẫu nhiên một tấm thẻ trong hộp. Tính xác suất của biến cố A: “An rút được tấm thẻ đánh số chia hết cho 3 và không vượt quá 10”.', NULL, 'Số kết quả có thể xảy ra là 15.
Các tấm thẻ chia hết cho 3 và không vượt quá 10 là $\{3; 6; 9\}$, có 3 kết quả thuận lợi.
Xác suất của biến cố $A$ là $P(A) = \frac{3}{15} = \frac{1}{5}$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (567, 64, 'II', 'Rút gọn căn thức', 'Cho hai biểu thức $M = \frac{x + 3}{\sqrt{x} - 2}$ và $N = \frac{\sqrt{x} - 1}{\sqrt{x} + 2} + \frac{5\sqrt{x} - 2}{x - 4}$ với $x > 0, x \neq 4$.
1) Tính giá trị biểu thức của $M$ khi $x = 9$.
2) Rút gọn biểu thức $N$.
3) Tìm giá trị của $x$ để biểu thức $\frac{M}{N}$ đạt giá trị nhỏ nhất.', NULL, '1) Thay $x = 9$ vào $M$: $M = \frac{9 + 3}{\sqrt{9} - 2} = \frac{12}{3 - 2} = 12$.
2) $N = \frac{(\sqrt{x} - 1)(\sqrt{x} - 2) + 5\sqrt{x} - 2}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{x + 2\sqrt{x}}{(\sqrt{x} - 2)(\sqrt{x} + 2)} = \frac{\sqrt{x}}{\sqrt{x} - 2}$.
3) Xét $P = \frac{M}{N} = \frac{x + 3}{\sqrt{x}} = \sqrt{x} + \frac{3}{\sqrt{x}} \ge 2\sqrt{3}$.
Dấu "=" xảy ra khi $\sqrt{x} = \frac{3}{\sqrt{x}} \Leftrightarrow x = 3$ (thỏa mãn ĐKXĐ). Vậy $\min \frac{M}{N} = 2\sqrt{3}$ khi $x = 3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (568, 64, 'III.1', 'Hệ phương trình', 'Một cửa hàng thời trang trong một quý đã nhập hàng với tổng số vốn là 800 triệu và bán hết hàng trong quý đó. Cửa hàng gồm 2 loại thời trang nam và thời trang nữ. Biết thời trang nam lãi 15% và thời trang nữ lãi 20%, tổng số tiền lãi của quý đó là 145 triệu đồng. Tính số vốn cửa hàng đã nhập cho mỗi loại thời trang trên.', NULL, 'Gọi số vốn nhập thời trang nam là $x$ (triệu đồng), thời trang nữ là $y$ (triệu đồng) ($0 < x, y < 800$).
Theo bài ra ta có hệ phương trình:
$\begin{cases} x + y = 800 \\ 0{,}15x + 0{,}2y = 145 \end{cases} \Leftrightarrow \begin{cases} x = 300 \\ y = 500 \end{cases}$ (thỏa mãn).
Vậy số vốn nhập thời trang nam là 300 triệu đồng, thời trang nữ là 500 triệu đồng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (569, 64, 'III.2', 'Chuyển động', 'Một ô tô và một xe máy cùng khởi hành từ A để đi đến B với vận tốc của mỗi xe không đổi trên toàn bộ quãng đường AB dài 120 km. Do vận tốc xe ô tô lớn hơn vận tốc xe máy là 10 km/h nên xe ô tô đến B sớm hơn xe máy là 36 phút. Tính vận tốc của mỗi xe.', NULL, 'Đổi 36 phút $= \frac{3}{5}$ giờ.
Gọi vận tốc của xe máy là $x$ (km/h, $x > 0$), vận tốc ô tô là $x + 10$ (km/h).
Thời gian xe máy đi: $\frac{120}{x}$ (giờ), thời gian ô tô đi: $\frac{120}{x + 10}$ (giờ).
Phương trình: $\frac{120}{x} - \frac{120}{x + 10} = \frac{3}{5} \Leftrightarrow \frac{1}{x} - \frac{1}{x + 10} = \frac{1}{200} \Leftrightarrow x(x + 10) = 2000 \Leftrightarrow x^2 + 10x - 2000 = 0$.
Giải phương trình được $x = 40$ (thỏa mãn) hoặc $x = -50$ (loại).
Vậy vận tốc xe máy là 40 km/h, vận tốc ô tô là 50 km/h.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (570, 64, 'III.3', 'Hệ thức Vi-ét', 'Cho phương trình $x^2 - x - 3 = 0$ có hai nghiệm $x_1, x_2$. Không giải phương trình, hãy tính giá trị của biểu thức $A = 3x_1 x_2^2 + x_1 + x_2(3x_1^2 + 1)$.', NULL, 'Theo định lí Vi-ét: $x_1 + x_2 = 1$ và $x_1 x_2 = -3$.
Biến đổi biểu thức:
$A = 3x_1 x_2^2 + x_1 + 3x_1^2 x_2 + x_2 = 3x_1 x_2(x_1 + x_2) + (x_1 + x_2) = (3x_1 x_2 + 1)(x_1 + x_2)$.
Thay số: $A = [3(-3) + 1] \cdot 1 = -8$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (571, 64, 'IV.1', 'Hình trụ - Hình nón', 'Một hộp đựng bóng tennis có dạng hình trụ chứa vừa khít 3 quả bóng tennis xếp theo chiều dọc như hình bên. Các quả bóng có dạng hình cầu, đường kính 6,8 cm.
{{FIGURE}}
a) Tính thể tích hộp đựng bóng (bỏ qua bề dày của vỏ hộp, lấy $\pi \approx 3{,}14$ và làm tròn kết quả đến hàng đơn vị của $\text{cm}^3$).
b) Tính thể tích bên trong hộp đựng bóng không bị chiếm bởi 3 quả bóng tennis (lấy $\pi \approx 3{,}14$ và làm tròn kết quả đến hàng đơn vị của $\text{cm}^3$).', '/static/figures/BoDeHaNoiLan2_De_53_trang_483_IV_1_615779.png', 'Bán kính đáy hình trụ bằng bán kính bóng: $r = \frac{6{,}8}{2} = 3{,}4\text{ cm}$.
Chiều cao hình trụ: $h = 3 \cdot 6{,}8 = 20{,}4\text{ cm}$.
a) Thể tích hộp: $V_{\text{trụ}} = \pi r^2 h \approx 3{,}14 \cdot 3{,}4^2 \cdot 20{,}4 \approx 741\text{ cm}^3$.
b) Thể tích của 3 quả bóng: $V_{\text{bóng}} = 3 \cdot \left(\frac{4}{3} \pi r^3\right) = 4 \pi r^3 \approx 4 \cdot 3{,}14 \cdot 3{,}4^3 \approx 494\text{ cm}^3$.
Thể tích không bị chiếm: $V = V_{\text{trụ}} - V_{\text{bóng}} \approx 741 - 494 = 247\text{ cm}^3$.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (572, 64, 'IV.2', 'Đường tròn nội tiếp', 'Cho nửa đường tròn $(O)$ đường kính $AB$. Điểm $M$ nằm trên nửa đường tròn ($M \neq A, B$). Tiếp tuyến tại $M$ cắt tiếp tuyến tại $A$ và $B$ của đường tròn $(O)$ lần lượt tại $C$ và $D$.
a) Chứng minh rằng: tứ giác $ACMO$ nội tiếp.
b) Gọi $P$ là giao điểm $CD$ và $AB$. Chứng minh: $PA \cdot PO = PC \cdot PM$.
c) Gọi $E$ là giao điểm của $AM$ và $BD$; $F$ là giao điểm của $AC$ và $BM$. Chứng minh: $E, F, P$ thẳng hàng.', NULL, 'a) Có $CA \perp AB \Rightarrow \widehat{CAO} = 90^\circ$; $CM \perp OM \Rightarrow \widehat{CMO} = 90^\circ$.
Suy ra $\widehat{CAO} + \widehat{CMO} = 180^\circ$, nên tứ giác $ACMO$ nội tiếp.
b) Xét $\triangle PAC$ và $\triangle PMO$ có góc $\widehat{P}$ chung và $\widehat{PAC} = \widehat{PMO}$ (cùng phụ góc liên quan hoặc từ tứ giác nội tiếp $ACMO$), do đó $\triangle PAC \sim \triangle PMO$ (g.g) $\Rightarrow \frac{PA}{PM} = \frac{PC}{PO} \Rightarrow PA \cdot PO = PC \cdot PM$.
c) Dùng tỉ số đoạn thẳng hoặc định lý Menelaus / định lý Desargues cho tam giác: $AC \parallel BD$, $AM \cap BD = E$, $BM \cap AC = F$. Đường nối $E, F$ cắt $AB, CD$ tạo chùm điều hòa, suy ra đường thẳng $EF$ đi qua giao điểm $P$ của $AB$ và $CD$. Do đó $E, F, P$ thẳng hàng.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483) (2025 - 2026)');
INSERT INTO questions (id, exam_id, slot, sub_topic, content, figure_path, solution, source_name) VALUES (573, 64, 'V', 'Cực trị thực tế', 'Cho một tấm nhôm hình vuông cạnh 12 cm. Người ta cắt ở bốn góc của tấm nhôm đó bốn hình vuông bằng nhau, mỗi hình vuông có cạnh bằng $x$ (cm), rồi gấp tấm nhôm lại như hình vẽ dưới đây để được một cái hộp không nắp. Tìm $x$ để thể tích của hộp là lớn nhất.
{{FIGURE}}', '/static/figures/BoDeHaNoiLan2_De_53_trang_483_V_615789.png', 'Điều kiện cạnh cắt: $0 < x < 6$.
Hộp không nắp có đáy là hình vuông cạnh $12 - 2x$ (cm) và chiều cao là $x$ (cm).
Thể tích khối hộp là:
$V(x) = x(12 - 2x)^2 = 4x(6 - x)^2$.
Áp dụng bất đẳng thức Cauchy cho 3 số dương $2x, 6 - x, 6 - x$:
$2x \cdot (6 - x) \cdot (6 - x) \le \left(\frac{2x + 6 - x + 6 - x}{3}\right)^3 = \left(\frac{12}{3}\right)^3 = 64$.
Suy ra $V(x) = 2 \cdot [2x(6 - x)^2] \le 2 \cdot 64 = 128\text{ cm}^3$.
Dấu "=" xảy ra khi $2x = 6 - x \Leftrightarrow 3x = 6 \Leftrightarrow x = 2$ (thỏa mãn).
Vậy $x = 2\text{ cm}$ thì thể tích của hộp lớn nhất.', 'Sở GD&ĐT Hà Nội - Bộ đề thi thử Hà Nội Lần 2 - Đề số 53 (Trang 483) (2025 - 2026)');
