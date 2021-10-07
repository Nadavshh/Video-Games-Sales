CREATE DATABASE videogames; 

USE videogames; 
SELECT * FROM dbo.vgsales$ ;

--TOTAL sales per Genre

SELECT Genre,
SUM(Global_sales) AS Total_Sales
FROM dbo.vgsales$ 
WHERE Year <= 2016
GROUP BY Genre 
ORDER BY 2 DESC;


-- MOST selled games per region
SELECT Name,
Global_sales,
NA_Sales,
EU_Sales,
JP_Sales,
Other_Sales FROM dbo.vgsales$ 
WHERE Year <= 2016
ORDER BY 2 DESC
;

-- MOST SELLER PUBLISHER
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
ORDER BY 2 DESC 
; 

-- TOP Generes Per Publisher
SELECT Publisher,
Genre,
ROUND(SUM(Global_Sales),2) AS total_sales ,
COUNT(*) AS Total_Releases
FROM dbo.vgsales$ 
--WHERE Publisher='Nintendo' 
GROUP BY Publisher, Genre
ORDER BY  1 DESC,3 DESC
;
-- Top Publishers
SELECT top 10 Publisher,
SUM(Global_Sales) AS Totl_Sales
FROM dbo.vgsales$ 
GROUP BY Publisher
ORDER BY 2 DESC
;
-- Sales Per Publisher Over Time
SELECT Publisher,
Year ,SUM(Global_Sales) AS Total_Sales FROM dbo.vgsales$ 
Where Year IS NOT NULL
GROUP BY Publisher,Year
ORDER BY 1 , 2
;