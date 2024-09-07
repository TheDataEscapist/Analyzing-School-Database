# Analyzing-School-Database
### Situation:
The school database contains 7 tables, aimed at managing various academic and administrative activities.

### Task:
1. Identify the number of classes each teacher handles.
2. Assist Teacher John in finding students with similar names as his.
3. Assign roll numbers to students alphabetically within each class.
4. Compute the male-to-female ratio in each class.
5. Calculate the average experience of teachers.
6. Generate student-wise marksheets for the entire year.
7. Find the percentage scores of specific students in the Quarterly exam.
8. Rank students in each class based on their Half-yearly exam marks.

### Action:
#### 1. Aggregate Functions & Inner Join
Calculated the number of classes each teacher handles using COUNT() and INNER JOIN between the teacher tables.
#### 2. LIKE Operator & Group By
Used the LIKE operator to find students with names similar to "John" and grouped results by class.
#### 3. ROW_NUMBER()
Assigned roll numbers using ROW_NUMBER() window function partitioned by class and ordered by student names.
#### 4. Group By, Order By, ROUND()
Computed gender ratios using COUNT() and rounded results with ROUND(), for each class.
#### 5. Date Functions & AVG()
Calculated average teacher experience using DATEDIFF() with AVG() for aggregation.
#### 6. Inner Join & Aliases
Joined multiple tables, utilizing aliases for clarity, to create comprehensive student marksheets.
#### 7. IN Operator
Filtered student IDs using the IN operator to calculate percentage scores in Quarterly exams.
#### 8. DENSE_RANK()
Ranked students within each class based on Half-yearly exam marks using the DENSE_RANK() window function.

### Result:
Efficiently analyzed the school database to fulfill various administrative and academic tasks, resulting in organized and actionable insights into teacher workloads, student demographics, academic performance, and gender diversity.
