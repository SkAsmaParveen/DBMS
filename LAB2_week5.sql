1. Display the department names in the lower case but the initial must be in uppercase.


/*  INITCAP function converts only the initial alphabets of a string to upper case.  */

SQL> SELECT INITCAP(dname) FROM dept;

INITCAP(DNAME)
--------------
Accounting
Research
Sales
Operations


2. Determine the ‘ename’, ‘job’, ‘sal’ rename the title as Job-sal the output must be Job-Sal as
SMITH [CLERK] RS.2000


3. For each department, Count the number of times S occurs in department names.

*/  The REPLACE() function replaces all occurrences of a substring within a string, with a new substring.  */
                   */  REPLACE(string, old_string, new_string)  */
                   
SQL> SELECT dname,LENGTH(dname) - LENGTH(REPLACE(dname,'S',NULL)) as SCount FROM dept;

DNAME              SCOUNT
-------------- ----------
ACCOUNTING              0
RESEARCH                1
SALES                   2
OPERATIONS              1
                   

