CREATE DATABASE videogames; 

USE videogames; 
SELECT * FROM dbo.vgsales$ ;

-- Total Publishers
SELECT COUNT(DISTINCT dbo.vgsales$.Publisher) AS Total_Publishers
FROM dbo.vgsales$ 
WHERE Year <= 2016  ;

-- Total Global Sales
SELECT ROUND(SUM(Global_sales),2) AS Total_Sales
FROM dbo.vgsales$ 
WHERE Year <= 2016 ; 

-- Total Games Released
SELECT COUNT(DISTINCT dbo.vgsales$.Name) AS Total_Games
FROM dbo.vgsales$ 
WHERE Year <= 2016; 

--TOTAL sales per Genre
SELECT Genre,
ROUND(SUM(Global_sales),2) AS Total_Sales
FROM dbo.vgsales$ 
WHERE Year <= 2016
GROUP BY Genre 
ORDER BY 2 DESC;

-- MOST SELLED PUBLISHER
SELECT TOP 10 Publisher,
ROUND(SUM(Global_Sales),2) AS Total_sales
FROM dbo.vgsales$
WHERE Year <= 2016
GROUP BY Publisher 
ORDER BY 2 DESC
;

-- Total Sales Per Year 
SELECT YEAR,
ROUND(SUM(Global_Sales),2) AS total_sales FROM dbo.vgsales$
WHERE YEAR IS NOT NULL 
AND Year <= 2016
GROUP BY Year
ORDER BY 1 
; 

-- TOP Selled Generes Per Publisher
SELECT Publisher,Genre,total_sales
FROM
(
SELECT Publisher,
Genre,
ROUND(SUM(Global_Sales),2) AS total_sales,
DENSE_RANK() OVER(PARTITION BY Publisher ORDER BY SUM(Global_Sales) DESC) AS rk
FROM dbo.vgsales$ 
WHERE Year <= 2016
GROUP BY Publisher, Genre
) a 
WHERE rk= 1 
ORDER BY 3 DESC 

-- TOP  Selled Game Per Publisher
SELECT Publisher,Game,total_sales
FROM
(
SELECT Publisher,
Name AS Game,
ROUND(SUM(Global_Sales),2) AS total_sales,
DENSE_RANK() OVER(PARTITION BY Publisher ORDER BY SUM(Global_Sales) DESC) AS rk
FROM dbo.vgsales$ 
WHERE Year <= 2016
GROUP BY Publisher, Name
) a 
WHERE rk= 1 
ORDER BY 3 DESC 

-- Top Publishers
SELECT top 10 Publisher,
SUM(Global_Sales) AS Totl_Sales
FROM dbo.vgsales$ 
WHERE Year <= 2016
GROUP BY Publisher
ORDER BY 2 DESC
;

-- Sales Per Publisher Over Time
SELECT
Publisher,
Year ,
SUM(Global_Sales) AS Total_Sales FROM dbo.vgsales$ 
Where Year IS NOT NULL
AND  Year <= 2016
GROUP BY Publisher,Year
ORDER BY 1,2
;


