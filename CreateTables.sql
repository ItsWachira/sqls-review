

DROP DATABASE evergreen_academy_db;

CREATE DATABASE evergreen_academy_db;

USE evergreen_academy_db;


-- Create User_Account table
CREATE TABLE user_acount (
  user_account_id BIGINT unsigned AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(255),
  user_email VARCHAR(255),
  date_of_birth datetime,
  gender VARCHAR(50),
  user_type ENUM ("student", "teacher") ,
  user_hashed_password VARCHAR(255),
  password_status ENUM ("Active","stale"),
  password_last_changed TIMESTAMP,
  last_login TIMESTAMP,
  failed_log_in_attempts INT,
  date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
   UNIQUE KEY uindex_user_account_id (user_account_id),
    KEY index_email_address (user_email),
	KEY index_user_name (user_name),
    KEY index_gender (gender),
    KEY index_user_type (user_type),
    KEY index_user_password (user_password), 
    KEY index_date_created (date_created),
    KEY index_date_modified (date_modified)
    
    

 
);

-- Create Teachers table
CREATE TABLE teachers (
  teacher_id BIGINT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  user_account_id BIGINT UNSIGNED NOT NULL,
  teacher_state ENUM ("Active","Not Active"),
  teacher_state_description VARCHAR(255) NOT NULL ,
  subject_areas VARCHAR(255)NOT NULL,
  hired_date DATETIME,
  date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
UNIQUE KEY uindex_teacher_id (teacher_id),
	KEY index_user_account_id (user_account_id),
    KEY index_teacher_state (teacher_state),
    KEY index_teacher_state_description (teacher_state_description),
    KEY index_subject_areas (subject_areas), 
	KEY index_hired_date ( hired_date),
    KEY index_date_created (date_created),
    KEY index_date_modified (date_modified), 
    
 CONSTRAINT fk_user_accounts_teachers_user_account_id_user_account_id FOREIGN KEY (user_account_id)
 REFERENCES user_account(user_account_id) ON UPDATE CASCADE ON DELETE RESTRICT
);





-- Create Pupils table
CREATE TABLE pupils (
  pupil_id BIGINT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  user_account_id BIGINT UNSIGNED NOT NULL,
  pupil_state ENUM ("Active","Not Active"),
  pupil_state_description VARCHAR(255),
  enrolled_date DATETIME,
  withdrawn_date DATETIME,
  date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
UNIQUE KEY uindex_pupil_id (pupil_id),
	KEY index_user_account_id (user_account_id),
    KEY index_pupil_state (teacher_state),
    KEY index_pupil_state_description (teacher_state_description),
	KEY index_enrolled_date ( hired_date),
    KEY index_withdrawn_date ( hired_date),
    KEY index_date_created (date_created),
    KEY index_date_modified (date_modified),
    
    
CONSTRAINT fk_user_accounts_pupils_user_account_id_user_account_id FOREIGN KEY (user_account_id)
REFERENCES user_account(user_account_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create Exams table
CREATE TABLE exams (
  exam_id BIGINT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  teacher_id BIGINT UNSIGNED NOT NULL,
  exam_name VARCHAR(255)  NOT NULL,
  exam_description VARCHAR(255) NOT NULL,
  exam_status ENUM ("Complete", "Draft","Done", "Not Done") NOT NULL,
  total_questions INT NOT NULL,
  date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
UNIQUE KEY uindex_exam_id(exam_id),
KEY index_exam_name (exam_name),
KEY index_teacher_id (teacher_id),
KEY index_total_questions (total_questions),
KEY index_exam_status (exam_status),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),

CONSTRAINT fk_teachers_exams_teacher_id_teacher_id FOREIGN KEY (teacher_id)
REFERENCES teacher(teacher_id) ON UPDATE CASCADE ON DELETE RESTRICT

);

-- Create schedule table
CREATE TABLE schedule (
  schedule_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  exam_id BIGINT UNSIGNED NOT NULL,
  scheduled_date DATETIME NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  duration INT NOT NULL, -- in minutes
  location VARCHAR(50) NOT NULL,
  is_rescheduled BOOLEAN DEFAULT FALSE,
  rescheduled_date DATETIME,
  rescheduled_reason VARCHAR(255),
 date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
 date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 
 
UNIQUE KEY uindex_schedule_id(schedule_id),
KEY index_exam_id (exam_name),
KEY index_scheduled_date(scheduled_date),
KEY index_start_time (start_time),
KEY index_end_time (end_time),
KEY index_duration  (duration ),
KEY index_is_rescheduled  (is_rescheduled ),
KEY index_rescheduled_date  (rescheduled_date ),
KEY index_location (location),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),

CONSTRAINT fk_exams_schedule_exam_id_exam_id FOREIGN KEY (exam_id)
REFERENCES exams(exam_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create Questions table
CREATE TABLE Questions (
  question_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  exam_id BIGINT UNSIGNED NOT NULL,
  question_text VARCHAR(255) NOT NULL,
  weight DECIMAL NOT NULL,
  date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  
  
UNIQUE KEY uindex_question_id(question_id),
KEY index_exam_id (exam_name),
KEY index_question_text(question_text),
KEY index_weight  (weight ),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),
  
  
CONSTRAINT fk_exams_questions_exam_id_exam_id FOREIGN KEY (exam_id)
REFERENCES exams(exam_id) ON UPDATE CASCADE ON DELETE RESTRICT

);

-- Create Choices table
CREATE TABLE Choices (
  choices_id INT PRIMARY KEY,
  question_id INT,
  choice_text VARCHAR(255),
  is_correct BOOLEAN,
  date_created DATETIME,
  date_modified DATETIME,
  INDEX idx_question_id (question_id)
);


-- Create Answers table
CREATE TABLE Answers (
  answer_id BIGINT PRIMARY KEY,
  exam_id BIGINT,
  pupil_id BIGINT,
  question_id BIGINT,
  choice_id BIGINT,
  date_created DATETIME,
  date_modified DATETIME,
  INDEX idx_exam_id (exam_id),
  INDEX idx_pupil_id (pupil_id),
  INDEX idx_question_id (question_id),
  INDEX idx_choice_id (choice_id)
);

-- Create Results table
CREATE TABLE Results (
  result_id BIGINT PRIMARY KEY,
  exam_id BIGINT,
  pupil_id BIGINT,
  score DECIMAL(10,2),
  percentage DECIMAL,
  grade VARCHAR(20),
  result_status ENUM,
  date_created DATETIME,
  date_modified DATETIME,
  
UNIQUE KEY uindex_exam_id(exam_id),
KEY index_exam_name (exam_name),
KEY index_staff_id (staff_id),
KEY index_total_questions (total_questions),
KEY index_exam_status (exam_status),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),

CONSTRAINT fk_school_staff_exams_staff_id_staff_id FOREIGN KEY (staff_id)
REFERENCES school_staff(staff_id) ON UPDATE CASCADE ON DELETE RESTRICT
);






CREATE TABLE pupils(
reg_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
user_id BIGINT,

date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
UNIQUE KEY uindex_reg_id(reg_id),
KEY index_pupil_name (pupil_name),

KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),



    CONSTRAINT fk_role_permissions_pupils_role_id_role_id FOREIGN KEY (role_id)
    REFERENCES role_permissions(role_id) ON UPDATE CASCADE ON DELETE RESTRICT
    
    );



-- teachers

CREATE TABLE teachers(
staff_id int unsigned PRIMARY KEY AUTO_INCREMENT,

date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
UNIQUE KEY uindex_staff_id(staff_id),

KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),

 CONSTRAINT fk_user_auth_school_staff_user_auth_id_user_auth_id FOREIGN KEY (user_auth_id)
    REFERENCES user_auth(user_auth_id) ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_role_permissions_school_staff_role_id_role_id FOREIGN KEY (role_id)
    REFERENCES role_permissions(role_id) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE exams(
exam_id int unsigned PRIMARY KEY AUTO_INCREMENT,
exam_name varchar(255) NOT NULL,
staff_id INT unsigned NOT NULL,
total_questions INT NOT NULL,
exam_status BOOLEAN NOT NULL CHECK (exam_status IN (0, 1)),
date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
UNIQUE KEY uindex_exam_id(exam_id),
KEY index_exam_name (exam_name),
KEY index_staff_id (staff_id),
KEY index_total_questions (total_questions),
KEY index_exam_status (exam_status),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),

CONSTRAINT fk_school_staff_exams_staff_id_staff_id FOREIGN KEY (staff_id)
REFERENCES school_staff(staff_id) ON UPDATE CASCADE ON DELETE RESTRICT




);



    
    
CREATE TABLE exam_schedule(
schedule_id int unsigned PRIMARY KEY AUTO_INCREMENT,
exam_time_created datetime NOT NULL ,
exam_time_taken datetime NOT NULL ,
exam_id int unsigned,
date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
UNIQUE KEY uindex_schdule_id(schedule_id),
KEY index_exam_time_created (exam_time_created),
KEY index_exam_id (exam_id),
KEY index_exam_time_taken(exam_time_taken),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),

CONSTRAINT fk_exams_exam_schedule_exam_id_exam_id FOREIGN KEY (exam_id)
REFERENCES exams(exam_id) ON UPDATE CASCADE ON DELETE RESTRICT

);



CREATE TABLE choices (
choice_id int unsigned PRIMARY KEY AUTO_INCREMENT,
choice_text varchar(255) NOT NULL,
date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
UNIQUE KEY uindex_choice_id(choice_id),
KEY index_choice_text (choice_text),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified)

);


CREATE TABLE questions(
question_id int unsigned PRIMARY KEY AUTO_INCREMENT,
exam_id INT UNSIGNED NOT NULL,
question_text varchar(255) NOT NULL,
weight decimal (10,2),
choice_id int unsigned NOT NULL,
is_correct varchar(255) NOT NULL,
date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
UNIQUE KEY uindex_question_id(question_id),
KEY index_exam_id (exam_id),
KEY index_question_text (question_text),
KEY choice_id (choice_id),
KEY weight  (weight),
KEY index_is_corrrect (is_correct),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),

CONSTRAINT fk_exams_questions_exam_id_exam_id FOREIGN KEY (exam_id)
REFERENCES exams(exam_id) ON UPDATE CASCADE ON DELETE RESTRICT,

CONSTRAINT fk_choices_questions_choice_id_choice_id FOREIGN KEY (choice_id)
REFERENCES choices(choice_id) ON UPDATE CASCADE ON DELETE RESTRICT

);





CREATE TABLE pupil_exam_question_answer(
pupil_exam_question_answer_id int unsigned PRIMARY KEY AUTO_INCREMENT,
reg_id INT UNSIGNED NOT NULL,
exam_id INT UNSIGNED NOT NULL,
question_id INT UNSIGNED NOT NULL,
choice_id INT UNSIGNED NOT NULL,
score decimal (10,2),
date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
UNIQUE KEY uindex_pupil_exam_question_answer_id(pupil_exam_question_answer_id),
KEY index_reg_id (reg_id),
KEY index_exam_id (exam_id),
KEY index_question_id (question_id),
KEY index_pupil_choice_id(choice_id),
KEY index_score (score),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),

CONSTRAINT fk_pupils_pupil_exam_question_answer_reg_id_reg_id FOREIGN KEY (reg_id)
REFERENCES pupils(reg_id) ON UPDATE CASCADE ON DELETE RESTRICT,

CONSTRAINT fk_exams_exam_question_answer_exam_id_exam_id FOREIGN KEY (exam_id)
REFERENCES exams(exam_id) ON UPDATE CASCADE ON DELETE RESTRICT,

CONSTRAINT fk_questions_exam_question_answer_questions_id_question_id FOREIGN KEY (question_id)
REFERENCES questions(question_id) ON UPDATE CASCADE ON DELETE RESTRICT,

CONSTRAINT fk_choices_exam_question_answer_choice_id_choice_id FOREIGN KEY (choice_id)
REFERENCES choices(choice_id) ON UPDATE CASCADE ON DELETE RESTRICT
);



CREATE TABLE results (
result_id int unsigned PRIMARY KEY AUTO_INCREMENT,
reg_id int unsigned NOT NULL,
exam_id int unsigned NOT NULL,
grade decimal (10,2),
date_created datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
date_modified datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
UNIQUE KEY uindex_result_id(result_id),
KEY index_reg_id(reg_id),
KEY index_exam_id(exam_id),
KEY index_grade(grade),
KEY index_date_created (date_created),
KEY index_date_modifed (date_modified),


CONSTRAINT fk_exams_results_exam_id_exam_id FOREIGN KEY (exam_id)
REFERENCES exams(exam_id) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_pupils_results_reg_id_reg_id FOREIGN KEY (reg_id)
REFERENCES pupils(reg_id) ON UPDATE CASCADE ON DELETE RESTRICT

);

   