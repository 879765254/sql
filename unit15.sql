1.创建视图v_emp_20，包含20号部门的员工编号，姓名，年薪列(年薪=12*(工资+奖金）；
create view v_emp_20 as
select empno,ename,(sal*12+comm) 年薪
from emp; 
select empno, ename, 年薪 from v_emp_20
2.从视图v_emp_20中查询年薪大于1万元员工的信息；
select * from v_emp_20
where 年薪>10000;
3.请为工资大于2000的员工创建视图，要求显示员工的部门信息，职位信息，工作地点；
create view v_dept as
select d.dname,e.job,d.loc
from emp e ,dept d
where e.deptno=d.deptno and e.sal>2000;
select dname, job, loc from v_dept
4.针对以上视图执行insert,update,delete,语句能否成功，为什么？
insert into v_dept(dname,job) values('chenghao','son');
insert into v_emp_20(empno,ename) values(11,'chenghao');
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp
