DROP SCHEMA company;
CREATE SCHEMA IF NOT EXISTS company;
USE company;

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
);

CREATE TABLE departament(
Dname VARCHAR(15) NOT NULL,
Dnumber INT NOT NULL,
Mgr_ssn CHAR(9),
Mgr_star_date DATE,
Dept_create_date DATE,
PRIMARY KEY (Dnumber),
FOREIGN KEY (Mgr_ssn) REFERENCES employee(ssn)
);

CREATE TABLE dept_locations(
Dnumber INT NOT NULL,
Dlocation VARCHAR(15) NOT NULL,
PRIMARY KEY (Dnumber,Dlocation),
FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
);

CREATE TABLE project(
Pname VARCHAR(15) NOT NULL,
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY (Pnumber),
UNIQUE (Pname),
FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);

CREATE TABLE works_on(
Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY (Essn, Pno),
FOREIGN KEY (Essn) REFERENCES employee(Ssn),
FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

CREATE TABLE dependent(
Essn CHAR(9) NOT NULL,
Dependent_name VARCHAR(15) NOT NULL,
Sex CHAR, -- F ou M
Bdate DATE,
Relationship VARCHAR(8),
PRIMARY KEY (Essn, Dependent_name),
FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);

SHOW TABLES;
DESC departament;
DESC employee;
DESC works_on;

select * from information_schema.table_constraints
	where constraint_schema = 'company';
    
select * from information_schema.referential_constraints
	where constraint_schema = 'company';