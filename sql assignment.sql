
--1.Select top 10 records from Employee table where Emp_Sal > 10000
select * from EMPLOYEE
select top(10) emp_sal 
from employee where Emp_Sal > 10000 order by emp_sal desc

--2.Retrieve Emp_Id, Emp_FName, Emp_Addr1, Emp_City, Emp_Zip, Dept_Name, Dept_City From Employee whose Department City is Brentwood. Use Table Alias

SELECT e.Emp_Id, e.Emp_FName, e.Emp_Addr1, e.Emp_City, e.Emp_Zip, d.dept_name, d.dept_city
FROM Employee e
JOIN Department d ON e.EDept_Id = d.dept_id
WHERE d.dept_city = 'Brentwood';

--3.Retrieve Emp_ID, Emp_Fname, Emp_Zip from Employee who are all working in department HR&Training and Compliance. Use embedded SQL statments

select Emp_ID, Emp_Fname, Emp_Zip 
from Employee e 
join Department d on e.EDept_Id = d.dept_id 
where d.dept_name IN ('HR & Training', 'Compliance');



--4.Retrieve Sum(Emp_Sal) and Dept_Name From Employee and Emp_Department by Dept_Name (Group By)

select d.Dept_Name,sum(emp_sal) as Total_Sal
from 
   employee e
join 
   EMP_DEPARTMENT d on e.EDept_Id = d.dept_id
group by 
    d.Dept_Name

--5.Select 2nd highest sal from Employee table

select max(Emp_Sal) as Second_Highest_Salary
from Employee
where Emp_Sal < (select max(Emp_Sal) as Second_Highest_Salary
from Employee
where Emp_Sal < (select max(Emp_Sal) from Employee))

--6.Rename a column Person_Name to P_Name in the table Person
EXEC sp_rename 'Persons.LastName', 'L_Name', 'COLUMN';

--7.Retrieve Emp_Id, Emp_FName, Emp_LName for location Zip_Code 88160 (use all three Employee tables) Use Embedded sql statements
select Emp_Id, Emp_FName, Emp_LName
   from(
        select Emp_Id, Emp_FName, Emp_LName, Zip_Code from Employee1
        union all
        select Emp_Id, Emp_FName, Emp_LName, Zip_Code from Employee2
        union all
        select Emp_Id, Emp_FName, Emp_LName, Zip_Code from Employee3
    ) as AllEmployees
    where Zip_Code = 88160;

--8.Write a query using Right Outer join to retrieve the data from Employee and Emp_Department table
select 
E.Emp_ID,E.Emp_FName,E.Emp_LName,E.Emp_Addr1,E.Emp_City,E.Emp_Sal,
D.Dept_Id,D.Dept_Name,D.Dept_State from employee E
right outer join EMP_DEPARTMENT D
on e.EDept_Id = d.Dept_Id
--9.Write a query using Full Outer join to retrieve the data from Employee and Emp_Department tables
select 
E.Emp_ID,E.Emp_FName,E.Emp_LName,E.Emp_Addr1,E.Emp_City,E.Emp_Sal,
D.Dept_Id,D.Dept_Name,D.Dept_State from employee E
full outer join EMP_DEPARTMENT D
on e.EDept_Id = d.Dept_Id



