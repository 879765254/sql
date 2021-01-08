CREATE TABLE emp_jobhistory(
    id NUMBER,--流水号
    empno NUMBER,--员工编号
    job VARCHAR2(9),--岗位
    begindate DATE,--开始日期
    sal Number(7,2)--在该岗位时工资
)
INSERT INTO emp_jobhistory VALUES(1,7839,'TRAINEE','17-11月-81',500);
INSERT INTO emp_jobhistory VALUES(2,7839,'SALESMAN','17-2月-82',1800);
INSERT INTO emp_jobhistory VALUES(3,7839,'CLERK','17-2月-83',2000);
INSERT INTO emp_jobhistory VALUES(4,7839,'SALESMAN','17-2月-85',1800);
INSERT INTO emp_jobhistory VALUES(5,7839, 'MANAGER','17-2月-87',3000);
