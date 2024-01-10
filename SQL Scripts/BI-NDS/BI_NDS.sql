USE master
GO

DROP DATABASE IF EXISTS BI_NDS
GO

CREATE DATABASE BI_NDS
GO

USE BI_NDS
GO

CREATE TABLE Year (
	YearId INT PRIMARY KEY IDENTITY(1,1),
	Year INT NOT NULL,
​
	CONSTRAINT CK_Year CHECK(Year BETWEEN 1990 AND 2023)
)
GO

CREATE TABLE Month (
	MonthId INT PRIMARY KEY IDENTITY(1,1),
	Month INT NOT NULL,
	YearId INT NOT NULL,
​
	CONSTRAINT CK_Month CHECK(Month BETWEEN 1 AND 12),
	CONSTRAINT FK_Month_Year FOREIGN KEY (YearId)
	REFERENCES Year (YearId)
)
GO

CREATE TABLE Day (
	DayId INT PRIMARY KEY IDENTITY(1, 1),
	Day INT NOT NULL,
	MonthId INT NOT NULL,
​
	CONSTRAINT CK_Day CHECK(Day BETWEEN 1 AND 31),
	CONSTRAINT FK_Day_Month FOREIGN KEY (MonthId)
	REFERENCES Month(MonthId)
)
GO

CREATE TABLE Hour (
	HourId INT PRIMARY KEY IDENTITY(1, 1),
	Hour INT NOT NULL,
	DayId INT NOT NULL,
​
	CONSTRAINT CK_Hour CHECK(Hour BETWEEN 0 AND 23),
	CONSTRAINT FK_Hour_Day FOREIGN KEY (DayId)
	REFERENCES Day(DayId)
)
GO

-- Year Data 
INSERT INTO Year (Year) VALUES (2011);
INSERT INTO Year (Year) VALUES (2012);
INSERT INTO Year (Year) VALUES (2013);
INSERT INTO Year (Year) VALUES (2014);
GO

CREATE PROCEDURE MonthData @year INT
AS
BEGIN
	DECLARE @m INT = 1;
	WHILE @m <= 12
	BEGIN
		INSERT INTO Month(Month, YearId) VALUES (@m, @year);
		SET @m = @m + 1
	END
END
GO

CREATE PROCEDURE DayData @month INT, @dayCount INT
AS
BEGIN
	DECLARE @d INT = 1;
	WHILE @d <= @dayCount
	BEGIN
		INSERT INTO dbo.Day (MonthId, Day) VALUES (@month, @d);
		SET @d = @d + 1;
	END;
END;
GO

CREATE PROCEDURE HourData @dayCount INT
AS
BEGIN
	DECLARE @day INT = 1
	WHILE @day <= @dayCount
	BEGIN
		DECLARE @h INT = 0;

		WHILE @h <= 23
		BEGIN
			INSERT INTO Hour (DayId, Hour) VALUES (@day, @h);
			SET @h = @h + 1;
		END;

		SET @day = @day + 1;
	END;
END;
GO


-- Month Data 
EXEC MonthData 1; -- 2011 months data
EXEC MonthData 2; -- 2012 months data
EXEC MonthData 3; -- 2013 months data
EXEC MonthData 4; -- 2014 months data
GO

-- Day Data
-- 2011
EXEC DayData 1, 31
EXEC DayData 2, 28 -- 2011 Feb has 28 days
EXEC DayData 3, 31
EXEC DayData 4, 30
EXEC DayData 5, 31
EXEC DayData 6, 30
EXEC DayData 7, 31
EXEC DayData 8, 31
EXEC DayData 9, 30
EXEC DayData 10, 31
EXEC DayData 11, 30
EXEC DayData 12, 31

-- 2012
EXEC DayData 13, 31
EXEC DayData 14, 29 -- 2012 Feb has 29 days
EXEC DayData 15, 31
EXEC DayData 16, 30
EXEC DayData 17, 31
EXEC DayData 18, 30
EXEC DayData 19, 31
EXEC DayData 20, 31
EXEC DayData 21, 30
EXEC DayData 22, 31
EXEC DayData 23, 30
EXEC DayData 24, 31

-- 2013
EXEC DayData 25, 31
EXEC DayData 26, 28 -- 2013 Feb has 28 days
EXEC DayData 27, 31
EXEC DayData 28, 30
EXEC DayData 29, 31
EXEC DayData 30, 30
EXEC DayData 31, 31
EXEC DayData 32, 31
EXEC DayData 33, 30
EXEC DayData 34, 31
EXEC DayData 35, 30
EXEC DayData 36, 31

-- 2014
EXEC DayData 37, 31
EXEC DayData 38, 28 -- 2014 Feb has 28 days
EXEC DayData 39, 31
EXEC DayData 40, 30
EXEC DayData 41, 31
EXEC DayData 42, 30
EXEC DayData 43, 31
EXEC DayData 44, 31
EXEC DayData 45, 30
EXEC DayData 46, 31
EXEC DayData 47, 30
EXEC DayData 48, 31
GO

-- Hour Data 
DECLARE @dayCount INT;
SELECT @dayCount = count(*) FROM Day
EXEC HourData @dayCount
GO

CREATE TABLE Country (
	Id INT PRIMARY KEY IDENTITY(1,1),
	CountryId varchar(20) NOT NULL,
	Name VARCHAR(100),
	SourceId INT NOT NULL,
	CreatedDate datetime,
	UpdatedDate datetime
)
GO

CREATE TABLE Region (
	Id INT PRIMARY KEY IDENTITY(1,1),
	RegionId varchar(20) NOT NULL,
	Name VARCHAR(100),
	CountryId INT NOT NULL,
	SourceId INT NOT NULL,
	CreatedDate datetime,
	UpdatedDate datetime

	CONSTRAINT FK_Region_Country FOREIGN KEY (CountryId)
	REFERENCES Country (Id)
)
GO

CREATE TABLE LAD (
	Id INT PRIMARY KEY IDENTITY(1,1),
	LADId varchar(20) NOT NULL,
	Name VARCHAR(100),
	RegionId INT NOT NULL,
	SourceId INT NOT NULL,
	CreatedDate datetime,
	UpdatedDate datetime

	CONSTRAINT FK_LAD_Region FOREIGN KEY (RegionId)
	REFERENCES Region (Id)
)
GO

CREATE TABLE LSOA (
	Id INT PRIMARY KEY IDENTITY(1,1),
	LSOAId varchar(20) NOT NULL,
	Name VARCHAR(100),
	LADId INT NOT NULL,
	SourceId INT NOT NULL,
	CreatedDate datetime,
	UpdatedDate datetime

	CONSTRAINT FK_LSOA_LAD FOREIGN KEY (LADId)
	REFERENCES LAD (Id)
)
GO

create table WeatherCondition (
	Id int identity(1,1) PRIMARY KEY,
	WeatherConditionId varchar(10),
	Name varchar(50),
	SourceID int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go  

Create table RoadSurfaceCondition (
	Id int identity(1,1) PRIMARY KEY,
	RoadSurfaceConditionId varchar(10),
	Name varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table UrbanOrRuralArea (
	Id int identity(1,1) PRIMARY KEY,
	UrbanOrRuralAreaId varchar(10),
	Name varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table RoadClass (
	Id int identity(1,1) PRIMARY KEY,
	RoadClassId varchar(10),
	Name varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table RoadType (
	Id int identity(1,1) PRIMARY KEY,
	RoadTypeId varchar(10),
	Name varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table Severity (
	Id int identity(1,1) PRIMARY KEY,
	SeverityId varchar(10),
	SeverityDetail varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table CasualtyClass (
	Id int identity(1,1) PRIMARY KEY,
	CasualtyClassId varchar(10),
	Name varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table CasualtyType (
	Id int identity(1,1) PRIMARY KEY,
	CasualtyTypeId varchar(10),
	Detail varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table Sex (
	Id int identity(1,1) PRIMARY KEY,
	SexId varchar(10),
	Name varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table Ageband (
	Id int identity(1,1) PRIMARY KEY,
	AgebandId varchar(10),
	Detail varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table VehicleType (
	Id int identity(1,1) PRIMARY KEY,
	VehicleTypeId varchar(10),
	Detail varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

Create table JourneyPurposeofDriver (
	Id int identity(1,1) PRIMARY KEY,
	JourneyPurposeofDriverId varchar(10),
	Detail varchar(50),
	SourceId int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go

CREATE TABLE Accident (
    Id INT PRIMARY KEY IDENTITY(1,1),
    AccidentIndex VARCHAR(20),
    LocationEastingOSGR int,
    LocationNorthingOSGR int,
    Longitude varchar(10),
    Latitude varchar(10),
    AccidentSeverityId INT,
    Time TIME,
    SpeedLimit INT,
    NumberOfCasualties INT,
    NumberOfVehicles INT,
    HourId int,
    WeatherConditionsId INT,
    RoadSurfaceConditionsId INT,
    UrbanOrRuralAreaId INT,
    FirstRoadClass int,
    SecondRoadClass int,
    FirstRoadNumber int,
    SecondRoadNumber int,
    RoadTypeId INT,
    LSOAId INT,
    SourceId INT,
    CreatedDate DATETIME,
    UpdatedDate DATETIME
)
go

CREATE TABLE Casualties (
    Id INT PRIMARY KEY IDENTITY(1,1),
    AccidentId int,
    VehicleReference INT,
    CasualtyReference INT,
    CasualtyClassId INT,
    CasualtyTypeId INT,
    SexOfCasualty int,
    AgeBandOfCasualty int,
    AgeOfCasualty INT,
    CasualtySeverityId INT,
    SourceId INT,
    CreatedDate DATETIME,
    UpdatedDate DATETIME, 
); 
go

CREATE TABLE Vehicle (
    Id INT PRIMARY KEY IDENTITY(1,1),
    AccidentId int,
    VehicleReference INT,
    VehicleType INT,
    JourneyPurposeOfDriver INT,
    SexOfDriver INT,
    AgeOfDriver INT,
    AgeBandOfDriver INT,
    AgeOfVehicle INT,
    SourceId INT,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
);
-------------------------------------------------
ALTER TABLE Accident 
ADD
	CONSTRAINT FKACCIDENTHOUR
	FOREIGN KEY(HourId)
	REFERENCES Hour(HourId),

	CONSTRAINT FKACCIDENTLSOA
	FOREIGN KEY(LSOAId)
	REFERENCES LSOA(Id),

	CONSTRAINT FKACCIDENTWEATHER
	FOREIGN KEY(WeatherConditionsId)
	REFERENCES WeatherCondition(Id),

	CONSTRAINT FKACCIDENTRoadCondition
	FOREIGN KEY(RoadSurfaceConditionsId)
	REFERENCES RoadSurfaceCondition(Id),

	CONSTRAINT FKACCIDENTUrbanOrRural
	FOREIGN KEY(UrbanOrRuralAreaId)
	REFERENCES UrbanOrRuralArea(Id),

	CONSTRAINT FKACCIDENTFirstRoadClass
	FOREIGN KEY(FirstRoadClass)
	REFERENCES RoadClass(Id),

	CONSTRAINT FKACCIDENTSecondRoadClass
	FOREIGN KEY(SecondRoadClass)
	REFERENCES RoadClass(Id),

	CONSTRAINT FKACCIDENTRoadType
	FOREIGN KEY(RoadTypeId)
	REFERENCES RoadType(Id),

	CONSTRAINT FKACCIDENTSeverity
	FOREIGN KEY(AccidentSeverityId)
	REFERENCES Severity(Id)

go
---------------------------------------------
ALTER TABLE Casualties 
ADD
	CONSTRAINT FKCasualtiesCasualtiesClass
	FOREIGN KEY(CasualtyClassId)
	REFERENCES CasualtyClass(Id),

	CONSTRAINT FKCasualtiesCasualtyType
	FOREIGN KEY(CasualtyTypeId)
	REFERENCES CasualtyType(Id),

	CONSTRAINT FKCasualtiesSexOfCasualty
	FOREIGN KEY(SexOfCasualty)
	REFERENCES Sex(Id),

	CONSTRAINT FKCasualtiesAgeBandOfCasualty
	FOREIGN KEY(AgeBandOfCasualty)
	REFERENCES Ageband(Id),

	CONSTRAINT FKCasualtiesCasualtySeverityId
	FOREIGN KEY(CasualtySeverityId)
	REFERENCES Severity(Id),

	CONSTRAINT FKCasualtiesAccident
	FOREIGN KEY(AccidentId)
	REFERENCES Accident(Id),

	CONSTRAINT FKCasualties_CasualtiesType
	FOREIGN KEY(CasualtyClassId)
	REFERENCES CasualtyType(Id)
go
-----------------------------------------------------

ALTER TABLE Vehicle
ADD
	CONSTRAINT FKVehicleJourneyPurposeOfDriver
	FOREIGN KEY(JourneyPurposeOfDriver)
	REFERENCES JourneyPurposeofDriver(Id),

	CONSTRAINT FKVehicleVehicleType
	FOREIGN KEY(VehicleType)
	REFERENCES VehicleType(Id),

	CONSTRAINT FKVehicleSexOfCasualty
	FOREIGN KEY(SexOfDriver)
	REFERENCES Sex(Id),

	CONSTRAINT FKVehicleAgeBandOfCasualty
	FOREIGN KEY(AgeBandOfDriver)
	REFERENCES Ageband(Id),

	CONSTRAINT FKVehicleAccident
	FOREIGN KEY(AccidentId)
	REFERENCES Accident(Id)
go
--------------------------