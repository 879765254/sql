select * from emp;
select * from dept;
select e.ename,e.sal,d.deptno,d.loc from emp e full join dept d on e.deptno=d.deptno;
select count(*),avg(comm) from emp;
select avg(nvl(comm,0)) from emp;
select max(sal),min(sal) from emp inner join dept on emp.deptno=dept.deptno where loc='CHICAGO';
select count(distinct job) from emp;
