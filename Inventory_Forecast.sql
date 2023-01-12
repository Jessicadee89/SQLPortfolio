/*Comparing highest cupping score between each country*/

SELECT [Country ], MAX([Cup Score]) AS Score
FROM CoffeeForecast..Inventory
GROUP BY [Country ]
ORDER BY 2 desc

 /*Average Score of each Country*/

Select [Country ], AVG([Cup Score]) AS Score
From Inventory
Group by [Country ]
Order by 2

/* Joinning Inventory Table with Weather table*/

SELECT *
FROM CoffeeForecast..Inventory
JOIN CoffeeForecast..Weather
ON Inventory.[Country ] = Weather. Country

/*Average temperature over a decate in Brazil during April*/

SELECT I.[Country ],W.Month, W.Year, AVG(W.Temperature) AS Overall 
FROM CoffeeForecast..Inventory AS I
JOIN CoffeeForecast.. Weather AS W
ON I.[Country ] = W. Country
WHERE I.[Country ]= 'BRAZIL' 
	AND W.Temperature <80
	AND W.Month = 'APRIL'
GROUP BY I.[Country ],W.Month, w.year, W.Temperature
ORDER BY 3

/*Forecast how much weight is left in our inventory with a Case Statement*/

SELECT [Country ], [Farm/Coop], [Initial weight], Weight,
CASE
	WHEN Weight >10000 THEN 'Eight weeks or more left'
	WHEN Weight >5000	THEN 'Five weeks left'
	WHEN Weight = 0 THEN 'Empty'
	else 'Less than one week'
END AS Forecast
FROM Inventory
ORDER BY 5 DESC

/* Which Ethiopia has five or more weeks left */

SELECT [Country ], [Farm/Coop], [Initial weight], Weight,
CASE
	WHEN Weight >=10000 THEN 'Eight weeks or more left'
	WHEN Weight >5000	THEN 'Five weeks left'
	WHEN Weight = 0 THEN 'Empty'
	else 'Less than one week'
END AS Forecast
FROM Inventory
WHERE [Country ] = 'ETHIOPIA' AND Weight >5000
ORDER BY 5 DESC



