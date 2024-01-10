use BI_Stage
go

CREATE TABLE [CountyCountryStage] (
    [LSOA11CD] varchar(20) NULL,
    [LSOA11NM] varchar(100) NULL,
    [MSOA11CD] varchar(20) NULL,
    [MSOA11NM] varchar(100) NULL,
    [TTWA11CD] varchar(20) NULL,
    [TTWA11NM] varchar(100) NULL,
    [LAD11CD] varchar(20) NULL,
    [LAD11NM] varchar(100) NULL,
    [LAD11NMW] varchar(100) NULL,
    [LAD20CD] varchar(20) NULL,
    [LAD20NM] varchar(100) NULL,
    [LAD20NMW] varchar(100) NULL,
    [CTY20CD] varchar(20) NULL,
    [CTY20NM] varchar(100) NULL,
    [CTRYCD] varchar(20) NULL,
    [CTRYNM] varchar(100) NULL,
	createdDate datetime,
	updatedDate datetime
)
go

select * from CountyCountryStage
