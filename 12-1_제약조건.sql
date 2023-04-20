
-- ���̺� ������ ��������
-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű)
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����)
-- NOT NULL: null�� ������� ����.
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.

DROP TABLE dept2;

CREATE TABLE dept2 (
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 0),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);

-- ���̺� ���� ���� ����(��� �� ���� �� ���������� ���ϴ� ���)
CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1), -- �޸� ��������
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no),
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 0),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);


-- �ܷ� Ű(foreign key)�� �θ����̺�(�������̺�)�� ���ٸ� INSERT�� �Ұ���
INSERT INTO dept2
VALUES(10, 'gg', 4000, 1000000, 'M'); -- ���� locations  locationb_id�� ����


-- �ֿ� Ű(primary key) �� ������ �ĺ��ڿ��� �Ѵ�.
INSERT INTO dept2
VALUES(10, 'hh', 1900, 1000000, 'M'); -- ���� primary key 10 �Ǹ� �ȵ�

INSERT INTO dept2
VALUES(20, 'hh', 1900, 1000000, 'M'); 

UPDATE dept2
SET loca = 4000
WHERE dept_no = 10; --����(�ܷ�Ű  �������� ����)

UPDATE dept2
SET loca = 4000
WHERE loca = 1800; --����(�ܷ�Ű  �������� ����)

-- ���� ���� ����
-- ���� ������ �߰�, ������ �����ϴ�. ������ �ȵ�!
-- �����Ϸ��� �����ϰ� ���ο� �������� �߰��ؾ� �Ѵ�.

DROP TABLE dept2;


CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);

-- pk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);
-- fk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_loca_locid_fk
FOREIGN KEY(loca) REFERENCES locations(location_id);
-- check �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'));
-- unique �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptname_uk UNIQUE(dept_name);
-- NOT NULL�� �� �������·� �����Ѵ�.
ALTER TABLE dept2 MODIFY dept_bonus NUMBER(10) NOT NULL;

-- ���� ���� ���� (���� ���� �̸�����)
ALTER TABLE dept2 DROP CONSTRAINT dept_no_pk;

-- ���� ���� Ȯ��
SELECT * FROM user_constraints
WHERE table_name = 'DEPT2'; --'dept2'; �ȵ�


--����1.
CREATE TABLE members(
    m_name VARCHAR2(20) NOT NULL,  --VARCHAR2�� �⺻���� �����Ƿ� ���� �����ؾ���.
    m_num NUMBER CONSTRAINT mem_memnum_pk PRIMARY KEY,
    reg_date DATE NOT NULL CONSTRAINT mem_regdate_uk UNIQUE,
    gender VARCHAR2(20), --VARCHAR(1)
    loca NUMBER CONSTRAINT mem_loca_loc_locid_fk REFERENCES locations(location_id)  
    
    --2��° ���
    --CONSTRAINT mem_loca_loc_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id);  
);

--3��° ���
--ALTER TABLE members ADD CONSTRAINT 
--mem_loca_loc_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id);  

INSERT INTO members
VALUES ( 'AAA', 1, '2018/07/01', 'M', 1800);
INSERT INTO members
VALUES ( 'BBB', 2, '2018/07/02', 'F', 1900);
INSERT INTO members
VALUES ( 'CCC', 3, '2018/07/03', 'M', 2000);
INSERT INTO members
VALUES ( 'DDD', 4, sysdate, 'M', 2000);

SELECT * FROM members;

COMMIT;

--����2.
SELECT 
    m.m_name, m.m_num, l.street_address, l.location_id
FROM members m
JOIN locations l
ON m.loca = l.location_id
ORDER BY m_num ASC;

