USE master
GO

DROP DATABASE IF EXISTS BI_DDS
GO

CREATE DATABASE BI_DDS
GO

USE BI_DDS
GO

create table Dim_WeatherCondition(
	WeatherConditionId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_RoadSurfaceCondition(
	RoadSurfaceConditionId INT PRIMARY KEY ,
	Detail varchar(50)
)
go

create table Dim_UrbanRuralArea(
	UrbanRuralAreaId INT PRIMARY KEY ,
	Detail varchar(50)
)
go

create table Dim_JourneyPurpose(
	JourneyPurposeId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_RoadClass(
	RoadClassId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_RoadType(
	RoadTypeId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_Severity(
	SeverityId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_Sex(
	SexId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_AgeBand(
	AgeBandId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_VehicleType(
	VehicleTypeId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_CasualtyType(
	CasualtyTypeId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_CasualtyClass(
	CasualtyClassId INT PRIMARY KEY,
	Detail varchar(50)
)
go

create table Dim_Year(
	YearId INT PRIMARY KEY,
	Year INT
)
go

create table Dim_Month(
	MonthId INT PRIMARY KEY,
	Month INT,
	YearId INT NOT NULL,

	CONSTRAINT FK_Dim_Month_Dim_Year FOREIGN KEY (YearId)
	REFERENCES Dim_Year (YearId)
)
go

create table Dim_Day(
	DayId INT PRIMARY KEY,
	Day INT,
	MonthId INT NOT NULL,

	CONSTRAINT FK_Dim_Day_Dim_Month FOREIGN KEY (MonthId)
	REFERENCES Dim_Month (MonthId)
)
go

create table Dim_Hour(
	HourId INT PRIMARY KEY,
	Hour INT,
	DayId INT NOT NULL,

	CONSTRAINT FK_Dim_Hour_Dim_Day FOREIGN KEY (DayId)
	REFERENCES Dim_Day (DayId)
)
go

create table Dim_Country(
	CountryId INT PRIMARY KEY,
	CountryName varchar(100),
	Status varchar(20)
)
go

create table Dim_Region(
	RegionId INT PRIMARY KEY,
	RegionName varchar(100),
	CountryId INT,
	Status varchar(20)

	CONSTRAINT FK_Dim_Region_Dim_Country FOREIGN KEY (CountryId)
	REFERENCES Dim_Country (CountryId)
)
go

create table Dim_LAD(
	LADId INT PRIMARY KEY,
	LADName varchar(100),
	RegionId INT,
	Status varchar(20)

	CONSTRAINT FK_Dim_LAD_Dim_Region FOREIGN KEY (RegionId)
	REFERENCES Dim_Region (RegionId)
)
go

create table Dim_LSOA(
	LSOAId INT PRIMARY KEY,
	Detail varchar(100),
	LADId INT,
	Status varchar(20)

	CONSTRAINT FK_Dim_LSOA_Dim_LAD FOREIGN KEY (LADId)
	REFERENCES Dim_LAD (LADId)
)
go

create table FactAccident (
	WeatherConditionId INT,
	RoadSurfaceConditionId INT,
	UrbanRuralAreaId INT,
	RoadClassId INT,
	RoadTypeId INT, 
	AccidentSeverityId INT,
	HourId INT,
	VehicleTypeId INT,
	LSOAId INT, 
	JourneyPurposeId INT,
	NumberOfCasualties INT,
	NumberOfVehicldes INT
)

create table FactCasualty (
	VehicleTypeId INT,
	CasualtyClassId INT,
	CasualtyTypeId INT,
	SexId INT,
	AgeBandId INT,
	CasualtySeverityId INT,
	HourId INT,
	LSOAId INT
)

ALTER TABLE FactAccident 
ADD
	CONSTRAINT FK_FactAccident_Dim_WeatherCondition
	FOREIGN KEY(WeatherConditionId)
	REFERENCES Dim_WeatherCondition(WeatherConditionId),

	CONSTRAINT FK_FactAccident_Dim_RoadSurfaceCondition
	FOREIGN KEY(RoadSurfaceConditionId)
	REFERENCES Dim_RoadSurfaceCondition(RoadSurfaceConditionId),

	CONSTRAINT FK_FactAccident_Dim_UrbanRuralArea
	FOREIGN KEY(UrbanRuralAreaId)
	REFERENCES Dim_UrbanRuralArea(UrbanRuralAreaId),

	CONSTRAINT FK_FactAccident_Dim_JourneyPurpose
	FOREIGN KEY(JourneyPurposeId)
	REFERENCES Dim_JourneyPurpose(JourneyPurposeId),

	CONSTRAINT FK_FactAccident_Dim_RoadClass
	FOREIGN KEY(RoadClassId)
	REFERENCES Dim_RoadClass(RoadClassId),

	CONSTRAINT FK_FactAccident_Dim_RoadType
	FOREIGN KEY(RoadTypeId)
	REFERENCES Dim_RoadType(RoadTypeId),

	CONSTRAINT FK_FactAccident_Dim_Severity
	FOREIGN KEY(AccidentSeverityId)
	REFERENCES Dim_Severity(SeverityId),

	CONSTRAINT FK_FactAccident_Dim_VehicleType
	FOREIGN KEY(VehicleTypeId)
	REFERENCES Dim_VehicleType(VehicleTypeId),

	CONSTRAINT FK_FactAccident_Dim_Hour
	FOREIGN KEY(HourId)
	REFERENCES Dim_Hour(HourId),

	CONSTRAINT FK_FactAccident_Dim_LSOA
	FOREIGN KEY(LSOAId)
	REFERENCES Dim_LSOA(LSOAId)
GO

ALTER TABLE FactCasualty
ADD
	CONSTRAINT FK_FactCasualty_Dim_Sex
	FOREIGN KEY(SexId)
	REFERENCES Dim_Sex(SexId),

	CONSTRAINT FK_FactCasualty_Dim_AgeBand
	FOREIGN KEY(AgeBandId)
	REFERENCES Dim_AgeBand(AgeBandId),

	CONSTRAINT FK_FactCasualty_Dim_CasualtyClass
	FOREIGN KEY(CasualtyClassId)
	REFERENCES Dim_CasualtyClass(CasualtyClassId),

	CONSTRAINT FK_FactCasualty_Dim_CasualtyType
	FOREIGN KEY(CasualtyTypeId)
	REFERENCES Dim_CasualtyType(CasualtyTypeId),

	CONSTRAINT FK_FactCasualty_Dim_Severity
	FOREIGN KEY(CasualtySeverityId)
	REFERENCES Dim_Severity(SeverityId),

	CONSTRAINT FK_FactCasualty_Dim_VehicleType
	FOREIGN KEY(VehicleTypeId)
	REFERENCES Dim_VehicleType(VehicleTypeId),

	CONSTRAINT FK_FactCasualty_Dim_Hour
	FOREIGN KEY(HourId)
	REFERENCES Dim_Hour(HourId),

	CONSTRAINT FK_FactCasualty_Dim_LSOA
	FOREIGN KEY(LSOAId)
	REFERENCES Dim_LSOA(LSOAId)
GO
--------------------------------------------------------