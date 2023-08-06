-- Script SQL

---- Drop the tables

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Travelers;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Trip;
DROP TABLE IF EXISTS Length;
DROP TABLE IF EXISTS Way_point;
DROP TABLE IF EXISTS Transport;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Trip_Transport;
DROP TABLE IF EXISTS Customers_Trip;
DROP TABLE IF EXISTS Staff_Trip;
DROP TABLE IF EXISTS Customers_Address;
DROP TABLE IF EXISTS Trip_Length;
DROP TABLE IF EXISTS Trip_Way_Point;
DROP TABLE IF EXISTS Transport;
DROP TABLE IF EXISTS Ticket_Way_Point;
DROP TABLE IF EXISTS Ticket_Length;

---- Create the tables

------ Customers

CREATE TABLE Customers (
    Id_c             INT AUTO_INCREMENT NOT NULL,
    Lastname_c       VARCHAR(100),
    FirstName_c      VARCHAR(50),
    Phone_c          VARCHAR(50),
    Email_c          VARCHAR(100),
    Gender           VARCHAR(50),
    Age              DATE,
    Total_travellers INT,
    PRIMARY KEY (Id_c)
)

------ Travelers 
CREATE TABLE Travelers (
    Id_travel             INT AUTO_INCREMENT NOT NULL,
    Lastname_travel       VARCHAR(100),
    FirstName_travel      VARCHAR(50),
    Gender                VARCHAR(50),
    Age                   DATE,
    Id_c                  INT NOT NULL,
    PRIMARY KEY (Id_c)
)

------ Address

CREATE TABLE Address(
        Id_a              INT AUTO_INCREMENT NOT NULL,
        Street_number     VARCHAR (100),
        Street_name       VARCHAR (100),
        Residence_name    VARCHAR (100),
        Building_name     VARCHAR (100),
        Floor             Int,
        Zip_code          VARCHAR (100),
        City              VARCHAR (25),
        Complement        VARCHAR (100),
        Type_address      VARCHAR (100),
        PRIMARY KEY (Id_a)
)

------ Staff

CREATE TABLE Staff(
        Id_staff            INT AUTO_INCREMENT NOT NULL,
        Lastname_staff      VARCHAR (100),
        Firstname_staff     VARCHAR (100),
        Phone_staff         VARCHAR (100),
        Email_staff         VARCHAR (100),
        Hiring_date         Date,
        Id_a                INT NOT NULL,
        PRIMARY KEY (Id_staff)
)
------ Trip

CREATE TABLE Trip(
        Id_trip         INT AUTO_INCREMENT NOT NULL,
        Start_date      Date,
        Start_time      Time,
        End_date        Date,
        End_time        Time,
        PRIMARY KEY (Id_trip)
)

------ Length

CREATE TABLE Length(
        Id_length       INT AUTO_INCREMENT NOT NULL,
        City_1          VARCHAR (100),
        City_2          VARCHAR (100),
        Length          Int,
        PRIMARY KEY (Id_length)
)

------ Way_point

CREATE TABLE Way_point(
        Id_w        INT AUTO_INCREMENT NOT NULL,
        Flat_rate   Real,
        City_w      VARCHAR (100),
        PRIMARY KEY (Id_w)
)

------ Transport

CREATE TABLE Transport(
        Id_t        INT AUTO_INCREMENT NOT NULL,
        Type_t      VARCHAR (100),
        City_access VARCHAR (100),
        PRIMARY KEY (Id_t)
)

------ Ticket

CREATE TABLE Ticket(
        Id_ticket        INT AUTO_INCREMENT NOT NULL,
        Payment_type     VARCHAR (100),
        Payment_date     Real,
        Purchase_date    Date,
        Id_c             INT NOT NULL,
        PRIMARY KEY (Id_ticket)
)

------ Payment

CREATE TABLE Payment(
        Id_p                    INT AUTO_INCREMENT NOT NULL,
        Number_monthly_payment  INT,
        Invoicing_date          Date,
        Id_ticket               INT  NOT NULL,
        PRIMARY KEY (Id_p)
)

------ Trip_Transport

CREATE TABLE Trip_Transport(
        Id_trip_Trip       INT NOT NULL,
        Id_t_Transport     INT NOT NULL,
        PRIMARY KEY (Id_trip_Trip,Id_t_Transport)
)

------ Customers_Trip

CREATE TABLE Customers_Trip(
        Id_trip_Trip       INT NOT NULL,
        Id_c_Customers     INT NOT NULL,
        PRIMARY KEY (Id_trip_Trip,Id_c_Customers)
)

------ Staff_Trip

CREATE TABLE Staff_Trip(
        Id_trip_Trip       INT NOT NULL,
        Id_staff_Staff     INT NOT NULL,
        PRIMARY KEY (Id_trip_Trip,Id_staff_Staff)
)

------ Customers_Address

CREATE TABLE Customers_Address(
        Id_a_Address       INT NOT NULL,
        Id_c_Customers     INT NOT NULL,
        PRIMARY KEY (Id_a_Address,Id_c_Customers)
)

------ Trip_length

CREATE TABLE Trip_Length(
        Id_trip_Trip         INT NOT NULL,
        Id_length_Length     INT NOT NULL,
        PRIMARY KEY (Id_trip_Trip,Id_length_Length)
)

------ Trip_Way_point

CREATE TABLE Trip_Way_point(
        Id_trip_Trip       INT NOT NULL,
        Id_w_Way_point     INT NOT NULL,
        PRIMARY KEY (Id_trip_Trip,Id_w_Way_point)
)

------ Ticket_Way_point

CREATE TABLE Ticket_Way_point(
        Id_w_Way_point       INT NOT NULL,
        Id_ticket_Ticket     INT NOT NULL,
        PRIMARY KEY (Id_w_Way_point,Id_ticket_Ticket)
)

------ Ticket_Length

CREATE TABLE Ticket_Length(
        Id_length_Length     INT NOT NULL,
        Id_ticket_Ticket     INT NOT NULL,
        PRIMARY KEY (Id_length_Length,Id_ticket_Ticket)
)