DROP SCHEMA company_constraints;
CREATE SCHEMA IF NOT EXISTS company_constraints;
USE company_constraints;

CREATE TABLE employee(
Fname VARCHAR(15) NOT NULL,
Minit CHAR,
Lname VARCHAR(15) NOT NULL,
Ssn CHAR(9) NOT NULL,
Bdate DATE,
Address VARCHAR(30),
sex CHAR,
Salary DECIMAL(10,2),
Super_ssn CHAR(9),
Dno INT NOT NULL,
constraint chk_salary_employee check (Salary> 2000.0),
constraint pk_employee PRIMARY KEY (Ssn)
);

CREATE TABLE departament(
Dname VARCHAR(15) NOT NULL,
Dnumber INT NOT NULL,
Mgr_ssn CHAR(9),
Mgr_star_date DATE,
Dept_create_date DATE,
constraint chk_date_dept check (Dept_create_date < Mgr_star_date),
constraint pk_dept PRIMARY KEY (Dnumber),
constraint unique_name_dept Unique(Dname),
FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
);

CREATE TABLE dept_locations(
Dnumber INT NOT NULL,
Dlocation VARCHAR(15) NOT NULL,
constraint pk_dept_locations PRIMARY KEY (Dnumber,Dlocation),
constraint fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
);

CREATE TABLE project(
Pname VARCHAR(15) NOT NULL,
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY (Pnumber),
constraint unique_project_name UNIQUE (Pname),
constraint fk_project FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);

CREATE TABLE works_on(
Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY (Essn, Pno),
constraint fk_employee_works_on FOREIGN KEY (Essn) REFERENCES employee(Ssn),
constraint fk_project_works_on FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

CREATE TABLE dependent(
Essn CHAR(9) NOT NULL,
Dependent_name VARCHAR(15) NOT NULL,
Sex CHAR, -- F ou M
Bdate DATE,
Relationship VARCHAR(8),
Age int not null,
constraint chk_age_dependent check (Age < 22),
PRIMARY KEY (Essn, Dependent_name),
constraint fk_dependent FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);

-- SHOW TABLES;
-- DESC departament;
-- DESC employee;
-- DESC works_on;

select * from information_schema.table_constraints where constraint_schema = 'company_constraints';
    
-- select * from information_schema.referential_constraints where constraint_schema = 'company_constraints';