use ShopManagement

create table Customer2
(
	FirstName varchar(50), 
	LastName varchar(50),
	Age int
)

insert into Customer2(FirstName, LastName, Age) values ('oto', 'Boss', 80)

select * from Customer2 where FirstName = 'Mustofa2'

select FirstName,LastName from Customer2

Alter table Customer2 add City varchar(50)

select * from Customer2

Alter table Customer2 drop column City

ALTER TABLE CUSTOMER2 ADD CustomerSince date

ALTER TABLE CUSTOMER2 ALTER COLUMN CustomerSince date

INSERT INTO CUSTOMER2(LastName, FirstName,Age, CustomerSince) 
VALUES ('John', 'Doe', 30, '01/01/2021') 



