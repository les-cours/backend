-- Insert data into the accounts table
INSERT INTO accounts (username, email, password, status, user_type, online_status) VALUES
('user1', 'user1@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE),
('user2', 'user2@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE),
('user3', 'user3@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE),
('user4', 'user4@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE),
('user5', 'user5@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE),
('user6', 'user6@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE),
('user7', 'user7@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE),
('user8', 'user8@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE),
('user9', 'user9@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE),
('user10', 'user10@example.com', '$2a$12$2F4QvaqBv59e0AAeGx03IO/Wv5qwbj16yhbfmQwQ6lzQ0qaMD5jK2', 'active', 'student', TRUE);



-- Insert high school specializations into the database using slugs as IDs
INSERT INTO departments(department_id, title, title_ar, schools, description, description_ar)
 VALUES
 ('experimental-sciences', 'Experimental Sciences', 'شعبة العلوم التجريبية', 'high', 'Department focused on experimental sciences like biology, chemistry, and physics.', 'قسم يركز على العلوم التجريبية مثل البيولوجيا والكيمياء والفيزياء.'),
('literature-and-philosophy', 'Literature and Philosophy', 'شعبة آداب وفلسفة', 'high', 'Department for the study of literature and philosophy.', 'قسم لدراسة الآداب والفلسفة.'),
('management-and-economics', 'Management and Economics', 'شعبة تسيير واقتصاد', 'high', 'Focuses on subjects related to management and economics.', 'يتركز على المواد المتعلقة بالإدارة والاقتصاد.'),
('technical-sciences', 'Technical Sciences', 'شعبة تقني رياضي', 'high', 'Department dedicated to technical and engineering sciences.', 'قسم مخصص للعلوم التقنية والهندسية.'),
('foreign-languages', 'Foreign Languages', 'شعبة لغات أجنبية', 'high', 'Focuses on the study of foreign languages.', 'يتركز على دراسة اللغات الأجنبية.'),
('mathematics', 'Mathematics', 'شعبة رياضيات', 'high', 'Department specializing in advanced mathematics studies.', 'قسم متخصص في دراسات الرياضيات المتقدمة.');

INSERT INTO grades (grade_id, department_id, title, title_ar) VALUES
('experimental-sciences-1', 'experimental-sciences', 'Experimental Sciences Year 1', 'العلوم التجريبية السنة الأولى'),
('experimental-sciences-2', 'experimental-sciences', 'Experimental Sciences Year 2', 'العلوم التجريبية السنة الثانية'),
('experimental-sciences-3', 'experimental-sciences', 'Experimental Sciences Year 3', 'العلوم التجريبية السنة الثالثة'),

('literature-and-philosophy-1', 'literature-and-philosophy', 'Literature and Philosophy Year 1', 'آداب وفلسفة السنة الأولى'),
('literature-and-philosophy-2', 'literature-and-philosophy', 'Literature and Philosophy Year 2', 'آداب وفلسفة السنة الثانية'),
('literature-and-philosophy-3', 'literature-and-philosophy', 'Literature and Philosophy Year 3', 'آداب وفلسفة السنة الثالثة'),

('management-and-economics-2', 'management-and-economics', 'Management and Economics Year 2', 'تسيير واقتصاد السنة الثانية'),
('management-and-economics-3', 'management-and-economics', 'Management and Economics Year 3', 'تسيير واقتصاد السنة الثالثة'),

('technical-sciences-2', 'technical-sciences', 'Technical Sciences Year 2', 'تقني رياضي السنة الثانية'),
('technical-sciences-3', 'technical-sciences', 'Technical Sciences Year 3', 'تقني رياضي السنة الثالثة'),

('foreign-languages-2', 'foreign-languages', 'Foreign Languages Year 2', 'لغات أجنبية السنة الثانية'),
('foreign-languages-3', 'foreign-languages', 'Foreign Languages Year 3', 'لغات أجنبية السنة الثالثة'),

('mathematics-2', 'mathematics', 'Mathematics Year 2', 'رياضيات السنة الثانية'),
('mathematics-3', 'mathematics', 'Mathematics Year 3', 'رياضيات السنة الثالثة');



INSERT INTO subjects (subject_id, title, title_ar) VALUES
('high-nat-sci-1', 'Natural Sciences 1', '1 العلوم الطبيعية'),
('high-nat-sci-2', 'Natural Sciences 2', '2 العلوم الطبيعية'),
('high-nat-sci-3', 'Natural Sciences 3', '3 العلوم الطبيعية'),

('high-phy-sci-1', 'Physical Sciences 1', '1 العلوم الفيزيائية'),
('high-phy-sci-2', 'Physical Sciences 2', '2 العلوم الفيزيائية'),
('high-phy-sci-3', 'Physical Sciences 3', '3 العلوم الفيزيائية'),

('high-math-sci-1', 'Mathematics 1', '1 الرياضيات'),
('high-math-sci-2', 'Mathematics 2', '2 الرياضيات'),
('high-math-sci-3', 'Mathematics 3', '3 الرياضيات'),

('high-arabic-sci-1', 'Arabic Language 1', '1 اللغة العربية'),
('high-arabic-sci-2', 'Arabic Language 2', '2 اللغة العربية'),
('high-arabic-sci-3', 'Arabic Language 3', '3 اللغة العربية'),

('high-french-sci-1', 'French Language 1', '1 اللغة الفرنسية'),
('high-french-sci-2', 'French Language 2', '2 اللغة الفرنسية'),
('high-french-sci-3', 'French Language 3', '3 اللغة الفرنسية'),

('high-english-sci-1', 'English Language 1', '1 اللغة الإنجليزية'),
('high-english-sci-2', 'English Language 2', '2 اللغة الإنجليزية'),
('high-english-sci-3', 'English Language 3', '3 اللغة الإنجليزية'),

('high-islamic-1', 'Islamic Studies 1', '1 العلوم الإسلامية'),
('high-islamic-2', 'Islamic Studies 2', '2 العلوم الإسلامية'),
('high-islamic-3', 'Islamic Studies 3', '3 العلوم الإسلامية'),

('high-history-geo-sci-1', 'History and Geography 1', '1 التاريخ والجغرافيا'),
('high-history-geo-sci-2', 'History and Geography 2', '2 التاريخ والجغرافيا'),
('high-history-geo-sci-3', 'History and Geography 3', '3 التاريخ والجغرافيا'),

('high-philosophy-sci-1', 'Philosophy 1', '1 الفلسفة'),
('high-philosophy-sci-2', 'Philosophy 2', '2 الفلسفة'),
('high-philosophy-sci-3', 'Philosophy 3', '3 الفلسفة');



-- Link subjects to the Experimental Sciences grade
INSERT INTO grades_subjects (subject_id, grade_id) VALUES
('high-nat-sci-1', 'experimental-sciences-1'),
('high-nat-sci-2', 'experimental-sciences-2'),
('high-nat-sci-3', 'experimental-sciences-3'),
('high-nat-sci-3', 'mathematics-3'),

('high-phy-sci-1', 'experimental-sciences-1'),
('high-phy-sci-2', 'experimental-sciences-2'),
('high-phy-sci-2', 'technical-sciences-2'),
('high-phy-sci-2', 'mathematics-2'),
('high-phy-sci-3', 'experimental-sciences-3'),
('high-phy-sci-3', 'technical-sciences-3'),
('high-phy-sci-3', 'mathematics-3'),


('high-math-sci-1', 'experimental-sciences-1'),
('high-math-sci-2', 'experimental-sciences-2'),
('high-math-sci-2', 'technical-sciences-2'),
('high-math-sci-2', 'mathematics-2'),
('high-math-sci-3', 'experimental-sciences-3'),
('high-math-sci-3', 'technical-sciences-3'),
('high-math-sci-3', 'mathematics-3'),


('high-arabic-sci-1', 'experimental-sciences-1'),
('high-arabic-sci-2', 'experimental-sciences-2'),
('high-arabic-sci-2', 'technical-sciences-2'),
('high-arabic-sci-2', 'mathematics-2'),
('high-arabic-sci-3', 'experimental-sciences-3'),
('high-arabic-sci-3', 'technical-sciences-3'),
('high-arabic-sci-3', 'mathematics-3'),


('high-french-sci-1', 'experimental-sciences-1'),
('high-french-sci-2', 'experimental-sciences-2'),
('high-french-sci-2', 'technical-sciences-2'),
('high-french-sci-2', 'mathematics-2'),
('high-french-sci-3', 'experimental-sciences-3'),
('high-french-sci-3', 'technical-sciences-3'),
('high-french-sci-3', 'mathematics-3'),


('high-english-sci-1', 'experimental-sciences-1'),
('high-english-sci-2', 'experimental-sciences-2'),
('high-english-sci-2', 'technical-sciences-2'),
('high-english-sci-2', 'mathematics-2'),
('high-english-sci-3', 'experimental-sciences-3'),
('high-english-sci-3', 'technical-sciences-3'),
('high-english-sci-3', 'mathematics-3'),


('high-islamic-1', 'experimental-sciences-1'),
('high-islamic-2', 'experimental-sciences-2'),
('high-islamic-2', 'technical-sciences-2'),
('high-islamic-2', 'mathematics-2'),
('high-islamic-3', 'experimental-sciences-3'),
('high-islamic-3', 'technical-sciences-3'),
('high-islamic-3', 'mathematics-3'),

('high-history-geo-sci-1', 'experimental-sciences-1'),
('high-history-geo-sci-2', 'experimental-sciences-2'),
('high-history-geo-sci-2', 'technical-sciences-2'),
('high-history-geo-sci-2', 'mathematics-2'),
('high-history-geo-sci-3', 'experimental-sciences-3'),
('high-history-geo-sci-3', 'technical-sciences-3'),
('high-history-geo-sci-3', 'mathematics-3'),

('high-philosophy-sci-3', 'experimental-sciences-3'),
('high-philosophy-sci-3', 'mathematics-3'),
('high-philosophy-sci-3', 'technical-sciences-3');

INSERT INTO months (id, title, title_ar) VALUES
(1, 'January', 'يناير'),
(2, 'February', 'فبراير'),
(3, 'March', 'مارس'),
(4, 'April', 'أبريل'),
(5, 'May', 'مايو'),
(6, 'June', 'يونيو'),
(7, 'July', 'يوليو'),
(8, 'August', 'أغسطس'),
(9, 'September', 'سبتمبر'),
(10, 'October', 'أكتوبر'),
(11, 'November', 'نوفمبر'),
(12, 'December', 'ديسمبر');


INSERT INTO cities (id, city_name, city_title_ar) VALUES
(1, 'Adrar', 'أدرار'),
(2, 'Chlef', 'الشلف'),
(3, 'Laghouat', 'الأغواط'),
(4, 'Oum El Bouaghi', 'أم البواقي'),
(5, 'Batna', 'باتنة'),
(6, 'Béjaïa', 'بجاية'),
(7, 'Biskra', 'بسكرة'),
(8, 'Béchar', 'بشار'),
(9, 'Blida', 'البليدة'),
(10, 'Bouira', 'البويرة'),
(11, 'Tamanrasset', 'تمنراست'),
(12, 'Tébessa', 'تبسة'),
(13, 'Tlemcen', 'تلمسان'),
(14, 'Tiaret', 'تيارت'),
(15, 'Tizi Ouzou', 'تيزي وزو'),
(16, 'Alger', 'الجزائر'),
(17, 'Djelfa', 'الجلفة'),
(18, 'Jijel', 'جيجل'),
(19, 'Sétif', 'سطيف'),
(20, 'Saïda', 'سعيدة'),
(21, 'Skikda', 'سكيكدة'),
(22, 'Sidi Bel Abbès', 'سيدي بلعباس'),
(23, 'Annaba', 'عنابة'),
(24, 'Guelma', 'قالمة'),
(25, 'Constantine', 'قسنطينة'),
(26, 'Médéa', 'المدية'),
(27, 'Mostaganem', 'مستغانم'),
(28, 'M-Sila', 'المسيلة'),
(29, 'Mascara', 'معسكر'),
(30, 'Ouargla', 'ورقلة'),
(31, 'Oran', 'وهران'),
(32, 'El Bayadh', 'البيض'),
(33, 'Illizi', 'اليزي'),
(34, 'Bordj Bou Arréridj', 'برج بوعريريج'),
(35, 'Boumerdès', 'بومرداس'),
(36, 'El Tarf', 'الطارف'),
(37, 'Tindouf', 'تندوف'),
(38, 'Tissemsilt', 'تسمسيلت'),
(39, 'El Oued', 'الوادي'),
(40, 'Khenchela', 'خنشلة'),
(41, 'Souk Ahras', 'سوق أهراس'),
(42, 'Tipaza', 'تيبازة'),
(43, 'Mila', 'ميلة'),
(44, 'Aïn Defla', 'عين الدفلى'),
(45, 'Naâma', 'النعامة'),
(46, 'Aïn Témouchent', 'عين تموشنت'),
(47, 'Ghardaïa', 'غرداية'),
(48, 'Relizane', 'غليزان'),
(49, 'El MGhair', 'المغير'),
(50, 'El Menia', 'المنيعة'),
(51, 'Ouled Djellal', 'أولاد جلال'),
(52, 'Bordj Baji Mokhtar', 'برج باجي مختار'),
(53, 'Beni Abbes', 'بني عباس'),
(54, 'Timimoun', 'تميمون'),
(55, 'Touggourt', 'تقرت'),
(56, 'Djanet', 'جانت'),
(57, 'Ain Salah', 'إن صالح'),
(58, 'Ain Guezzam', 'إن قزام');



-- Using subquery to fetch account IDs dynamically from the accounts table
-- Matching on username which should be unique as ensured by the accounts table setup
INSERT INTO students (student_id, grade_id, city_id, firstname, lastname, gender, date_of_birth, avatar)
SELECT account_id, 'mathematics-3', 1, firstname, lastname, gender, '2000-01-01', 'default_avatar.png'
FROM (VALUES
    ('user1', 'John', 'Doe', 'M'),
    ('user2', 'Jane', 'Doe', 'F'),
    ('user3', 'Jim', 'Beam', 'M'),
    ('user4', 'Jill', 'Hill', 'F'),
    ('user5', 'Jack', 'Smith', 'M'),
    ('user6', 'Julia', 'Roberts', 'F'),
    ('user7', 'Jordan', 'Belfort', 'M'),
    ('user8', 'Joan', 'Arc', 'F'),
    ('user9', 'Joseph', 'Bloggs', 'M'),
    ('user10', 'Jessie', 'James', 'F')
) AS tmp(username, firstname, lastname, gender)
JOIN accounts ON accounts.username = tmp.username;
