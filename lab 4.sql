create table Customer
(	
	CustomderId int IDENTITY (1, 1) PRIMARY KEY,
	Name varchar(50) Not null, 
	Age varchar(50) Not null,
	Address varchar(50) Not null,
	Payment float
)

INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('kashem',20,'lalbagh', 255.00)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('bld',23,'dmd', 1000.00)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('msh',22,'bailyroad', 355.00)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('bag',20,'lalbagh', 480.00)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('chgl',20,'lalbagh', 320.00)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('bld',20,'lalbagh', 770.00)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('janina',20,'lalbagh', 659.00)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('name nai',20,'lalbagh', 700.00)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('trash can',20,'motijheel', 150.55)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('bazuka',20,'tejgaon', 850.29)
INSERT INTO Customer(Name, Age, Address,Payment ) 
VALUES ('tanker',20,'farmgate', 900.99)


SELECT * FROM Customer
SELECT Name,Age FROM Customer

SELECT * FROM CUSTOMER WHERE AGE LIKE '_2' /*This shows 32 and 22*/

SELECT * FROM CUSTOMER WHERE AGE LIKE '%0' /*This shows all with 
30 and 20 */


Select Max(Payment) from Customer

Select Age, Max(Payment) from Customer GROUP BY AGE /*we always have to add
this group by and it must be same as parameter after select*/

Select Age, Max(Payment) from Customer GROUP BY AGE 
Select Age, AVG(Payment) from Customer GROUP BY AGE 
Select Age, Max(Payment) from Customer GROUP BY AGE having age >= 25
Select Age, AVG(Payment) from Customer GROUP BY AGE having age >= 25
Select Age, MAX(Payment) from Customer GROUP BY AGE having MAX(Payment) >= 500
Select Age, AVG(Payment) from Customer GROUP BY AGE having AVG(Payment) >= 700
Select Age, MAX(Payment) from Customer GROUP BY AGE having AVG(Payment) >= 700


/*here if we want to apply condition like we used where, here we have to use
having */
/*here max is an aggregate function, we can use other aggregate
functions similarly
*/


Select Count(*) from Customer /*To count total number of rows this is used*/

Select Count(Payment) from Customer /*If there is null in count column
it won't take it into account*/
Select Count(Age) from Customer /*This takes into account all*/
Select Count(DISTINCT AGE) from Customer 
/* This counts only the unique ages, if there are multiple ages with same value
it won't count it

if we want to count total number of rows in the table then we can use count
but don't use a column which accepts null. because count won't count those null values
*/


Select Upper(Name) from Customer

select * from Customer where name = 'KASHEM'
/*This is not case sensitive, so even if we have 'kashem' in our database
it will still display it

For case senstivie sql in other platforms we can use it like this
select * from Customer where UPPER(name) = 'KASHEM'
*/

select * from Customer where Len(Name) >= 6



select left(Name,2) from Customer
select * from Customer where left(Name,1)  = 'K'
/*we can also use like operator, like operator checks both patter 
and equal operator*/




select SUBSTRING(Name,2,3) from Customer



select REVERSE(Name) from Customer
select SUBSTRING(REVERSE(Name),2,3) from Customer



select Name + ' ' + Age  from Customer 
select Name + ' ' + Age as "Name-Age" from Customer 
/*case/convert not in syllabus of online*/



/*Not included in pdf*/

Select Name, Payment*10 as "Yearly Payment" from Customer

/*Mutiplies payment row with the corresponding age value
and names the column as NewRandomTable
Both naming is okay.
We can also do Payment+Age*/
Select Name, Payment*Age as NewRandomTable from Customer


/**
Select Name, Payment-Discount as NewRandomTable from Customer
If there was a column we could've done this
**/

/*Changing column name only without any operation*/

Select Name as "New Name", Age as "New Age" from Customer
Select Name, Age as "New Age" from Customer


/*Equality check, for null we  cannot use '='
we must use is or is not to do this*/
Select * from Customer where Age is not null
Select * from Customer where Age is null








SELECT Age, MAX(Payment) FROM CUSTOMER
SELECT Age, MAX(Payment) FROM CUSTOMER GROUP BY Age 

SELECT Age, MAX(Payment) FROM CUSTOMER GROUP BY Age HAVING NAME LIKE 'Ka%'
/*This line above throws an error*/

SELECT Age, MAX(Payment) FROM CUSTOMER GROUP BY Age HAVING Age >= 25


SELECT SUM(Payment),AVG(Payment) FROM CUSTOMER
SELECT SUM(Payment) as 'Total Salary',AVG(Payment) as 'Average Salary' FROM CUSTOMER



CREATE TABLE CUSTOMER2
(
	CustomerId int IDENTITY(1,1) PRIMARY KEY,
	LastName varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	AreaCode int NULL,
	Address varchar(200) NULL,
	Phone varchar(11) NULL,
)


CREATE TABLE ORDERDETAILS
(
	OrderId int IDENTITY(1,1) PRIMARY KEY,
	CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER2 (CustomerId) UNIQUE,
	OrderDate date NULL,
	OrderAmount float NULL
) 

select * from CUSTOMER2
Select * from ORDERDETAILS
delete from ORDERDETAILS
INSERT INTO ORDERDETAILS(CustomerId,OrderDate,OrderAmount) 
values(10,'1994-05-18',500)

INSERT INTO CUSTOMER2 (LastName, FirstName, AreaCode, Address, Phone) 
VALUES ('Khan', 'Rahim', 1307, 'Gulshan', '01677515829'),
       ('Rahman', 'Kahim', 1202, 'Dhanmondi', '0i912584949'),
       ('Mehedi', 'Hashim', 1307, 'Gulshan', '01645789544')


INSERT INTO CUSTOMER2 (LastName, FirstName, AreaCode, Address, Phone) 
VALUES ('Sardar', 'Kashim', 1102, 'Uttara', '01612457845')


INSERT INTO CUSTOMER2 (LastName, FirstName, AreaCode, Address, Phone) 
VALUES ('Sardar', 'Kashim', 1102, 'Uttara', '01612457845')

INSERT INTO CUSTOMER2 (LastName, AreaCode, Address, Phone) 
VALUES ('Sardar', 1102, 'Uttara', '01612457845')

INSERT INTO CUSTOMER2 (LastName, FirstName, AreaCode, Phone) 
VALUES ('Sardar', 'Kashim', 1102, '01612457845')

select * FROM customer where Name not in('kashem', 'chagol')


CREATE TABLE CUSTOMER3
(
	CustomerId int IDENTITY(1,1) PRIMARY KEY,
	LastName varchar(50) NOT NULL,
	FirstName varchar(50) NOT NULL,
	AreaCode int NULL,
	Address varchar(200) NULL DEFAULT 'Dhaka',
	Phone varchar(11) NULL,
)

INSERT INTO CUSTOMER3 (LastName, FirstName, Address,AreaCode, Phone) 
VALUES ('Sardar', 'Kashim', 'Moon',1102, '01612457845')


Select Round(Payment,1,1) from Customer 
