
use testdatabase

CREATE TABLE Doctor /*match doctor profile before merging*/
( 
doctor_id int IDENTITY(1,1) PRIMARY KEY,
doctor_name varchar(50) NOT NULL,
doctor_email varchar(50) NOT NULL,
doctor_mobile varchar(100)NOT NULL,
doctor_address varchar(80) NULL,
department varchar(100) NOT NULL,
doctor_specialist varchar(100) NOT NULL,
languages varchar(100) NULL,
hospital_affiliations varchar(100) NULL,
professional_experience varchar(100) NOT NULL,
room_number int NOT NULL ,
educaional_background varchar(100) NOT NULL,
doctor_password varchar(100) NOT NULL
)

select * from DOCTOR

select * from Doctor where doctor_name like '%mid%'

select educaional_background from Doctor where doctor_name like '%doggo%'

Alter table Doctor add doctor_password varchar(50)

select doctor_specialist from Doctor where doctor_id = 1 /*Doctor Specialist*/
select hospital_affiliations from Doctor where doctor_id = 1
select doctor_mobile from Doctor where doctor_id = 1
select doctor_email  from Doctor where doctor_id = 1
select doctor_address from Doctor where doctor_id = 1


-- updating educational background quesires
select * from Doctor where educaional_background like '%rotten%'
update Doctor Set educaional_background = 'MS(medicine),FCPS,MMBS' where doctor_id=1

select doctor_specialist, hospital_affiliations, doctor_email, doctor_mobile,
professional_experience, doctor_address, educaional_background from Doctor where doctor_id=1

select top 100 percent * from Doctor 


ALTER TABLE DOCTOR
RENAME COLUMN educaional_background TO Educational_Background


CREATE TABLE Receptionist
(
	receptionist_id INT IDENTITY(1,1) PRIMARY KEY,
	receptionist_name varchar(50),
	receptionist_pass varchar(50) NOT NULL,	
)


insert into Receptionist (receptionist_name,receptionist_pass) 
values('Midoriya','reception1'),
		('Izuku','reception2'),
		('Uraraka','reception3')


drop table Receptionist

CREATE TABLE ADMIN
(
	admin_id INT IDENTITY(1,1) PRIMARY KEY,
	admin_name varchar(50),
	admin_pass varchar(50),
)


insert into Admin (admin_name,admin_pass) 
values('Midoriya','admin1'),
		('Izuku','admin2'),
		('Uraraka','admin3')


drop table Receptionist
	

 select TOP 1 doctor_id from Doctor order by doctor_id desc

drop table Doctor

INSERT INTO Doctor (doctor_name, doctor_email, doctor_mobile,doctor_address,department,doctor_specialist,languages,hospital_affiliations,professional_experience,room_number,educaional_background, doctor_password) 
VALUES ('Dr. Michel Jordan', 'jordan@gmail.com', '01555500000','Dhanmondi','Dental Surgeon','Dentistry,Surgery','English,Bangla','Fellowship','5 years',401,'MS(medicine),FCPS,MMBS', 'doctor1'),
       ('Dr. Karen Dawson', 'karen@gmail.com', '01555500001','Dhanmondi','Paediatric Surgeon','Paediatric,Laparoscopy,Endoscoic','English,Bangla','Fellowship','8 years',402,'MS M.CH(Paediatric),FCPS,MMBS', 'doctor2'),
       ('Dr. Zakaria', 'zakaria@gmail.com', '01555500022','Dhanmondi','Cardiology','Cardiologist,Surgery','Bangla','Fellowship','15 years',505,'MS(Cardiology),FCPS,MMBS', 'doctor3'),
	   ('Dr. Safa', 'safa@gmail.com', '01555500030','Dhanmondi','Neurology','Neurologist,Surgery','English,Bangla','Fellowship','10 years',501,'MS(Neurology),FCPS,MMBS', 'doctor4'),
	   ('Dr. Adam', 'adam@gmail.com', '01555500011','Dhanmondi','Dental Surgeon','Dentistry,Surgery,Implantology','English,Bangla','Fellowship','20 years',402,'MS(medicine),FCPS,MMBS', 'doctor5')

INSERT INTO Doctor (doctor_name, doctor_email, doctor_mobile, doctor_address, department, doctor_specialist,
languages, hospital_affiliations, professional_experience, room_number, educaional_background, doctor_password) 
VALUES ('Dr. Doggo man', 'doggo@gmail.com', '01555500011','Dhanmondi','Dental Surgeon',
'Dentistry,Surgery','English,Bangla','Fellowship','5 years',401,'MS(medicine),FCPS,MMBS', 'doctor1')

select doctor_name, doctor_password from Doctor where doctor_id=1


CREATE TABLE Patient
(
patient_id int IDENTITY(1,1) PRIMARY KEY,
patient_name varchar(50) NOT NULL,
patient_email varchar(50) NOT NULL,
patient_mobile varchar(20)NOT NULL,
patient_address varchar(80) NULL,
gender varchar(10) NOT NULL,
blood_group varchar(5) NOT NULL,
age int NOT NULL,
patient_height int NOT NULL,
patient_weight int NOT NULL
)

INSERT INTO Patient (patient_name, patient_email, patient_mobile, patient_address,gender,blood_group,age,patient_height,patient_weight) 
VALUES ('Samia', 'samia@yahoo.com','0160000011','Shiddeshwari','Female','B+',21,5.3,60),
       ('Ahnaf', 'ahnaf@yahoo.com','0150333011','Dhanmondi','Male','A+',22,5.6,80),
       ('Mustofa', 'mustofa@yahoo.com','0133333311','Lalbag','Male','O+',22,5.7,70),
	   ('Nusrat', 'nusrat@gmail.com','0169999011','Ajimpur','Female','B+',20,5,58),
	   ('Priota', 'priota@yahoo.com','0177000011','Tejgan','Female','AB+',21,5.4,48)

create table Schedule
(
schedule_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
doctor_id int NOT NULL FOREIGN KEY REFERENCES Doctor (doctor_id),
doctor_schedule_start_time time NOT NULL,
doctor_schedule_end_time time NOT NULL,
schedule_day date NOT NULL,
duration time NOT NULL,
)

INSERT INTO Schedule (doctor_schedule_start_time, doctor_schedule_end_time, schedule_day, duration) 
VALUES ('10:30:00', '13:00:00','2021:3:10','02:30:00'),
       ('10:10:00', '13:00:00','2021:3:12','02:30:00'),
	   ('14:00:00', '18:00:00','2021:3:12','04:00:00'),
	   ('10:30:00', '13:00:00','2021:3:13','02:30:00'),
	   ('14:00:00', '18:00:00','2021:3:13','04:00:00')


create table Appointment
(
appointment_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
patient_id int NOT NULL FOREIGN KEY REFERENCES Patient(patient_id),
doctor_id int NOT NULL FOREIGN KEY REFERENCES Doctor(doctor_id),
start_time time NOT NULL,
end_time time NOT NULL,
appointment_day varchar(50) NOT NULL,
reason varchar(50) NOT NULL,
date_of_appointment date NOT NULL,
patient_name varchar(20) NOT NULL
)

INSERT INTO Appointment (start_time, end_time, end_time, appointment_day,reason,date_of_appointment,patient_name) 
VALUES ('10:30:00', '11:10:00','Sunday','Tooth Pain','2021:3:10','Samia'),
       ('11:10:00', '11:50:00','Sunday','Bleeding from leftside tooth','2021:3:10','Ahnaf'),
	   ('14:00:00', '14:40:00','tuesday','Headache since 1 week','2021:3:12','Priota'),
	   ('14:40:00', '15:20:00','Tuesday','Left eye have pain and headache','2021:3:12','Nusrat'),
       ('10:30:00', '11:10:00','Wednesday','Tooth Pain','2021:3:13','Mustofa')

create table Prescription
(
prescription_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
patient_id int NOT NULL FOREIGN KEY REFERENCES Patient(patient_id),
doctor_id int NOT NULL FOREIGN KEY REFERENCES Doctor(doctor_id),
appointment_id int NOT NULL FOREIGN KEY REFERENCES Appointment(appointment_id),
date_of_appointment date NOT NULL,
patient_health_condition varchar(30)  NULL,
patient_exercise_routine varchar(10)  NULL,
patient_food_chart varchar(30)  NULL,
)
INSERT INTO Appointment(date_of_appointment, patient_health_condition, patient_exercise_routine, patient_food_chart) 
VALUES ('2021:3:10', 'Painful','','Soft food'),
       ('2021:3:10', 'Painful','','Soft food'),
	   ('2021:3:12', 'Critical','','Normal Diet'),
	   ('2021:3:12', 'Critical','','Normal Diet'),
	   ('2021:3:13', 'Painful','','Normal Diet')


create table Disease
(
disease_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
prescription_id int NOT NULL FOREIGN KEY REFERENCES Prescription(prescription_id),
patient_id int NOT NULL FOREIGN KEY REFERENCES Patient(patient_id),
doctor_id int NOT NULL FOREIGN KEY REFERENCES Doctor(doctor_id),
disease_name varchar(50),
disease_type varchar(50),
disease_description varchar(100),
disease_status varchar(20),
)
INSERT INTO Disease(disease_name, disease_type, disease_description, disease_status) 
VALUES ('Toothache', 'Tooth','Rightside tooth have cavity','Inital stage'),
       ('Cracked Tooth', 'Tooth','Leftside tooth cracked and bleeding','Critical stage'),
	   ('Migraine', 'Headache','Migraine problems are severe','Critical stage'),
	   ('Headache and left eye pain', 'Headache','Left eye have some pain','Critical stage'),
	   ('Toothache', 'Tooth','Middel tooth have cavity','Inital stage')


CREATE TABLE Medicine
(
medicine_prescription_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
prescription_id int NOT NULL FOREIGN KEY REFERENCES Prescription(prescription_id),
patient_id int NOT NULL FOREIGN KEY REFERENCES Patient(patient_id),
doctor_id int NOT NULL FOREIGN KEY REFERENCES Doctor(doctor_id),
medicine_name varchar(50) NOT NULL,
medicine_start_date date NOT NULL,
medicine_end_date date NOT NULL,
medicine_interval varchar(20) NULL,
tummy_status varchar(10) NULL
)

INSERT INTO  Medicine(medicine_name, medicine_start_date, medicine_end_date, medicine_interval,tummy_status) 
VALUES ('Napa', '2021:3:10','2021:3:20','10 Days when pain started and take after meal',''),
       ('Napa', '2021:3:10','2021:3:25','15 Days when pain started and take after meal',''),
	   ('Napa', '2021:3:12','2021:3:30','28 Days when pain started and take after meal',''),
	   ('Napa', '2021:3:12','2021:4:10','38 Days when pain started and take after meal',''),
	   ('Napa', '2021:3:13','2021:3:20','7 Days when pain started and take after meal','')

CREATE TABLE Test
(
test_prescription_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
prescription_id int NOT NULL FOREIGN KEY REFERENCES Prescription(prescription_id),
patient_id int NOT NULL FOREIGN KEY REFERENCES Patient(patient_id),
doctor_id int NOT NULL FOREIGN KEY REFERENCES Doctor(doctor_id),
test_name varchar(30) NOT NULL,
test_report varchar(50) NOT NULL,
test_description varchar(100) NOT NULL,
test_date varchar(50) NOT NULL,
doctor_name varchar(50) NOT NULL
)

INSERT INTO  Test(test_name, test_report, test_description, test_date,doctor_name) 
VALUES ('Dental X-ray', 'Cavity','For cavity rightside tootyh was damaged ','11 March 2021','Dr. Michel Jordan'),
       ('Dental X-ray', 'Cracked tooth','Infected leftside tooth ','10 March 2021','Dr. Adam'),
	('Dental X-ray', 'Cavity','For cavity rightside tootyh was damaged ','13 March 2021','Dr. Adam'),
	('Dental X-ray', 'Cavity','For cavity rightside tootyh was damaged ','14 March 2021','Dr. Michel Jordan'),
        ('Dental X-ray', 'Cavity','For cavity rightside tootyh was damaged ','12 March 2021','Dr. Michel Jordan')







