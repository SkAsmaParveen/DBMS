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
  3  AND TO_CHAR(hiredate, 'W' ) = '02'  ;

no rows selected


6. Write an SQL statement to convert the current date to new date picture ex: MONDAY 10th
June 2005 10:30.00 PM


  --TO_CHAR(expression, date_format)
  
SQL> select TO_CHAR(sysdate,'DAY DDth MONTH YYYY  HH:MI:SS AM') AS "DATE-TIME" FROM dual;

DATE-TIME
------------------------------------------
SATURDAY  17TH JUNE      2023  02:33:03 PM

--The DUAL is special one row, one column table present by default in all Oracle databases. 


7. Write a query to display all employee details who joined last Wednesday of a month and
experience should be greater than 20 months


8. Write a query to calculate the service of employees rounded to years


SQL> select empno,ename,job,hiredate,floor(MONTHS_BETWEEN(sysdate,hiredate)/12)
  2  as SERVICE_IN_YEARS from empl;

     EMPNO ENAME      JOB       HIREDATE  SERVICE_IN_YEARS
---------- ---------- --------- --------- ----------------
      7369 SMITH      CLERK     17-DEC-80               42
      7499 ALLEN      SALESMAN  20-FEB-81               42
      7521 WARD       SALESMAN  22-FEB-81               42
      7566 JONES      MANAGER   02-APR-81               42
      7654 MARTIN     SALESMAN  28-SEP-81               41
      7698 BLAKE      MANAGER   01-MAY-81               42
      7782 CLARK      MANAGER   09-JUN-81               42
      7788 SCOTT      ANALYST   19-APR-87               36
      7839 KING       PRESIDENT 17-NOV-81               41
      7844 TURNER     SALESMAN  08-SEP-81               41
      7876 ADAMS      CLERK     23-MAY-87               36

     EMPNO ENAME      JOB       HIREDATE  SERVICE_IN_YEARS
---------- ---------- --------- --------- ----------------
      7900 JAMES      CLERK     03-DEC-81               41
      7902 FORD       ANALYST   03-DEC-81               41
      7934 MILLER     CLERK     23-JAN-82               41

14 rows selected.


9. Write a query that will display a list of employees and their salary and the comments as follows:
      a. If the salary is more than 1500 then display “above target”
      b. If the salary is equal to 1500 then display “on the target”
      c. If the salary is less than 1500 then display “below the target”


--decode(expression,search_value,result)


SQL> SELECT ename, sal,
  2      DECODE(SIGN(SAL-1500), 1, 'above target',
  3                             0, 'on the target',
  4                            -1, 'below the target') AS COMMENTS
  5      FROM empl;

ENAME             SAL COMMENTS
---------- ---------- ----------------
SMITH             800 below the target
ALLEN            1600 above target
WARD             1250 below the target
JONES            2975 above target
MARTIN           1250 below the target
BLAKE            2850 above target
CLARK            2450 above target
SCOTT            3000 above target
KING             5000 above target
TURNER           1500 on the target
ADAMS            1100 below the target

ENAME             SAL COMMENTS
---------- ---------- ----------------
JAMES             950 below the target
FORD             3000 above target
MILLER           1300 below the target

14 rows selected.


10. Display all employee names, employee number, department names & salary grades for all employees who are working in department 30.*/

  
11. Display the time of day.
  
SQL> select TO_CHAR(SYSDATE,'HH:MM:SS AM') FROM dual;

TO_CHAR(SYS
-----------
02:06:25 PM
  

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


This function is used to measure the months between two dates.
       MONTHS_BETWEEN(from_date, to_date)




                   

