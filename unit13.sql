1.����5��Լ���ĺ��塣
�����Լ�����ǿգ�Ψһ�������������
2.����ѧ����ϵsc��������������
ѡ����ˮ�� ��ֵ�� ������
ѧ����� �ǿ� ���
�γ̱�� �ǿ� �����
�ɼ�     0-100֮�䣻
create table sc(
       id number constraint sc_id_pk primary key,
       sno number constraint sc_sno_nn not null,
       cno number constraint sc_cno_nn not null,
       score number constraint sc_score_ck check(score between 0 and 100),
       constraint sc_sno_fk foreign key(sno) references student(sno),
       constraint sc_cno_fk foreign key(cno) references course(cno)
);
3.����copy_emp��Ҫ���ʽͬemp����ȫһ�������������ݡ�
create table copy_emp as select * from emp where 1=0;
4.����copy_dept��Ҫ���ʽͬdept����ȫһ�������������ݡ�
create table copy_dept as select * from dept where 1=0;
5.����copy_emp �������deptno������copy_dept��deptno,����ܷ�ɹ�,Ϊʲô��
�ܳɹ���copy_emp�е�deptno������ο�copy_dept�е�deptno��������
6.׷��copy_dept��������deptno
alter table copy_dept modify(constraint cd_deptno_pk primary key(deptno));
create table course(
       cno number constraint course_cno_pk primary key,
       cname varchar2(20)
);
create table student(
       sno number constraint student_sno_pk primary key,
       sname varchar2(20)
);
1.ѧУ��һ��ѡ��ϵͳ�����а������¹�ϵģʽ��
ϵ(ϵ��ţ� ������
   ϵ����:  Ψһ����
   ϵ���Σ� �ǿ�Լ����
   ϵ����Уȥ��ȡֵ��Χֻ�����Ϻ�У���ͻ���У��)
�༶(�༶��ţ� ������
     �༶���ƣ� Ψһ����
     ����ϵ��  ���)
2.����ѧ����������������:
ѧ�� �����ַ��� 10λ ����
���� �䳤�ַ��� 20λ �ǿ�
�Ա� �����ַ��� 2λ ȡֵ��Χֻ��Ϊ�л�Ů
�������� ������ 
