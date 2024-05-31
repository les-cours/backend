CREATE EXTENSION IF NOT EXISTS pgcrypto;



CREATE TYPE ACCOUNT_STATE AS ENUM('active', 'inactive', 'banned');
CREATE TYPE USER_TYPE AS ENUM('student', 'teacher', 'admin');
CREATE TYPE SCHOOLS AS ENUM('school', 'middle', 'high');

CREATE TABLE accounts (
    account_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    status ACCOUNT_STATE NOT NULL,
    user_type USER_TYPE NOT NULL,
    online_status BOOLEAN DEFAULT TRUE
);

CREATE INDEX idx_accounts_username ON accounts(username);
CREATE INDEX idx_accounts_email ON accounts(email);

CREATE TABLE permissions (
    account_id UUID REFERENCES accounts(account_id) ON DELETE CASCADE,
    orgs_create BOOLEAN DEFAULT FALSE,
    orgs_update BOOLEAN DEFAULT FALSE,
    orgs_delete BOOLEAN DEFAULT FALSE,
    orgs_read BOOLEAN DEFAULT FALSE,
    users_create BOOLEAN DEFAULT FALSE,
    users_update BOOLEAN DEFAULT FALSE,
    users_delete BOOLEAN DEFAULT FALSE,
    users_read BOOLEAN DEFAULT FALSE,
    learning_create BOOLEAN DEFAULT FALSE,
    learning_update BOOLEAN DEFAULT FALSE,
    learning_delete BOOLEAN DEFAULT FALSE,
    learning_read BOOLEAN DEFAULT FALSE
);

CREATE TABLE departments (
    department_id VARCHAR(40) PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    title_ar VARCHAR(255) NOT NULL,
    description TEXT DEFAULT '',
    description_ar TEXT DEFAULT '',
    schools SCHOOLS NOT NULL
);

CREATE TABLE grades (
    grade_id VARCHAR(40) PRIMARY KEY DEFAULT gen_random_uuid(),
    department_id VARCHAR(40) REFERENCES departments(department_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    title_ar VARCHAR(255)
);

CREATE TABLE subjects (
    subject_id VARCHAR(40) PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    title_ar VARCHAR(255)
);

CREATE TABLE grades_subjects (
    subject_id VARCHAR(40) REFERENCES subjects(subject_id) ON DELETE CASCADE,
    grade_id VARCHAR(40) REFERENCES grades(grade_id) ON DELETE CASCADE,
    PRIMARY KEY (subject_id, grade_id)
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    city_name VARCHAR(50) UNIQUE NOT NULL,
    city_name_ar VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE months (
    id SERIAL PRIMARY KEY,
    title VARCHAR(10) UNIQUE NOT NULL,
    title_ar VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE students (
    student_id UUID PRIMARY KEY REFERENCES accounts(account_id) ON DELETE CASCADE,
    grade_id VARCHAR(40) REFERENCES grades(grade_id) ON DELETE CASCADE,
    city_id INT REFERENCES cities(id) ON DELETE CASCADE,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    date_of_birth DATE DEFAULT '2000-01-01',
    notification_status BOOLEAN DEFAULT TRUE,
    avatar TEXT DEFAULT '',
    amount SERIAL NOT NULL, --MAX = 214,748,3647.00
    deleted_at TIMESTAMP
);

CREATE TABLE teachers (
    teacher_id UUID PRIMARY KEY REFERENCES accounts(account_id) ON DELETE CASCADE,
    city_id INT REFERENCES cities(id) ON DELETE CASCADE,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    date_of_birth DATE DEFAULT '2000-01-01',
    description TEXT DEFAULT '',
    description_ar TEXT DEFAULT '',
    badge VARCHAR(255),
    avatar TEXT DEFAULT '',
    deleted_at TIMESTAMP
);

CREATE TABLE teacher_subjects (
    subject_id VARCHAR(40) REFERENCES subjects(subject_id) ON DELETE CASCADE,
    teacher_id UUID REFERENCES teachers(teacher_id) ON DELETE CASCADE,
    PRIMARY KEY (subject_id, teacher_id)
);

CREATE TABLE email_confirmation (
    account_id UUID PRIMARY KEY REFERENCES accounts(account_id) ON DELETE CASCADE,
    code VARCHAR(40) NOT NULL,
    expires_at TIMESTAMP NOT NULL
);

CREATE TABLE teachers_invitations (
    teacher_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) NOT NULL,
    subjects TEXT NOT NULL
);

CREATE TABLE classrooms (
    classroom_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    teacher_id UUID,
    subject_id VARCHAR(40),
    title VARCHAR(255) NOT NULL,
    arabic_title VARCHAR(255),
    image VARCHAR(255),
    price VARCHAR(255),
    badge VARCHAR(255),
    description TEXT DEFAULT '',
    description_ar TEXT DEFAULT '',
    deleted_at TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id) ON DELETE SET NULL,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id) ON DELETE SET NULL,
    CONSTRAINT unique_teacher_subject UNIQUE (teacher_id, subject_id)
);

CREATE TABLE chapters (
    chapter_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    classroom_id UUID,
    title VARCHAR(255),
    arabic_title VARCHAR(255),
    description TEXT DEFAULT '',
    description_ar TEXT DEFAULT '',
    deleted_at TIMESTAMP,
    FOREIGN KEY (classroom_id) REFERENCES classrooms(classroom_id) ON DELETE SET NULL
);

CREATE TABLE lessons (
    lesson_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    chapter_id UUID,
    title VARCHAR(255),
    arabic_title VARCHAR(255),
    description TEXT DEFAULT '',
    description_ar TEXT DEFAULT '',
    deleted_at TIMESTAMP,
    month_id INT,
    FOREIGN KEY (chapter_id) REFERENCES chapters(chapter_id) ON DELETE SET NULL,
    FOREIGN KEY (month_id) REFERENCES months(id) ON DELETE SET NULL
);

CREATE TABLE documents (
    document_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    lesson_id UUID,
    document_type VARCHAR(6),
    title VARCHAR(255) NOT NULL,
    arabic_title VARCHAR(255) NOT NULL,
    description TEXT DEFAULT '',
    description_ar TEXT DEFAULT '',
    duration TIME,
    lecture_number INT,
    document_link VARCHAR(255) NOT NULL,
    FOREIGN KEY (lesson_id) REFERENCES lessons(lesson_id) ON DELETE SET NULL,
    CHECK (document_type IN ('video', 'pdf'))
);


CREATE TABLE comments (
    comment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_by UUID,
    is_owner BOOLEAN,
    video_id UUID,
    comment VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reply_to UUID,
    FOREIGN KEY (created_by) REFERENCES accounts(account_id) ON DELETE SET NULL,
    FOREIGN KEY (video_id) REFERENCES documents(document_id) ON DELETE SET NULL,
    FOREIGN KEY (reply_to) REFERENCES comments(comment_id) ON DELETE SET NULL
);


CREATE TABLE lessons_document (
    lesson_id UUID,
    document_id UUID,
    PRIMARY KEY (lesson_id, document_id),
    FOREIGN KEY (lesson_id) REFERENCES lessons(lesson_id) ON DELETE CASCADE
);

-- subscription
CREATE TABLE subscription (
    subscription_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    classroom_id UUID,
    student_id UUID,
    month_id INT,
    paid_at TIMESTAMP DEFAULT now(),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(classroom_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (month_id) REFERENCES months(id) ON DELETE SET NULL
);

-- discounts
CREATE TABLE discounts (
    discounts_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    classroom_id UUID,
    student_id UUID,
    month_id INT,
    paid_at TIMESTAMP DEFAULT now(),
    FOREIGN KEY (classroom_id) REFERENCES classrooms(classroom_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (month_id) REFERENCES months(id) ON DELETE SET NULL
);

CREATE TABLE payment_codes (
    id serial PRIMARY KEY ,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    code character varying(50) NOT NULL,
    amount serial NOT NULL,
    used_at timestamp without time zone NULL
  );
