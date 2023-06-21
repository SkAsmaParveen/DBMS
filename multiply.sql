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



SQL> @z:\plsql\multiply.sql
 16  /
Enter value for n: 2
old   6: n:=&n;
new   6: n:=2;
2*1=2
2*2=4
2*3=6
2*4=8
2*5=10
2*6=12
2*7=14
2*8=16
2*9=18
2*10=20

PL/SQL procedure successfully completed.



