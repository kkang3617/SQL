
-- insert 
-- ���̺� ���� Ȯ��
DESC departments;

-- INSERT�� ù��° ��� (��� �÷� �����͸� �� ���� ����)
INSERT INTO departments
VALUES(290, '������', 100, 1700); 
                                  
INSERT INTO departments  --VALUES �̿��ؼ� ���� ���� ����
VALUES(290, '������');   --����  ��� �÷��� ���� �������� �Է����־�� �Ѵ�.


SELECT * FROM departments;
ROLLBACK; -- ���� ������ �ٽ� �ڷ� ������ Ű����

-- INSERT�� �� ��° ��� (���� �÷��� �����ϰ� ����, NOT NULL Ȯ���ϼ���!)
INSERT INTO departments
    (department_id, department_name, location_id)
VALUES
    (280, '������', 1700);
    
-- �纻 ���̺� ����
-- �纻 ���̺��� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� false�� (1 = 2) �����ϸ� -> ���̺��� ������ �����ϰ� �����ʹ� ����x
CREATE TABLE managers AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2);

SELECT * FROM managers;
DROP TABLE managers;   --DROP ���̺� ���ﶧ ����ϴ� Ű����

-- INSERT (��������)
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);

---------------------------------------------------------------------------------

-- UPDATE
CREATE TABLE emps AS (SELECT * FROM employees);
SELECT * FROM emps;

/*
CTAS�� ����ϸ� ���� ������ NOT NULL ����� ������� �ʴ´�.
���������� ���� ��Ģ�� ��Ű�� �����͸� �����ϰ�, �׷��� ���� �͵���
DB�� ����Ǵ� ���� �����ϴ� �������� ����Ѵ�.
*/


-- UPDATE�� ������ ���� ������ ������ �� �� �����ؾ� �Ѵ�.
-- �׷��� ������ ���� ����� ���̺� ��ü�� ����ȴ�.
UPDATE emps SET salary = 30000; --WHERE ���� ���������� ������ ��簪�� 
                                --30000���� ����ȴ�.
SELECT * FROM emps;
ROLLBACK;

UPDATE emps SET salary = 30000
WHERE employee_id = 100;

UPDATE emps SET salary = salary + salary * 0.1
WHERE employee_id = 100;


UPDATE emps SET 
phone_number = '010.1234.1234' , manager_id = 102
WHERE employee_id = 100;


-- UPDATE (��������)
UPDATE emps
    SET (job_id, salary, manager_id) =
    (SELECT job_id, salary, manager_id  --����� 100���� ��� ���� ��ȸ�ؼ�
    FROM emps                           
    WHERE employee_id = 100
    )
WHERE employee_id = 101; -- ����� 101���� ������� ����


-- DELETE
DELETE FROM emps   -- DELETE * FROM ~~~ ���� ���� �Ǽ��� ������!! * ��������!
WHERE employee_id = 103;

SELECT * FROM emps
WHERE employee_id = 103; -- �����ؼ� ��ȸ����� ����.


-- �纻���̺� ����
CREATE TABLE depts AS (SELECT * FROM departments);
SELECT * FROM depts;


-- DELETE (��������)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM depts
                        WHERE department_name = 'IT');





