--1.��Ա����������һ��Ա����Ա�����Ϊ8888������ΪBOB����λΪCLERK������Ϊ��7788����ְ����Ϊ1985-03-03��н��3000������Ͳ���Ϊ�ա�
insert into emp(empno,ename,job,mgr,hiredate,sal)
values(8887,'BoB','CLERK',7788,to_date('1985-03-03','yyyy-MM-dd'),3000);
select * from emp;
--1.ʹ��CREATE TABLE emp_back as 
        --SELECT * FROM EMP WHERE 1=0������emp_back��,�����������ɡ�
create table emp_back as select * from emp where 1=0;
--2.��emp������ְ���ڴ���1982��1��1��֮ǰ��Ա����Ϣ���Ƶ�emp_back���С�
insert into emp_back
select * from emp; 

select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp_back
--1.�޸Ĳ���20��Ա����Ϣ����82��֮����ְ��Ա����ְ����������10��
update emp
set sal=sal+10
where deptno=20 and hiredate>to_date('1982','yyyy');
--2.�޸Ľ���Ϊnull��Ա������������Ϊ0
update emp
set comm=0
where comm is null;
--3.�޸Ĺ����ص���NEW YORK��CHICAGO��Ա�����ʣ���������500
update emp 
set sal=sal+500
where deptno in(
      select deptno
      from dept
      where loc in ('NEW YORK','CHICAGO'));
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp
select deptno, dname, loc from dept
alter table emp_back
add(dname varchar2(14));
select empno, ename, job, mgr, hiredate, sal, comm, deptno,dname from emp_back
update emp_back e
set dname=(
    select dname
    from dept
    where deptno=e.deptno);
--1.ɾ��������Ϊ7566��Ա����¼
delete from emp_back
where mgr=7566;
--2.ɾ��������NEW YORK��Ա����¼
delete from emp_back
where deptno=(
      select deptno
      from dept
      where loc='NEW YORK')
--3.ɾ�����ʴ������ڲ���ƽ�����ʵ�Ա����¼
delete emp_back e
where sal>(select avg(sal)
                  from emp_back
                  where deptno=e.deptno);
1.ʹ��������䣬����ѧ����student�Ͱ༶��class
create table student (        --ѧ����
     xh char(4),--ѧ��
      xm varchar2(10),--����
     sex char(2),--�Ա�
     birthday date,--��������
     sal number(7,2), --��ѧ��
     studentcid number(2) --ѧ���༶��
);
Create table class (   --�༶��
      classid number(2), --�༶���
      cname varchar2(20),--�༶����
        ccount  number(3) --�༶����
)

--2.��������ѧ����Ͱ༶�������������
--��1����������༶��ϢΪ��1��JAVA1�࣬null
                         2��JAVA2�࣬null
                         3��JAVA3�࣬null
--��2�����ѧ����Ϣ���£���A001��,��������,���С�,��01-5��-05��,100,1
insert into student
values('A001','����','��','01-5��-05',100,1);
--��3�����ѧ����Ϣ���£�'A002','MIKE','��','1905-05-06',10
insert into student(xh,xm,sex,birthday,studentcid)
values('A002','MIKE','��',to_date('1905-05-06','yyyy-MM-dd'),10)
--��4�����벿��ѧ����Ϣ�� 'A003','JOHN','Ů��
insert into student(xh,xm,sex)
values('A003','JOHN','Ů');
--��5����A001ѧ���Ա��޸�Ϊ'Ů��
update student
set sex='Ů'
where xh='A001'
--��6����A001ѧ����Ϣ�޸����£��Ա�Ϊ�У���������Ϊ1980-04-01
update student
set sex='��'��birthday=to_date('1980-04-01','yyyy-MM-dd')
where xh='A001';
--��7��������Ϊ�յ�ѧ���༶�޸�ΪJava3��
insert into class(classid,cname)
values(3,'java3��')
update student
set studentcid=3
where birthday is null;
--��8����ʹ��һ��SQL��䣬ʹ���Ӳ�ѯ�����°༶����ÿ���༶�������ֶ�
update class c
set ccount=(
    select count(1)
    from student
    where studentcid=c.classid);

select classid, cname, ccount from class
select xh, xm, sex, birthday, sal, studentcid from student

CREATE TABLE copy_emp   (
  empno number(4),
  ename varchar2(20),
  hiredate date default sysdate ,
  deptno number(2),
  sal number(7,2))
  


--(1)�ڱ�copy_emp�в������ݣ�Ҫ��sal�ֶβ����ֵ�����ź�50���μӹ���ʱ��Ϊ2000��1��1�գ������ֶ�����
insert into copy_emp(deptno,hiredate)
values(20,to_date('2000-01-01','yyyy-MM-dd'));

--(2)�ڱ�copy_emp�в������ݣ�Ҫ���emp���в��ź�Ϊ10�Ų��ŵ�Ա����Ϣ����
insert into copy_emp(empno,ename,hiredate,sal,deptno)
select empno, ename,hiredate, sal,deptno from emp
where deptno=10;
--(3)�޸�copy_emp�������ݣ�Ҫ��10�Ų�������Ա����20%�Ĺ���
update copy_emp
set sal=sal*1.2
where deptno=10;
--(4)�޸�copy_emp����salΪ�յļ�¼�������޸�Ϊƽ������
update copy_emp
set sal=(
    select avg(sal)
    from copy_emp)
where sal is null;
--(5)�ѹ���Ϊƽ�����ʵ�Ա���������޸�Ϊ��
update copy_emp
set sal = null
where sal =(
    select avg(sal)
    from copy_emp);
--(6)����򿪴���2�鿴�����޸�
--(7)ִ��commit������2���ٴβ鿴������Ϣ
--(8)ɾ������Ϊ�յ�Ա����Ϣ
delete copy_emp
where sal is null;
--(9)ִ��rollback
select empno, ename, hiredate, deptno, sal from copy_emp
