use company_constraints;
select * from employee;
select * from department;

-- diminuindo o retrabalho
delimiter \\
create procedure procedure_test()
begin
	-- procedimento;
	 -- instrução sql;
end \\
delimiter ;
drop procedure info_employee;
delimiter $$
create procedure info_employee()
begin
	select * from employee inner join department on Ssn = Mgr_ssn;
end $$
delimiter ;

call info_employee;

delimiter %
create procedure insert_into_employee_proc()
	begin
		insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
        values ('Maria','B','Smith','123456824','1965-08-10','731-Foundren-Houston-TX','F','35000.00','123456789','5');
        end %
delimiter ;
drop procedure insert_into_employee_proc;
call insert_into_employee_proc;
select * from employee;

delimiter %
create procedure insert_into_employee_proc(
	in Fname_p varchar(15),
    in Minit_p char(1),
    in Lname_p varchar(15),
    in Ssn_p char(9),
    in Bdate_p date,
    in Address_p varchar(10),
    in Sex_p char(1),
    in Salary_p decimal(10,2),
    in Super_ssn_p, char(9),
    in Dno_p int
)
begin
	insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
        -- values ('Maria','B','Smith','123456824','1965-08-10','731-Foundren-Houston-TX','F','35000.00','123456789','5');
    values (Fname_p, Minit_p, Lname_p, Ssn_p, Bdate_p, Address_p, Sex_p, Salary_p, Super_ssn_p, Dno_p);
	
    end %
delimiter ;

desc employee;

-- retorna o registro que foi persistido
		
		select * from employee where Ssn = Ssn_p;
        select 'Inserção bem sucedida' as Message;

call insert_into_employee_proc (
-- 'Claudia','B','Teixeira','12345624','1990-08-10','731-Foundren-Houston-TX','F','40000.00','123456789','5');
'Amanda','B','Teixeira','123456245','1990-08-10','731-Foundren-Houston-TX','F','40000.00','123456789','1');
