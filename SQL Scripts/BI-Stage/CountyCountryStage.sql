use BI_Stage
go

CREATE TABLE [CountyCountryStage] (
    [LSOA11CD] varchar(20),
    [LSOA11NM] varchar(100),
    [MSOA11CD] varchar(20),
    [MSOA11NM] varchar(100),
    [TTWA11CD] varchar(20),
    [TTWA11NM] varchar(100),
    [LAD11CD] varchar(20),
    [LAD11NM] varchar(100),
    [LAD11NMW] varchar(100),
    [LAD20CD] varchar(20),
    [LAD20NM] varchar(100),
    [LAD20NMW] varchar(100),
    [CTY20CD] varchar(20),
    [CTY20NM] varchar(100),
    [CTRYCD] varchar(20),
    [CTRYNM] varchar(100)
)
go

select * from CountyCountryStage