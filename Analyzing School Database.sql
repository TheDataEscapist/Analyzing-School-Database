/*Creating Database*/
create database school_db;

/*Making the database default*/
use school_db;

/*In a school, one teacher might be teaching more than one class.
Task 1: To identify how many classes each teacher is taking.*/
select teacher.teacher_id, teacher_name, count(class_id) as NoOfClasses
from teacher INNER JOIN teacher_allocation
on teacher.teacher_id = teacher_allocation.teacher_id
group by teacher.teacher_id
order by teacher_id asc;

/*It is interesting for teachers to come across students with names similar to theirs.
John is one such teacher who finds this fascinating and wants to find out how many students in each class have names similar to his.
Task 2: To help John find the number of students sharing similar names as his*/
select class_id, count(student_name) as NoOfStudentsNamedJohn
from students
where student_name like "%John%"
group by class_id;

/*Every class teacher assigns unique roll numbers to their class students based on the alphabetical order of their names.
Task 3: To assign roll numbers to each student in the class.*/
select student_id, student_name, class_id,
row_number() over (partition by class_id order by student_name asc)
from students;

/*The principal of the school wants to understand the diversity of students in their school.
One of the important aspects is gender diversity.
Task 4: To compute the male to female gender ratio in each class.*/
select class_id, round(sum(if(gender = "M", 1, 0)) / sum(if(gender="F",1,0)), 2) as Ratio 
from students
group by class_id
order by class_id asc;

/*Every school has teachers with different years of experience.
Task 5: To calculate the average experience of teachers in the school.*/
select round(avg(YrsOfExp), 0) as AvgYrsOfExp
from (select teacher_id, teacher_name, 
round(datediff(current_date(), date_of_joining)/365.25, 0) as YrsOfExp
	  from teacher) as TempTable;

/*At the end of every year, class teachers must provide students with their marksheet for the whole year.
The marksheet of a student consists of exam (Quarterly, Half-yearly, etc) wise marks obtained out of the total marks.
Task 6: To help class teachers obtain the student-wise marksheet.*/
select student_name, exam_name, exam_subject, marks, total_marks, round((marks/total_marks)*100, 2) as Percentage
from students, exam_paper, exam
where students.student_id = exam_paper.student_id and exam_paper.exam_id = exam.exam_id
order by 1, 2, 3;

/*Every teacher has certain group of favourite students and keep track of their performance in exams.
A teacher wants to find out the percentages attained by students with ids 1,4,9,16,25 in the Quarterly exam.
Task 7: To obtain the above data for each student.*/
select distinct student_id, sum(marks) over (partition by student_id) as QuarterlyMarksObtained, 
sum(total_marks) over (partition by student_id) as TotalMarks, 
round(avg((marks/total_marks)*100) over (partition by student_id),2) as Percentage
from exam INNER JOIN exam_paper
on exam.exam_id = exam_paper.exam_id
where total_marks = 20 and student_id IN (1,4,9,16,25);

/*Class teachers assign ranks to their students based on their marks obtained in each exam.
Task 8: To assign continuous ranks to students in each class for Half-yearly exams.*/
select distinct student_id, student_name, class_id, HYMarksObtained, TotalMarks,
dense_rank() over (partition by class_id order by HYMarksObtained desc) as Rnk
from (select distinct students.student_id, student_name, students.class_id, 
sum(marks) over (partition by student_id) as HYMarksObtained,
sum(total_marks) over (partition by student_id) as TotalMarks
from students INNER JOIN exam_paper on students.student_id = exam_paper.student_id
INNER JOIN exam on exam.exam_id = exam_paper.exam_id
where exam_name = "Half Yearly") as TempTable;