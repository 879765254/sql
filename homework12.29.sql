--1.查询入职日期最早的员工姓名，入职日期
select ename,hiredate
from emp
where hiredate=(
select min(hiredate)
from emp
);
--2.查询工资比SMITH工资高并且工作地点在CHICAGO的员工姓名，工资，部门名称
select e.ename,e.sal,d.dname
from emp e,dept d
where e.deptno=d.deptno and e.sal>(
select sal
from emp
where ename='SMITH'
)and d.loc='CHICAGO';
--3.查询入职日期比20部门入职日期最早的员工还要早的员工姓名，入职日期
select ename,hiredate
from emp
where hiredate<(
select min(hiredate)
from emp
where deptno=20
);
--4.查询部门人数大于所有部门平均人数的的部门编号，部门名称，部门人数
select d.deptno,d.dname,count(1)
from emp e,dept d
where e.deptno=d.deptno
having count(1)>(
select avg(count(1))
from emp
group by deptno
)
group by d.deptno,d.dname;
--1.查询入职日期比10部门任意一个员工晚的员工姓名、入职日期，不包括10部门员工
select ename,hiredate
from emp
where hiredate>any(
select hiredate
from emp
where deptno=10
) and deptno<>10
--2.查询入职日期比10部门所有员工晚的员工姓名、入职日期，不包括10部门员工
select ename,hiredate
from emp
where hiredate>all(
select hiredate
from emp
where deptno=10
) and deptno<>10
--3.查询职位和10部门任意一个员工职位相同的员工姓名，职位，不包括10部门员工
select ename,hiredate
from emp
where hiredate=any(
select hiredate
from emp
where deptno=10
) and deptno<>10
--1.查询职位及经理和10部门任意一个员工职位及经理相同的员工姓名，职位，不包括10部门员工
select job,mgr
from emp
where (job,mgr) in(
                   select job,mgr
                   from emp
                   where deptno=10)
                   and deptno <> 10;

--2.查询职位及经理和10部门任意一个员工职位或经理相同的员工姓名，职位，不包括10部门员工
select job,mgr
from emp
where (job in(
                   select job
                   from emp
                   where deptno=10)
or mgr in(
                   select mgr
                   from emp
                   where deptno=10))
                   and deptno <> 10;
--1.查询比自己职位平均工资高的员工姓名、职位，部门名称，职位平均工资
select e.ename,a.*,d.dname,e.sal
from (select job,avg(sal) avgsal
     from emp
     group by job) a,emp e,dept d
where a.job=e.job and e.deptno=d.deptno and e.sal>a.avgsal;

select e.ename,e.job,d.dname,(select avg(sal) from emp where job=e.job ),e.sal
from emp e,dept d
where e.deptno=d.deptno and sal>(select avg(sal) from emp where job=e.job);

--2.查询职位和经理同员工SCOTT或BLAKE完全相同的员工姓名、职位，不包括SCOOT和BLAKE本人。
select ename,job
from emp
where (job,mgr) in (select job,mgr
                   from emp
                   where ename in ('SCOTT','BLAKE'))
and ename not in ('SCOTT','BLAKE');
--3.查询不是经理的员工姓名。
select ename
from emp e
where 0=(select count(1)
         from emp
         where mgr=e.empno);
--1.列出至少有一个雇员的所有部门名称。
select dname
from dept d
where exists(
select '1'
from emp
where deptno=d.deptno);
--2.列出一个雇员都没有的所有部门名称。
select dname
from dept d
where not exists(
select '1'
from emp
where deptno=d.deptno);

