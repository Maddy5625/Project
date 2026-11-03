CREATE DATABASE Population_pop;
USE Population_pop;
select* from population;

CREATE TABLE Countries (
    Country_ID INT PRIMARY KEY,
    Country_Name VARCHAR(50),
    Population BIGINT,
    Industry VARCHAR(50),
    GDP_Per_Capita DECIMAL(12,2)
    );
    
INSERT INTO Countries VALUES
(1, 'India', 1417000000, 'Agriculture', 2500),
(2, 'China', 1412000000, 'Manufacturing', 12700),
(3, 'USA', 333000000, 'Technology', 76000),
(4, 'Indonesia', 275000000, 'Agriculture', 4700),
(5, 'Pakistan', 235000000, 'Textiles', 2600),
(6, 'Nigeria', 218000000, 'Oil and Gas', 2200),
(7, 'Brazil', 215000000, 'Agriculture', 12500);

CREATE TABLE Food_Data (
    Food_ID INT PRIMARY KEY,
    Country_ID INT,
    Main_Food VARCHAR(50),
    Food_Production INT
);

INSERT INTO Food_Data VALUES
(1, 1, 'Rice', 135000),
(2, 2, 'Rice', 208000),
(3, 3, 'Wheat', 49000),
(4, 4, 'Rice', 55000),
(5, 5, 'Wheat', 27000),
(6, 6, 'Cassava', 60000);


-- Display all columns
SELECT * FROM Countries;

-- Select specific columns
SELECT Country_Name, Population
FROM Countries;

-- Display unique industries
SELECT DISTINCT Industry
FROM Countries;

-- Display only the first 3 rows (MySQL)
SELECT * FROM Countries
LIMIT 3;

-- Population greater than 300 million
SELECT * FROM Countries
WHERE Population > 300000000;

-- Find a particular country
SELECT * FROM Countries
WHERE Country_Name = 'India';

-- Multiple conditions
SELECT * FROM Countries
WHERE Population > 200000000
AND GDP_Per_Capita > 5000;

-- OR condition
SELECT * FROM Countries
WHERE Industry = 'Agriculture'
OR Industry = 'Technology';

-- BETWEEN
SELECT * FROM Countries
WHERE GDP_Per_Capita BETWEEN 2000 AND 10000;

-- IN
SELECT * FROM Countries
WHERE Country_Name IN ('India', 'China', 'Brazil');

-- LIKE
SELECT * FROM Countries
WHERE Country_Name LIKE 'I%';

-- Check missing values
SELECT * FROM Countries
WHERE Industry IS NULL;


-- Count countries in each industry
SELECT Industry, COUNT(*) AS Total_Countries
FROM Countries
GROUP BY Industry;

-- Total population by industry
SELECT Industry, SUM(Population) AS Total_Population
FROM Countries
GROUP BY Industry;

-- Average GDP per capita by industry
SELECT Industry, AVG(GDP_Per_Capita) AS Average_GDP
FROM Countries
GROUP BY Industry;

-- Filter grouped results using HAVING
SELECT Industry, COUNT(*) AS Total_Countries
FROM Countries
GROUP BY Industry
HAVING COUNT(*) > 1;


-- Ascending order (smallest to largest)
SELECT * FROM Countries
ORDER BY Population ASC;

-- Descending order (largest to smallest)
SELECT * FROM Countries
ORDER BY Population DESC;

-- Sort by multiple columns
SELECT * FROM Countries
ORDER BY Industry ASC, Population DESC;

-- Show the top 3 countries by population
SELECT Country_Name, Population
FROM Countries
ORDER BY Population DESC
LIMIT 3;


SELECT c.Country_Name, f.Main_Food
FROM Countries c
INNER JOIN Food_Data f
ON c.Country_ID = f.Country_ID;


SELECT c.Country_Name, f.Main_Food
FROM Countries c
LEFT JOIN Food_Data f
ON c.Country_ID = f.Country_ID;


SELECT c.Country_Name, f.Main_Food
FROM Countries c
RIGHT JOIN Food_Data f
ON c.Country_ID = f.Country_ID;


SELECT c.Country_Name, f.Main_Food
FROM Countries c
LEFT JOIN Food_Data f
ON c.Country_ID = f.Country_ID

UNION

SELECT c.Country_Name, f.Main_Food
FROM Countries c
RIGHT JOIN Food_Data f
ON c.Country_ID = f.Country_ID;


SELECT c.Country_Name, f.Main_Food
FROM Countries c
CROSS JOIN Food_Data f;


SELECT a.Country_Name, b.Country_Name,
       a.Industry
FROM Countries a
JOIN Countries b
ON a.Industry = b.Industry
AND a.Country_ID < b.Country_ID;


SELECT
    Industry,
    COUNT(*) AS Total_Countries,
    SUM(Population) AS Total_Population,
    ROUND(AVG(GDP_Per_Capita), 2) AS Average_GDP
FROM Countries
WHERE Population > 200000000
GROUP BY Industry
HAVING COUNT(*) >= 1
ORDER BY Total_Population DESC;
