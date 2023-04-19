
/*
- NUMBER(2) -> ������ 2�ڸ����� ������ �� �ִ� ������ Ÿ��.
- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�.
    ex) 3.1415 -> 3.14
        31.415 -> 31.42
        314.1514 -> 314.15
- NUMBER -> ��ȣ�� ������ �� (38, 0)���� �ڵ� �����ȴ�.
- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����. (4000byte����)
- CLOB -> ��뷮 �ؽ�Ʈ ������ Ÿ�� (�ִ� 4Gbyte)
- BLOB -> ������ ��뷮 ��ü (�̹���, ���� ���� �� ���)
- DATE -> BC 4712�� 1�� 1�� ~ AD9999�� 12�� 31�ϱ��� ���� ����
- ��, ��, �� ��������.
*/
CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonuse NUMBER(10)
);


DESC dept2;
SELECT * FROM dept2;

--NUMBER�� VARCHAR2 Ÿ���� ���̸� Ȯ��
INSERT INTO dept2
VALUES(40, '������', '����', sysdate, 2000000);
INSERT INTO dept2
VALUES(400, '�濵����', '����', sysdate, 2000000); --���� NUMBER(2)
INSERT INTO dept2
VALUES(30, '������', '����', sysdate, 20000000000); --���� NUMBER(10)
INSERT INTO dept2
VALUES(30, '�������ΰŰ����鼭�λ絵�ϰ��ѹ����ϴºμ�', '����', sysdate, 20000000000);
                                                    --���� VARCHAR2(14) 
                                                    
-- �÷� �߰�
ALTER TABLE dept2
ADD (dept_count NUMBER(3));

SELECT * FROM dept2;

-- �� �̸� ����
ALTER TABLE dept2
RENAME COLUMN dept_count to emp_count;

-- �� �Ӽ� ����
-- ���� �����ϰ��� �ϴ� �÷��� �����Ͱ� �̹� �����Ѵٸ� �׿� �´� Ÿ������
-- �����ؾ� �Ѵ�. ���� �ʴ� Ÿ�����δ� ������ �Ұ����ϴ�.
ALTER TABLE dept2
MODIFY (emp_count NUMBER(4));
ALTER TABLE dept2
MODIFY (dept_name VARCHAR2(20)); 
ALTER TABLE dept2
MODIFY (dept_name NUMBER(20));  -- ����

DESC DEPT2;

-- �� ����
ALTER TABLE dept2
DROP COLUMN emp_count;

SELECT * FROM dept2;

-- ���̺� �̸� ����
ALTER TABLE dept2
RENAME TO dept3;

SELECT * FROM dept2; --����
SELECT * FROM dept3;

-- ���̺� ���� (������ ���ܵΰ� ���� �����͸� ��� ����)
TRUNCATE TABLE dept3;

SELECT * FROM dept3;

DROP TABLE dept3; -- ���̺� ����

ROLLBACK;


