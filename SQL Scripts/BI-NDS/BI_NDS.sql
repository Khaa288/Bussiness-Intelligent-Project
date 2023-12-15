--create database BI_NDS
use BI_NDS
go

create table WeatherCondition (
	Id int identity(1,1) PRIMARY KEY,
	WeatherConditionId varchar(10),
	Name varchar(50),
	SourceID int,
	CreatedDate datetime,
	UpdatedDate datetime
)
go  

Create table RoadSurfaceConditon (
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
    DateId int,
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
	CONSTRAINT FKACCIDENTWEATHER
	FOREIGN KEY(WeatherConditionsId)
	REFERENCES WeatherCondition(Id),

	CONSTRAINT FKACCIDENTRoadCondition
	FOREIGN KEY(RoadSurfaceConditionsId)
	REFERENCES RoadSurfaceConditon(Id),

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
	REFERENCES CasualtyClass(Id),

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
