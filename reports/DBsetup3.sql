
USE hospital;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Patient; 
CREATE TABLE Patient(
	healthid INTEGER(9),
	healthinfo CHAR(100),
	name CHAR(20),
	phonenum CHAR(10),
	address CHAR(100),
	city CHAR(25),
	postal_code CHAR(7),
	province CHAR(30),
	PRIMARY KEY(healthid));

/*This is the trigger to check for constraints on patient inserts*/
DROP TRIGGER IF EXISTS check_patient_insert;
DELIMITER $$
CREATE TRIGGER `check_patient_insert` BEFORE INSERT ON `Patient`
FOR EACH ROW
BEGIN
    IF (new.healthid < 0) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'heatlhid must be positive';
	ELSEIF (char_length(new.phonenum) <> 10) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'phonenum must contain only 10 digits';
	ELSEIF (not (new.province = 'British Columbia' OR new.province ='Ontario' OR new.province = 'Alberta' OR new.province = 'Manitoba' OR new.province = 'Quebec'
		OR new.province = 'Nunavut' OR new.province = 'Northwest Territories' OR new.province = 'Sasketchewan' OR new.province = 'Yukon' OR new.province = 'Nova Scotia'
	OR new.province = 'New Brunswick' OR new.province = 'Newfoundland' OR new.province = 'Prince Edward Island')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not a defined province';
	ELSEIF (not (substring(new.postal_code,1,1) regexp '^[A-Z]' AND substring(new.postal_code,2,1) regexp '^[0-9]' AND substring(new.postal_code,3,1) regexp '^[A-Z]'
	AND substring(new.postal_code,5,1) regexp '^[0-9]' AND substring(new.postal_code,6,1) regexp '^[A-Z]' AND substring(new.postal_code,7,1) regexp '^[0-9]'
	AND substring(new.postal_code,4,1) = ' ')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Postal code not in correct format: A1A 1A1';
    END IF;
END$$   
DELIMITER ;

/*This is the trigger to check for constraints on patient updates*/
DROP TRIGGER IF EXISTS check_patient_update;
DELIMITER $$
CREATE TRIGGER `check_patient_update` BEFORE UPDATE ON `Patient`
FOR EACH ROW
BEGIN
	IF (char_length(new.phonenum) <> 10) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'phonenum must contain only 10 digits';
	ELSEIF (not (new.province = 'British Columbia' OR new.province ='Ontario' OR new.province = 'Alberta' OR new.province = 'Manitoba' OR new.province = 'Quebec'
		OR new.province = 'Nunavut' OR new.province = 'Northwest Territories' OR new.province = 'Sasketchewan' OR new.province = 'Yukon' OR new.province = 'Nova Scotia'
	OR new.province = 'New Brunswick' OR new.province = 'Newfoundland' OR new.province = 'Prince Edward Island')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not a defined province';
	ELSEIF (not (substring(new.postal_code,1,1) regexp '^[A-Z]' AND substring(new.postal_code,2,1) regexp '^[0-9]' AND substring(new.postal_code,3,1) regexp '^[A-Z]'
	AND substring(new.postal_code,5,1) regexp '^[0-9]' AND substring(new.postal_code,6,1) regexp '^[A-Z]' AND substring(new.postal_code,7,1) regexp '^[0-9]'
	AND substring(new.postal_code,4,1) = ' ')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Postal code not in correct format: A1A 1A1';
    END IF;
END$$   
DELIMITER ;

DROP TABLE IF EXISTS Staff; 
CREATE TABLE Staff(
	sin INTEGER(9),
	name CHAR(20),
	phonenum CHAR(10),
	address CHAR(100),
	city CHAR(25),
	postal_code CHAR(7),
	province CHAR(30),
	PRIMARY KEY(SIN));


/*This is the trigger to check for constraints on staff inserts*/
DROP TRIGGER IF EXISTS check_staff_insert;
DELIMITER $$
CREATE TRIGGER `check_staff_insert` BEFORE INSERT ON `Staff`
FOR EACH ROW
BEGIN
    IF (new.sin < 0) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'SIN must be positive';
	ELSEIF (char_length(new.phonenum) <> 10) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'phonenum must contain only 10 digits';
	ELSEIF (not (new.province = 'British Columbia' OR new.province ='Ontario' OR new.province = 'Alberta' OR new.province = 'Manitoba' OR new.province = 'Quebec'
		OR new.province = 'Nunavut' OR new.province = 'Northwest Territories' OR new.province = 'Sasketchewan' OR new.province = 'Yukon' OR new.province = 'Nova Scotia'
	OR new.province = 'New Brunswick' OR new.province = 'Newfoundland' OR new.province = 'Prince Edward Island')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not a defined province';
	ELSEIF (char_length(new.phonenum) <> 10) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'phonenum must contain only 10 digits';
	ELSEIF (not (substring(new.postal_code,1,1) regexp '^[A-Z]' AND substring(new.postal_code,2,1) regexp '^[0-9]' AND substring(new.postal_code,3,1) regexp '^[A-Z]'
	AND substring(new.postal_code,5,1) regexp '^[0-9]' AND substring(new.postal_code,6,1) regexp '^[A-Z]' AND substring(new.postal_code,7,1) regexp '^[0-9]'
	AND substring(new.postal_code,4,1) = ' ')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Postal code not in correct format: A1A 1A1';
    END IF;
END$$   
DELIMITER ;

/*This is the trigger to check for constraints on staff updates*/
DROP TRIGGER IF EXISTS check_staff_updates;
DELIMITER $$
CREATE TRIGGER `check_staff_updates` BEFORE UPDATE ON `Staff`
FOR EACH ROW
BEGIN
    IF (new.sin < 0) THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'SIN must be positive';
	ELSEIF (char_length(new.phonenum) <> 10) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'phonenum must contain only 10 digits';
	ELSEIF (not (new.province = 'British Columbia' OR new.province ='Ontario' OR new.province = 'Alberta' OR new.province = 'Manitoba' OR new.province = 'Quebec'
		OR new.province = 'Nunavut' OR new.province = 'Northwest Territories' OR new.province = 'Sasketchewan' OR new.province = 'Yukon' OR new.province = 'Nova Scotia'
	OR new.province = 'New Brunswick' OR new.province = 'Newfoundland' OR new.province = 'Prince Edward Island')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not a defined province';
	ELSEIF (char_length(new.phonenum) <> 10) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'phonenum must contain only 10 digits';
	ELSEIF (not (substring(new.postal_code,1,1) regexp '^[A-Z]' AND substring(new.postal_code,2,1) regexp '^[0-9]' AND substring(new.postal_code,3,1) regexp '^[A-Z]'
	AND substring(new.postal_code,5,1) regexp '^[0-9]' AND substring(new.postal_code,6,1) regexp '^[A-Z]' AND substring(new.postal_code,7,1) regexp '^[0-9]'
	AND substring(new.postal_code,4,1) = ' ')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Postal code not in correct format: A1A 1A1';
    END IF;
END$$   
DELIMITER ;

DROP TABLE IF EXISTS Hospital; 
CREATE TABLE Hospital(
	name CHAR(50),
	city CHAR(25),
	address CHAR(100),
	postal_code CHAR(7),
	province CHAR(30),
	PRIMARY KEY(name, city));

/*This is the trigger to check for constraints on hospital*/
DROP TRIGGER IF EXISTS check_hospital;
DELIMITER $$
CREATE TRIGGER `check_hospital` BEFORE INSERT ON `Hospital`
FOR EACH ROW
BEGIN
	IF (not (new.province = 'British Columbia' OR new.province ='Ontario' OR new.province = 'Alberta' OR new.province = 'Manitoba' OR new.province = 'Quebec'
		OR new.province = 'Nunavut' OR new.province = 'Northwest Territories' OR new.province = 'Sasketchewan' OR new.province = 'Yukon' OR new.province = 'Nova Scotia'
	OR new.province = 'New Brunswick' OR new.province = 'Newfoundland' OR new.province = 'Prince Edward Island')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not a defined province';
	ELSEIF (not (substring(new.postal_code,1,1) regexp '^[A-Z]' AND substring(new.postal_code,2,1) regexp '^[0-9]' AND substring(new.postal_code,3,1) regexp '^[A-Z]'
	AND substring(new.postal_code,5,1) regexp '^[0-9]' AND substring(new.postal_code,6,1) regexp '^[A-Z]' AND substring(new.postal_code,7,1) regexp '^[0-9]'
	AND substring(new.postal_code,4,1) = ' ')) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Postal code not in correct format: A1A 1A1';
    END IF;
END$$   
DELIMITER ;

DROP TABLE IF EXISTS Room; 
CREATE TABLE Room(
	level INTEGER(1),
	roomnum INTEGER(3),
	name CHAR(50),
	city CHAR(25),
	PRIMARY KEY(level, roomnum, name, city),
	FOREIGN KEY(name, city) references Hospital(name, city)
	ON DELETE CASCADE);


DROP TABLE IF EXISTS Office; 
CREATE TABLE Office(
	level INTEGER(1),
	roomnum INTEGER(3),
	name CHAR(50),
	city CHAR(25),
	PRIMARY KEY(level, roomnum, name, city),
	FOREIGN KEY(level, roomnum, name, city) references
	Room(level, roomnum, name, city)
	ON DELETE cascade);

DROP TABLE IF EXISTS SurgeryRoom;
CREATE TABLE SurgeryRoom(
	level INTEGER(1),
	roomnum INTEGER(3),
	name CHAR(50),
	city CHAR(25),
	PRIMARY KEY(level, roomnum, name, city),
	FOREIGN KEY(level, roomnum, name, city) references
	Room(level, roomnum, name, city)
	ON DELETE cascade);

DROP TABLE IF EXISTS Nurse;
CREATE TABLE Nurse(
	sin INTEGER(9),
	PRIMARY KEY(sin),
	FOREIGN KEY(sin) references Staff(sin)
	ON DELETE cascade
	ON UPDATE CASCADE);

DROP TABLE IF EXISTS Security;
CREATE TABLE Security(
	sin INTEGER(9),
	PRIMARY KEY(sin),
	FOREIGN KEY(sin) references Staff(sin)
	ON DELETE cascade
	ON UPDATE CASCADE);

DROP TABLE IF EXISTS Janitor;
CREATE TABLE Janitor(
	sin INTEGER(9),
	PRIMARY KEY(sin),
	FOREIGN KEY(sin) references Staff(sin)
	ON DELETE cascade
	ON UPDATE CASCADE);

DROP TABLE IF EXISTS Receptionist;
CREATE TABLE Receptionist(
	sin INTEGER(9),
	PRIMARY KEY(sin),
	FOREIGN KEY(sin) references Staff(sin)
	ON DELETE cascade
	ON UPDATE CASCADE);


DROP TABLE IF EXISTS Physician;
CREATE TABLE Physician(
	sin INTEGER(9),
	specialty CHAR(20),
	office_room INTEGER(3),
	office_name CHAR(50),
	office_level INTEGER(1),
	office_city CHAR(25),
	PRIMARY KEY(sin),
	FOREIGN KEY(sin) references Staff(sin)
	ON DELETE cascade 
	ON UPDATE CASCADE,
	FOREIGN KEY(office_level,office_room,office_name,office_city) references Office(level,roomnum,name,city)
	ON DELETE SET NULL
	ON UPDATE CASCADE);

DROP TABLE IF EXISTS Procedures; 
CREATE TABLE Procedures(
	proid INTEGER(11),
	healthid INTEGER(11),
	sin INTEGER(9),
	description CHAR(100),
	date DATE,
	time CHAR(5),
	PRIMARY KEY(proid),
	FOREIGN KEY(healthid) references Patient(healthid)
	ON DELETE cascade 
	ON UPDATE CASCADE,
	FOREIGN KEY(sin) references Physician(sin)
	ON DELETE cascade
	ON UPDATE CASCADE);


DROP TABLE IF EXISTS PatientStaysIn; 
CREATE TABLE PatientStaysIn(
	healthid INTEGER(11),
	roomnum INTEGER(3),
	level INTEGER(1),
	name CHAR(50),
	city CHAR(25),
	PRIMARY KEY(healthid, roomnum, level, name, city),
	FOREIGN KEY(level,roomnum,name,city) references Room(level,roomnum,name,city)
	ON DELETE cascade 
	ON UPDATE CASCADE,
	FOREIGN KEY(healthid) references Patient(healthid)
	ON DELETE cascade
	ON UPDATE CASCADE);

DROP TABLE IF EXISTS ProcedureInRoom; 
CREATE TABLE ProcedureInRoom(
	proid INTEGER(11),
	level INTEGER(1),
	roomnum INTEGER(3),
	name CHAR(50),
	city CHAR(25),
	PRIMARY KEY(proid, level, roomnum, name, city),
	FOREIGN KEY(level, roomnum, name, city) references
	Room(level, roomnum, name, city)
	ON DELETE cascade 
	ON UPDATE CASCADE,
	FOREIGN KEY(proid) references Procedures(proid)
	ON DELETE cascade 
	ON UPDATE CASCADE);
	
DROP TABLE IF EXISTS WorksAt; 
CREATE TABLE WorksAt(
	sin INTEGER(9),
	name CHAR(50),
	city CHAR(25),
	PRIMARY KEY(sin, name, city),
	FOREIGN KEY(name, city) references Hospital(name, city)
	ON DELETE cascade 
	ON UPDATE CASCADE,
	FOREIGN KEY(sin) references Staff(sin)
	ON DELETE cascade
	ON UPDATE CASCADE);

SET FOREIGN_KEY_CHECKS=1;

INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000000, "Oberyn Martell", 6047883456, "1234 Cambie St", "Vancouver", "R4A 5P3", "British Columbia");
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000001, "Sansa Stark", 6044455778, "3453 Main St", 'Vancouver', 'V5R 4T6', "British Columbia");
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000002, "Arya Stark", 6044445778, "3453 Main St", 'Vancouver', 'V5R 4T6', "British Columbia");
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000003, "Cercie Lannister", 6046663666, '4433 Wicked Drive', 'Vancouver', 'V5R 4B5', 'British Columbia');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000004, "Master Pycelle", 6049985674, '6969 Sexsmith Drive', 'Vancouver', 'V5R 4T3', 'British Columbia');

INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000000, "Jaime Lannister", 6047783438, '3443 Sexsmith Drive', 'Edmonton', 'T4T 8H2', 'Alberta');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000001, "Tyrion Lannister", 6043458765, '9221 Halfman St', 'Calgary', 'T4A 6Z3', 'Alberta');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000002, "Tywin Lannister", 6045539834, '3221 Lemons St', 'Calgary', 'T7R 0K3', 'Alberta');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000003, "Shae Jor", 6045527843, '642 Perki St', 'Winnipeg', 'R4A 5T2', 'Manitoba');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000004, "Sandor Clegane", 6042348745, '1742 Main St', 'Toronto', 'K7T 4T2', 'Ontario');

INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000000, "Jon Snow", 4033452345, '5643 Lost Drive', 'North Wall', 'X3R 3R1', 'Northwest Territories');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000001, "Peter Baelish", 6044422558, '1135 Creek Lake', 'Vancouver', 'V5R 4T6', 'British Columbia');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000002, "Varys Bald", 6042255994, '9642, Sneeky St', 'Vancouver', 'V3R 5T2', 'British Columbia');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000003, "Lysa Stark", 6045533425, '3312 Robson St', 'Vancouver', 'V3T 3F4', 'British Columbia');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000004, "Robert Baratheon", 6045792452, '8201 Swine St', 'Vancouver', 'V8Y 4R3', 'British Columbia');

INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (400000000, "Gregor Clegane", 6048823491, '3326 Trout Lake', 'Vancouver', 'V3T 2T4', 'British Columbia');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (400000001, "Rafaat Mir", 6044422557, '4564 Main Mall', 'Vancouver', 'V5R 1G4', 'British Columbia');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (400000002, "Theon Grinch", 4032345135, '5211 Cold St', 'Elfcity', 'X3T 3L8', 'Nunavut');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (400000003, "Stannis Baratheon", 6042348549, '7632 Dragonwell St', 'Vancouver', 'V3E 5T3', 'British Columbia');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (400000004, "Dany Targaryen", 4052383451, '5322 Workman St', 'Quebic City', 'G8R 1B3', 'Quebec');

INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (500000000, 'Jorah Mormont', 6047783452, '6363 Burrard St', 'Vancouver', 'V7R 3U2', 'British Columbia');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (500000001, 'Grey Worm', 6047628412, '6930 West Mall', 'Vancouver', 'V7H 4V3', 'British Columbia' );
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (500000002, 'Noble Man', 4053258932, '9205 Argyle Drive', 'Vancouver', 'V3T 0T0', 'British Columbia');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (500000003, 'Harry Potter', 4053456789, '5443 Magic St', 'London', 'K8I 7B7', 'Ontario');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (500000004, 'Renly Baratheon', 6043352484, '619 Mysterous Drive', 'Toronto', 'K4T 3R1', 'Ontario');

/* */
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000005, 'Bobby Ryan', 4057783452, '6363 Burrard St', 'Toronto', 'K7R 3U2', 'Ontario');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000006, 'Gabriel Lam', 4057628412, '6930 West Mall', 'Mississuaga', 'K7H 4V3', 'Ontario' );
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000007, 'Hodar Sadar', 4053258932, '9205 Argyle Drive', 'Mississuaga', 'K3T 0T0', 'Ontario');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000008, 'Harry Wong', 4053456789, '5443 Magic St', 'London', 'K8I 7B7', 'Ontario');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (100000009, 'Renly Wu', 4053352484, '619 Mysterous Drive', 'London', 'K4T 3R1', 'Ontario');

INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000005, 'Dion Phaneuf', 4057783452, '6363 Burrard St', 'Waterloo', 'K7R 3U2', 'Ontario');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000006, 'Carey Price', 4057628412, '6930 West Mall', 'Montreal', 'G7H 4V3', 'Quebec' );
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000007, 'P.K. Subban', 4053245634, '9205 Argyle Drive', 'Montreal', 'G3T 0T0', 'Quebec');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000008, 'Dale Weise', 4053100069, '5443 Magic St', 'Montreal', 'G8I 7B7', 'Quebec');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (200000009, 'Henrik Sedin', 4053876484, '619 Mysterous Drive', 'Halifax', 'K4T 3R1', 'Nova Scotia');

INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000005, 'Megan Wong', 4056423452, '6363 Burrard St', 'Waterloo', 'K7R 3U2', 'Ontario');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000006, 'Rachel Adams', 4057645612, '6930 West Mall', 'Toronto', 'K7H 4V3', 'Ontario' );
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000007, 'Melissa White', 4053568932, '9205 Argyle Drive', 'Toronto', 'K3T 0T0', 'Ontario');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000008, 'Melody Brown', 4056466789, '5443 Magic St', 'London', 'K8I 7B7', 'Ontario');
INSERT INTO Staff(sin,name,phonenum,address,city,postal_code,province) VALUES (300000009, 'Julie Winters', 4053352484, '619 Mysterous Drive', 'Toronto', 'K4T 3R1', 'Ontario');
/* */



INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000000, 'Has severe asthma','Walter White','6042224432','3125 Blackwaters St','Vancouver','V5R 3U9','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000001, 'Has HIV','Robb Stark','6043324432','6364 Gerald St','Vancouver','V5I 3I9','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000002, 'No known diseases','Roose Bolton','6046464432','4353 Traitors Drive','Vancouver','V5N 3J1','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000003, 'No known diseases','Scarlett Johannson','6042624552','124 Main St','Richmond','V5R 8K9','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000004, 'Has breast cancer','Catelyn Tully','6042724432','3179 Blackwaters St','Surrey','V5Z 6X9','British Columbia');

INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000005, 'No known diseases','Skyler White','6042224432','3125 Blackwaters St','Vancouver','V5R 3U9','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000006, 'Heart disease','Tony Stark','6043324432','6364 Gerald St','Vancouver','V5I 3I9','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000007, 'Has mental illness','Ramsay Bolton','6046464432','4353 Traitors Drive','Vancouver','V5N 3J1','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000008, 'No known diseases','Max Payne','7782678222','550 Ackoryd Rd.','Richmond','V1B 3U9','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000009, 'Has colon cancer','Richard Tully','6042724432','3179 Blackwaters St','Surrey','V5Z 6X9','British Columbia');

INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000010, 'Has cerebral palsy','Flynn White','6042224432','3125 Blackwaters St','Vancouver','V5R 3U9','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000011, 'No known diseases','Nina Fung','7789222554','111 Lones Way','Coquitlam','V0D 2X5','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000012, 'No known diseases','Angela King','6046464432','5531 Street & Kingsway','Vancouver','V6J 2L6','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000013, 'No known diseases','Megan Fox','6042624552','124 Main St','Richmond','V5R 8K9','British Columbia');
INSERT INTO Patient(healthid, healthinfo, name, phonenum ,address, city, postal_code, province) VALUES (00000014, 'No known diseases','Katy Tully','6042724432','3179 Blackwaters St','Surrey','V5Z 6X9','British Columbia');
	
	
INSERT INTO Hospital(name,city,address,postal_code,province) VALUES ('Iron Council Hospital', 'Vancouver', '3453 Oldsmith Drive', 'V6R 3T8', 'British Columbia');
INSERT INTO Hospital(name,city,address,postal_code,province) VALUES ('St Peters Hospital', 'Vancouver', '4644 Silky Way', 'V7P 4M2', 'British Columbia');

-- Hospitals with no rooms
INSERT INTO Hospital(name,city,address,postal_code,province) VALUES ('St Kings Hospital', 'Toronto', '2342 Helpme St','K5R 3N8', 'Ontario');
INSERT INTO Hospital(name,city,address,postal_code,province) VALUES ('Montreal General Hospital', 'Montreal', '4421 Biggums St', 'G6F 9T5', 'Quebec');
INSERT INTO Hospital(name,city,address,postal_code,province) VALUES ('Richmond General Hospital', 'Richmond', '7721 Hells Way','V9L 3F8', 'British Columbia');

INSERT INTO Nurse( sin) VALUES (100000000);
INSERT INTO Nurse( sin) VALUES (100000001);
INSERT INTO Nurse( sin) VALUES (100000002);
INSERT INTO Nurse( sin) VALUES (100000003);
INSERT INTO Nurse( sin) VALUES (100000004);
INSERT INTO Nurse( sin) VALUES (100000005);
INSERT INTO Nurse( sin) VALUES (100000006);
INSERT INTO Nurse( sin) VALUES (200000007);
INSERT INTO Nurse( sin) VALUES (200000008);

INSERT INTO Security( sin) VALUES (200000000);
INSERT INTO Security( sin) VALUES (200000001);
INSERT INTO Security( sin) VALUES (200000002);
INSERT INTO Security( sin) VALUES (200000003);
INSERT INTO Security( sin) VALUES (200000004);
INSERT INTO Security( sin) VALUES (300000000);
INSERT INTO Security( sin) VALUES (100000007);
INSERT INTO Security( sin) VALUES (200000009);

INSERT INTO Janitor( sin) VALUES (200000004);
INSERT INTO Janitor( sin) VALUES (400000000);
INSERT INTO Janitor( sin) VALUES (400000001);
INSERT INTO Janitor( sin) VALUES (400000002);
INSERT INTO Janitor( sin) VALUES (400000003);
INSERT INTO Janitor( sin) VALUES (400000004);
INSERT INTO Janitor( sin) VALUES (100000008);
INSERT INTO Janitor( sin) VALUES (300000005);

INSERT INTO Receptionist( sin) VALUES (300000000);
INSERT INTO Receptionist( sin) VALUES (300000001);
INSERT INTO Receptionist( sin) VALUES (300000002);
INSERT INTO Receptionist( sin) VALUES (300000003);
INSERT INTO Receptionist( sin) VALUES (300000004);
INSERT INTO Receptionist( sin) VALUES (200000003);
INSERT INTO Receptionist( sin) VALUES (200000004);
INSERT INTO Receptionist( sin) VALUES (100000008);
INSERT INTO Receptionist( sin) VALUES (300000006);

INSERT INTO Room(level,roomnum,name,city) VALUES (1, 100, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 200, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 300, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (4, 400, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (5, 500, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (1, 101, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 201, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 301, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (4, 401, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (5, 501, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (1, 102, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 202, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 302, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (4, 402, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (5, 502, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (1, 103, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 203, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 303, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (4, 403, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (5, 503, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (1, 104, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 204, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 304, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (4, 404, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (5, 504, 'Iron Council Hospital', 'Vancouver');

INSERT INTO Room(level,roomnum,name,city) VALUES (1, 100, 'St Peters Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 200, 'St Peters Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 300, 'St Peters Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (4, 400, 'St Peters Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (5, 500, 'St Peters Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (1, 101, 'St Peters Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 201, 'St Peters Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 301, 'St Peters Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (4, 401, 'St Peters Hospital', 'Vancouver');
INSERT INTO Room(level,roomnum,name,city) VALUES (5, 501, 'St Peters Hospital', 'Vancouver');

INSERT INTO Room(level,roomnum,name,city) VALUES (1, 100, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 200, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 300, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (4, 400, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (5, 500, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (6, 600, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (7, 700, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (8, 800, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (1, 101, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 201, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 301, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (4, 401, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (5, 501, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (6, 601, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (7, 701, 'St Kings Hospital', 'Toronto');
INSERT INTO Room(level,roomnum,name,city) VALUES (8, 801, 'St Kings Hospital', 'Toronto');

INSERT INTO Room(level,roomnum,name,city) VALUES (1, 100, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (1, 101, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (1, 102, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (1, 103, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 200, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 201, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 202, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (2, 203, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 300, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 301, 'Montreal General Hospital', 'Montreal');
INSERT INTO Room(level,roomnum,name,city) VALUES (3, 302, 'Montreal General Hospital', 'Montreal');

INSERT INTO Office(level,roomnum,name,city) VALUES (3, 300, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Office(level,roomnum,name,city) VALUES (4, 400, 'St Peters Hospital', 'Vancouver');
INSERT INTO Office(level,roomnum,name,city) VALUES (5, 500, 'St Peters Hospital', 'Vancouver');
INSERT INTO Office(level,roomnum,name,city) VALUES (5, 501, 'St Peters Hospital', 'Vancouver');
INSERT INTO Office(level,roomnum,name,city) VALUES (4, 400, 'Iron Council Hospital', 'Vancouver');
INSERT INTO Office(level,roomnum,name,city) VALUES (2, 200, 'St Kings Hospital', 'Toronto');
INSERT INTO Office(level,roomnum,name,city) VALUES (2, 201, 'St Kings Hospital', 'Toronto');
INSERT INTO Office(level,roomnum,name,city) VALUES (3, 300, 'St Kings Hospital', 'Toronto');
INSERT INTO Office(level,roomnum,name,city) VALUES (3, 301, 'St Kings Hospital', 'Toronto');
INSERT INTO Office(level,roomnum,name,city) VALUES (3, 300, 'Montreal General Hospital', 'Montreal');
INSERT INTO Office(level,roomnum,name,city) VALUES (3, 301, 'Montreal General Hospital', 'Montreal');
INSERT INTO Office(level,roomnum,name,city) VALUES (3, 302, 'Montreal General Hospital', 'Montreal');

INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (1,100,'Iron Council Hospital', 'Vancouver');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (1,101,'Iron Council Hospital', 'Vancouver');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (1,102,'Iron Council Hospital', 'Vancouver');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (1,100,'St Peters Hospital', 'Vancouver');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (1,101,'St Peters Hospital', 'Vancouver');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (2,200,'St Peters Hospital', 'Vancouver');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (2,201,'St Peters Hospital', 'Vancouver');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (1,100,'St Kings Hospital', 'Toronto');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (1,101,'St Kings Hospital', 'Toronto');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (1,100,'Montreal General Hospital', 'Montreal');
INSERT INTO SurgeryRoom(level,roomnum,name,city) VALUES (2,200,'Montreal General Hospital', 'Montreal');

INSERT INTO WorksAt(sin, name, city) VALUES (100000000, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (100000001, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (100000002, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (200000000, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (200000001, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (200000002, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (300000000, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (300000001, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (300000002, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (400000000, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (400000001, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (500000000, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (500000001, 'Iron Council Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (500000004, 'Iron Council Hospital', 'Vancouver');

INSERT INTO WorksAt(sin, name, city) VALUES (100000003, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (100000004, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (200000003, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (200000004, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (300000003, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (300000004, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (400000002, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (400000003, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (400000004, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (500000002, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (500000003, 'St Peters Hospital', 'Vancouver');
INSERT INTO WorksAt(sin, name, city) VALUES (500000004, 'St Peters Hospital', 'Vancouver');

INSERT INTO WorksAt(sin, name, city) VALUES (100000005, 'St Kings Hospital', 'Toronto');
INSERT INTO WorksAt(sin, name, city) VALUES (100000006, 'St Kings Hospital', 'Toronto');
INSERT INTO WorksAt(sin, name, city) VALUES (100000007, 'St Kings Hospital', 'Toronto');
INSERT INTO WorksAt(sin, name, city) VALUES (100000008, 'St Kings Hospital', 'Toronto');
INSERT INTO WorksAt(sin, name, city) VALUES (100000009, 'St Kings Hospital', 'Toronto');
INSERT INTO WorksAt(sin, name, city) VALUES (200000005, 'St Kings Hospital', 'Toronto');
INSERT INTO WorksAt(sin, name, city) VALUES (200000006, 'St Kings Hospital', 'Toronto');

INSERT INTO WorksAt(sin, name, city) VALUES (200000007, 'Montreal General Hospital', 'Montreal');
INSERT INTO WorksAt(sin, name, city) VALUES (200000008, 'Montreal General Hospital', 'Montreal');
INSERT INTO WorksAt(sin, name, city) VALUES (200000009, 'Montreal General Hospital', 'Montreal');
INSERT INTO WorksAt(sin, name, city) VALUES (300000005, 'Montreal General Hospital', 'Montreal');
INSERT INTO WorksAt(sin, name, city) VALUES (300000006, 'Montreal General Hospital', 'Montreal');
INSERT INTO WorksAt(sin, name, city) VALUES (300000007, 'Montreal General Hospital', 'Montreal');
INSERT INTO WorksAt(sin, name, city) VALUES (300000008, 'Montreal General Hospital', 'Montreal');
INSERT INTO WorksAt(sin, name, city) VALUES (300000009, 'Montreal General Hospital', 'Montreal');

INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (500000000,'Cancer Specialist',300,'Iron Council Hospital', 3, 'Vancouver');
INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (500000001,'Family',500,'St Peters Hospital', 5, 'Vancouver' );
INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (500000002,'Neurosurgery',400,'St Peters Hospital', 4, 'Vancouver' );
INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (500000003,'Family', 501, 'St Peters Hospital', 5, 'Vancouver' );
INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (500000004,'General Surgery', 400, 'Iron Council Hospital', 4, 'Vancouver');

INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (100000009,'General Surgery', 200, 'St Kings Hospital', 2, 'Toronto');
INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (200000005,'Family', 201, 'St Kings Hospital', 2, 'Toronto');
INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (200000006,'Cardiologist', 300, 'St Kings Hospital', 3, 'Toronto');

INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (300000007,'Family', 300, 'Montreal General Hospital', 3, 'Montreal');
INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (300000008,'Family', 301, 'Montreal General Hospital', 3, 'Montreal');
INSERT INTO Physician(sin, specialty,office_room,office_name,office_level,office_city) VALUES (300000009,'General Surgery', 302, 'Montreal General Hospital', 3, 'Montreal');

INSERT INTO Procedures(proid,healthid,sin,description,date,time) VALUES (00000, 000000000, 500000001, 'Asthma treatment', '2012-12-12', '12:30');
INSERT INTO Procedures(proid,healthid,sin,description,date,time) VALUES (00001, 000000000, 500000001, 'Asthma treatment', '2012-12-14', '9:30');
INSERT INTO Procedures(proid,healthid,sin,description,date,time) VALUES (00002, 000000000, 500000003, 'Asthma treatment', '2012-12-17', '15:30');
INSERT INTO Procedures(proid,healthid,sin,description,date,time) VALUES (00003, 000000001, 500000001, 'Check up', '2013-01-04', '12:15');
INSERT INTO Procedures(proid,healthid,sin,description,date,time) VALUES (00004, 000000002, 500000003, 'Check up', '2013-01-19', '14:45');
INSERT INTO Procedures(proid,healthid,sin,description,date,time) VALUES (00005, 000000003, 500000004, 'Biospy', '2012-12-12', '10:45');
INSERT INTO Procedures(proid,healthid,sin,description,date,time) VALUES (00006, 000000004, 500000000, 'Cancer treatment', '2012-12-19', '12:30');
INSERT INTO Procedures(proid,healthid,sin,description,date,time) VALUES (00007, 000000004, 500000000, 'Cancer treatment', '2012-01-07', '12:30');

INSERT INTO ProcedureInRoom(proid, level, roomnum, name, city) VALUES(00005, 2, 200, 'Iron Council Hospital', 'Vancouver');
INSERT INTO ProcedureInRoom(proid, level, roomnum, name, city) VALUES(00000, 5, 500, 'St Peters Hospital', 'Vancouver');
INSERT INTO ProcedureInRoom(proid, level, roomnum, name, city) VALUES(00001, 5, 500, 'St Peters Hospital', 'Vancouver');
INSERT INTO ProcedureInRoom(proid, level, roomnum, name, city) VALUES(00002, 5, 501, 'St Peters Hospital', 'Vancouver');
INSERT INTO ProcedureInRoom(proid, level, roomnum, name, city) VALUES(00003, 5, 500, 'St Peters Hospital', 'Vancouver');
INSERT INTO ProcedureInRoom(proid, level, roomnum, name, city) VALUES(00004, 5, 501, 'St Peters Hospital', 'Vancouver');
INSERT INTO ProcedureInRoom(proid, level, roomnum, name, city) VALUES(00006, 3, 300, 'Iron Council Hospital', 'Vancouver');
INSERT INTO ProcedureInRoom(proid, level, roomnum, name, city) VALUES(00007, 3, 300, 'Iron Council Hospital', 'Vancouver');

INSERT INTO PatientStaysIn(healthid, roomnum, level, name, city) VALUES(00000003, 200, 2, 'Iron Council Hospital', 'Vancouver');
INSERT INTO PatientStaysIn(healthid, roomnum, level, name, city) VALUES(00000007, 100, 1, 'St Peters Hospital', 'Vancouver');
INSERT INTO PatientStaysIn(healthid, roomnum, level, name, city) VALUES(00000011, 500, 5, 'St Kings Hospital', 'Toronto');
INSERT INTO PatientStaysIn(healthid, roomnum, level, name, city) VALUES(00000012, 202, 2, 'Montreal General Hospital', 'Montreal');
INSERT INTO PatientStaysIn(healthid, roomnum, level, name, city) VALUES(00000013, 201, 2, 'Montreal General Hospital', 'Montreal');
