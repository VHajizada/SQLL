-- SUBQUERIES
SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS 
WHERE DEPARTMENT_NAME IN ('IT', 'Sales');

SELECT FIRST_NAME,DEPARTMENT_ID FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (20,60);

SELECT FIRST_NAME,DEPARTMENT_ID FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM HR.DEPARTMENTS 
WHERE DEPARTMENT_NAME IN ('IT', 'Sales'));

SELECT AVG(SALARY), DEPARTMENT_ID
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;

select first_name, department_id, salary
from hr.employees
where salary > (select avg(salary) from hr.employees E 
                WHERE E.DEPARTMENT_ID=DEPARTMENT_ID)


-- Task 1:
Select department_id, max(salary) as Maks_maas 
from hr.employees
where department_id is not null
group by DEPARTMENT_ID
order by Maks_maas desc;

-- Task 2:
select location_id, count(*) as SOBE_SAYI
from hr.DEPARTMENTS
group by location_id 
order by sobe_sayi desc;

-- Task 3:
select e.first_name, e.last_name, d.department_name 
from hr.EMPLOYEES e
left join hr.departments d
on e.department_id=d.department_id;

-- Task 4:
Select job_id, sum(salary) as UMUMI_MAAS
From hr.employees
group by job_id 
having sum(salary)>30000;

-- Task 5:
Select department_id, min(salary) AS MIN_MAAS
from hr.employees
where department_id is not null
group by department_id 
having min(salary)>4000
order by min_MAAS asc;

-- Task 6:
Select J.job_title, round(sum(E.salary)/count(*)) as ORTA_MAAS
FROM HR.JOBS J
JOIN HR.EMPLOYEES E
ON J.JOB_ID=E.job_id
group by job_title 
having round(sum(e.salary)/count(*)) between 6000 and 12000;

-- Task 7:
SELECT j.job_title
FROM hr.jobs j
LEFT JOIN hr.employees e ON j.job_id = e.job_id
WHERE e.job_id IS NULL;

-- Task 8:


-- Task 9:
select department_id,manager_id,count(*) AS ISCI_SAYI
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL AND MANAGER_ID IS NOT NULL
GROUP BY DEPARTMENT_ID, MANAGER_ID;

-- Task 10:
Select l.city, sum(e.salary) as Umumi_maas 
from hr.employees e
left join hr.departments d
on e.department_id=d.department_id
left join hr.locations l
on l.location_id=d.location_id
group by l.city 
having Sum(e.salary)>20000
order by umumi_maas desc;
