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

