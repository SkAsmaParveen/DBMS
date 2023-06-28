1.	Write a PL/SQL block to do the following:
  
     a.Read a number and print its multiplication table

declare
i number;
n number;

begin
n:=&n;

for i in 1..10 
loop
dbms_output.put_line(n||'*'||i||'='||n*i);
end loop;

end;


b.Read a number and check whether it is a palindrome or not

declare
    n number := &n;
    rev number := 0;
    temp number := n;
begin
    while temp<>0 loop
    rev := (rev*10)+mod(temp,10);
    temp := trunc(temp/10);
    end loop;
    dbms_output.put_line('Reverse: '||rev);
    if rev=n then
      dbms_output.put_line(n||' is a Palindrome number');
    else
      dbms_output.put_line(n||' is not a Palindrome number');
    end if;
end;

OUTPUT:

SQL> set serveroutput on
SQL> @Z:\PLSQL\PAL.SQL
 17  /
Enter value for n: 969
old   2:     n number := &n;
new   2:     n number := 969;
Reverse: 969
969 is a Palindrome number

PL/SQL procedure successfully completed.


c.Read a number n, and print the first n Fibonacci numbers


SQL> @Z:\PLSQL\FIB.SQL
 18  /
Enter value for n: 5
old   5:     n number := &n;
new   5:     n number := 5;
Fibonacci series:
0
1
1
2
3

PL/SQL procedure successfully completed.


2.Write a PL/SQL block which will accept two numbers and find out their LCM and HCF. The output should be stored in a table called DEMO_TAB.

