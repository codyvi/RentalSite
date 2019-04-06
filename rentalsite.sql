/*
    David Alonso Cantú Martínez 
    A00822455
    Video DataBase
*/

CREATE TABLE Director(
	DirectorNo varchar(1) Not NULL,
    DirectorName varchar(15) Not NULL, 
    primary key (DirectorNo)
)Engine=InnoDB;

CREATE TABLE Video(
    catalogNo CHAR(1) NOT NULL,
	title VARCHAR(15) NOT NULL,
	Certificate varchar(15) NOT NULL,
    category varchar(15) NOT NULL,
    dailyRental decimal(60) NOT NULL,
    price decimal(30) NOT NULL, 
    DirectorNo varchar(1) NOT NULL, 
	PRIMARY KEY(catalogNo),
    foreign key (DirectorNo) references Director(DirectorNo)
)Engine=InnoDB;

CREATE TABLE VideoForRent(
    VideoNo varchar(15) NOT NULL,
    available varchar(15) Not NULL,
    catalogNo varchar(1) Not NULL, 
    primary key(videoNo),
    foreign key(catalogNo) references video(catalogNo)
)Engine=InnoDB;

CREATE TABLE Member(
    memberNo varchar(15) NOT NULL,
    fname varchar(15) NOT NULL, 
    lname varchar(15) NOT NULL, 
    sex char(1) NOT NULL, 
    DOB DATETIME NULL,  
    address varchar(30) NULL, 
    dateJoined DATETIME NOT NULL,
    primary key(memberNo)
)Engine=InnoDB;

CREATE TABLE RentalAgreement(
    RentalNo varchar(1) NOT NULL, 
    memberNo varchar(15) NOT NULL,
    VideonO varchar(15) NOT NULL,
    dateOut DATETIME NOT NULL,
    dateReturn DATETIME NULL, 
    primary key(RentalNo),
    foreign key(memberNo) references Member(memberNo),
    foreign key(videoNo) references VideoForRent(videoNo)
)Engine=InnoDB;


/* Inserts */

INSERT INTO director VALUES('1', 'George Lucas');
INSERT INTO director VALUES('2', 'Steven Spillberg');
INSERT INTO director VALUES('3', 'David Cantu');

INSERT INTO video VALUES('1', 'Star Wars', 'SSL', 'Sci-Fi', '18', '25', '1');
INSERT INTO video VALUES('2', 'Star Wars II', 'SSL', 'Sci-Fi', '15', '25', '1');
INSERT INTO video VALUES('3', 'Shazam', 'SSL', 'Action', '3', '20', '30');

INSERT INTO videoforrent VALUES('1', 'NO', '1');
INSERT INTO videoforrent VALUES('2', 'YES', '1');
INSERT INTO videoforrent VALUES('4', 'YES', '2');
INSERT INTO videoforrent VALUES('3', 'YES', '3');

INSERT INTO Member VALUES('1', 'David', 'Martinez','M', '2000-04-21', '450 Stone, Houston, TX', '2015-05-17');
INSERT INTO Member VALUES('2', 'Emiliano', 'Bayli','M', '1998-03-27', '449 Stone, Houston, TX', '2015-06-23');
INSERT INTO Member VALUES('3', 'Sofía', 'Hernandez','F', '1997-06-27', '731 Fondren, Houston, TX', '2016-03-01');

INSERT INTO RentalAgreement VALUES('1', '2', '1', '2019-03-05', null)
