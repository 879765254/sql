1.查询工资高于编号为7782的员工工资，并且和7369号员工从事相同工作的员工的编号、姓名及工资。
select empno,ename,sal
from emp
where sal>(select sal
      from emp
      where empno=7782)
      and job=(select job
          from emp
          where empno=7369);
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp      
update emp set sal=500
where empno=7934;  
2.查询工资最高的员工姓名和工资。 
select ename,sal
from emp
where sal=(select max(sal)
      from emp)
3.查询部门最低工资高于10号部门最低工资的部门的编号、名称及部门最低工资。
select e.deptno,d.dname, min(sal)
       from emp e,dept d
       where e.deptno=d.deptno
       group by e.deptno,d.dname
       having min(sal)>(select min(sal)
       from emp
       where deptno=10)
select a.*,d.dname
from (select deptno,min(sal)
from emp
group by deptno
having min(sal)>(select min(sal)
       from emp
       where deptno=10)) a,dept d
       where a.deptno=d.deptno;

       
4.查询员工工资为其部门最低工资的员工的编号和姓名及工资。
select empno,ename,sal
from emp e
where sal=(select min(sal)
      from emp
      where deptno=e.deptno);
5.显示经理是KING的员工姓名，工资。
select ename,sal
from emp
where mgr=(select empno
      from emp
      where ename='KING');
6.显示比员工SMITH参加工作时间晚的员工姓名，工资，参加工作时间。
select ename,sal,hiredate
from emp
where hiredate>(select hiredate
                from emp
                where ename='SMITH');
7.使用子查询的方式查询哪些职员在NEW YORK工作。
select *
from emp
where deptno=(select deptno
      from dept
      where loc='NEW YORK')
8.写一个查询显示和员工SMITH工作在同一个部门的员工姓名，雇用日期，查询结果中排除SMITH。
select ename,hiredate
from emp
where deptno=(select deptno
      from emp
      where ename='SMITH')
      and ename !='SMITH';
9.写一个查询显示其工资比全体职员平均工资高的员工编号、姓名。
select empno,ename
from emp
where sal>(select avg(sal)
      from emp);
10.写一个查询显示其上级领导是King的员工姓名、工资。
select ename,sal
from emp
where mgr=(select empno
      from emp
      where ename='KING')
11.显示所有工作在RESEARCH部门的员工姓名，职位。
select ename,job
from emp
where deptno=(select deptno
      FROM DEpt
      where dname='RESEARCH')
12.查询每个部门的部门编号、平均工资，要求部门的平均工资高于部门20的平均工资。
select deptno,avg(sal)
from emp
group by deptno
having avg(sal)>(select avg(sal)
      from emp
      where deptno=20);
13.查询大于自己部门平均工资的员工姓名，工资，所在部门平均工资，高于部门平均工资的额度。
select e.ename,e.sal,a.avgsal,sal-a.avgsal
from emp e,(select deptno,avg(sal) avgsal
from emp
group by deptno) a
where e.deptno=a.deptno
and sal>a.avgsal;
14. 列出至少有一个雇员的所有部门
select *
from dept d
where 0<(select count(1)
      from emp
      where deptno=d.deptno);
15. 列出薪金比"SMITH"多的所有雇员
select *
from emp
where sal>(select sal
      from emp
      where ename='SMITH')
16. 列出入职日期早于其直接上级的所有雇员
select *
from emp e
where hiredate>(select hiredate
      from emp
      where empno=e.mgr)
17. 找员工姓名和直接上级的名字
select w.ename,m.ename
from emp w,emp m
where w.mgr=m.empno;
18. 显示部门名称和人数
select a.*,d.dname
from (select deptno,count(1)
from emp
group by deptno) a,dept d
where a.deptno=d.deptno;
19. 显示每个部门的最高工资的员工
select a.*,e.*
from (select deptno,max(sal)
from emp
group by deptno) a,emp e
where a.deptno=e.deptno;
20. 显示出和员工号7369部门相同的员工姓名，工资
select ename,sal
from emp
where deptno=(select deptno
      from emp
      where empno=7369);
21. 显示出和姓名中包含"W"的员工相同部门的员工姓名
select ename
from emp
where deptno=(select deptno
      from emp
      where instr(ename,'W')!=0);
22. 显示出工资大于平均工资的员工姓名，工资
select ename,sal
from emp
where sal>(select avg(sal)
     from emp
     );
23. 显示出工资大于本部门平均工资的员工姓名，工资
select ename,sal
from emp e
where sal>(select avg(sal)
      from emp
      where deptno=e.deptno)
24. 显示每位经理管理员工的最低工资，及最低工资者的姓名
select e.ename,a.minsal
from (select mgr,min(sal)minsal
from emp
group by mgr) a,emp e
where a.mgr=e.mgr;
25. 显示比工资最高的员工参加工作时间晚的员工姓名，参加工作时间
select ename,hiredate
from emp
where hiredate>(select hiredate
      from emp
      where sal=(select max(sal)
      from emp))
26. 显示出平均工资最高的的部门平均工资及部门名称
select a.maxsal,d.dname
from (select deptno,max(avg(sal)) maxsal
from emp
group by deptno) a,dept d
where a.deptno=d.deptno;
