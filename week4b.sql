II.	Write nested queries for answering the following queries that retrieve data from university database:


1.	Find the total number of (distinct) students who have taken course sections taught by the instructor with ID 10101
  
  SQL> SELECT COUNT(DISTINCT TAKES.id) as TotalStudents,TAKES.course_id FROM TAKES,TEACHES t WHERE
  2  t.course_id=takes.course_id AND t.id = 10101  GROUP BY TAKES.course_id, t.sec_id;
  
  TOTALSTUDENTS COURSE_I
------------- --------
            6 CS-101
            2 CS-315
            2 CS-347



2.	Find the names of all instructors whose salary is greater than at least one instructor in the Biology department

  SELECT name FROM instructor WHERE salary > SOME (SELECT salary FROM instructor  WHERE dept_name = 'Biology');


NAME
--------------------
Wu
Einstein
Gold
Katz
Singh
Brandt
Kim

7 rows selected.

3.	Find the departments that have the highest average salary

SELECT dept_name from INSTRUCTOR GROUP BY dept_name HAVING avg(SALARY) >= ALL(SELECT avg(salary) as HighestAvgSalary FROM INSTRUCTOR GROUP BY dept_name); 

DEPT_NAME
--------------------
Physics


4.	Find all the courses taught in the both the Fall 2009 and Spring 2010 semesters

SELECT course_id from teaches WHERE SEMESTER = 'Fall' AND YEAR = 2009 AND course_id IN( SELECT course_id from teaches WHERE SEMESTER = 'Spring' AND YEAR = 2010 );


COURSE_I
--------
CS-101


5.	Find all the courses taught in the Fall 2009 semester but not in the Spring 2010 semester.
  
SQL> SELECT course_id FROM teaches WHERE SEMESTER = 'Fall' AND YEAR = 2009 AND course_id NOT IN(SELE
CT course_id FROM teaches WHERE SEMESTER = 'Spring' AND YEAR = 2010);

COURSE_I
--------
CS-347
PHY-101



6.	Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester. (Write correlated nested Query)
  
 SQL> SELECT t.course_id FROM teaches t WHERE semester='Fall' AND year=2009 AND EXISTS(
  2      SELECT * FROM teaches s WHERE s.semester='Spring' AND s.year=2010 AND t.course_id=s.course_id);
 
COURSE_I
--------
CS-101

7. Find all students who have taken all courses offered in the Biology
department. (Write Correlated nested Query)

SQL> SELECT DISTINCT s.id FROM student s WHERE NOT EXISTS(
  2      (SELECT course_id FROM course WHERE dept_name='Biology')
  3      MINUS
  4      (SELECT t.course_id FROM takes t WHERE s.id=t.id)
  5  );

no rows selected.


8. Find all courses that were offered at most once in 2009.

SELECT DISTINCT course_id FROM teaches WHERE year=2009 
GROUP BY course_id HAVING COUNT(course_id) <= 1;

COURSE_I
--------
BIO-101
CS-101
CS-347
EE-181
PHY-101

9. Find all courses that were offered at least twice in 2009”


SQL> SELECT DISTINCT course_id FROM teaches WHERE year=2009 
  2   GROUP BY course_id HAVING COUNT(course_id) >= 2;

COURSE_I
--------
CS-190

10. Find the average instructors’ salaries of those departments where the
average salary is greater than $42,000.


SQL> SELECT dept_name, AVG(salary) AS AVG_SALARY FROM instructor 
  2  GROUP BY dept_name HAVING AVG(salary)>42000;

DEPT_NAME            AVG_SALARY
-------------------- ----------
Biology                   72000
Comp. Sci.           77333.3333
Elec. Eng.                80000
Finance                   85000
History                   61000
Physics                   91000

6 rows selected.

11. Find the departments with the maximum budget.

SQL> SELECT dept_name FROM department WHERE budget=(SELECT MAX(budget) FROM department);

DEPT_NAME
--------------------
Finance

12. Find the names of instructors who have not taught any course.


SQL> SELECT i.id FROM instructor i WHERE NOT EXISTS(
  2      SELECT * FROM teaches t WHERE t.id=i.id
  3  );

ID
-----
33456
58583
76543

13. Find the IDs and names of all students who have not taken any course
offering before Spring 2009.

SQL> (SELECT id, name FROM student)
  2  MINUS
  3  (SELECT s.id, s.name FROM student s, takes t WHERE s.id=t.id AND t.year<2009);

ID    NAME
----- --------------------
00128 Zhang
12345 Shankar
19991 Brandt
23121 Chavez
44553 Peltier
45678 Levy
54321 Williams
55739 Sanchez
70557 Snow
76543 Brown
76653 Aoi

ID    NAME
----- --------------------
98765 Bourikas
98988 Tanaka

13 rows selected.



14. Find the lowest, across all departments, of the per-department maximum
salary computed.


SQL> SELECT MIN(MaxSal) FROM(
  2  SELECT dept_name, MAX(salary) AS MaxSal FROM instructor GROUP BY dept_name);

MIN(MAXSAL)
-----------
      40000

SQL> 
15. Display the IDs and names of the instructors who have taught all Comp. Sci.
courses.




  
  
