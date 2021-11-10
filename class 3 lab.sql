create table Customer20
(
	FirstName varchar(50), 
	LastName varchar(50),
	Age int
)

insert into Customer20(FirstName, LastName, Age) values ('Choto', 'Boss', 10)

select * from Customer20 order by Age asc
/* desc for descending */


select distinct Age from Customer20
/* This will bring row's which are not same, that is if 2 guys have age 10,
then only 1 row will be printed, if it is unique with respect to age
, then it will also be printed, this will help in finding*/


/*Between operator*/
select * from Customer20 
where age between 23 and 27
/* This is 23 and 27 inclusive

where age >= 23 AND age <= 27

Finds out the customers within this range
we can also use greaterthan equal stuffs
*/

/*In operator*/
select * from Customer20 
where age IN (23,27)
/*This in works like Or, that is it will check if age is 
equal to 23 or 27*/


/*Like operator*/
/*Like operator is a better way to check strings of some patterns, suppose
check customers whose name starts with R, then we will use R%,

here % implies, there can be no other character or 1 or more
if we use _ instead of %, then it implies exactly 1 character must be present
For example if we want name whose first character is R and the it has only
2 character in its name, then we can use R_
*/

select * from Customer20 
where age IN (23,27)


/*
Top
This finds out the top rows, the select top we use 
*/
/*THIS IS NOT IN PDF */


create table Employee
(
	EmployeeId varchar(50), 
	Name varchar(50),
	Salary int
)

Select Name, Salary From Employee /*this salary is monthly salary*/
/*If we want to see annual salary*/
Select Name, Salary*12 From Employee /*
This will display the yearly salary, however this calculation will 
not affect our database, select only displays, doesnt change database

The name of columns after this line will be 
Name Salary*12

If we want custom name of the column
Select Name, Salary*12 as Yearly_Salary From Employee

Select Name, Salary*12 as "Yearly Salary"From Employee /*if we use space in name
surround it with quotation mark*/
*/

/*
Whenever we try to compare with null we cant use equal operator,
we have to use is

select * from customer where age is not null
*/



CREATE TABLE CUSTOMER2
(
	CustomerId int IDENTITY(1,1) PRIMARY KEY,
	LastName varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	AreaCode int NULL,
	Address varchar(200) NULL,
	Phone varchar(11) NULL,
)



CREATE TABLE ORDER2
( 
	OrderId int IDENTITY (1, 1) PRIMARY KEY,
	CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER2 (CustomerId),
	OrderDate date NULL,
	OrderAmount money NULL,
)


CREATE TABLE CUSTOMER3
(
	CustomerId int IDENTITY (1,1) PRIMARY KEY,
	CustomerNumber int NOT NULL UNIQUE CHECK(CustomerNumber>1000),
	/*Checks if customer number less than 1000, if it is then it will throw
	an error when we try to insert values*/
	LastName varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
)


CREATE TABLE CUSTOMER4
(
	CustomerId int IDENTITY(1,1) PRIMARY KEY,
	CustomerNumber int NOT NULL UNIQUE CHECK(CustomerNumber>1000),
	LastName varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	AreaCode int NULL,
	Address varchar(200) NULL DEFAULT 'Dhaka',
	/*If no value is set to address, then it will be dhaka by default*/
	Phone varchar(11) NULL,
)



UPDATE CUSTOMER4 set AreaCode=46 where CustomerId=2
/*
Note: If you don’t include the WHERE clause then result becomes updated to all records. 
So make sure to include the WHERE clause when using the UPDATE command!
*/


delete from CUSTOMER4 where CustomerId =2
DELETE FROM CUSTOMER4 /*To delete table*/

select * from CUSTOMER4 order by LastName asc
select * from CUSTOMER4 order by LastName desc


SELECT CustomerId,FirstName,LastName FROM CUSTOMER4

SELECT FirstName as 'First Name',LastName as 'Last Name' FROM CUSTOMER4

SELECT FirstName + ' ' + LastName as 'Customer Name' FROM CUSTOMER4

SELECT * FROM CUSTOMER4 ORDER BY LastName

SELECT * FROM CUSTOMER4 ORDER BY Address,LastName ASC

SELECT * FROM CUSTOMER4 ORDER BY LastName desc

SELECT * FROM CUSTOMER4 WHERE CustomerNumber='1001'

SELECT * FROM CUSTOMER4 WHERE AreaCode > 1250

SELECT DISTINCT Address FROM CUSTOMER4

