create database if not exists first_example;
use first_example;
create table if not exists person(
person_id smallint unsigned,
fname varchar(20),
lname varchar(20),
gender enum('M','F','B','A','I','P','O'),
birth_date date,
street varchar(30),
city varchar(20),
state varchar(20),
country varchar(20),
postal_code varchar(20),
constraint pk_person primary key (person_id)
);

desc person;

create table if not exists favorite_food(
person_id smallint unsigned,
food varchar(20),
constraint pk_favorite_food primary key (person_id, food),
constraint fk_favorite_food_person_id foreign key (person_id)
references person(person_id)
);

desc favorite_food;

show databases;
select * from information_schema.table_constraints
where constraint_schema = 'first_example';

select constraint_name from information_schema.table_constraints
where table_name = 'person';

select * from information_schema.table_constraints
where table_name = 'person';

desc person;

insert into person values(
'2','Carolina','Silva','F','1979-08-21','rua tal',
'Cidade J','RJ','Brasil','26054-89'
);
insert into person values(
'5','Roberta','Silva','F','1979-08-21','rua tal',
'Cidade J','RJ','Brasil','26054-89'
),
(
'6','Luiz','Silva','F','1979-08-21','rua tal',
'Cidade J','RJ','Brasil','26054-89'
);

select * from person;

desc favorite_food;

insert into favorite_food values
(2,'Lasanha'),
(5,'Carne assada'),
(6,'Fetuccine');

select * from favorite_food;