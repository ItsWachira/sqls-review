use evergreen_academy_db;

SELECT
  e.exam_name,
  q.question_id,
  q.weight,
  c.choice_id,
  a.answer_id
FROM
  exams e
  JOIN questions q ON e.exam_id = q.exam_id
  JOIN choices c ON q.question_id = c.question_id
  JOIN answers a ON c.choice_id = a.choice_id
WHERE
  e.exam_name = 'English Exam';
  
-- Calculate the score



SET @john_pupil_id := (SELECT pupil_id FROM pupils WHERE user_account_id = @john_user_account_id);

SELECT
  e.exam_name,
  ua.user_name AS student_name,
  SUM(CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) AS total_score
FROM
  exams e
  JOIN questions q ON e.exam_id = q.exam_id
  JOIN choices c ON q.question_id = c.question_id
  JOIN answers a ON c.choice_id = a.choice_id
  JOIN pupils p ON a.pupil_id = p.pupil_id
  JOIN user_account ua ON p.user_account_id = ua.user_account_id
WHERE
p.pupil_id = @john_pupil_id
AND 
  e.exam_name = 'English Exam'
 
GROUP BY
   e.exam_name, ua.user_name;
   
   
   
   SELECT
  SUM(CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) AS total_score
FROM
  exams e
  JOIN questions q ON e.exam_id = q.exam_id
  JOIN choices c ON q.question_id = c.question_id
  JOIN answers a ON c.choice_id = a.choice_id
  JOIN pupils p ON a.pupil_id = p.pupil_id
  JOIN user_account ua ON p.user_account_id = ua.user_account_id
WHERE
p.pupil_id = @john_pupil_id
AND 
  e.exam_name = 'English Exam'
 
GROUP BY
   e.exam_name, ua.user_name;

SELECT SUM(q.weight) AS total_score
FROM answers a 
JOIN questions q ON a.question_id = q.question_id
JOIN choices c ON a.choice_id = c.choice_id
WHERE c.is_correct = "true" AND a.pupil_id=1 AND a.exam_id = 2

GROUP BY a.exam_id, a.pupil_id;
   
SELECT
  -- SUM(a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) AS total_scorea.exam_id, a.pupil_id
  
    
    e.exam_id,
   
(SELECT SUM(q.weight) AS total_score
FROM answers a 
JOIN questions q ON a.question_id = q.question_id
JOIN choices c ON a.choice_id = c.choice_id
WHERE c.is_correct = "true"  AND a.exam_id = 1
GROUP BY a.exam_id) AS total_score,

(SELECT SUM(q.weight) AS total_score
FROM answers a 
JOIN questions q ON a.question_id = q.question_id
JOIN choices c ON a.choice_id = c.choice_id
WHERE  a.exam_id = 1
GROUP BY a.exam_id) AS total_weight;




FROM
  exams e
  JOIN questions q ON e.exam_id = q.exam_id
  JOIN choices c ON q.question_id = c.question_id
  JOIN answers a ON c.choice_id = a.choice_id
  JOIN pupils p ON a.pupil_id = p.pupil_id
  JOIN user_account ua ON p.user_account_id = ua.user_account_id
WHERE
  e.exam_name = 'English Exam'
 
;
   
   
(SELECT SUM(q.weight) AS total_score, a.exam_id, a.pupil_id
FROM answers a 
JOIN questions q ON a.question_id = q.question_id
JOIN choices c ON a.choice_id = c.choice_id
WHERE c.is_correct = "true" AND a.pupil_id=1
GROUP BY a.exam_id, a.pupil_id);





SELECT * FROM questions 
WHERE exam_id =  1;


SELECT * FROM choices;

SELECT a.answer_id, a.pupil_id, a.exam_id, a.question_id, a.choice_id, q.weight, c.is_correct FROM answers a

JOIN questions q ON a.question_id = q.question_id

JOIN choices c ON a.choice_id = c.choice_id

WHERE c.is_correct = "true" AND a.exam_id = 1;








   
   
   
  
  ----
  SELECT
  e.exam_name,
  ua.user_name AS student_name,
  SUM(CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) AS total_score,
  (SELECT SUM(weight) FROM questions WHERE exam_id = e.exam_id) AS total_weight
FROM
  exams e
  JOIN questions q ON e.exam_id = q.exam_id
  JOIN choices c ON q.question_id = c.question_id
  JOIN answers a ON c.choice_id = a.choice_id
  JOIN pupils p ON a.pupil_id = p.pupil_id
  JOIN user_account ua ON p.user_account_id = ua.user_account_id
WHERE
  e.exam_name = 'English Exam'
  AND p.pupil_id = @john_pupil_id
GROUP BY
  ua.user_name, e.exam_name, e.exam_id;

SELECT
  e.exam_name,
  ua.user_name AS student_name,
  SUM(CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) AS total_score,
  (SELECT SUM(weight) FROM questions WHERE exam_id = e.exam_id) AS total_weight
FROM
  exams e
  JOIN questions q ON e.exam_id = q.exam_id
  JOIN choices c ON q.question_id = c.question_id
  JOIN answers a ON c.choice_id = a.choice_id
  JOIN pupils p ON a.pupil_id = p.pupil_id
  JOIN user_account ua ON p.user_account_id = ua.user_account_id
WHERE
  e.exam_name = 'English Exam'
  AND p.pupil_id = @john_pupil_id
GROUP BY
  ua.user_name, e.exam_name, e.exam_id;


SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


SELECT
  e.exam_name,
  ua.user_name AS student_name,
  SUM(CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) AS total_score,
  (SELECT SUM(weight) FROM questions WHERE exam_id = e.exam_id) AS total_weight
FROM
  exams e
  JOIN questions q ON e.exam_id = q.exam_id
  JOIN choices c ON q.question_id = c.question_id
  JOIN answers a ON c.choice_id = a.choice_id
  JOIN pupils p ON a.pupil_id = p.pupil_id
  JOIN user_account ua ON p.user_account_id = ua.user_account_id
WHERE
  e.exam_name = 'English Exam'
  AND p.pupil_id = @john_pupil_id
GROUP BY
  ua.user_name, e.exam_name;
  
  
  
  --- 
  
  SELECT
    q.question_id,
    q.question_text,
    CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN "Correct" ELSE "Incorrect" END AS answer_status,
    SUM(CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) AS total_score,
    (SELECT SUM(weight) FROM questions WHERE exam_id = e.exam_id) AS total_weight,
    ROUND(
        SUM(CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) /
        (SELECT SUM(weight) FROM questions WHERE exam_id = e.exam_id) * 100,
        2
    ) AS percentage
FROM
    exams e
    JOIN questions q ON e.exam_id = q.exam_id
    JOIN choices c ON q.question_id = c.question_id
    JOIN answers a ON c.choice_id = a.choice_id AND a.pupil_id = @john_pupil_id
    JOIN pupils p ON a.pupil_id = p.pupil_id
WHERE
    e.exam_name = 'English Exam'
    AND p.pupil_id = @john_pupil_id
GROUP BY
    q.question_id,
    q.question_text
ORDER BY
    q.question_id;
    
    
SELECT
    @john_pupil_id AS student_john,
    e.exam_id,
    @total_score := SUM(CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) AS total_score,
    @total_weight := (SELECT SUM(weight) FROM questions WHERE exam_id = e.exam_id) AS total_weight,
    @percentage := ROUND(
        SUM(CASE WHEN a.answer_id = c.choice_id AND c.is_correct = "true" THEN q.weight ELSE 0 END) /
        (SELECT SUM(weight) FROM questions WHERE exam_id = e.exam_id) * 100,
        2
    ) AS percentage
FROM
    exams e
    JOIN questions q ON e.exam_id = q.exam_id
    JOIN choices c ON q.question_id = c.question_id
    JOIN answers a ON c.choice_id = a.choice_id AND a.pupil_id = @john_pupil_id
    JOIN pupils p ON a.pupil_id = p.pupil_id
WHERE
    e.exam_name = 'English Exam'
    AND p.pupil_id = @john_pupil_id
LIMIT 1;

       
INSERT INTO results (exam_id, pupil_id, score, percentage, grade, result_status)
SELECT
    e.exam_id,
    p.pupil_id,
    @total_score AS score,
    @percentage AS percentage,
    CASE
        WHEN @percentage >= 90 THEN 'A'
        WHEN @percentage >= 80 THEN 'B'
        WHEN @percentage >= 70 THEN 'C'
        WHEN @percentage >= 60 THEN 'D'
        ELSE 'F'
    END AS grade,
    'Computed' AS result_status
FROM
    exams e
    JOIN pupils p ON p.pupil_id = @john_pupil_id
WHERE
    e.exam_name = 'English Exam'
ON DUPLICATE KEY UPDATE
    score = @total_score,
    percentage = @percentage,
    grade = CASE
        WHEN @percentage >= 90 THEN 'A'
        WHEN @percentage >= 80 THEN 'B'
        WHEN @percentage >= 70 THEN 'C'
        WHEN @percentage >= 60 THEN 'D'
        ELSE 'F'
    END,
    result_status = 'Computed',
    date_modified = NOW();
    
    
    SELECT * from answers;
 







