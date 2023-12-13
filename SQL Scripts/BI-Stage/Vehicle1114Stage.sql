use BI_Stage

CREATE TABLE [Vehicles1114Stage] (
    [Accident_Index] varchar(20),
    [Vehicle_Reference] int,
    [Vehicle_Type] int,
    [Towing_and_Articulation] int,
    [Vehicle_Manoeuvre] int,
    [Vehicle_Location-Restricted_Lane] int,
    [Junction_Location] int,
    [Skidding_and_Overturning] int,
    [Hit_Object_in_Carriageway] int,
    [Vehicle_Leaving_Carriageway] int,
    [Hit_Object_off_Carriageway] int,
    [1st_Point_of_Impact] int,
    [Was_Vehicle_Left_Hand_Drive?] int,
    [Journey_Purpose_of_Driver] int,
    [Sex_of_Driver] int,
    [Age_of_Driver] int,
    [Age_Band_of_Driver] int,
    [Engine_Capacity_(CC)] int,
    [Propulsion_Code] int,
    [Age_of_Vehicle] int,
    [Driver_IMD_Decile] int,
    [Driver_Home_Area_Type] int
)
go

select * from Vehicles1114Stage