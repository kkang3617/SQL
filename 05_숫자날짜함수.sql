
-- �����Լ�                       00.0000
-- ROUND(�ݿø�)                -10 1234
-- ���ϴ� �ݿø� ��ġ�� �Ű������� ����. ������ �ִ� �͵� ����
SELECT
    ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1) --5�����ݿø�
FROM dual;

-- TRUNC(����)
-- ������ �Ҽ��� �ڸ������� �߶󳽴�.  
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS (���밪)
SELECT ABS(-34) FROM dual;

-- CEIL(�ø�), FLOOR(����)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(������)
SELECT 10 / 4, MOD(10, 4)
FROM dual;

-- ��¥ �Լ�
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual;

-- ��¥�� ������ �����ϴ�.
SELECT sysdate + 1 FROM dual; --���ڰ� �ö�.

SELECT first_name, sysdate - hire_date
FROM employees; -- �ϼ�

SELECT first_name, hire_date,
(sysdate - hire_date) / 7 AS week
FROM employees; -- �ּ�

SELECT first_name, hire_date,
(sysdate - hire_date) / 365 AS year
FROM employees; -- ���

--��¥ �ݿø�, ����
SELECT ROUND(sysdate) FROM dual; --������ �������� �ݿø�.
SELECT ROUND(sysdate, 'year') FROM dual; --��(6�� ��) �������� �ݿø�.
SELECT ROUND(sysdate, 'month') FROM dual; --�� �������� �ݿø�.
SELECT ROUND(sysdate, 'day') FROM dual; --�� �������� �ݿø�. (�ش� ���� �Ͽ��� ��¥ �޷»� ����)

SELECT TRUNC(sysdate) FROM dual; --������ �������� �ݿø�.
SELECT TRUNC(sysdate, 'year') FROM dual; --��(6�� ��) �������� �ݿø�.
SELECT TRUNC(sysdate, 'month') FROM dual; --�� �������� �ݿø�.
SELECT TRUNC(sysdate, 'day') FROM dual; --�� �������� �ݿø�. (�ش� ���� �Ͽ��� ��¥ �޷»� ����)
