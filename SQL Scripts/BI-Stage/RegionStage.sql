use BI_Stage
GO

CREATE TABLE [RegionStage] (
    [RGNCD] varchar(20),
    [RGNNM] varchar(50),
    [CTRYCD] varchar(20),
    [CTRYNM] varchar(50),
    [EWCD] varchar(20),
    [EWNM] varchar(50),
    [GBCD] varchar(20),
    [GBNM] varchar(50),
    [UKCD] varchar(20),
    [UKNM] varchar(50)
)
GO

select * from RegionStage