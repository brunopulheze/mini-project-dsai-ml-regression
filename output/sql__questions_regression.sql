-- 1. SQL script to create the database for house price regression analysis
CREATE DATABASE house_price_regression;
USE house_price_regression;

-- 2. Table to store house price data
CREATE TABLE house_price_data (
    id BIGINT,
    date VARCHAR(50),
    price DECIMAL(12,2),
    bedrooms INT,
    bathrooms DECIMAL(3,2),
    sqft_living INT,
    sqft_lot INT,
    floors DECIMAL(3,2),
    waterfront INT,
    [view] INT,
    condition_val INT,
    grade INT,
    sqft_above INT,
    sqft_basement INT,
    yr_built INT,
    yr_renovated INT,
    zipcode INT,
    lat DECIMAL(10,8),
    long_val DECIMAL(11,8),
    sqft_living15 INT,
    sqft_lot15 INT
);

-- 3. Import data into the table
-- Use SQL Server BULK INSERT instead of MySQL-specific commands
BULK INSERT house_price_data
FROM 'path\to\your\house_data.csv'
WITH (
    FIRSTROW = 2,             -- skip header row if present
    FIELDTERMINATOR = ',',    -- CSV delimiter
    ROWTERMINATOR = '\n',     -- line delimiter
    TABLOCK
);

-- 4. Select all data to verify import
SELECT * FROM house_price_data;

-- 5. Drop Date column and display first 10 rows
ALTER TABLE house_price_data DROP COLUMN date;
SELECT TOP 10 * FROM house_price_data;

-- 6. Count Rows
SELECT COUNT(*) AS total_rows FROM house_price_data;

-- 7. Find unique values

-- Unique bedrooms
SELECT DISTINCT bedrooms FROM house_price_data ORDER BY bedrooms;

-- Unique bathrooms
SELECT DISTINCT bathrooms FROM house_price_data ORDER BY bathrooms;

-- Unique floors
SELECT DISTINCT floors FROM house_price_data ORDER BY floors;

-- Unique condition
SELECT DISTINCT condition_val FROM house_price_data ORDER BY condition_val;

-- Unique grade


-- 8. Top 10 Most Expensive Houses
SELECT TOP 10 id 
FROM house_price_data 
ORDER BY price DESC;

-- 9. Average Price
SELECT AVG(price) AS average_price FROM house_price_data;

-- 10. Group By Analysis
-- Average price by bedrooms
SELECT bedrooms, AVG(price) AS Average_Price 
FROM house_price_data 
GROUP BY bedrooms 
ORDER BY bedrooms;

-- Average sqft_living by bedrooms
SELECT bedrooms, AVG(sqft_living) AS Average_Sqft_Living 
FROM house_price_data 
GROUP BY bedrooms 
ORDER BY bedrooms;

-- Average price by waterfront
SELECT waterfront, AVG(price) AS Average_Price 
FROM house_price_data 
GROUP BY waterfront;

-- Correlation between condition and grade
SELECT condition_val, AVG(grade) AS Average_Grade 
FROM house_price_data 
GROUP BY condition_val 
ORDER BY condition_val;

-- 11. Customer Specific Query
SELECT * 
FROM house_price_data 
WHERE bedrooms IN (3, 4)
    AND bathrooms > 3
    AND floors = 1
    AND waterfront = 0
    AND condition_val >= 3
    AND grade >= 5
    AND price < 300000;

-- 12. Properties with Price Twice the Average
SELECT * 
FROM house_price_data 
WHERE price > 2 * (SELECT AVG(price) FROM house_price_data);
GO

-- 13. Create View for Properties with Price Twice the Average
CREATE VIEW expensive_properties AS
SELECT * 
FROM house_price_data 
WHERE price > 2 * (SELECT AVG(price) FROM house_price_data);
GO

-- 14. Price Difference Between 3 and 4 Bedroom Houses
SELECT 
    (SELECT AVG(price) FROM house_price_data WHERE bedrooms = 4) -
    (SELECT AVG(price) FROM house_price_data WHERE bedrooms = 3) 
AS price_difference;

-- 15. Differenct Locations (Distinct Zip Codes)
SELECT DISTINCT zipcode FROM house_price_data ORDER BY zipcode;

-- 16. Renovated Properties
SELECT * FROM house_price_data WHERE yr_renovated > 0;

-- 17. 11th Most Expensive Property
SELECT * 
FROM house_price_data 
ORDER BY price DESC 
OFFSET 10 ROWS FETCH NEXT 1 ROWS ONLY;