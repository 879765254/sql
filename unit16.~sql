1.创建序列，起始位1，自增为1，最小值为1，最大值为9999
create sequence seq
increment by 1
start with 1
minvalue 1
maxvalue 100;
2.创建序列，起始值为50，每次增加5；
create sequence seq1
start with 50
increment by 5;
3.在表copy_dept中插入记录，其中部门号码采用上一步中创建的序列生成；
create table copy_dept as
select * from dept where 1=0;
insert into copy_dept(deptno) values(seq1.nextval);
insert into copy_dept(deptno) values(seq1.currval);
select deptno, dname, loc from copy_dept
4.请为工资创建索引，比较<10000,>1000,与round（sal）>10000,哪个索引有效，哪个索引无效；
create index emp_sal_index 
on emp(sal);
select * from emp where sal<10000;
select * from emp where sal>1000;
select * from emp where round(sal)>10000;
5.创建表，采用“create table copy_emp_index as select * from emp”，生成500万条数据，把其中的“员工号”字段修改为唯一；
create table copy_emp_index as select * from emp;
alter table copy_emp_index modify(empno unique)
select * from copy_emp_index
6.查询表copy_emp_index表中员工号为200001的员工姓名，工资，记录执行时间；
select ename,sal from copy_emp_index where empno=11;
7.在copy_emp_index表的empno字段上创建索引，再次执行第6题语句，记录执行时间并做对比；
create index emp_empno_index on copy_emp_index(empno);
select ename,sal from copy_emp_index where empno=11;
