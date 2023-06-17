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


SQL> SELECT ename || ' [' || job || ']' || ' RS.' || sal as "Job-sal" FROM emp;

Job-sal
------------------------------------------------------------------
SMITH [CLERK] RS.800
ALLEN [SALESMAN] RS.1600
WARD [SALESMAN] RS.1250
JONES [MANAGER] RS.2975
MARTIN [SALESMAN] RS.1250
BLAKE [MANAGER] RS.2850
CLARK [MANAGER] RS.2450
SCOTT [ANALYST] RS.3000
KING [PRESIDENT] RS.5000
TURNER [SALESMAN] RS.1500
ADAMS [CLERK] RS.1100

Job-sal
------------------------------------------------------------------
JAMES [CLERK] RS.950
FORD [ANALYST] RS.3000
MILLER [CLERK] RS.1300

14 rows selected.


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


/*  It is used to convert a date from DATE value to a specified date format.   */
            */ TO_CHAR(format,'model') */

SQL> SELECT * FROM emp 
  2  WHERE TO_CHAR(hiredate, 'YYYY/DD')  BETWEEN 1980 AND 1990
  3  AND TO_CHAR(hiredate, 'W' ,'D') = '02' '07' AND '14' ;

no rows selected


6. Write an SQL statement to convert the current date to new date picture ex: MONDAY 10th
June 2005 10:30.00 PM


  --TO_CHAR(expression, date_format)
  
SQL> select TO_CHAR(sysdate,'DAY DDth MONTH YYYY  HH:MI:SS AM') AS "DATE-TIME" FROM dual;

DATE-TIME
------------------------------------------
SATURDAY  17TH JUNE      2023  02:33:03 PM

SQL> SELECT TO_CHAR(CURRENT_DATE, 'DAY DDth MONTH HH:MI:SS AM') AS "DATE-TIME" FROM DUAL;

--The DUAL is special one row, one column table present by default in all Oracle databases. 

S


7. Write a query to display all employee details who joined last Wednesday of a month and
experience should be greater than 20 months


8. Write a query to calculate the service of employees rounded to years


12. Find all employees who earn a salary greater than the average salary of their departments.



SQL> SELECT e.* FROM empl e WHERE e.sal > ( SELECT AVG(sal) FROM empl WHERE deptno = e.deptno GROUP 
BY deptno);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300
        30

      7566 JONES      MANAGER         7839 02-APR-81       2975
        20

      7698 BLAKE      MANAGER         7839 01-MAY-81       2850
        30


     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
---------- ---------- --------- ---------- --------- ---------- ----------
    DEPTNO
----------
      7788 SCOTT      ANALYST         7566 19-APR-87       3000
        20

      7839 KING       PRESIDENT            17-NOV-81       5000
        10

      7902 FORD       ANALYST         7566 03-DEC-81       3000
        20


6 rows selected.







                   

