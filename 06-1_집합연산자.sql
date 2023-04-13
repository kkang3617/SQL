
-- ���� ������
-- UNION(������ �ߺ� x), UNION ALL(������ �ߺ� o), INTERSECT(������), MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �Ѵ�.

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION --������ �ߺ����x 201Michael �ߺ��̾ �ϳ��� ������
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL--������ �ߺ���뤷
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT --������
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS --������ ()��-�Ʒ� �������� 201����Ŭ�� ����
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS --������  �������� 201����Ŭ�� ����
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';