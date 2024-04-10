CREATE DATABASE MOVIE_CATALOGE_SYSTEM;

USE MOVIE_CATALOGE_SYSTEM;

CREATE TABLE COUNTRY(
    COUNTRY_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    COUNTRY_NAME VARCHAR(30)
);

CREATE TABLE STATES(
    STATE_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    STATE_NAME VARCHAR(30),
    COUNTRY_ID INT,
    CONSTRAINT COUNTRY_ID FOREIGN KEY (COUNTRY_ID)
    REFERENCES COUNTRY(COUNTRY_ID)
);

CREATE TABLE DISTRICT(
    DISTRICT_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DISTRICT_NAME VARCHAR(30),
    STATE_ID INT,
    CONSTRAINT STATE_ID FOREIGN KEY (STATE_ID)
    REFERENCES STATES(STATE_ID)
);

CREATE TABLE USERS(
    USER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    USER_NAME VARCHAR(30),
    USER_ROLE VARCHAR(30),
    USER_EMAIL VARCHAR(80),
    USER_PHONE_NUMBER VARCHAR(20),
    USER_FIRST_NAME VARCHAR(30),
    USER_LAST_NAME VARCHAR(30),
    USER_DOB DATE,
    USER_IDENTITY VARCHAR(20),
    USER_PASSWORD VARCHAR(500),
    CREATED_AT TIMESTAMP
);

CREATE TABLE ADDRESS(
    ADDRESS_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    USER_ID INT,
    CONSTRAINT USER_ID FOREIGN KEY (USER_ID)
    REFERENCES USERS(USER_ID),
    ADDRESS_PINCODE INTEGER,
    ADDRESS_LINE1 VARCHAR(60),
    ADDRESS_LINE2 VARCHAR(60),
    ADDRESS_LANDMARK VARCHAR(80),
    COUNTRY_ID INT,
    CONSTRAINT FK_COUNTRY_ID FOREIGN KEY (COUNTRY_ID)
    REFERENCES COUNTRY(COUNTRY_ID),
    STATE_ID INT,
    CONSTRAINT FK_STATE_ID FOREIGN KEY (STATE_ID)
    REFERENCES STATES(STATE_ID),
    DISTRICT_ID INT,
    CONSTRAINT DISTRICT_ID FOREIGN KEY (DISTRICT_ID)
    REFERENCES DISTRICT(DISTRICT_ID)
);