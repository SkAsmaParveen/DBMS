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

 4. Write a query to display the department name which does not contain any employees.
 
 
 SQL> SELECT dname FROM dept WHERE deptno NOT IN (SELECT DISTINCT deptno FROM emp);

DNAME
--------------
OPERATIONS


5. Write a query to display all employee details where employee was joined in year date wise
1980 and 1990 and 2nd week of every month


/*  TO_CHAR function is used to typecast a numeric or date input to character type with a format model   */
            */ TO_CHAR(format,'model') */

SQL> SELECT * FROM emp 
  2  WHERE TO_CHAR(hiredate, 'YYYY/DD')  BETWEEN 1980 AND 1990
  3  AND TO_CHAR(hiredate, 'W') = '02' ;

no rows selected



                   

