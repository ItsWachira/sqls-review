-- Retrieve the pupil_ids
SET @student_1_id := (SELECT pupil_id FROM pupils WHERE user_account_id = @john_user_account_id);


-- Retrieve exam_id for Science Exam
SET @science_exam_id := (SELECT exam_id FROM exams WHERE exam_name = 'Science Exam');

-- sample questions for Science Exam
INSERT INTO questions (exam_id, question_text, weight)
VALUES (@science_exam_id, 'What is Newton''s first law of motion?', 3.0);

INSERT INTO questions (exam_id, question_text, weight)
VALUES (@science_exam_id, 'What is the chemical symbol for gold?', 2.0);

INSERT INTO questions (exam_id, question_text, weight)
VALUES (@science_exam_id, 'What is the process of photosynthesis?', 2.0);

INSERT INTO questions (exam_id, question_text, weight)
VALUES (@science_exam_id, 'What are the three states of matter?', 3.0);

INSERT INTO questions (exam_id, question_text, weight)
VALUES (@science_exam_id, 'Define the term "acid rain".', 2.0);


-- sample choices for the science exams:

-- Retrieve question_id for Question 1
SET @science_question_1_id := (SELECT question_id FROM questions WHERE question_text = 'What is Newton''s first law of motion?');

-- choice options for Question 1
INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_1_id, 'a. An object at rest tends to stay at rest, and an object in motion tends to stay in motion with the same speed and in the same direction unless acted upon by an unbalanced force', 'true');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_1_id, 'b. Force is equal to mass times acceleration', 'false');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_1_id, 'c. For every action, there is an equal and opposite reaction', 'false');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_1_id, 'd. The rate of change of momentum of an object is directly proportional to the applied force and takes place in the direction in which the force is applied', 'false');

-- Retrieve question_id for Question 2
SET @science_question_2_id := (SELECT question_id FROM questions WHERE question_text = 'What is the chemical symbol for gold?');

--  choice options for Question 2
INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_2_id, 'a. Au', 'true');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_2_id, 'b. Ag', 'false');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_2_id, 'c. Gd', 'false');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_2_id, 'd. Pt', 'false');

-- Retrieve question_id for Question 3
SET @science_question_3_id := (SELECT question_id FROM questions WHERE question_text = 'What is the process of photosynthesis?');

--  choice options for Question 3
INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_3_id, 'a. The process by which plants convert light energy into chemical energy', 'true');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_3_id, 'b. The process by which plants release oxygen into the atmosphere', 'false');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_3_id, 'c. The process by which plants absorb water from the soil', 'false');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_3_id, 'd. The process by which plants produce flowers', 'false');

-- Retrieve question_id for Question 4
SET @science_question_4_id := (SELECT question_id FROM questions WHERE question_text = 'What are the three states of matter?');

-- choice options for Question 4
INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_4_id, 'a. Solid, liquid, gas', 'true');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_4_id, 'b. Solid, liquid, plasma', 'false');


INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_4_id, 'c. Solid, gas, plasma', 'false');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_4_id, 'd. Liquid, gas, plasma', 'false');

-- Retrieve question_id for Question 5
SET @science_question_5_id := (SELECT question_id FROM questions WHERE question_text = 'Define the term "acid rain".');

--  choice options for Question 5
INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_5_id, 'a. Rainfall with acidic pH due to the presence of pollutants like sulfur dioxide and nitrogen oxides', 'true');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_5_id, 'b. Rainfall that contains high levels of carbon dioxide', 'false');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_5_id, 'c. Rainfall caused by volcanic eruptions', 'false');

INSERT INTO choices (question_id, choice_text, is_correct)
VALUES (@science_question_5_id, 'd. Rainfall that contains high levels of ozone', 'false');


-- choices asnwers for student 1 science exam


SET @science_question_1_choice_b_id := (SELECT choice_id FROM choices WHERE choice_text = "b. Force is equal to mass times acceleration");
SET @science_question_2_choice_c_id := (SELECT choice_id FROM choices WHERE choice_text = "c. Gd");
SET @science_question_3_choice_a_id := (SELECT choice_id FROM choices WHERE choice_text = "a. The process by which plants convert light energy into chemical energy");
SET @science_question_4_choice_a_id := (SELECT choice_id FROM choices WHERE choice_text = "a. Solid, liquid, gas");
SET @science_question_5_choice_a_id := (SELECT choice_id FROM choices WHERE choice_text = "a. Rainfall with acidic pH due to the presence of pollutants like sulfur dioxide and nitrogen oxides");


-- Question 1:
INSERT INTO answers (pupil_id, exam_id, question_id, choice_id)
VALUES (@student_1_id, @science_exam_id, @science_question_1_id, @science_question_1_choice_b_id);

-- Question 2:
INSERT INTO answers (pupil_id, exam_id, question_id, choice_id)
VALUES (@student_1_id, @science_exam_id, @science_question_2_id, @science_question_2_choice_c_id);

-- Question 3:
INSERT INTO answers (pupil_id, exam_id, question_id, choice_id)
VALUES (@student_1_id, @science_exam_id, @science_question_3_id, @science_question_3_choice_a_id);

-- Question 4:
INSERT INTO answers (pupil_id, exam_id, question_id, choice_id)
VALUES (@student_1_id, @science_exam_id, @science_question_4_id, @science_question_4_choice_a_id);

-- Question 5:
INSERT INTO answers (pupil_id, exam_id, question_id, choice_id)
VALUES (@student_1_id, @science_exam_id, @science_question_5_id,  @science_question_5_choice_a_id);