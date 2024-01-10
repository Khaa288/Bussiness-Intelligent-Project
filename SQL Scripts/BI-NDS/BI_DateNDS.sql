use BI_NDS
go

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

select * from Year
select * from Month
select * from Day
select * from Hour

select * from Hour h join Day d 
	on h.DayId = d.DayId join Month m
	on d.MonthId = m.MonthId join Year y
	on m.YearId = y.YearId

	and h.Hour = 0 and d.Day = 1 and m.Month = 1 and y.Year = 2011