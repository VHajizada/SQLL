-- Task 1 :
CREATE TABLE layiheler (
    layihe_id   NUMBER(4) PRIMARY KEY,
    layihe_kodu CHAR(6),
    layihe_adi  VARCHAR2(50),
    budce       NUMBER(8, 2)
);
-- Task 2;
INSERT INTO layiheler (layihe_id, layihe_kodu, layihe_adi, budce)
VALUES (1, 'PRJ001', 'Yeni Layihə', 123456.789);

-- Task 3:
CREATE TABLE sobeler (
    sobe_id   number(5, 2) PRIMARY KEY,
    sobe_adi  char(30)
);

CREATE TABLE isciler (
    isci_id  NUMBER PRIMARY KEY,  -- 1) 
    ad       VARCHAR2(30),
    sobe_id  NUMBER
);


INSERT INTO sobeler VALUES (10, 'IT');
INSERT INTO sobeler VALUES (20, 'HR');
INSERT INTO sobeler VALUES (30, 'Finance');

INSERT INTO isciler VALUES (1, 'Aysel', 10);
INSERT INTO isciler VALUES (2, 'Murad', 20);
INSERT INTO isciler VALUES (3, 'Nigar', 20);
INSERT INTO isciler VALUES (4, 'Leyla', NULL);  
COMMIT;

SELECT * FROM SOBELER;

select SOBE_ADI, length(SOBE_ADI) as simvol_uzunlugu,
vsize(SOBE_ADI) as tutdugu_yer
from sobeler;

-- Task 4:
select 
ad from isciler
where sobe_id is Null;

-- Task 5:
SELECT s.sobe_adi
FROM sobeler s
WHERE EXISTS (
    SELECT 1
    FROM isciler i
    WHERE i.sobe_id = s.sobe_id
);
-- Task 6:
SELECT s.sobe_adi
FROM sobeler s
WHERE s.sobe_id NOT IN (
    SELECT i.sobe_id
    FROM isciler i
    where i.sobe_id is not null
);

Select s.sobe_adi 
from sobeler s
where not exists (select  1 from isciler i
where i.sobe_id=s.sobe_id);

-- Task 7:
Select department_name from hr.DEPARTMENTS d
where not exists ( select 1 from hr.EMPLOYEES e
where d.department_id=e.department_id);

-- Task 8:
Select e.first_name, e.last_name from hr.employees e
where exists ( select 1 from hr.employees m
where m.manager_id=e.employee_id);

-- Task 9:
SELECT TO_DATE('2024/12/25 14:30:00', 'YYYY/MM/DD HH24:MI:SS') AS tarix
FROM DUAL;

-- Task 10:
SELECT TO_DATE('2025-Nov-09 09:15 PM', 'YYYY-MON-DD HH:MI PM') AS tarix
FROM DUAL;

-- Task 11:
SELECT 
    first_name,
    last_name,
    salary,
    hire_date
FROM hr.employees
WHERE hire_date > DATE '2007-01-01'
  AND salary > 8000
ORDER BY hire_date DESC;

-- Task 12:
SELECT 
    first_name,
    last_name,
    hire_date
FROM hr.employees
WHERE hire_date BETWEEN DATE '2005-01-01' AND DATE '2005-12-31';

-- Task 13:
Select to_char(hire_date, 'DD.MM.YYYY') AS yenilenmis_tarix
from hr.EMPLOYEES
Fetch first 10 rows only;

-- Task 14:
SELECT 
    first_name,
    last_name,
    hire_date,
    ADD_MONTHS(hire_date, 3) AS son_sinaq_tarixi
FROM hr.employees;

-- Task 15;
SELECT 
    first_name,
    last_name,
    hire_date
FROM hr.employees
WHERE EXTRACT(MONTH FROM hire_date) = 5;
