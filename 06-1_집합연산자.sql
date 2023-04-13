
-- 집합 연산자
-- UNION(합집합 중복 x), UNION ALL(합집합 중복 o), INTERSECT(교집합), MINUS(차집합)
-- 위 아래 column 개수와 데이터 타입이 정확히 일치해야 한다.

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION --합집합 중복허용x 201Michael 중복이어서 하나만 가져옴
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL--합집합 중복허용ㅇ
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT --교집합
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS --차집합 ()위-아래 교집합인 201마이클만 제외
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;

SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS --차집합  교집합인 201마이클만 제외
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';