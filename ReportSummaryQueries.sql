-- select all the exams set by a particular teacher 
SELECT exam_id, exam_name, teacher_id 
FROM exams
WHERE teacher_id = teacher_id;

SELECT
    t.teacher_id,
    t.teacher_name,
    e.exam_name
FROM
    exams e
JOIN
    (SELECT DISTINCT teacher_id FROM exams WHERE teacher_id = 1) t ON e.teacher_id = t.teacher_id
WHERE
    e.teacher_id = 1;
    
SELECT DISTINCTROW
    teachers.teacher_id,
    teachers.teacher_name,
    exams.exam_name
FROM
    exams, teachers
;

-- to select the all the teachers who have set exams per subject

SELECT exam_id, exam_name 
FROM exams
GROUP BY teacher_id;

--  report on the answers provided by a pupil for an exam and their percentage score in that exam.

SELECT pupil_id, pupil_name, exam_name, pupil_select_answer AS exam_answers 
FROM pupil_exam_question_answer 
JOIN pupils ON pupil_exam_question_answer.pupil_id = pupils.pupil_id;





