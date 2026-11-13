-- Task 1:
select first_name,
    last_name,
    hire_date,
    case when extract(year from hire_date)<2003 then 'Veteran'
    when extract(year from hire_date) between 2003 and 2006 then 'Tecrubeli'
    else 'Yeni'
    end as "Staj_Qrupu"
    from hr.employees;

-- Task 2:
select department_id, department_name, 
case Department_name 
when 'Administration' then 'Idareetme'
when 'Marketing' then 'Marketinq'
when 'Purchasing' then 'Satinalma'
when 'Human Resources' then 'Insan Resurslari'
else 'Diger sobe'
end as "Sobe_Az"
from hr.departments;

-- Task 3:
Select first_name, department_id,
case when department_id is Null then 'Sobe teyin olunmayib'
else 'Sobe var'
end as "Sobe statusu"
from hr.employees;

Select first_name, department_id,
nvl2(department_id,'Sobe var','Sobe teyin olunmayib') as "Sobe statusu"
from hr.employees;

-- Task 4: 
select JOb_id,job_title,
case when job_id in ('AD_PRES','FI_MGR','AD_VP','AC_MGR') then 'Ali Rehberlik'
when job_id in ('IT_PROG','SA_REP','FI_ACCOUNT') then 'Esas mutexessis'
when job_id in ('ST_CLERK','SH_CLERK','PU_CLERK') then 'Operativ isci'
else 'Diger'
end as "Kateqoriya"
from hr.jobs;

-- Task 5:
select first_name, department_id, salary,
case when department_Id= 50 THEN Salary*0.08
when department_id=30 then salary*0.12
when department_id=100 then 400
else salary*0.04
end as "Muavinet"
from hr.employees;

-- Task 6:
SELECT FIRST_NAME, COMMISSION_PCT,
       CASE 
           WHEN COMMISSION_PCT IS NULL THEN 'Yoxdur'
           WHEN COMMISSION_PCT > 0.25 THEN 'Yuksek komissiya'
           WHEN COMMISSION_PCT > 0.10 THEN 'Normal komissiya'
           ELSE 'Diger'
       END AS "Komissiya novu"
FROM HR.EMPLOYEES;

-- Task 7:
Select first_name,phone_number,salary,
case when phone_number like '1.515%'then 'Daxili xett'
when salary>=10000 then 'Yuksek maasli'
when commission_pct is not null then 'Satis komandasi'
else 'Standart isci'
end as "Kateqoriya"
from hr.employees;

-- Task 8:
Select first_name,salary, commission_pct,
nvl(commission_pct,0)*salary*3 as rubluk_bonus,
nvl(commission_pct,0)*salary*3+3*salary as rubluk_umumi
from hr.employees
order by rubluk_umumi asc;

-- Task 9:
Select e.first_name, j.job_title,e.salary,j.min_salary, j.max_salary,
case when e.salary =j.max_salary then 'Limite catib'
when j.max_salary -e.salary<=2000 then 'Limite cox yaxin'
when e.salary< j.min_salary+1000 then 'Baslangic seviyede'
else 'Orta araligda' 
end as "Maas_veziyyeti"
from hr.employees e
left join hr.jobs j
on e.job_id=j.job_id;


-- Task 10:
select e.first_name, e.last_name,
nvl2(d.manager_id,'Rehberi var','Rehbersiz sobe') as "Menecer status",
case when l.country_id is null then 'Teyin edilmeyib'
when l.country_id in ('US') then 'ABS ofisi'
else 'Beynelxalq ofis' 
end as "Region"
from hr.EMPLOYEES e
left join hr.departments d
on e.department_id=d.department_id
left join hr.locations l
on d.location_id=l.location_id;
