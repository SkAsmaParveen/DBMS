1. Find all possible combinations of instructors and the courses they teach.


SQL> SELECT i.id, i.name, c.course_id, c.title FROM instructor i, course c, teaches t WHERE i.id=t.i
d AND t.course_id=c.course_id;

ID    NAME                 COURSE_I
----- -------------------- --------
TITLE
--------------------------------------------------
10101 Srinivasan           CS-101
Intro. to Computer Science

10101 Srinivasan           CS-315
Robotics

10101 Srinivasan           CS-347
Database System Concepts


2. Retrieve the names of all instructors, along with their department names and
   department building name.

SQL> select name,instructor.dept_name,building from instructor,department where instructor.dept_name
 = department.dept_name;

NAME                 DEPT_NAME            BUILDING
-------------------- -------------------- ---------------
Srinivasan           Comp. Sci.           Taylor
Wu                   Finance              Painter
Mozart               Music                Packard
Einstein             Physics              Watson
El Said              History              Painter
Gold                 Physics              Watson
Katz                 Comp. Sci.           Taylor
Califieri            History              Painter
Singh                Finance              Painter
Crick                Biology              Watson
Brandt               Comp. Sci.           Taylor

NAME                 DEPT_NAME            BUILDING
-------------------- -------------------- ---------------
Kim                  Elec. Eng.           Taylor

12 rows selected.

3. Find the names of instructors who have taught at least one course



SQL> SELECT DISTINCT i.name FROM instructor i, teaches t WHERE i.id=t.id;

NAME
--------------------
Brandt
Crick
Einstein
El Said
Katz
Kim
Mozart
Srinivasan
Wu

9 rows selected.


4.    For the student with ID 12345 (or any other value), show all course_id and title
      of all courses registered for by the student.

SQL> select s.id, t.course_id, c.title from student s, takes t, course c where s.id = '12345' AND 
s.id = t.id  AND t.course_id = c.course_id;

ID    COURSE_I TITLE
----- -------- --------------------------------------------------
12345 CS-101   Intro. to Computer Science
12345 CS-190   Game Design
12345 CS-315   Robotics
12345 CS-347   Database System Concepts


5. Find instructor names and course identifiers for instructors in the Computer
   Science department.
   
   
   
   SQL> select DISTINCT(i.name), t.course_id from instructor i, teaches t WHERE dept_name LIKE 'Comp. Sci.' AND i.id = t.id;

  NAME                 COURSE_I
-------------------- --------
  Brandt               CS-190
  Brandt               CS-319
  Katz                 CS-101
  Katz                 CS-319
  Srinivasan           CS-101
  Srinivasan           CS-315
  Srinivasan           CS-347

  7 rows selected.
   
   
   
   
6. For all instructors in the university who have taught some course, find their
   names and the course ID of all courses they taught.
   
   SQL> select DISTINCT(i.name), t.course_id FROM instructor i, teaches t WHERE i.id = t.id;

NAME                 COURSE_I
-------------------- --------
Brandt               CS-190
Brandt               CS-319
Crick                BIO-101
Crick                BIO-301
Einstein             PHY-101
El Said              HIS-351
Katz                 CS-101
Katz                 CS-319
Kim                  EE-181
Mozart               MU-199
Srinivasan           CS-101

NAME                 COURSE_I
-------------------- --------
Srinivasan           CS-315
Srinivasan           CS-347
Wu                   FIN-201

14 rows selected.



7. Find the names of all instructors whose salary is greater than at least one
   instructor in the Biology department. Or Find the names of all instructors who
   earn more than the lowest paid instructor in the Biology department.
   

SQL> SELECT name FROM instructor WHERE salary>(SELECT MIN(salary) FROM instructor WHERE dept_name LI
KE 'Biology');

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



SQL>  select i.name from instructor i,instructor s where s.dept_name = 'Biology' and i.salary > s.salary;

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
   
   
8. Find full details of instructors who teach at least one course.


   
SQL>  SELECT DISTINCT i.* from instructor i,teaches t where i.id = t.id;

ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
10101 Srinivasan           Comp. Sci.                65000
12121 Wu                   Finance                   90000
15151 Mozart               Music                     40000
22222 Einstein             Physics                   95000
32343 El Said              History                   60000
45565 Katz                 Comp. Sci.                75000
76766 Crick                Biology                   72000
83821 Brandt               Comp. Sci.                92000
98345 Kim                  Elec. Eng.                80000

9 rows selected.


9. Find the instructor names and the courses they taught for all instructors in the
Biology department who have taught some course.


 
SQL> SELECT DISTINCT i.name from instructor i,teaches t WHERE i.id = t.id AND dept_name LIKE 'Comp. Sci.' ;

NAME
--------------------
Brandt
Katz
Srinivasan

SQL> 


10. Find the set of all courses taught either in Fall 2009 or in Spring 2010, or both.


SQL> SELECT t.course_id from teaches t WHERE (semester LIKE 'Fall' AND year = 2009) OR (semester LIK
E 'Spring' AND year = 2010);

COURSE_I
--------
CS-101
CS-315
CS-347
FIN-201
MU-199
PHY-101
HIS-351
CS-101
CS-319
CS-319

10 rows selected.


11. Find all courses taught in the Fall 2009 semester but not in the Spring 2010
semester.


SQL> SELECT t.course_id from teaches t WHERE (semester LIKE 'Fall' AND year = 2009) OR NOT (semester
 LIKE 'Spring' AND year = 2010);

COURSE_I
--------
CS-101
CS-347
PHY-101
BIO-101
BIO-301
CS-190
CS-190
EE-181

8 rows selected.

12. Find the names of all students who have taken any Comp. Sci. course ever.
(there should be no duplicate names)


SQL> SELECT DISTINCT s.name  from student s, takes t, course c WHERE c.dept_name = 'Comp. Sci.' 
     AND s.id = t.id AND t.course_id = c.course_id;

NAME
--------------------
Bourikas
Brown
Levy
Shankar
Williams
Zhang

6 rows selected.


13. Display the IDs of all instructors who have never taught a course. (Don’t write
nested query)
   
   
   
SQL> select i.id from instructor i where not exists (select * from teaches t where t.id = i.id);

ID
-----
33456
58583
76543
   

SQL> (SELECT id FROM instructor) MINUS (SELECT id FROM teaches);

ID
-----
33456
58583
76543


   



