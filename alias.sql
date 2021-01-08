select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp;
select sal*1.2
from emp;
select sal*6+sal*6*1.2 收入
from emp;
select ename||'的第一年总收入为'||sal*6*2.2 as "年收 $入"
from emp;
select distinct job
from emp;
select nvl(comm,0)
from emp
where comm=0;
select 10/3
from dual;



