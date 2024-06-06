-- Populate user_auth
INSERT INTO user_auth (user_email, user_password)
VALUES
('alice.doe@example.com', 'password123'),
('bob.smith@example.com', 'password456'),
('charlie.johnson@example.com', 'password789'),
('david.brown@example.com', 'password321'),
('emily.lee@example.com', 'password654'),
('frank.davis@example.com', 'password987'),
('grace.wilson@example.com', 'password159');








-- populate permissions 

INSERT INTO role_permissions (role_name, permissions)
VALUES
('Teacher', 'create_exam'),
( 'Teacher', 'Update_exam'),
( 'Teacher', 'Delete_exam'),
( 'Teacher', 'View_exam'),
( 'Student', 'view_exam'),
('Student', 'Write_exam');



-- Populate the pupils table with 7 records
INSERT INTO pupils (pupil_name, user_auth_id, role_id, role_name)
VALUES
('Alice Doe', (SELECT user_auth_id FROM user_auth WHERE user_email = 'alice.doe@example.com'LIMIT 1
), (SELECT role_id FROM role_permissions WHERE role_name = 'Student'LIMIT 1
), 'Student'),
('Bob Smith', (SELECT user_auth_id FROM user_auth WHERE user_email = 'bob.smith@example.com' LIMIT 1
), (SELECT role_id FROM role_permissions WHERE role_name = 'Student'LIMIT 1
), 'Student'),
('Charlie Johnson', (SELECT user_auth_id FROM user_auth WHERE user_email = 'charlie.johnson@example.com'LIMIT 1
), (SELECT role_id FROM role_permissions WHERE role_name = 'Student' LIMIT 1
), 'Student'),
('David Brown', (SELECT user_auth_id FROM user_auth WHERE user_email = 'david.brown@example.com' LIMIT 1
), (SELECT role_id FROM role_permissions WHERE role_name = 'Teacher'LIMIT 1
), 'Teacher'),
('Emily Lee', (SELECT user_auth_id FROM user_auth WHERE user_email = 'emily.lee@example.com' LIMIT 1
), (SELECT role_id FROM role_permissions WHERE role_name = 'Student' LIMIT 1
), 'Student');




-- Populate the teachers table
INSERT INTO school_staff (staff_name, user_auth_id, role_id, role_name)
VALUES
('David Brown', (SELECT user_auth_id FROM user_auth WHERE user_email = 'david.brown@example.com' LIMIT 1), (SELECT role_id FROM role_permissions WHERE role_name = 'Teacher' LIMIT 1), 'Teacher'),
('Frank Davis', (SELECT user_auth_id FROM user_auth WHERE user_email = 'frank.davis@example.com' LIMIT 1), (SELECT role_id FROM role_permissions WHERE role_name = 'Teacher' LIMIT 1), 'Teacher'),
('Grace Wilson', (SELECT user_auth_id FROM user_auth WHERE user_email = 'grace.wilson@example.com' LIMIT 1), (SELECT role_id FROM role_permissions WHERE role_name = 'Teacher' LIMIT 1), 'Teacher');

SELECT * FROM 

-- populate exams
INSERT INTO exams (exam_name, staff_id, total_questions, exam_status)
VALUES
('Algebra Exam', (SELECT staff_id FROM school_staff WHERE staff_name = 'David Brown'), 10, 1),
('English Literature Exam', (SELECT staff_id FROM school_staff WHERE staff_name = 'Frank David'), 10, 1),
('Biology Midterm', (SELECT staff_id FROM school_staff WHERE staff_name = 'Grace Wilson'), 10, 1);

SELECT * FROM exams;




-- Populate the exams table with 7 records
INSERT INTO exams (exam_name, exam_date, teacher_id, total_questions, exam_status)
VALUES
('Algebra Exam', '2023-05-01 10:00:00', 1, 20, 1),
('English Literature Exam', '2023-06-15 14:00:00', 2, 25, 1),
('Biology Midterm', '2023-07-10 09:00:00', 3, 30, 1),
('History Final', '2023-08-20 13:30:00', 4, 18, 1),
('Physics Quiz', '2023-09-05 11:00:00', 1, 15, 1),
('Chemistry Exam', '2023-10-01 15:45:00', 5, 22, 1),
('Geography Test', '2023-11-12 10:30:00', 6, 24, 1);

-- Populate the questions table with 7 records per exam
INSERT INTO questions (exam_id, question_text, option_a, option_b, option_c, option_d, correct_answer)
VALUES
(1, 'What is the value of x in the equation 2x + 5 = 15?', '5', '7', '10', '3', 'c'),
(1, 'Which of the following is the formula for the area of a circle?', 'A = πr', 'A = 2πr', 'A = πr^2', 'A = πd^2', 'c'),
(1, 'What is the square root of 64?', '4', '6', '8', '16', 'c'),
(1, 'What is the slope of a line that passes through the points (2, 3) and (5, 9)?', '2', '3', '4', '6', 'b'),
(1, 'Which of the following is the identity property of addition?', 'a + 0 = a', 'a * 1 = a', 'a + b = b + a', 'a * a = 1', 'a'),
(1, 'What is the value of 3^4?', '12', '27', '81', '243', 'c'),
(1, 'What is the simplified form of the expression (2x^2 - 3x + 5) - (x^2 + 2x - 1)?', 'x^2 - 5x + 6', '2x^2 - 5x + 4', '2x^2 - 5x + 6', 'x^2 - 5x + 4', 'c');

-- Populate the pupil_exam_question_answer table with 7 records per pupil per exam
INSERT INTO pupil_exam_question_answer (pupil_id, exam_id, question_id, pupil_selected_answer)
VALUES
(1, 1, 1, 'c'), (1, 1, 2, 'c'), (1, 1, 3, 'c'), (1, 1, 4, 'b'), (1, 1, 5, 'a'), (1, 1, 6, 'c'), (1, 1, 7, 'c'),
(2, 1, 1, 'a'), (2, 1, 2, 'b'), (2, 1, 3, 'd'), (2, 1, 4, 'a'), (2, 1, 5, 'c'), (2, 1, 6, 'b'), (2, 1, 7, 'a'),
(3, 1, 1, 'c'), (3, 1, 2, 'c'), (3, 1, 3, 'c'), (3, 1, 4, 'b'), (3, 1, 5, 'a'), (3, 1, 6, 'c'), (3, 1, 7, 'c'),
(4, 1, 1, 'c'), (4, 1, 2, 'c'), (4, 1, 3, 'c'), (4, 1, 4, 'b'), (4, 1, 5, 'a'), (4, 1, 6, 'c'), (4, 1, 7, 'c'),
(5, 1, 1, 'a'), (5, 1, 2, 'b'), (5, 1, 3, 'd'), (5, 1, 4, 'a'), (5, 1, 5, 'c'), (5, 1, 6, 'b'), (5, 1, 7, 'a'),
(6, 1, 1, 'c'), (6, 1, 2, 'c'), (6, 1, 3, 'c'), (6, 1, 4, 'b'), (6, 1, 5, 'a'), (6, 1, 6, 'c'), (6, 1, 7, 'c'),
(7, 1, 1, 'a'), (7, 1, 2, 'b'), (7, 1, 3, 'd'), (7, 1, 4, 'a'), (7, 1, 5, 'c'), (7, 1, 6, 'b'), (7, 1, 7, 'a');