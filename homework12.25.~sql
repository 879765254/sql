--1.写一个查询,用首字母大写，其它字母小写显示雇员的 ename，显示名字的长度，并给每列一个适当的标签，条件是满足所有雇员名字的开始字母是J、A 或 M 的雇员，并对查询结果按雇员的ename升序排序。（提示：使用initcap、length、substr）
select initcap(ename) 员工名字,length(ename)名字长度
from emp
where substr(ename,1,1) in('J','A','M');
--1.查询员工姓名中中包含大写或小写字母A的员工姓名。
select ename
from emp
where instr(ename,'a')!=0 or instr(ename,'A')!=0;
--2.查询部门编号为10或20，入职日期在81年5月1日之后，并且姓名中包含大写字母A的员工姓名，员工姓名长度（提示，要求使用INSTR函数，不能使用like进行判断)
select ename,length(ename)
from emp
where deptno in (10,20) and hiredate>to_date('01-05-1981','dd-MM-YYYY') and instr(ename,'A')!=0;
--3.查询每个职工的编号,姓名，工资
--要求将查询到的数据按照一定的格式合并成一个字符串.
--前10位：编号,不足部分用*填充,左对齐
--中间10位：姓名，不足部分用*填充,左对齐
--后10位：工资，不足部分用*填充,右对齐
select concat(concat(rpad(empno,10,'*'),rpad(ename,10,'*')),lpad(sal,10,'*'))
from emp;
--1.写一个查询，分别计算100.456 四舍五入到小数点后第2位，第1位，整数位的值。
select round(100.456,2),round(100.456,1),round(100.456)
from dual;
--2.写一个查询，分别计算100.456 从小数点后第2位，第1位，整数位截断的值。
select trunc(100.456,2),trunc(100.456,1),trunc(100.456)
from dual;
--1.查询每个员工截止到现在一共入职多少天？
select ename,round(sysdate-hiredate) 入职天数
from emp;
--1.查询服务器当前时间
select systimestamp
from dual;
--2.查询部门10,20的员工截止到2000年1月1日，工作了多少个月，入职的月份。(提示：使用months_between,extract)
select round(months_between(to_date('01-01-2000','dd-MM-YYYY'),hiredate)),extract(month from hiredate) 
from emp;
--3.如果员工试用期6个月，查询职位不是MANAGER的员工姓名，入职日期，转正日期，入职日期后的第一个星期一,入职当月的最后一天日期。（提示：使用add_months,next_day,last_day)
select ename,hiredate,add_months(hiredate,6),next_day(hiredate,'星期一')，last_day(hiredate)
from emp;
--1.显示服务器系统当前时间，格式为2007-10-12 17:11:11(提示：使用to_char函数)
select to_char(sysdate,'YYYY-MM-dd HH24:mm:ss')
from dual;
--2.显示ename、hiredate 和 雇员开始工作日是星期几，列标签DAY(提示：使用to_char函数)
select ename,hiredate,to_char(hiredate,'day')
from emp;
--3.查询员工姓名，工资，格式化的工资（￥999,999.99） (提示：使用to_char函数)
select ename,hiredate,to_char(sal,'l999,999.99')
from emp;
--4.把字符串2015-3月-18 13:13:13 转换成日期格式，并计算和系统当前时间间隔多少天。 (提示：使用to_date函数)
select sysdate-to_date('2015-03-18 13:13:13','YYYY-MM-dd HH24:mi:ss')
from dual;


--select to_date('16:23:21','HH24:mi:ss')
--from dual

--1.计算2000年1月1日到现在有多少月，多少周（四舍五入）。
select round(months_between(sysdate,to_date('01-01-2000','dd-MM-YYYY'))),round((sysdate-(to_date('01-01-2000','dd-MM-YYYY')))/7)
from dual;
--2.查询员工ENAME的第三个字母是A的员工的信息(使用2个函数)。
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp
where instr(ename,'A')=3;
--3.使用trim函数将字符串‘hello’、‘  Hello ’、‘bllb’、‘ hello    ’分别处理得到下列字符串ello、Hello、ll、hello。
select trim('h' from 'hello'),trim(' ' from '  Hello '),trim('b' from 'bllb'),trim(' ' from ' hello    ')
from dual;
--4.将员工工资按如下格式显示：123,234.00 RMB 。
select concat(to_char(sal,'999,999.99'),'RMB')
from emp;
--5.查询员工的姓名及其经理编号，要求对于没有经理的显示“No Manager”字符串。
select ename,nvl (to_char(mgr),'No Manager')
from emp;
--6.将员工的参加工作日期按如下格式显示：月份/年份。
 select to_char(hiredate,'MM/YYYY')
 from emp;
--7.在员工表中查询出员工的工资，并计算应交税款：如果工资小于1000,税率为0，如果工资大于等于1000并小于2000，税率为10％，如果工资大于等于2000并小于3000，税率为15％，如果工资大于等于3000，税率为20％。
select sal,decode(trunc(sal/1000),0,'0',1,'10%',2,'15%','20%') taxRate
from emp;
--8.创建一个查询显示所有雇员的 ename和 sal。格式化sal为 15 个字符长度，用 $ 左填充，列标签 SALARY。
select ename,lpad(sal,15,'$') SALARY
from emp;




select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp
