


-- ------------INTERMEDIATE SQL -----------------


use mikaeil1;
select * from EmployeeDemographics
select * from EmployeeSalary


-- The INNER JOIN keyword selects records that have similar values in both tables.
SELECT * FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmplyeeID;




-- Right Join it gathers all of data from right table
SELECT * FROM EmployeeDemographics
right JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmplyeeID;


-- Left join it gathers all of information from left table
SELECT *  FROM EmployeeDemographics
right JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmplyeeID;




-- ---------------------------------------------
SELECT * FROM EmployeeDemographics
Inner Join EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmplyeeID
WHERE FirstName != 'Michael'
ORDER by Salary DESC



-- AVG gives us average Salary
SELECT Salary, JobTitle, AVG(Salary) FROM EmployeeSalary
Inner Join EmployeeDemographics
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmplyeeID
WHERE JobTitle = 'Salesman'
Group By JobTitle;



-- UNION it takes out and removing the duplicates
-- we should be sure that both select statement return same 
-- number of columns
select LastName, FirstName, Age from EmployeeDemographics
union all
select * from EmployeeSalary



-- CASE Methode: We could add a condition to our column
select FirstName, LastName, Age,
case 
    when Age between 27 and 30 then 'Young'
    when Age > 30 then 'Old'
    ELSE 'No Idea'
End
from EmployeeDemographics
where Age is NOT NULL
Order by Age

-- 

select *
case
    when JobTitle = 'Salesman' then Salary + (Salary * 0.10)
    when JobTitle = 'Accountant' then Salary + (Salary * 0.5)
    when JobTitle = 'HR' then Salary + (Salary * 0.000001)
    else Salary + (Salary * 0.03)
end as SalaryAfterRaise
from EmployeeSalary
Join EmployeeDemographics
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmplyeeID


-- updating in a Table
select * from EmployeeDemographics
select * from EmployeeSalary

SELECT * FROM mikaeil1.EmployeeDemographics
UPDATE EmployeeDemographics
SET Age = 33
WHERE EmployeeID = 1006

-- deleting, it delet the entire row in our table
-- DELETE FROM table_name WHERE condition;

DELETE
FROM mikaeil1.EmployeeDemographics
WHERE EmployeeID = 1008;


-- Aliasing

SELECT FirstName FName FROM mikaeil1.EmployeeDemographics 


SELECT FirstName + ' ' + LastName as FullName 
FROM EmployeeDemographics


SELECT Avg(Age) as AvgAge 
FROM EmployeeDemographics



SELECT Demo.EmployeeID
FROM EmployeeDemographics as Demo



SELECT Demo.EmployeeID, Sal.Salary
FROM EmployeeDemographics as Demo
Join EmployeeSalary as Sal
     on Demo.EmployeeID = Sal.EmplyeeID



-- Partition By
SELECT FirstName, LastName, Gender, Salary,
      COUNT(Gender) over (partition by Gender) as TotalGender
from EmployeeDemographics dem
join EmployeeSalary sal
     on dem.EmployeeID = sal.EmplyeeID







