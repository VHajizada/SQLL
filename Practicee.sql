-- Task 1:
SELECT 
    first_name, 
    last_name, 
    salary, 
    NVL(commission_pct, 0) AS duzeldilmis_komissiya
FROM hr.employees;
-- Task 2:
SELECT 
    first_name, 
    last_name, 
    salary
FROM hr.employees
WHERE UPPER(last_name) = 'KING';
-- Task 3:
select 
first_name,
last_name,
hire_date
from hr.EMPLOYEES
where hire_date> date '2006-01-01';
-- Task 4:
SELECT 
    first_name, 
    last_name, 
    ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS staz_ay
FROM hr.employees;
-- Task 5:
SELECT 
    first_name, 
    last_name, 
    phone_number
FROM hr.employees
WHERE phone_number LIKE '1.515%';
-- Task 6:
SELECT 
    job_title, 
    min_salary
FROM hr.jobs
WHERE min_salary < 3000
ORDER BY min_salary DESC;
-- Task 7:
SELECT 
    city, 
    street_address
FROM hr.locations
WHERE postal_code IS NULL;
-- Task 8:
SELECT 
    first_name, 
    last_name, 
    salary || ' USD' AS maas_valuta
FROM hr.employees;
-- Task 9:
SELECT 
    COUNT(*) AS umumi_say
FROM hr.jobs
WHERE max_salary > 20000;
--Task 10:
--First alternative:
Select first_name,
hire_date
from hr.EMPLOYEES
where hire_date>= Date '2005-01-01'
and hire_date < date '2006-01-01';
-- Second alternative:
SELECT 
    first_name, 
    hire_date
FROM hr.employees
WHERE EXTRACT(YEAR FROM hire_date) = 2005;
--Task 11:
Select first_name,
salary,
Salary*0.8 as Net_Maas
from hr.EMPLOYEES
where Department_id=80;
-- Task 12:
Select First_name,
hire_date,
Job_id
from hr.employees
where hire_date>= date  '2003-01-01' and hire_date< date '2026-01-01'
and Job_id <> 'IT_PROG';
-- Task 13:
Select count(*) as Isci_sayi,
round(avg(salary)) as orta_maas
from hr.employees
where commission_pct is null
-- Task 14:
Select first_name,
salary
from hr.EMPLOYEES
where Manager_id is not null and department_id is not NULL
order by salary desc
fetch first 3 rows only;
-- Task 15:
select First_name,
Last_name, 
extract(Day from hire_date) As ise_giren_gun   
from hr.EMPLOYEES
where extract ( Day from hire_date)>15 and Salary between 5000 and 12000;
-- Task 16:
  Select First_name,
Last_name,
job_id
from hr.EMPLOYEES
where lower(first_name)='david';
-- Task 17:
Select 
first_name,
last_name,
hire_date
from  hr.EMPLOYEES
where hire_date< date '2007-12-31';
-- Task 18:
select city, 
postal_code 
from hr.locations
where postal_code like '9%';
-- Task 19:
Select Job_title,
max_salary
from hr.jobs 
where max_salary>10000 
order by max_salary asc;
-- Task 20:
Select first_name, 
department_id || ' DEPT' As Sobe_kodu
from hr.employees;
-- Task 21:
Select count(*)
from hr.employees
where job_id='ST_CLERK';
-- Task 22:
Select first_name,
hire_date
from hr.employees
where extract(year from hire_date)=2008 and extract(month from hire_date)=01;
-- Task 23:
Select first_name,
last_name,
commission_pct
from hr.EMPLOYEES
where  commission_pct>=0.15;
-- Task 24:
select job_title 
from hr.JOBS
order by max_salary ASC
fetch first 3 rows only;
-- Task 25:
Select first_name,
salary,
salary*1.1+nvl(commission_pct,0)  As bonus
from hr.EMPLOYEES
where department_id=80;
-- Task 26:
Select first_name,
last_name,
hire_date
from hr.EMPLOYEES
where extract(year from hire_date)>2004 and extract(month from hire_date)=06;
-- Task 27:
Select round(min(salary)),
round(max(salary)),
round(avg(salary))
from hr.employees
where department_id=50;
-- Task 28:
SELECT 
    first_name,
    last_name,
    ROUND(salary * 12, 2) AS illik_bruto,
    ROUND((salary * 12) * 0.15, 2) AS illik_vergi,
    ROUND((salary * 12) * 0.85, 2) AS illik_net
FROM hr.employees;

