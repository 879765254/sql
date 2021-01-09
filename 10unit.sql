--1.产生一个报告显示 BLAKE的所有下级（包括直接和间接下级）雇员的名字、薪水和部门号。
select ename,sal,deptno
from emp
start with ename='BLAKE'
connect by prior empno=mgr;
--2.创建一个报告显示对于雇员 SMITH 经理的层次，包括级别和姓名，首先显示他的直接经理。
select level,ename
from emp
start with ename='SMITH'
connect by prior mgr=empno;
--3.创建一个缩进报告显示经理层次，从名字为 KING的雇员开始，显示雇员的名字、经理ID和部门ID。
select lpad(ename,10+level,'*'),mgr,deptno
from emp
start with ename='KING'
connect by prior empno=mgr;
--4.产生一个公司组织图表显示经理层次。从最顶级的人开始，排除所有job为CLERK的人，还要排除FORD和那些对FORD报告的雇员。
select lpad(ename,10+level,'*'),mgr,deptno
from emp
where job!='CLERK' and ename !='FORD' and mgr!=(select empno from emp where ename='FORD')
start with ename='KING'
connect by prior empno=mgr;
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp
--1.查询所有雇员编号，名字和部门名字。
select empno,ename,(select dname from dept where deptno=e.deptno)
from emp e

--2.查询哪些员工是经理？
select *
from emp e
where empno in(select mgr from emp where mgr=e.empno )
--3.查询哪些员工不是经理？
select *
from emp e
where empno not in(select mgr from emp where mgr=e.empno )
--4.查询每个部门工资最低的两个员工编号，姓名，工资。
select empno,ename,sal
from emp e
where sal=(
      select min(sal)
      from emp
      where deptno=e.deptno)
--1.列出至少有一个雇员的所有部门名称。
select dname
from dept d
where exists(select 1
      from emp
      where deptno=d.deptno)
--2.列出一个雇员都没有的所有部门名称。
select dname
from dept d
where not exists(select 1
      from emp
      where deptno=d.deptno)
1.查询薪水多于他所在部门平均薪水的雇员名字，部门号。
select ename,deptno
from emp e
where sal>(
         select avg(sal)
         from emp
         where deptno=e.deptno)
2.查询员工姓名和直接上级的名字。
select ename,(select ename from emp where empno=e.mgr)
from emp e
3.查询每个部门工资最高的员工姓名，工资。
select ename,sal
from emp e
where sal=(select max(sal)
      from emp 
      where deptno=e.deptno)
4.查询每个部门工资前两名高的员工姓名，工资
select ename,sal
from emp e
where 2>(select count(1)
      from emp
      where sal>e.sal and deptno=e.deptno)
