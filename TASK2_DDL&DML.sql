-- Create Database

CREATE DATABASE PublicCarParkNetworkDB;

--Task #2 – data definition and manipulation

--1.creates the database structure according to your model (that includes keys and other details)

CREATE TABLE CarPark_System
(
System_Id varchar(50) NOT NULL PRIMARY KEY, 
CarPark_Area varchar(50) NOT NULL
);

CREATE TABLE CarPark
(
CarPark_Id varchar(50) NOT NULL PRIMARY KEY, 
System_Id varchar(50) NULL FOREIGN KEY REFERENCES CarPark_System(System_Id),
CarPark_Name varchar(50) NULL,
CarPark_Address varchar(50) NULL,
Geographical_Coordinates varchar(50) NULL,
NumberOfDecks int NULL,
IsSlotAvailable char(3) NULL
);

CREATE TABLE Decks
(
Deck_Id int NOT NULL PRIMARY KEY IDENTITY (1,1), 
CarPark_Id varchar(50) NULL FOREIGN KEY REFERENCES CarPark(CarPark_Id),
Deck_FloorName varchar(50) NULL,
NumberOfParkingPlace int NULL,
IsDeckFull char(3) NULL
);


CREATE TABLE ParkingPlace
(
ParkingPlace_Id varchar(50) NOT NULL PRIMARY KEY, 
Deck_Id int NULL FOREIGN KEY REFERENCES Decks(Deck_Id),
AllotmentType varchar(50) NULL,
IsAvailable char(3) NULL
);

CREATE TABLE CarOwnerDetails
(
Owner_id int NOT NULL ,
Car_NumberPlate varchar(50) NOT NULL UNIQUE,
Owner_Name varchar(50) NOT NULL,
Email_Address varchar(50) NULL,
Resident varchar(50) NULL,
PRIMARY KEY (Owner_id,Car_NumberPlate)
);

CREATE TABLE CarStay
(
Car_Id int NOT NULL PRIMARY KEY IDENTITY (11,1),
ParkingPlace_Id varchar(50) NULL FOREIGN KEY REFERENCES ParkingPlace(ParkingPlace_Id),
Car_NumberPlate varchar(50) NULL FOREIGN KEY REFERENCES CarOwnerDetails(Car_NumberPlate),
Arrival_Time DateTime NULL,
Departure_Time DateTime NULL
);

--2.inserts test data into your database (at least 10 records per table)


INSERT INTO CarPark_System VALUES 
('CK','Kabaty'),('CN','Natolin'),('CI','Imelin'),('CU','Urysnow'),('CW','Wilanowska'),
('CP','Politechnika'),('CC','Centrum'),('CS','Swietokrzyska'),('CB','Stare Bielany'),('CM','Mlociny');


INSERT INTO CarPark VALUES
('MK','CK','MKabaty','Metro Kabaty','52.13N 21.06E',2,'YES'),
('MI','CI','MImelin','Metro Imelin','52.14N 21.04E',1,'NO'),
('MN','CN','MNatolin','Metro Natolin','52.13N 21.06E',2,'YES'),
('MU','CU','MUrysnow','Metro Urysnow','52.16N 21.02E',1,'YES'),
('MW','CW','MWilanowska','Metro Wilanowska','52.18N 21.02E',1,'YES'),
('MP','CP','MPolitechnika','Metro Politechnika','52.21N 21.01E',2,'NO'),
('MC','CC','MCentrum','Metro Centrum','52.23N 21.01E',3,'YES'),
('MC1','CC','Al.Jerozolimskie','Aleja Jerozolimskie','52.12N 20.57E',3,'YES'),
('MS','CS','Mswietokrzyska ','Metro swietokrzyska ','52.235N 21.00E',2,'YES'),
('MB','CB','MStare Bielany','Metro Stare Bielany','52.28N 20.94E',2,'YES'),
('MM','CM','MMlociny','Metro Mlociny','52.29N 20.93E',3,'YES');

INSERT INTO Decks VALUES 
('MK','First_Floor',5,'YES'),
('MK','Second_Floor',5,'NO'),
('MI','First_Floor',5,'NO'),
('MN','First_Floor',5,'YES'),
('MN','Second_Floor',5,'NO'),
('MU','First_Floor',5,'YES'),
('MW','First_Floor',5,'NO'),
('MP','First_Floor',5,'YES'),
('MP','Second_Floor',5,'NO'),
('MC','First_Floor',5,'YES'),
('MC','Second_Floor',5,'NO'),
('MC','Third_Floor',5,'NO'),
('MC1','First_Floor',5,'YES'),
('MC1','Second_Floor',5,'NO'),
('MC1','Third_Floor',5,'NO'),
('MS','First_Floor',5,'YES'),
('MS','Second_Floor',5,'NO'),
('MB','First_Floor',5,'YES'),
('MB','Second_Floor',5,'NO'),
('MM','First_Floor',5,'YES'),
('MM','Second_Floor',5,'NO'),
('MM','Third_Floor',5,'YES');

INSERT INTO ParkingPlace VALUES
('MK1',1,'FREE','NO'),('MK2',1,'FREE','YES'),('MK3',1,'FREE','YES'),('MK4',1,'FREE','YES'),('MK5',1,'FREE','YES'),
('MK6',2,'Permanent','NO'),('MK7',2,'Permanent','NO'),('MK8',2,'Permanent','NO'),('MK9',2,'Permanent','YES'),('MK10',2,'Permanent','YES'),
('MI1',3,'Permanent','YES'),('MI2',3,'FREE','NO'),('MI3',3,'Permanent','YES'),('MI4',3,'FREE','NO'),('MI5',3,'Permanent','YES'),
('MN1',4,'FREE','YES'),('MN2',4,'Permanent','YES'),('MN3',4,'FREE','YES'),('MN4',4,'Permanent','YES'),('MN5',4,'FREE','YES'),
('MN6',5,'Permanent','YES'),('MN7',5,'FREE','NO'),('MN8',5,'Permanent','YES'),('MN9',5,'FREE','YES'),('MN10',5,'Permanent','YES'),
('MU1',6,'FREE','YES'),('MU2',6,'Permanent','NO'),('MU3',6,'FREE','NO'),('MU4',6,'FREE','YES'),('MU5',6,'Permanent','YES'),
('MW1',7,'Permanent','YES'),('MW2',7,'FREE','NO'),('MW3',7,'FREE','YES'),('MW4',7,'Permanent','YES'),('MW5',7,'FREE','YES'),
('MP1',8,'FREE','YES'),('MP2',8,'Permanent','YES'),('MP3',8,'FREE','YES'),('MP4',8,'Permanent','YES'),('MP5',8,'Permanent','YES'),
('MP6',9,'Permanent','NO'),('MP7',9,'FREE','YES'),('MP8',9,'Permanent','YES'),('MP9',9,'FREE','YES'),('MP10',9,'FREE','YES'),
('MC1',10,'FREE','YES'),('MC2',10,'FREE','YES'),('MC3',10,'FREE','YES'),('MC4',10,'FREE','YES'),('MC5',10,'FREE','YES'),
('MC6',11,'FREE','YES'),('MC7',11,'FREE','NO'),('MC8',11,'FREE','YES'),('MC9',11,'FREE','YES'),('MC10',11,'Permanent','YES'),
('MC11',12,'FREE','YES'),('MC12',12,'FREE','NO'),('MC13',12,'Permanent','YES'),('MC14',12,'FREE','YES'),('MC15',12,'Permanent','YES'),
('MCJ1',13,'Permanent','YES'),('MCJ2',13,'FREE','YES'),('MCJ3',13,'Permanent','NO'),('MCJ4',13,'FREE','YES'),('MCJ5',13,'Permanent','YES'),
('MCJ6',14,'FREE','YES'),('MCJ7',14,'FREE','YES'),('MCJ8',14,'FREE','YES'),('MCJ9',14,'Permanent','YES'),('MCJ10',14,'FREE','YES'),
('MCJ11',15,'Permanent','YES'),('MCJ12',15,'FREE','NO'),('MCJ13',15,'Permanent','YES'),('MCJ14',15,'Permanent','YES'),('MCJ15',15,'Permanent','YES'),
('MS1',16,'FREE','YES'),('MS2',16,'Permanent','YES'),('MS3',16,'FREE','YES'),('MS4',16,'Permanent','YES'),('MS5',16,'FREE','YES'),
('MS6',17,'Permanent','YES'),('MS7',17,'FREE','YES'),('MS8',17,'Permanent','YES'),('MS9',17,'FREE','YES'),('MS10',17,'Permanent','YES'),
('MB1',18,'FREE','NO'),('MB2',18,'FREE','YES'),('MB3',18,'Permanent','NO'),('MB4',18,'FREE','YES'),('MB5',18,'FREE','YES'),
('MB6',19,'Permanent','YES'),('MB7',19,'Permanent','YES'),('MB8',19,'FREE','NO'),('MB9',19,'Permanent','YES'),('MB10',19,'Permanent','YES'),
('MM1',20,'FREE','YES'),('MM2',20,'Permanent','NO'),('MM3',20,'Permanent','NO'),('MM4',20,'FREE','YES'),('MM5',20,'Permanent','YES'),
('MM6',21,'Permanent','YES'),('MM7',21,'FREE','YES'),('MM8',21,'FREE','YES'),('MM9',21,'Permanent','YES'),('MM10',21,'FREE','YES'),
('MM11',22,'Permanent','YES'),('MM12',22,'FREE','YES'),('MM13',22,'FREE','YES'),('MM14',22,'FREE','YES'),('MM15',22,'Permanent','YES');


INSERT INTO CarOwnerDetails VALUES
(1001,'WW 574CE','Maria Anders','Anders.M@gmail.com','NO'),
(1002,'WY 0056','Thomas Hardy','thomashardy@gmail.com','NO'),
(1003,'WU ALEX','Hanna Moos','hannamos@gmail.com','NO'),
(1004,'WSR U343','Frédérique Citeaux','citeauxF@gmail.com','YES'),
(1005,'WUR 6823','Yang Wang','ywang@gmail.com','YES'),
(1006,'WUY 1206','Sven Ottlieb','so159699@gmail.com','NO'),
(1007,'WAW 1598','Howard Snyder','howardsynder@gmail.com','YES'),
(1008,'WX 0016','Alexander Feuer','afleaxander@gmail.com','NO'),
(1009,'WU 1686','Paula Wilson','paula.wilson@gmail.com','YES'),
(1010,'WUR 9587','Karl Jablonski','karl.j@yahoo.com','YES');


INSERT INTO CarStay VALUES
('MK1','WW 574CE','2020-01-15 06:20:01','2020-01-16 16:44:05'),
('MN1','WY 0056','2020-04-25 13:23:44','2020-04-25 16:24:44'),
('MC7','WU ALEX','2020-04-20 16:15:25','2020-05-01 10:10:10'),
('MCJ3','WSR U343','2020-03-23 03:12:14','2020-04-23 10:14:04'),
('MB3','WUR 6823','2020-04-25 13:50:14','2020-04-25 16:24:40'),
('MC12','WUY 1206','2020-02-12 05:15:35','2020-02-12 15:16:16'),
('MM2','WAW 1598','2020-05-25 01:03:05','2020-05-25 08:24:44'),
('MW2','WX 0016','2020-01-18 09:13:00','2020-02-20 09:14:01'),
('MM3','WU 1686','2020-03-03 20:02:02','2020-03-05 21:02:02'),
('MU2','WUR 9587','2020-03-15 22:03:00','2020-03-16 16:25:55');

--3. updates a few selected records

UPDATE CarOwnerDetails 
SET Owner_Name = 'Paula Wilson', Email_Address = 'paula.wilson@gmail.com'
WHERE Car_NumberPlate = 'WUR 9587';

UPDATE ParkingPlace
SET IsAvailable = 'NO'
WHERE ParkingPlace_Id = 'MC13';

UPDATE CarStay 
SET ParkingPlace_Id = 'MN2'
WHERE Car_Id = 12 ;

UPDATE CarPark 
SET IsSlotAvailable = 'NO'
WHERE CarPark_Address LIKE 'aleja%' ;

update CarStay
  set Departure_Time = ''
  where car_id = 27;

update CarStay
  set Arrival_Time = '2020-05-30 23:59:00' , Departure_Time = null
  where car_id = 11;

update CarStay
  set Arrival_Time ='2020-03-23 03:12:14' , Departure_Time = null
  where Car_NumberPlate = 'WY 1456';

update CarStay
  set ParkingPlace_Id = 'MN3'
  where car_id = 15;

insert into CarOwnerDetails values ('1012','WW 547CE','Neil Oberoi','oberoi@gmail.com','NO');

