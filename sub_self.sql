-- Task 1:
select e.first_name,e.job_id, d.first_name , d.job_id 
from hr.employees e
join hr.employees d
on d.employee_id=e.manager_id;

-- Task 2:
SELECT e.first_name AS isci_adi, 
       e.last_name AS isci_soyadi, 
       NVL(m.first_name, 'Yoxdur') AS menecer_adi, 
       NVL(m.last_name, 'Yoxdur') AS menecer_soyadi
FROM hr.employees e
LEFT JOIN hr.employees m 
  ON e.manager_id = m.employee_id;

-- Task 3:
SELECT department_id, department_name, location_id 
FROM hr.departments
WHERE location_id IN (SELECT location_id 
                      FROM hr.locations 
                      WHERE country_id = 'UK');
                      
-- Task 4:
Select e.first_name, e.last_name, e.salary
from hr.EMPLOYEES e
join hr.employees d
on e.manager_id=d.employee_id 
where d.first_name='Neena' and d.last_name= 'Kochhar';

-- Task 5:  
Select e.first_name, e.last_name, e.hire_date as isci_tarix, 
m.first_name as menecer_adi, m.hire_date as menecer_tarix
from hr.employees e
join hr.employees m
on e.manager_id=m.employee_id
where e.hire_date<m.hire_date;

-- Task 6:
Select e.first_name, e.last_name, e.job_id, m.first_name as menecer_adi 
, m.last_name as menecer_soyadi 
from hr.EMPLOYEES e
join hr.employees m
on e.manager_id=m.employee_id
where e.job_id=m.job_id;

-- Task 7:
Select first_name, last_name, job_id, salary 
from hr.employees 
where job_id in (select job_id from hr.jobs where max_salary>15000);

-- Task 8:
SELECT FIRST_NAME, SALARY
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM HR.DEPARTMENTS
    WHERE DEPARTMENT_NAME IN ('IT', 'Finance')
);

-- Task 9:
select employee_id, first_name,last_name 
from hr.employees
where employee_id not in (select manager_id from hr.EMPLOYEES
where manager_id is not null );

-- Task 10:
Select m.first_name as menecer_adi, m.last_name as menecer_soyadi,
max(e.salary) as max_tabe_maasi, min(e.salary) as min_tabe_maasi 
from hr.employees e
join hr.employees m
on m.employee_id=e.manager_id
group by m.employee_id, m.first_name, m.last_name 
having avg(e.salary)>7000 
order by max(e.salary) desc;
