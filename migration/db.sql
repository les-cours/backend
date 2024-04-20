CREATE EXTENSION IF NOT EXISTS pgcrypto;
--       CREATE TYPE PAYMENT_METHOD AS ENUM('baridimob', 'card', 'flexi', 'paypal');
      CREATE TYPE ACCOUNT_STATE AS ENUM('active', 'disabled', 'banned');
      CREATE TYPE USER_TYPE AS ENUM('student', 'teacher', 'admin');
      CREATE TYPE SCHOOLS AS ENUM('school','middle','high');


CREATE TABLE plan (
    plan_id TEXT  PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT DEFAULT '',
    price INT NOT NULL,
    new_price INT DEFAULT 0,
    promotion BOOLEAN DEFAULT FALSE,
    level INT NOT NULL,
    category TEXT NOT NUll
);

CREATE TABLE accounts (
    account_id TEXT PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    status ACCOUNT_STATE NOT NULL,
    user_type USER_TYPE NOT NULL,
    plan_id TEXT REFERENCES plan(plan_id)
);

/**
 * Roles
 **/
CREATE TABLE permissions (
    id SERIAL PRIMARY KEY,
    account_id TEXT REFERENCES accounts(account_id) ON DELETE CASCADE,
    write_comment BOOLEAN NOT NULL,
    live BOOLEAN NOT NULL,
    settings BOOLEAN NOT NULL
);

CREATE TABLE departments (
    department_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    arabic_name TEXT,
    schools SCHOOLS NOT NULL
);

CREATE TABLE grades (
     grade_id TEXT PRIMARY KEY,
     department_id TEXT REFERENCES departments(department_id) ON DELETE CASCADE,
     name TEXT NOT NULL,
     arabic_name TEXT
);


CREATE TABLE subjects (
     subject_id TEXT PRIMARY KEY,
     name TEXT NOT NULL,
     arabic_name TEXT
);



CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    student_id TEXT REFERENCES accounts(account_id) ON DELETE CASCADE,
    grade_id TEXT REFERENCES grades(grade_id) ON DELETE CASCADE,
    city_id INTEGER REFERENCES cities(id) ON DELETE CASCADE,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    date_of_birth DATE DEFAULT '2000-01-01',
    online_status BOOLEAN DEFAULT TRUE,
    default_avatar TEXT NOT NULL DEFAULT '',
    notification_status BOOLEAN DEFAULT TRUE,
	avatar TEXT NOT NULL DEFAULT ''
);

CREATE TABLE teachers (
    teacher_id TEXT PRIMARY KEY REFERENCES accounts(account_id) ON DELETE CASCADE,  -- one to one
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL
);


CREATE TABLE grades_subjects (
     subject_id TEXT REFERENCES subjects(subject_id) ON DELETE CASCADE,
     grade_id TEXT REFERENCES grades(grade_id) ON DELETE CASCADE
);

CREATE TABLE teacher_subjects (
     subject_id TEXT REFERENCES subjects(subject_id) ON DELETE CASCADE,
     teacher_id TEXT REFERENCES teachers(teacher_id) ON DELETE CASCADE
);

CREATE TABLE login_history (
    id SERIAL PRIMARY KEY,
    account_id TEXT REFERENCES accounts(account_id) ON DELETE CASCADE,
    ip VARCHAR(35) NOT NULL,
        timestamp BIGINT NOT NULL,
        user_agent TEXT NOT NULL,
        os_name VARCHAR(512) NOT NULL,
        country VARCHAR(256) NOT NULL,
        city VARCHAR(512) NOT NULL
);



INSERT INTO plan ("plan_id","name","description","price","new_price","promotion","level","category") VALUES ('PLAN_free','free','free',0,0,'FALSE',1,'test');

INSERT INTO accounts ("username","account_id","email","password","status","user_type","plan_id") VALUES ('chouache_chouaib','1a395308-7ac9-44d7-80af-72e57c8892d8','chouaib@school.dz','$2a$06$ouSixblRauitV1UzPhyjf.wPNoBTZ.0q.kdLGPHvmg2RGp7WZ7CL2','active','student','PLAN_free');

INSERT INTO cities (id,city_name) VALUES (1,'SETIF');





INSERT INTO "public"."permissions" ("id","account_id","write_comment","live","settings") VALUES (1,'1a395308-7ac9-44d7-80af-72e57c8892d8','FALSE','FALSE','FALSE');


INSERT INTO departments (department_id, name, arabic_name, schools)
VALUES
('ALG_SS', 'default', 'شعبة افتراضية', 'school'),
('ALG_MS', 'default', 'شعبة افتراضية', 'middle'),
('ALG_HS_MATH', 'Mathematics High School', 'شعبة رياضيات', 'high'),
('ALG_HS_SYS', 'Sciences High School', 'شعبة علوم تجريبية', 'high'),
('ALG_HS_LITERARY', 'Literary High School', 'شعبة أدبيات', 'high'),
('ALG_HS_TECH', 'Technical High School', 'شعبة تقني رياضي', 'high');


-- Insert example data
INSERT INTO grades(grade_id, department_id, name, arabic_name)
VALUES
('GRADE_1_SS', 'ALG_SS', 'Grade 1', 'الصف الأول'),
('GRADE_2_SS', 'ALG_SS', 'Grade 2', 'الصف الثاني'),
('GRADE_3_SS', 'ALG_SS', 'Grade 3', 'الصف الثالث'),
('GRADE_4_SS', 'ALG_SS', 'Grade 4', 'الصف الرابع'),
('GRADE_5_SS', 'ALG_SS', 'Grade 5', 'الصف الخامس'),

('GRADE_1_MS', 'ALG_MS', 'Grade 1', 'الصف الأول'),
('GRADE_2_MS', 'ALG_MS', 'Grade 2', 'الصف الثاني'),
('GRADE_3_MS', 'ALG_MS', 'Grade 3', 'الصف الثالث'),
('GRADE_4_MS', 'ALG_MS', 'Grade 4', 'الصف الرابع'),

('GRADE_2_MATH', 'ALG_HS_MATH', 'Grade 2', 'الصف الثاني'),
('GRADE_3_MATH', 'ALG_HS_MATH', 'Grade 3', 'الصف الثالث'),

('GRADE_1_SYS', 'ALG_HS_SYS', 'Grade 1', 'الصف الأول'),
('GRADE_2_SYS', 'ALG_HS_SYS', 'Grade 2', 'الصف الثاني'),
('GRADE_3_SYS', 'ALG_HS_SYS', 'Grade 3', 'الصف الثالث'),

('GRADE_1_LITERARY', 'ALG_HS_LITERARY', 'Grade 1', 'الصف الأول'),
('GRADE_2_LITERARY', 'ALG_HS_LITERARY', 'Grade 2', 'الصف الثاني'),
('GRADE_3_LITERARY', 'ALG_HS_LITERARY', 'Grade 3', 'الصف الثالث'),


('GRADE_2_TECH', 'ALG_HS_TECH', 'Grade 2', 'الصف الثاني'),
('GRADE_3_TECH', 'ALG_HS_TECH', 'Grade 3', 'الصف الثالث');


-- Inserting subjects
INSERT INTO subjects (subject_id, name, arabic_name)
VALUES
('LITERATURE_SCIENCE_2', 'Literature (SCIENCE) 2 ', '2 الأدب علمي'),
('MATH_SCIENCE_1', 'MATH (SCIENCE) 1 ', '1 الرياضيات علمي');

-- Inserting grades_subjects relationships
INSERT INTO grades_subjects (subject_id, grade_id)
VALUES
('LITERATURE_SCIENCE_2', 'GRADE_2_SYS'),
('LITERATURE_SCIENCE_2', 'GRADE_2_TECH'),
('LITERATURE_SCIENCE_2', 'GRADE_2_MATH'),
('MATH_SCIENCE_1', 'GRADE_1_SYS');


INSERT INTO students (student_id, grade_id, city_id, firstname, lastname, gender, date_of_birth, online_status, default_avatar, notification_status)
VALUES ('1a395308-7ac9-44d7-80af-72e57c8892d8', 'GRADE_3_MATH', 1, 'chouache', '_chouaib', 'M', '2000-03-04', TRUE, '', TRUE);