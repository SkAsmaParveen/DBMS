1.	Write a PL/SQL stored function to calculate ncrusingfact (m) function that returns factorial of m.

-- CREATE FUNCTION fun_name(args data_type) RETURN IS/AS

--function for calculating factorial

CREATE FUNCTION fac(n number) RETURN number AS
f number := 1;
a number := n;

begin

while(n>1) loop
f := f*a;
a := a-1;
end loop;
return f;

end;

CREATE FUNCTION ncr (n number, r number) RETURN number AS
ncr  number ;

BEGIN
ncr:=trunc(fac(n)/(fac(r)*fac(n-r)));
RETURN ncr;
END;

--MAIN PROGRAM

declare

n number := &n;
r number := &r;
ncr1 number;

begin

ncr1 := ncr(n,r);
dbms_output.put_line(n||'c'||r||' = '||ncr1);
end;



SQL> set serveroutput on
SQL>  @Z:\PLSQL\4AMAIN.SQL
 12  /
Enter value for n: 3
old   3: n number := &n;
new   3: n number := 3;
Enter value for r: 2
old   4: r number := &r;
new   4: r number := 2;
3c2 = 3

PL/SQL procedure successfully completed.

2.	Write a PL/SQL block that updates salary of an employee in employee table by using incr function which takes employee number as argument, calculates increment and returns increment based on the following criteria.
       If salary <= 3000 – increment = 30% of salary
       If salary > 3000 and <= 6000– increment = 20% of salary
       Else increment = 10% of salary. 

  SQL> create table empl2(ename varchar(10),sal number,empno number);

Table created.


SQL> select * from empl2;

ENAME             SAL      EMPNO
---------- ---------- ----------
Asma             7000          1
Salma           10000          2
Malli            1000          3

CREATE or replace FUNCTION incr(sal number) RETURN number AS

s number;
n number;

begin

	select sal into s from empl2 where empno=n;
	if s <= 3000 then s:=0.3*s;
	elsif s>3000 and s<=6000 then
		s:=0.2*s;
	else    
        s:=0.1*s;
	end if;
	return s;
end;


SQL>  @Z:\PLSQL\LAB4B.SQL
 18  /
Function created.





