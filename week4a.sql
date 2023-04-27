I. Write SQL Select Statements using Aggregate Functions, Group By and Having clauses
for the following queries that retrieve data from university database:

1. Find the maximum and average capacity of buildings in the university.


SQL> SELECT max(capacity),avg(capacity) FROM classroom GROUP BY(building) ;

MAX(CAPACITY) AVG(CAPACITY)
------------- -------------
          500           500
           10            10
           70            70
           50            40

   
2. Display the least budget of the departments.

SQL> SELECT min(budget) as MinBudget from department GROUP BY building;

 MINBUDGET
----------
     80000
     50000
     85000
     70000

3. Find the total number of courses and credits offered by Biology
department.

SQL> SELECT COUNT(DISTINCT(title)) as TotalCoursesOffered, sum(credits) as TotalCredits from course 
WHERE dept_name LIKE 'Biology' GROUP BY dept_name;

TOTALCOURSESOFFERED TOTALCREDITS
------------------- ------------
                  3           11


4. Find the average salary of instructors in the Computer Science department.


SQL> SELECT avg(salary) as AvgSalary from instructor WHERE dept_name = 'Comp. Sci.' GROUP BY dept_name;

 AVGSALARY
----------
77333.3333

5. Find the total number of instructors who teach a course in the Spring 2010
semester.

 SQL>  SELECT COUNT(DISTINCT id) as TotalInstructors  FROM teaches where semester = 'Spring' AND year
 = 2010;

TOTALINSTRUCTORS
----------------
               6



6. Find the average salary in each department.

SQL> SELECT dept_name, avg(salary) as AvgSalary from instructor GROUP BY dept_name;

DEPT_NAME             AVGSALARY
-------------------- ----------
Biology                   72000
Comp. Sci.           77333.3333
Elec. Eng.                80000
Finance                   85000
History                   61000
Music                     40000
Physics                   91000

7 rows selected.

SQL> 


7. Find the number of instructors in each department who teach a course in
the Spring 2010 semester.


SQL> SELECT COUNT(DISTINCT i.id) as TotalInstructors, i.dept_name from instructor i,teaches t WHERE 

  2  i.id = t.id AND t.semester = 'Spring' AND t.year = 2010 GROUP BY dept_name;

TOTALINSTRUCTORS DEPT_NAME
---------------- --------------------
               3 Comp. Sci.
               1 Finance
               1 History
               1 Music


8. Find the department name and average salary of the department for only
those departments where the average salary of the instructors is more than
$42,000.


SQL> select avg(salary) as AvgSalary, dept_name from instructor GROUP BY dept_name HAVING avg(salary
) > 42000;

 AVGSALARY DEPT_NAME
---------- --------------------
     72000 Biology
77333.3333 Comp. Sci.
     80000 Elec. Eng.
     85000 Finance
     61000 History
     91000 Physics

6 rows selected.

9. For each course section offered in 2009, find the average total credits
(tot_cred) of all students enrolled in the section, if the section had at least 2
students.


SQL> select t.course_id,t.sec_id,avg(s.tot_cred) as AvgTotalCredits from student s,takes t where s
  2  .id=t.id and year=2009 group by t.course_id,t.sec_id having count(s.id)>=2;

COURSE_I SEC_ID   AVGTOTALCREDITS
-------- -------- ---------------
CS-101   1                     65
CS-190   2                     43
CS-347   1                     67


10. For each department, find the maximum salary of instructors in that
department. You may assume that every department has at least one
instructor.

SQL> SELECT dept_name, max(salary) as MaxSalary from instructor GROUP BY dept_name;

DEPT_NAME             MAXSALARY
-------------------- ----------
Biology                   72000
Comp. Sci.                92000
Elec. Eng.                80000
Finance                   90000
History                   62000
Music                     40000
Physics                   95000

7 rows selected.


11. For the student with ID 12345 (or any other value), show the total number
of credits scored for all courses (taken by that student). Don't display the
tot_creds value from the student table, you should use SQL aggregation on
courses taken by the student.


SQL> SELECT t.id,sum(c.credits) as TotalCredits from takes t, course c  WHERE id=12345
  2  AND t.course_id = c.course_id GROUP BY t.id;

ID    TOTALCREDITS
----- ------------
12345           14


12. Display the total credits for each of the students, along with the ID of the
student; don't bother about the name of the student. (Don't display the
tot_creds value from the student table, you should use SQL aggregation on
courses taken by the student. For students who have not registered for any
course, tot_creds should be 0)
                                                      

SQL> SELECT t.id, sum(c.credits) as TotalCredits from takes t,course c WHERE 
  2  t.course_id = c.course_id GROUP BY t.id;

ID    TOTALCREDITS
----- ------------
00128            7
12345           14
19991            3
23121            3
44553            4
45678           11
54321            8
55739            3
76543            7
76653            3
98765            7

ID    TOTALCREDITS
----- ------------
98988            8

12 rows selected.
                                                    
                                                      
