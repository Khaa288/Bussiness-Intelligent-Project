use BI_Stage
go

CREATE TABLE [Casualties1114Stage] (
    [Accident_Index] varchar(20),
    [Vehicle_Reference] int,
    [Casualty_Reference] int,
    [Casualty_Class] int,
    [Sex_of_Casualty] int,
    [Age_of_Casualty] int,
    [Age_Band_of_Casualty] int,
    [Casualty_Severity] int,
    [Pedestrian_Location] int,
    [Pedestrian_Movement] int,
    [Car_Passenger] int,
    [Bus_or_Coach_Passenger] int,
    [Pedestrian_Road_Maintenance_Worker] int,
    [Casualty_Type] int,
    [Casualty_Home_Area_Type] int
)
go

select * from Casualties1114Stage