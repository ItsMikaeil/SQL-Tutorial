create schema mikaeil1;  -- we make a schema
use mikaeil1;   -- we say to computer to use this schema 



-- make a new table -------------
create table EmployeeDemographics(
EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
);



-- make a second table---------------------------------------------
Create Table EmployeeSalary(
EmplyeeID int,
JobTitle  varchar(50),
Salary int
)




-- insert value in EmployeeDemographics -----------------------------

INSERT INTO EmployeeDemographics VALUES
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

select * from EmployeeDemographics




-- Insert -- value in EmployeeSalary-----------------------------------------
INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

 select * from EmployeeSalary
 
 
 
-- ----------------------------------------------------------
SELECT  * 
FROM EmployeeDemographics



-- DISTINCT: give us unique values in EmployeeID column
SELECT DISTINCT(EmployeeID)
FROM EmployeeDemographics



-- COUNT: It refers to how many last name we have
SELECT COUNT(LastName)
FROM EmployeeDemographics 


-- MAX, MIN, AVG
SELECT * 
FROM EmployeeSalary

SELECT MAX(Salary) FROM EmployeeSalary
SELECT MIN(Salary) FROM EmployeeSalary
SELECT AVG(Salary) FROM EmployeeSalary



-- --------
SELECT * 
FROM EmployeeDemographics
WHERE FirstName != 'Pam'

SELECT * 
FROM EmployeeDemographics
WHERE FirstName = 'Pam'

SELECT * 
FROM EmployeeDemographics
WHERE Age > 32

-- AND
SELECT * 
FROM EmployeeDemographics
WHERE Age > 32 AND Gender = 'Male'

-- OR
SELECT * 
FROM EmployeeDemographics
WHERE Age > 32 OR Gender = 'Male'




-- WHERE
SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE 'S%' -- everything that start with s

SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE '%S%' -- everything that has s

SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%' -- something that start with s and has o in some place

-- Null
SELECT * 
FROM EmployeeDemographics
WHERE FirstName is NULL

SELECT * 
FROM EmployeeDemographics
WHERE FirstName is NOT NULL




-- IN
SELECT * 
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')

-- GROUP BY (DISTINCT shpw us what value is in that uniqu 
-- GROUP BY show us what kind of value is in table but its also rolling 
-- all up into one column so that we can use it for other things )

SELECT Gender 
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender, Age, COUNT(Gender) 
FROM EmployeeDemographics
GROUP BY Gender, Age



-- ORDER BY

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC

SELECT *
FROM EmployeeDemographics
ORDER BY 2 DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC

SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY CountGender DESC

