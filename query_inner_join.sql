-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students` . `name`, `students` . `surname`, `degrees`. `name`
FROM `degrees`
INNER JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `departments` . `name`, `degrees`.`level`
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees` . `level` = "magistrale"
AND `departments` . `name` = "dipartimento di neuroscienze";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `teachers` . `name`, `teachers` . `surname`, `courses` . `name`, `cfu`
FROM `teachers`
INNER JOIN `course_teacher` AS `co_te`
ON `teachers` . `id` = `co_te` . `teacher_id`
INNER JOIN `courses`
ON `co_te` . `course_id` = `courses` . `id`
WHERE `co_te` . `teacher_id` = 44 ;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students` . `surname` , `students` . `name`, `departments` . `name` , `degrees` . `name`
FROM `departments`
INNER JOIN `degrees`
ON `departments` . `id` = `degrees` . `department_id`
INNER JOIN `students`
ON `degrees` . `id` = `students` . `degree_id`
ORDER BY `students` . `surname` , `students` . `name`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `teachers`.`name`, `teachers`.`surname`,`degrees`.`name`,`courses`.`name`
FROM `degrees`
INNER JOIN `courses`
ON `degrees` . `id` = `courses` . `degree_id`
INNER JOIN `course_teacher` AS `ct`
ON `courses` . `id` = `ct` . `course_id`
INNER JOIN `teachers`
ON `ct` . `teacher_id` = `teachers`. `id` ;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT teachers.name, teachers.surname, departments.name
FROM teachers
JOIN course_teacher
ON teachers.id = course_teacher.teacher_id
JOIN courses
ON course_teacher.course_id = courses.id
JOIN degrees
ON courses.degree_id = degrees.id
JOIN departments
ON degrees.department_id = departments.id
WHERE departments.name = "Dipartimento di Matematica" ;



