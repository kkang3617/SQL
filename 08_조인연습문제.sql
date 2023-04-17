/*���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)*/
SELECT
    *
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;   --106��

SELECT
    *
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;  --107��

SELECT
    *
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;  --122��

SELECT
    *
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;  --123�� left join �� right join ��� ��ģ��



/*���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�*/
SELECT
    first_name || ' ' || last_name AS name, 
    e.department_id
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE employee_id = 200;



/*���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����Ǿ� �ִ��� Ȯ��*/

SELECT
    e.first_name, j.job_id, j.job_title
FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY first_name ASC;

/*���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.*/
SELECT
    *
FROM jobs js LEFT OUTER JOIN job_history jh
ON js.job_id = jh.job_id;

--���� 5.
--Steven King�� �μ����� ����ϼ���.
SELECT
    d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.first_name = 'Steven' AND e.last_name = 'King';


--���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���

SELECT
    *
FROM employees e
CROSS JOIN departments d;

--���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
--�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)
SELECT--ANSI
    e.employee_id AS �����ȣ, e.first_name AS �̸�, e.salary AS �޿�,
    d.department_name AS �μ���, l.city AS �ٹ���
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id 
AND job_id = 'SA_MAN';

SELECT --����Ŭsql �ۼ�
    e.employee_id AS �����ȣ, e.first_name AS �̸�, e.salary AS �޿�,
    d.department_name AS �μ���, l.city AS �ٹ���
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id 
AND d.location_id = l.location_id 
AND job_id = 'SA_MAN';

--���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title��
--'Stock Manager', 'Stock Clerk'�� ���� ������ ����ϼ���.
SELECT
    *
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
--WHERE j.job_title = 'Stock Manager' OR j.job_title = 'Stock Clerk';
WHERE job_title IN('Stock Manager','Stock Clerk'); 



--���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
SELECT
    d.department_name
FROM departments d LEFT OUTER JOIN employees e
ON d.department_id = e.department_id
WHERE employee_id IS NULL;


--���� 10. 
---join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
--��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
SELECT
    e1.first_name AS ����̸�, e2.first_name AS �Ŵ����̸�
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;



--���� 11. 
--6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���  manager

SELECT
    e1.employee_id, e1.first_name, e1.manager_id,
    e2.first_name, e2.salary  --e2 �Ŵ���
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.manager_id IS NOT NULL
ORDER BY e1.salary DESC;
