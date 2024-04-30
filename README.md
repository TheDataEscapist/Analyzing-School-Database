# Analyzing-School-Database
The school database consists of 7 tables - students, class, class_curriculum, teacher, teacher_allocation, exam, and exam_paper. The columnar distribution of each table is given below.
#### students
student_id int, student_name text, class_id text, gender text, date_of_birth datetime
#### class
class_id text, class_standard int, class_section text, class_teacher_id text
#### class_curriculum
class_curriculum_id text, class_standard int, subject_name text
#### teacher
teacher_id text, teacher_name text, teacher_subject text, gender text, date_of_birth datetime, date_of_joining datetime
#### teacher_allocation
teacher_allocation_id text, class_id text, teacher_id text
#### exam
exam_id text, exam_name text, exam_subject text, class_standard int, total_marks int
#### exam_paper
exam_paper_id text, student_id int, exam_id text, marks int

### Objectives:
In a school, one teacher might be teaching more than one class.<br>Task 1: To identify how many classes each teacher is taking.<br>
<br>It is interesting for teachers to come across students with names similar to theirs. John is one such teacher who finds this fascinating and wants to find out how many students in each class have names similar to his.<br>Task 2: To help John find the number of students sharing similar names as his.<br>
<br>Every class teacher assigns unique roll numbers to their class students based on the alphabetical order of their names.<br>Task 3: To assign roll numbers to each student in the class.<br>
<br>The principal of the school wants to understand the diversity of students in their school. One of the important aspects is gender diversity.<br>Task 4: To compute the male to female gender ratio in each class.<br>
<br>Every school has teachers with different years of experience.<br>Task 5: To calculate the average experience of teachers in the school.<br>
<br>At the end of every year, class teachers must provide students with their marksheet for the whole year. The marksheet of a student consists of exam (Quarterly, Half-yearly, etc) wise marks obtained out of the total marks.<br>Task 6: To help class teachers obtain the student-wise marksheet.<br>
<br>Every teacher has certain group of favourite students and keep track of their performance in exams. A teacher wants to find out the percentages attained by students with ids 1,4,9,16,25 in the Quarterly exam.<br>Task 7: To obtain the above data for each student.<br>
<br>Class teachers assign ranks to their students based on their marks obtained in each exam.<br>Task 8: To assign continuous ranks to students in each class for Half-yearly exams.
