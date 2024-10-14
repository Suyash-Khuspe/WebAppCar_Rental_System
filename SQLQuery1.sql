create database CRMS

create table Car_details
(
	CPlateNum varchar(50) primary key,
	Brand varchar(50) not null,
	Model varchar(50) not null,
	Price int not null,
	Color varchar(50) not null,
	Cstatus varchar(50) not null
)

create table customer
(
	Custid int primary key IDENTITY(1000,1),
	CustName varchar(50),
	CustAdd varchar(50),
	CustPhone varchar(50),
	CustPassword varchar(50)
)
alter table rent alter column car varchar(50)not null

create table Rent
(
	RentId int primary key identity(1000,1),
	Car int,
	Customer int,
	Rentdate date,
	Returndate date,
	Fees int
)

create database CRMS

create table Car_details
(
	CPlateNum varchar(50) primary key,
	Brand varchar(50) not null,
	Model varchar(50) not null,
	Price int not null,
	Color varchar(50) not null,
	Cstatus varchar(50) not null
)

create table customer
(
	Custid int primary key IDENTITY(1000,1),
	CustName varchar(50),
	CustAdd varchar(50),
	CustPhone varchar(50),
	CustPassword varchar(50)
)
alter table rent alter column car varchar(50)not null

create table Rent
(
	RentId int primary key identity(1000,1),
	Car int,
	Customer int,
	Rentdate date,
	Returndate date,
	Fees int
)

CREATE TABLE CReturn
(
	Rentid int NOT NULL,
    Car varchar(50) NOT NULL,
    Customer int NOT NULL,
    RDate date NOT NULL,
    CDelay int NOT NULL,
    Fine int NOT NULL,
    CONSTRAINT FK_CReturn_Car FOREIGN KEY (Car) REFERENCES Car_details(CPlateNum),
    CONSTRAINT FK_CReturn_Customer FOREIGN KEY (Customer) REFERENCES customer(Custid)
);


	
select * from Car_details
select * from customer
select * from rent
SELECT * from CReturn

drop table CReturn
delete from creturn where CDelay=0


CREATE PROCEDURE sp_addcar
    @CPlateNum NVARCHAR(50),
    @Brand NVARCHAR(50),
    @Model NVARCHAR(50),
    @Price INT,
    @Color NVARCHAR(50),
    @Cstatus NVARCHAR(50)
AS
BEGIN
    INSERT INTO Car_details (CPlateNum, Brand, Model, Price, Color, Cstatus)
    VALUES (@CPlateNum, @Brand, @Model, @Price, @Color, @Cstatus)
END

CREATE PROCEDURE sp_updatecar
    @OriginalCPlateNum NVARCHAR(50),
    @CPlateNum NVARCHAR(50),
    @Brand NVARCHAR(50),
    @Model NVARCHAR(50),
    @Price INT,
    @Color NVARCHAR(50),
    @Cstatus NVARCHAR(50)
AS
BEGIN
    UPDATE Car_details 
    SET CPlateNum = @CPlateNum, 
        Brand = @Brand, 
        Model = @Model, 
        Price = @Price, 
        Color = @Color, 
        Cstatus = @Cstatus
    WHERE CPlateNum = @OriginalCPlateNum
END

CREATE PROCEDURE sp_deletecar
    @CPlateNum NVARCHAR(50)
AS
BEGIN
    DELETE FROM Car_details WHERE CPlateNum = @CPlateNum
END

CREATE PROCEDURE sp_addcustomer
    @CustName NVARCHAR(100),
    @CustAdd NVARCHAR(255),
    @CustPhone NVARCHAR(15),
    @CustPassword NVARCHAR(50)
AS
BEGIN
    INSERT INTO Customer (CustName, CustAdd, CustPhone, CustPassword)
    VALUES (@CustName, @CustAdd, @CustPhone, @CustPassword)
END

CREATE PROCEDURE sp_updatecustomer
    @Custid INT,
    @CustName NVARCHAR(100),
    @CustAdd NVARCHAR(255),
    @CustPhone NVARCHAR(15),
    @CustPassword NVARCHAR(50)
AS
BEGIN
    UPDATE Customer
    SET CustName = @CustName,
        CustAdd = @CustAdd,
        CustPhone = @CustPhone,
        CustPassword = @CustPassword
    WHERE Custid = @Custid
END

CREATE PROCEDURE sp_deletecustomer
    @Custid INT
AS
BEGIN
    DELETE FROM Customer
    WHERE Custid = @Custid
END

CREATE PROCEDURE sp_addCarReturn
    @RentId INT,
    @Car NVARCHAR(50),
    @Customer INT,
    @Rentdate DATE,
    @Delay INT,
    @Fine INT
AS
BEGIN
    INSERT INTO CReturn (RentId, Car, Customer, RDate, CDelay, Fine)
    VALUES (@RentId, @Car, @Customer, @Rentdate, @Delay, @Fine)
END

CREATE PROCEDURE sp_updateCarStatus
    @CPlateNum NVARCHAR(50)
AS
BEGIN
    UPDATE Car_details
    SET Cstatus = 'Available'
    WHERE CPlateNum = @CPlateNum
END

CREATE PROCEDURE sp_deleteRent
    @RentId INT
AS
BEGIN
    DELETE FROM Rent
    WHERE RentId = @RentId
END

CREATE PROCEDURE sp_addRent
    @Car NVARCHAR(50),
    @Customer INT,
    @Rentdate DATE,
    @Returndate DATE,
    @Fees INT
AS
BEGIN
    INSERT INTO Rent (Car, Customer, Rentdate, Returndate, Fees)
    VALUES (@Car, @Customer, @Rentdate, @Returndate, @Fees)
END

CREATE PROCEDURE sp_updateCarStatusCust
    @CPlateNum NVARCHAR(50)
AS
BEGIN
    UPDATE car_details
    SET Cstatus = 'Booked'
    WHERE CPlateNum = @CPlateNum
END


