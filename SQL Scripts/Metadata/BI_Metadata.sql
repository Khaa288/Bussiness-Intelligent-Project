USE master
GO

DROP DATABASE IF EXISTS BI_Metadata
GO

CREATE DATABASE BI_Metadata
GO

USE BI_Metadata
GO

--delete from DataFlow
--delete from DataFlowNDS

create table DataFlow (
	Id int identity(1, 1) PRIMARY KEY,
	SourceName varchar(50) unique not null,
	LSET datetime DEFAULT '1-1-1900',
	CET datetime DEFAULT null,
)
go

insert into DataFlow(SourceName) values('Accidents1114_Source1')
insert into DataFlow(SourceName) values('Vehicles1114_Source1')
insert into DataFlow(SourceName) values('Casualtiest1114_Source1')
insert into DataFlow(SourceName) values('LSOA11_TO_LAD20_TO_COUNTRY_Source2')
insert into DataFlow(SourceName) values('COUNTRY_TO_REGION')
insert into DataFlow(SourceName) values('RoadSafety')
insert into DataFlow(SourceName) values('LAD20_TO_REGION')
go

create table DataFlowNDS (
	Id int identity(1, 1) PRIMARY KEY,
	TableName varchar(50) unique not null,
	LSET datetime DEFAULT '1-1-1900',
	CET datetime DEFAULT null,
)
go

insert into DataFlowNDS(TableName) values('Accident')
insert into DataFlowNDS(TableName) values('AgeBand')
insert into DataFlowNDS(TableName) values('Casualties')
insert into DataFlowNDS(TableName) values('CasualtyClass')
insert into DataFlowNDS(TableName) values('CasualtyType')
insert into DataFlowNDS(TableName) values('Country')
insert into DataFlowNDS(TableName) values('Day')
insert into DataFlowNDS(TableName) values('Hour')
insert into DataFlowNDS(TableName) values('JourneyPurposeOfDriver')
insert into DataFlowNDS(TableName) values('LAD')
insert into DataFlowNDS(TableName) values('LSOA')
insert into DataFlowNDS(TableName) values('Month')
insert into DataFlowNDS(TableName) values('Region')
insert into DataFlowNDS(TableName) values('RoadClass')
insert into DataFlowNDS(TableName) values('RoadType')
insert into DataFlowNDS(TableName) values('RoadSurfaceCondition')
insert into DataFlowNDS(TableName) values('Severity')
insert into DataFlowNDS(TableName) values('Sex')
insert into DataFlowNDS(TableName) values('UrbanOrRuralArea')
insert into DataFlowNDS(TableName) values('Vehicle')
insert into DataFlowNDS(TableName) values('VehicleType')
insert into DataFlowNDS(TableName) values('WeatherCondition')
insert into DataFlowNDS(TableName) values('Year')
go

select * from DataFlow
select * from DataFlowNDS