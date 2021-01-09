1.简述5种约束的含义。
检查性约束，非空，唯一，主键，外键。
2.创建学生关系sc，包括属性名：
选课流水号 数值型 主键；
学生编号 非空 外键
课程编号 非空 外键；
成绩     0-100之间；
create table sc(
       id number constraint sc_id_pk primary key,
       sno number constraint sc_sno_nn not null,
       cno number constraint sc_cno_nn not null,
       score number constraint sc_score_ck check(score between 0 and 100),
       constraint sc_sno_fk foreign key(sno) references student(sno),
       constraint sc_cno_fk foreign key(cno) references course(cno)
);
3.创建copy_emp，要求格式同emp表完全一样，不包含数据。
create table copy_emp as select * from emp where 1=0;
4.创建copy_dept，要求格式同dept表完全一样，不包含数据。
create table copy_dept as select * from dept where 1=0;
5.设置copy_emp 表中外键deptno，参照copy_dept中deptno,语句能否成功,为什么？
能成功，copy_emp中的deptno是外键参考copy_dept中的deptno是主键。
6.追加copy_dept表中主键deptno
alter table copy_dept modify(constraint cd_deptno_pk primary key(deptno));
create table course(
       cno number constraint course_cno_pk primary key,
       cname varchar2(20)
);
create table student(
       sno number constraint student_sno_pk primary key,
       sname varchar2(20)
);
1.学校有一个选课系统，其中包括如下关系模式：
系(系编号： 主键，
   系名称:  唯一键，
   系主任： 非空约束，
   系所在校去：取值范围只能在南湖校区和浑南校区)
班级(班级编号： 主键，
     班级名称： 唯一键，
     所属系：  外键)
2.创建学生表，包含如下属性:
学号 定长字符型 10位 主键
姓名 变长字符型 20位 非空
性别 定长字符型 2位 取值范围只能为男或女
出生日期 日期型 
