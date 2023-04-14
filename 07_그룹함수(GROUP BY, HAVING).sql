
-- �׷� �Լ� AVG, MAX, MIN, SUM, COUNT

SELECT   --GROUP ������ָ� ��ü���̺� �����.
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;

SELECT COUNT(*) FROM employees; -- �� �� ������ ��
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees; --null�� �ƴ� ���� ��
SELECT COUNT(manager_id) FROM employees; --null�� �ƴ� ���� ��

-- �μ����� �׷�ȭ, �׷��Լ��� ���
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

-- ������ �� 
-- �׷� �Լ��� �Ϲ� �÷��� ���ÿ� �׳� ����� ���� ����.
SELECT
    department_id,
    AVG(salary)
FROM employees;  -- ����

-- GROUP BY���� ����� �� GROUP���� ������ ������ �ٸ� �÷��� ��ȸ�� �� ����.
SELECT   -- job_id�� �׷�ȭ���� �ʾҴ�.
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; --����

--GROUP BY�� 2�� �̻� ���
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

-- GROUP BY�� ���� �׷�ȭ�� �� �� ������ �� ��� HAVING�� ���.
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) >100000; --salary�� ���� 100000�Ѵ� �μ� (����)

SELECT 
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5; -- 5���̻��� job_id�� ��ȸ.

-- �μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� ���� ����� 5000 �̻� ��ȸ
SELECT      -- FROM->WHERE->GROUP BY->HAVING->SELECT->ORDER BY �������
    department_id,
    AVG(salary) AS ���
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;

--���� 1.
--��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
--��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���
SELECT
    job_id,
    COUNT(*) AS �����, 
    AVG(salary) AS �������
FROM employees
GROUP BY job_id
ORDER BY ������� DESC; -- �� �̷����� ORDER BY AVG(salary) DESC;
                      -- FROM  GROUP BY SELECT ORDER ���̹Ƿ� ������� ��밡��                                       

--���� 2.
--��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
--(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.
SELECT
    TO_CHAR(hire_date, 'YY') AS �Ի�⵵,
    COUNT(*) AS �����
FROM employees
GROUP BY TO_CHAR(hire_date, 'YY');

--���� 3.
--�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. �� �μ� ��� �޿��� 7000�̻��� �μ��� ���
SELECT
    department_id,
    AVG(salary) AS ��ձ޿�
FROM employees
WHERE salary>=5000
GROUP BY department_id
HAVING AVG(salary) >= 7000;


--���� 4.
--��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
--department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
--���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
--���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���
SELECT
    department_id,
    TRUNC(AVG(salary + (salary*commission_pct)), 2) AS ���������,
    SUM(salary + (salary*commission_pct)) AS �հ�,
    COUNT(*) AS �����
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;

