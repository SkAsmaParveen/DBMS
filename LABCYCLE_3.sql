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



