CREATE TABLE CUSTOMER2
(
CustomerId int IDENTITY(1,2) PRIMARY KEY,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
AreaCode int NULL,
Address varchar(200) NULL,
Phone varchar(11) NULL,
)

insert into CUSTOMER2(LastName, FirstName, Address, Phone) 
values ('Choto', 'Boss','lalbagh', '011778852')


select * from CUSTOMER where LastName = 'Choto2' or LastName = 'Choto3'

select FirstName,LastName from CUSTOMER

