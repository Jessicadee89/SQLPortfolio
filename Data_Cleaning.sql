/* Cleaning Data in SQL Queries*/

SELECT *
FROM WarehouseTemperature

/* Delete Unused Columns*/

Select * 
From WarehouseTemperature

Alter Table WarehouseTempture
Drop Column [Wind Speed AM], [Weather Outdoors Mid Roast], [Mid Roast Wind Speed], [MID ROAST Room Temp Humidity]

/*Standardize Date Format*/
Select CurrentDate, FORMAT(CurrentDate, 'MM-dd-yyyy')
From WarehouseTemperature

Update WarehouseTemperature
Set [Main Sheet] = CONVERT(Date, [Main Sheet]) 

/*Will not update Properly*/

Alter Table WarehouseTemperature
Add CurrentDate Date;

Update WarehouseTemperature
Set CurrentDate = CONVERT(Date, [Main Sheet]) 

/*Drop Old Column Main Sheet*/

Alter Table WarehouseTemperature
Drop Column [Main Sheet]

/*Breaking out Weather Am into Indivdual Columns (Condition and Fahrenheit)*/

Select top 1000 [Weather AM],
SUBSTRING([Weather AM], 1, CHARINDEX(' ',[Weather AM])) AS Condition,
SUBSTRING([Weather AM], 6, CHARINDEX('F',[Weather AM])-4) AS Fahrenheit
From WarehouseTemperature
Where [Weather AM] Like 'Sunny%'
Order By 3 desc

Alter Table WarehouseTemperature
Add Condition Nvarchar(255);

Update WarehouseTemperature
Set Condition = SUBSTRING([Weather AM], 1, CHARINDEX(' ',[Weather AM]))

Select [Weather AM], Condition, Fahrenheit
From WarehouseTemperature
Where Condition LIKE 'Sunny%'