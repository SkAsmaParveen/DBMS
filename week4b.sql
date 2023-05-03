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



5.	Find all the courses taught in the Fall 2009 semester but not in the Spring 2010 semester.
  
SQL> SELECT course_id FROM teaches WHERE SEMESTER = 'Fall' AND YEAR = 2009 AND course_id NOT IN(SELE
CT course_id FROM teaches WHERE SEMESTER = 'Spring' AND YEAR = 2010);

COURSE_I
--------
CS-347
PHY-101



6.	Find all courses taught in both the Fall 2009 semester and in the Spring 2010 semester. (Write correlated nested Query)
  
  


  
  
