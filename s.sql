select * from emp;
--select deptno, avg(sal) from emp group by deptno;
--select ename, avg(sal) from emp group by ename;
--select loc, count(*) employeecount
-- from emp e
--join dept d
--  on e.deptno = d.deptno 
-- group by d.deptno, loc
--having count(*) >= 5
-- order by employeecount desc;
--select * from emp where sal>(select sal from emp where upper(ename)=upper('jones'));
--select * from emp where sal=(select min(sal) from emp);
select ename, job, sal
  from emp
 where job = (select job from emp where empno = 7369)
   and sal > (select sal from emp where empno = 7876);
select deptno, min(sal)
  from emp
 group by deptno
having min(sal) > (select min(sal) from emp where empno = 20);
select empno, ename
  from emp
 where sal in (select min(sal) from emp group by deptno);
select empno, ename, job, sal
  from emp
 where deptno <> 10
   and sal > any (select sal from emp where deptno = 10);
select empno, ename, job, sal
  from emp
 where deptno <> 10
   and sal > (select min(sal) from emp where deptno = 10);
select empno, ename, job, sal
  from emp
 where deptno <> 10
   and sal > all (select sal from emp where deptno = 10);
select ename, job, deptno
  from emp
 where (job, mgr) in (select job, mgr from emp where deptno = 10)
   and deptno <> 10;
select ename, job
  from emp
 where (job in (select job from emp where deptno = 10) or
       mgr in (select mgr from emp where deptno = 10))
   and deptno <> 10;
select ename from emp where empno not in (select nvl(mgr, 0) from emp);
select ename
  from emp
 where empno not in (select nvl(mgr, -999.99) from emp)
   and empno = (select empno from emp where ename = 'KING');
select e.ename, e.job, d.dname, b.avgsal
  from emp e, dept d, (select job, avg(sal) avgsal from emp group by job) b
 where e.deptno = d.deptno
   and e.job = b.job
   and e.sal > b.avgsal;
select distinct e.ename, e.job
  from emp e, (select job, mgr from emp) a
 where e.job = a.job
   and e.mgr = a.mgr
   and e.ename not in ('SCOOT', 'BLAKE');
select distinct b.ename
  from emp e, (select ename, mgr from emp) b
 where e.empno <> b.mgr;
select * from (select rownum rn,ename,hiredate from emp order by hiredate asc)where rn<=10 and rn>5;
