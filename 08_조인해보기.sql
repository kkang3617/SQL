
/*
# �����̶�?
- ���� �ٸ� ���̺��� ������ ���谡 �����Ͽ�
1�� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���� ����Ѵ�.

SELECT �÷�����Ʈ FROM ���� ����� �Ǵ� ���̺� (1�� �̻�)
WHERE ���� ���� -> ����Ŭ ����
*/

-- employees ���̺� �μ� id �� ��ġ�ϴ� department ���̺��� �μ� id�� ã�Ƽ�
-- SELECT ���Ͽ� �ִ� �÷����� ����ϴ� ������.
SELECT
    first_name, last_name, hire_date,
    salary, job_id, e.department_id, department_name  --department_id�� �����÷�
FROM employees e, departments d  --��Ī ���� �� AS ��������
WHERE e.department_id = d.department_id; -- ����Ŭ ����

SELECT
    e.first_name, e.last_name, e.hire_date,
    e.salary, e.job_id, e.department_id, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id; --ANSI ǥ�� ���� ����

/*
������ ���̺� ���������� �����ϴ� �÷��� ��쿡��
���̺� �̸��� �����ص� �����ϴ�. �׷���, �ؼ��� ��Ȯ���� ����
���̺� �̸��� �ۼ��ؼ� �Ҽ��� ǥ���� �ִ� ���� �ٶ����ϴ�.
���̺� �̸��� �ʹ� �� �ÿ��� ALIAS�� �ۼ��Ͽ� Ī�Ѵ�.
�� ���̺� ��� ������ �ִ� �÷��� ��� �ݵ�� ����� �־�� �Ѵ�.
*/

-- 3���� ���̺��� �̿��� ���� ���� (INNER JOIN)
-- ���� ����: �� ���̺� ��ο��� ��ġ�ϴ� ���� ���� �ุ ��ȯ.
SELECT
    e.first_name, e.last_name, e.department_id,
    d.department_name,
    j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

SELECT
    e.first_name, e.last_name,
    d.department_id, d.department_name,
    j.job_title,
    loc.city
FROM
    employees e,
    departments d,
    jobs j,
    locations loc
WHERE
    e.department_id = d.department_id
AND
    e.job_id = j.job_id -- 3, 4
AND
    d.location_id = loc.location_id -- 2
AND
    loc.state_province = 'California';  --1

/*
1. loc���̺��� province = 'California' ���ǿ� �´� ���� �������
2. location_id ���� ���� ���� ������ �����͸�
   departments���� ã�Ƽ� ����
3. ���� ����� ������ department_id�� ����
   employees ���̺��� �����͸� ã�Ƽ� ����
4. ���� ����� jobs ���̺��� ���Ͽ� �����ϰ� ��������� ���.
*/

-- �ܺ� ����
/*
��ȣ ���̺��� ��ġ�Ǵ� ������ ����Ǵ� ���� ���ΰ��� �ٸ���
��� �� ���̺� ���� ���� ������� �ش� row���� ��ȸ �����
��� ���ԵǴ� ������ ���Ѵ�.
*/
SELECT
    e.first_name, e.last_name, e.hire_date,
    e.salary, e.job_id, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);
/*
employees ���̺��� �����ϰ�, departments ���̺��� �������� �ʾƵ�
(+)�� ���� ���� ���̺��� �������� �Ͽ� departments ���̺��� ���ο�
�����϶�� �ǹ̸� �ο��ϱ� ���� ��ȣ�� ���δ�.
*/
SELECT
    e.first_name, e.last_name, e.hire_date,
    e.salary, e.job_id, e.department_id, d.department_name
FROM employees e, departments d, locations loc
WHERE e.department_id = d.department_id(+)
AND d.location_id = loc.location_id;
/*�ܺ������� ����ߴ���, ���Ŀ� ���� ������ ����ϸ�
���������� �켱������ �ν��Ѵ�.
*/

/*
-- �ܺ� ���� ���� �� ��� ���ǿ� (+)�� �ٿ��� �ܺ� ������ �����ȴ�.
-- �Ϲ� ���ǿ��� (+)�� ������ ������ �ܺ� ������ Ǯ���� ������ �߻�.(�����ʹ���)
*/
SELECT 
    e.employee_id, e.first_name,
    e.department_id,
    j.start_date, j.end_date, j.job_id
FROM employees e, job_history j --e�� ���� �����͸� j���� �߰���. (�ƿ�������)
WHERE e.employee_id = j.employee_id(+)
AND j.department_id(+) = 80;



