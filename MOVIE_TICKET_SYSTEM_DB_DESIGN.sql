CREATE DATABASE MOVIE_TICKET_SYSTEM;
USE MOVIE_TICKET_SYSTEM;
CREATE TABLE MOVIES(MOVIE_ID INT PRIMARY KEY, MOVIE_TITLE VARCHAR(60) NOT NULL, MOVIE_RELEASE_DATE DATE NOT NULL,MOVIE_DIRECTOR varchar(30));
CREATE TABLE THEATRES(THEATRE_ID INT PRIMARY KEY, THEATRE_NAME VARCHAR(60) NOT NULL,THEATRE_LOCATION varchar(30),NO_OF_SCREENS int);
CREATE TABLE SCREENS(SCREEN_ID INT PRIMARY KEY, THEATRE_ID INT NOT NULL, SCREEN_CAPACITY int,FOREIGN KEY(THEATRE_ID) REFERENCES THEATRES(THEATRE_ID));
CREATE TABLE USERS(USER_ID INT PRIMARY KEY, USER_NAME VARCHAR(60), USER_EMAIL VARCHAR(20) NOT NULL UNIQUE,USER_PASSWORD varchar(30) NOT NULL UNIQUE);
CREATE TABLE TICKETS(TICKET_ID INT PRIMARY KEY, SEAT_NUMBER varchar(3) NOT NULL,SCREEN_ID int NOT NULL, TIMING DATETIME,MOVIE_ID int,FOREIGN KEY(MOVIE_ID) REFERENCES MOVIES(MOVIE_ID),foreign key(SCREEN_ID)references SCREENS(SCREEN_ID));
CREATE TABLE SHOWTIME(SHOWTIME_ID INT PRIMARY KEY, MOVIE_ID INT NOT NULL, SCREEN_ID INT NOT NULL, AVAILABLE_SEATS INT NOT NULL,TOTAL_SEATS INT NOT NULL,START_TIME TIME,END_TIME TIME,TICKET_PRICE INT NOT NULL,FOREIGN KEY(MOVIE_ID) REFERENCES MOVIES(MOVIE_ID),FOREIGN KEY(SCREEN_ID) REFERENCES SCREENS(SCREEN_ID));
CREATE TABLE BOOKINGS(BOOKING_ID INT PRIMARY KEY, USER_ID INT, SHOWTIME_ID INT, NO_OF_TICKETS INT NOT NULL, TOTAL_AMOUNT INT NOT NULL, BOOKING_DATE DATETIME,FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID),FOREIGN KEY(SHOWTIME_ID) REFERENCES SHOWTIME(SHOWTIME_ID));
CREATE TABLE USER_HISTORY(S_NO INT UNIQUE NOT NULL PRIMARY KEY AUTO_INCREMENT,USER_ID INT, MOVIE_ID INT, DATE DATETIME);

DESCRIBE SHOWTIME;