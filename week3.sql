1. Find all possible combinations of instructors and the courses they teach.


SQL> select name,course_id from instructor,teaches where instructor.ID = teaches.id;

NAME                 COURSE_I
-------------------- --------
Srinivasan           CS-101
Srinivasan           CS-315
Srinivasan           CS-347
Wu                   FIN-201
Mozart               MU-199
Einstein             PHY-101
El Said              HIS-351
Katz                 CS-101
Katz                 CS-319
Crick                BIO-301
Brandt               CS-190

NAME                 COURSE_I
-------------------- --------
Brandt               CS-190
Brandt               CS-319
Kim                  EE-181

14 rows selected.


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


