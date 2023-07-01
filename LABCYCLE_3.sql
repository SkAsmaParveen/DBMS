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

OUTPUT:
  SQL> @D:\PLSQL
SP2-0310: unable to open file "D:\PLSQL.sql"
SQL> @D:\PLSQL\MULTIPLY.SQL
 14  /
Enter value for n: 3
old   6: n:=&n;
new   6: n:=3;
3*1=3
3*2=6
3*3=9
3*4=12
3*5=15
3*6=18
3*7=21
3*8=24
3*9=27
3*10=30

PL/SQL procedure successfully completed.

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
  -- should create a table named DEMO_TAB before hand
-- CREATE TABLE DEMO_TAB (
--     Num1    numeric(4,0),
--     Num2    numeric(4,0),
--     LCM     numeric(2,0),
--     HCF     numeric(2,0)
-- );
declare
    n1 DEMO_TAB.Num1%type := &n1;
    n2 DEMO_TAB.Num2%type := &n2;
    ma number;
    mi number;
    gcd DEMO_TAB.HCF%type;
    lcm DEMO_TAB.LCM%type;
    i number;
    r DEMO_TAB%ROWTYPE;
begin
    if n1>n2 then
    ma := n1;
    mi := n2;
    else
    mi := n1;
    ma := n2;
    end if;
    for i in 2..mi loop
    if MOD(mi, i)=0 AND MOD(ma, i)=0 then   
    lcm := i;
    EXIT;
    end if;
    end loop;

    for i in REVERSE 1..mi loop
    if MOD(mi, i)=0 AND MOD(ma, i)=0 then
    gcd := i;
    EXIT;
    end if;
    end loop;

    INSERT INTO DEMO_TAB VALUES(n1, n2, lcm, gcd);
end;


OUTPUT:
  
SQL> @D:\PLSQL\DEMOTAB.SQL
 34  /
Enter value for n1: 2
old   2:     n1 DEMO_TAB.Num1%type := &n1;
new   2:     n1 DEMO_TAB.Num1%type := 2;
Enter value for n2: 4
old   3:     n2 DEMO_TAB.Num2%type := &n2;
new   3:     n2 DEMO_TAB.Num2%type := 4;

PL/SQL procedure successfully completed.

SQL> SELECT * from demo_tab;

      NUM1       NUM2        LCM        HCF
---------- ---------- ---------- ----------
         2          4          2          2

3.Write a PL/SQL block to read the quantity of a product from inventory and if it is > 0 reduce the quantity by 1 and 
        record the status of purchase of that product as ‘PURCHASED’. Otherwise 
        record the status of purchase of that product as ‘OUT OF STOCK’. While recording the status of a purchase, record the date of transaction.


declare

id Inventorty.ProductId%type := &id;
quan Inventorty.Quantity%type;

begin

select Quantity into quan from InventorTy where ProductId = id;
if quan > 0 then
update Inventorty set Quantity = Quantity-1 where ProductId = id;

insert into PurchaseRecord values(id,'Purchased',sysdate);
else

insert into PurchaseRecord values(id,'OutOfStock',sysdate);

end if;
end;

SQL> create table Inventorty (ProductId number,
  2  ProductName varchar(10),
  3  Quantity numeric(4,0),
  4  primary key(ProductId));

Table created.

SQL> insert into Inventorty values(1234,'Scrubber',3);

1 row created.

SQL> insert into Inventorty values(5678,'Doormat',4);

1 row created.

SQL> insert into Inventorty values(9101,'Curtain',5);

1 row created.


SQL> insert into Inventorty values(5678,'Doormat',4);

1 row created.

  SQL> create table PurchaseRecord( ProductId number,
  2  Status varchar(10),
  3  TransacDate date,
  4   foreign key(ProductId) references Inventorty );

Table created.


OUTPUT:

SQL> select * from Inventorty;

PRODUCTID  PRODUCTNAM   QUANTITY
---------- ---------- ----------
1234       Scrubber            3
5678       Doormat             4
9101       Curtain             5


SQL>  @D:\PLSQL\INVEN.SQL
 21  /
Enter value for id: 1234
old   3: id Inventorty.ProductId%type := &id;
new   3: id Inventorty.ProductId%type := 1234;

PL/SQL procedure successfully completed.

SQL> select * from Inventorty;

 PRODUCTID PRODUCTNAM   QUANTITY
---------- ---------- ----------
      1234 Scrubber            2
      5678 Doormat             4
      9101 Curtain             5
   
SQL> select * from PurchaseRecord;

 PRODUCTID STATUS     TRANSACDA
---------- ---------- ---------
      1234 Purchased  01-JUL-23


4.Write a PL/SQL block to handle the following built-in exceptions
no_data_found
too_many_rows
zero_divide

--CREATE EMPLOYEE TABLE BEFORE HAND
   
SQL> create table employee( Name varchar(10), Dno numeric(4,0),
  2  Ssn varchar(10) primary key,
  3  Dname varchar(10) );

Table created.

SQL> insert into employee values('Asma',100,1234,'CSE');

1 row created.

SQL> insert into employee values('Salma',101,5678,'CSE');

1 row created.
declare 

s employee.Ssn%type;
m number := 10;
n number;



begin
  
-- n := m/0;
--select ssn into s from employee;
select ssn into s from employee where dno = 10;

exception
when too_many_rows then
dbms_output.put_line('Too manyrows where only1 isexpected');

when zero_divide then
dbms_output.put_line('Trying to divide by Zero!');

when no_data_found then
dbms_output.put_line('No department is found!');

end;

OUTPUT:
  
SQL>  @D:\PLSQL\EH.SQL
 26  /
Too manyrows where only1 isexpected
PL/SQL procedure successfully completed.

  
SQL> @D:\PLSQL\EH.SQL
 25  /
Trying to divide by Zero!
PL/SQL procedure successfully completed.

  
SQL>  @D:\PLSQL\EH.SQL
 26  /
No department is found!
PL/SQL procedure successfully completed.

  
5 .Write a PL/SQL block to check whether the quantity of any product in Inventory table of problem 3 
  is < 0. If so, using an exception display relevant message and update quantity to 0.




  



