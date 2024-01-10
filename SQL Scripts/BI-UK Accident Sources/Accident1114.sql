use BI_Source1
go

CREATE TABLE [Accident1114] (
    [Accident_Index] varchar(20),
    [Location_Easting_OSGR] int,
    [Location_Northing_OSGR] int,
    [Longitude] varchar(10),
    [Latitude] varchar(10),
    [Police_Force] int,
    [Accident_Severity] int,
    [Number_of_Vehicles] int,
    [Number_of_Casualties] int,
    [Date] date,
    [Day_of_Week] int,
    [Time] time(7),
    [Local_Authority_(District)] int,
    [Local_Authority_(Highway)] varchar(10),
    [1st_Road_Class] int,
    [1st_Road_Number] int,
    [Road_Type] int,
    [Speed_limit] int,
    [Junction_Detail] int,
    [Junction_Control] int,
    [2nd_Road_Class] int,
    [2nd_Road_Number] int,
    [Pedestrian_Crossing-Human_Control] int,
    [Pedestrian_Crossing-Physical_Facilities] int,
    [Light_Conditions] int,
    [Weather_Conditions] int,
    [Road_Surface_Conditions] int,
    [Special_Conditions_at_Site] int,
    [Carriageway_Hazards] int,
    [Urban_or_Rural_Area] int,
    [Did_Police_Officer_Attend_Scene_of_Accident] int,
    [LSOA_of_Accident_Location] varchar(10),
    createdDate datetime,
    updatedDate datetime
)

select * from [Accident1114] 