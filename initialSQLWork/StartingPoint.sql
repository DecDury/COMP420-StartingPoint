#This file creates and inserts all the contents for the StartingPoint Database

CREATE DATABASE startingpoint;

USE startingpoint;

CREATE TABLE parent (
	ID INT(6) NOT NULL AUTO_INCREMENT,
	LastName VARCHAR(30) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	Phone VARCHAR(12) NOT NULL,
	DateOfArrival VARCHAR(10) NOT NULL,
	DateReceived VARCHAR(10) NOT NULL,
	CountryOfOrigin VARCHAR(30) NOT NULL,
	Status VARCHAR(10) NOT NULL,
	PRIMARY KEY (ID)
);


CREATE TABLE children (
	ID INT(6) NOT NULL,
	ChildFirstName VARCHAR(30) NOT NULL,
	Gender VARCHAR(1) NOT NULL,
	Age INT(3) NOT NULL,
	ShoeSize INT(2) NOT NULL,
	PRIMARY KEY (ID,ChildFirstName),
	FOREIGN KEY (ID) REFERENCES parent(ID)
);


CREATE TABLE health (
	ID INT(6) NOT NULL,
	ChildFirstName VARCHAR(30) NOT NULL,
	HealthNeeds VARCHAR(100) NOT NULL,
	PRIMARY KEY (ID, ChildFirstName),
	FOREIGN KEY (ID, ChildFirstName) REFERENCES children(ID, ChildFirstName)
);


CREATE TABLE requesteditems (
	ID INT(6) NOT NULL,
	Item VARCHAR(100) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID) REFERENCES parent(ID)
);


CREATE TABLE location (
	ID INT(6) NOT NULL,
	AddressNumber VARCHAR(6) NOT NULL,
	Street VARCHAR(50) NOT NULL,
	AptNumber VARCHAR(4) NOT NULL,
	ZipCode INT(5) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (ID) REFERENCES parent(ID)
);


CREATE TABLE city (
	ZipCode INT(5) NOT NULL,
	City VARCHAR(50) NOT NULL,
	PRIMARY KEY (ZipCode)#,
	#FOREIGN KEY (ZipCode) REFERENCES location(ZipCode)
);

# Inserting contents

# parent
INSERT INTO parent (ID, LastName, FirstName, Phone, DateOfArrival, DateReceived, CountryOfOrigin, Status) VALUES (154,'Ahmadi','Mo','916-833-9999','11/1/19','1/4/21','Afg','SIV');
INSERT INTO parent (ID, LastName, FirstName, Phone, DateOfArrival, DateReceived, CountryOfOrigin, Status) VALUES (155,'Rahim','Sohel','916-285-1000','8/28/19','1/8/21','Afg/Tky','ref');
INSERT INTO parent (ID, LastName, FirstName, Phone, DateOfArrival, DateReceived, CountryOfOrigin, Status) VALUES (156,'Kurilenko','Yelena','916-285-1001','12/8/20','1/15/21','Russia','parole');
INSERT INTO parent (ID, LastName, FirstName, Phone, DateOfArrival, DateReceived, CountryOfOrigin, Status) VALUES (157,'Sayedi','Hayat','916-272-6000','12/16/20','1/20/21','Afg','SIV');
INSERT INTO parent (ID, LastName, FirstName, Phone, DateOfArrival, DateReceived, CountryOfOrigin, Status) VALUES (158,'Jalil','Ghayoor','313-338-9999','1/18/21','1/29/21','Afg','SIV');
INSERT INTO parent (ID, LastName, FirstName, Phone, DateOfArrival, DateReceived, CountryOfOrigin, Status) VALUES (159,'Adel','Sediq','222-222-2222','1/21/21','2/7/21','Afg','SIV');

# children
# Wanted to make default value if no name provided.
# However this breaks using it as a composite primary key (duplicate entries)
#ALTER TABLE children ALTER ChildFirstName SET DEFAULT 'NoNameProvided';

INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Latif',154,'f',8,3);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Elham',154,'m',7,2);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Asma',154,'f',3,9);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Mohammad',154,'m',12,6);
# INSERT INTO children (ID,Gender,Age,ShoeSize) VALUES (155,'f',18,9);
# INSERT INTO children (ID,Gender,Age,ShoeSize) VALUES (155,'m',6,13);
# INSERT INTO children (ID,Gender,Age) VALUES (156,'f',6);
INSERT INTO children (ChildFirstName,ID,Gender,Age) VALUES ('Frozan',157,'f',19);
INSERT INTO children (ChildFirstName,ID,Gender,Age) VALUES ('Asma',157,'f',17);
INSERT INTO children (ChildFirstName,ID,Gender,Age) VALUES ('Husna',157,'f',14);
INSERT INTO children (ChildFirstName,ID,Gender,Age) VALUES ('Hadia',157,'f',11);
INSERT INTO children (ChildFirstName,ID,Gender,Age) VALUES ('Zahra',157,'f',5);
INSERT INTO children (ChildFirstName,ID,Gender,Age) VALUES ('Rasheed',157,'m',13);
INSERT INTO children (ChildFirstName,ID,Gender,Age) VALUES ('Almas',157,'m',9);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Faya',158,'m',10,37);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Bahara',158,'f',8,33);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Khudija',158,'f',7,32);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Elias',158,'m',4,30);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Arif',158,'m',2,29);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Hadia',159,'f',15,37);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Zahra',159,'f',13,35);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Fereshta',159,'f',12,35);
INSERT INTO children (ChildFirstName,ID,Gender,Age,ShoeSize) VALUES ('Rafi',159,'m',11,37);

# health
INSERT INTO health (ID, ChildFirstName, HealthNeeds) VALUES (154, 'Latif', 'Asthma');
INSERT INTO health (ID, ChildFirstName, HealthNeeds) VALUES (158, 'Arif', 'Type 1 Diabetes');

# requestedItems
INSERT INTO requesteditems (ID, Item) VALUES (155, 'Toiletries');
INSERT INTO requesteditems (ID, Item) VALUES (156, 'Large Blanket');
INSERT INTO requesteditems (ID, Item) VALUES (159, 'Rug');

# location
INSERT INTO location (ID, AddressNumber, Street, AptNumber, ZipCode) VALUES (154,'2223','Fast Avenue','18',95821);
INSERT INTO location (ID, AddressNumber, Street, AptNumber, ZipCode) VALUES (155,'5420','Slow Lane','48',95660);
INSERT INTO location (ID, AddressNumber, Street, AptNumber, ZipCode) VALUES (156,'3000','Howe Avenue','21',95821);
INSERT INTO location (ID, AddressNumber, Street, AptNumber, ZipCode) VALUES (157,'9165','Boomtown Drive','21',95826);
INSERT INTO location (ID, AddressNumber, Street, AptNumber, ZipCode) VALUES (158,'3500','Bulb Avenue','E305',95821);
INSERT INTO location (ID, AddressNumber, Street, AptNumber, ZipCode) VALUES (159,'2222','North Pole','106',95821);

# city
INSERT INTO city (ZipCode,City) VALUES (95821, 'Sacramento');
INSERT INTO city (ZipCode,City) VALUES (95660, 'N Highlands');
