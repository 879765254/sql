1.�������û�neu
create user neu
identified by 123456;
2.���û�neu��Ȩ,ʹ���ܹ���¼�����ݿ⣬�ܹ���ѯscott�µ�emp�����޸�emp���sal,ename�����ֶ�
grant create session to neu;
grant select on scott.emp to neu;
grant update(sal,ename) on scott.emp to neu;
3.�����û�neu�ĵ�¼Ȩ��
revoke create session from neu;
4.�����û�neu�����ж���Ȩ��
revoke all on scott.emp from neu;
5.������ɫrole_neu
create role role_neu;
6.����ɫrole_neu��Ȩ,ʹ���ܹ���¼�����ݿ�
grant create session to role_neu;
7.����ɫrole_neu���û�neu
grant role_neu to neu;
8.ɾ����ɫrole_neu
drop role role_neu;
9.ɾ���û�neu
drop user neu;
