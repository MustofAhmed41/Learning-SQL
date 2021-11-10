use ShopManagement

create table Customer2
(
	FirstName varchar(50), 
	LastName varchar(50),
	Age int
)

insert into Customer2(FirstName, LastName, Age) values ('oto', 'oss', 80)

/*This line below wil not work because the table is altered
by adding a new column and when we dont specify the column name
then it will cause error, for the code above it works because
we have mentioned the column name*/
insert into CUSTOMER2 values ('Choto', 'Boss', 80)


select top 60 PERCENT * from Customer2 where FirstName like 'Must%'

select top 2 * from Customer2 where FirstName = 'Mustofa2'

select FirstName,LastName from Customer2


SELECT * FROM CUSTOMER2 WHERE LastName LIKE 'Jo%'
SELECT * FROM CUSTOMER2 WHERE LastName LIKE 'Jo__'
SELECT * FROM CUSTOMER2 WHERE LastName LIKE 'Jo%_'

Alter table Customer2 add City varchar(50)

select * from Customer2

Alter table Customer2 drop column City

ALTER TABLE CUSTOMER10 ADD CustomerSince date

ALTER TABLE CUSTOMER10 ALTER COLUMN CustomerSince date
ALTER TABLE CUSTOMER10 ALTER COLUMN CustomerSince varchar(50)

ALTER TABLE CUSTOMER10 ADD tax int
ALTER TABLE CUSTOMER10 ALTER COLUMN tax float
ALTER TABLE CUSTOMER10 ALTER COLUMN tax int
/*when we convert float to int, it loses its decimal values*/

INSERT INTO CUSTOMER10(LastName, FirstName,Age, CustomerSince) 
VALUES ('John', 'Doe', 30, '01/01/2021')                 


CREATE TABLE ORDERR
( OrderId int IDENTITY (1, 1) PRIMARY KEY,
CustomerId varchar(50) NOT NULL FOREIGN KEY REFERENCES CUSTOMER11 (FirstName),
OrderDate date NULL,
OrderAmount money NULL,
)                 


create table Customer4
(
	CustomerId int Primary key,
	FirstName varchar(50) Not Null,
	LastName varchar(50) Not Null,
	Age int
)

INSERT INTO CUSTOMER4(CustomerId, FirstName,LastName, Age) 
VALUES (3, 'John', 'Doe', 30)      /* There is 
already a row with 3, if i execute this, this will throw an error.
and customerId is primary key so must be unique.
*/


INSERT INTO CUSTOMER4(CustomerId, LastName, Age) 
VALUES (3, 'Doe', 30)  
/*
Cannot do this because we set firstName to not null, so we can't
pass null value to firstName, we must provide it something.
*/

create table Customer5
(
	CustomerId int,
	FirstName varchar(50) Not Null UNIQUE,
	LastName varchar(50) Not Null,
	Age int
)

INSERT INTO CUSTOMER5(CustomerId, FirstName,LastName, Age) 
VALUES (1, 'John', 'Doe', 30)  
/*We cannot put this same row twice, because we specified Firstname
to be unique, we can't have 2 same FirstName*/



create table Customer6
(
	CustomerId int CHECK (CustomerId >1000),
	FirstName varchar(50) Not Null,
	LastName varchar(50) Not Null,
	Age int
)

INSERT INTO CUSTOMER6(CustomerId, FirstName,LastName, Age) 
VALUES (100, 'John', 'Doe', 30) 

/*
This above line will throw an error because it doesn't fullfill the 
CustomerId > 1000 condition. This will work
INSERT INTO CUSTOMER6(CustomerId, FirstName,LastName, Age) 
VALUES (1010, 'John', 'Doe', 30) 
Any number above 1000 will work
*/


CREATE TABLE ORDERR
( OrderId int IDENTITY (1, 1) PRIMARY KEY,
CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER (CustomerId),
/*
Here, even if we didn't write FOREIGN KEY this would still work but it is
better to write foreign key because, it ensures that the customerId of 
other table with whose respect we are writing it in this table, that
exists. That is, if we don't give foreign key then, we can insert 
orderId with customderId that doesn't even exist in the original 
Customer table. Giving foreign key ensures it is there.

IMPORTANT
For not null, for this given scenario we must give not null
but for some cases, we might need to allow null.
*/
OrderDate date NULL,
OrderAmount money NULL,
)


/*Updating value of a row, row update*/


/*This will change all name to kashem*/

Update Customer2 Set CustomerSince = '2020-01-20' 
select * from Customer2

/*This will change FirstName of all the customer whose 
age is 30 to kashem. Since age is generic and did here only for example
we can make condition as 'where CustomerId=3'
*/

Update Customer2 Set LastName = 'Ae2' where Age = 20
/*
Here 'where' works like if

we can also use 'and' and 'or' to set up complex conditions
*/


/*To Delete a row
Delete from Customer2 where CustomderId = 3 

To delete all
delete from Customer
*/



CREATE TABLE CUSTOMER7
(
	CustomerId int IDENTITY(1,1) PRIMARY KEY,
	LastName varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	AreaCode int NULL,
	Address varchar(200) NULL,
	Phone varchar(11) NULL,
)


/*
INSERT INTO CUSTOMER7 VALUES (1000, 'Rahman', 'Karim', 1203, 'Dhaka','01912584949')
This will throw an error because we cannot manually give primary key 

Error: An explicit value for the identity column in table 'CUSTOMER7' can only be specified 
when a column list is used and IDENTITY_INSERT is ON.
*/

INSERT INTO CUSTOMER7 VALUES ( 'Rahman', 'Karim', 1203, 'Dhaka','01912584949')

INSERT INTO CUSTOMER7 (LastName, FirstName, AreaCode, Address, Phone) 
VALUES ('Khan', 'Rahim', 1307, 'Gulshan', '01677515829')

INSERT INTO CUSTOMER (LastName, FirstName) 
VALUES ('Ahmed', 'Hashim')


ALTER TABLE CUSTOMER7
ADD CustomerSince date

ALTER TABLE CUSTOMER7
DROP COLUMN CustomerSince

ALTER TABLE CUSTOMER7
ALTER COLUMN CustomerSince datetime

INSERT INTO CUSTOMER7(LastName, FirstName, AreaCode, Address, Phone, CustomerSince) 
VALUES ('Ema', 'Mahzabeen', 1209, 'Dhanmondi', '01677515829', '1994-05-18') 

INSERT INTO CUSTOMER7(LastName, FirstName, AreaCode, Address, Phone, CustomerSince) 
VALUES ('Ema', 'Mahzabeen', 1307, 'Gulshan', '01677515829', '1994-05-18 23:59:59') 


CREATE TABLE CUSTOMER8
(
	CustomerId float ,
	Name varchar(11)
)

INSERT INTO CUSTOMER8(CustomerId, Name) 
VALUES (1.99, 'name nai')

ALTER TABLE CUSTOMER8 ALTER COLUMN CustomerId float
