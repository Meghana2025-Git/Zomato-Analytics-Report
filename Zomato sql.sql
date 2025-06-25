create database zomato;
use zomato;
select count(distinct country ) as distcode from zomato_csv;
select count(distinct `country name`) as totalcountry from zomato_csv;

select * from zomato_csv;
ALTER TABLE zomato_csv
CHANGE COLUMN `ï»¿RestaurantID` RestaurantID INT;
ALTER TABLE zomato_csv
CHANGE COLUMN `country name` Countryname varchar(111);
# 1. Find the Number of Restaurants Based on City and Country
SELECT countryname, City, COUNT(RestaurantID) AS NumberOfRestaurants
FROM zomato_csv
GROUP BY Countryname, City
ORDER BY NumberOfRestaurants DESC;

# 2. Number of Restaurants Opened Based on Year, Quarter, and Month
SELECT Year, Quarter, Month, COUNT(RestaurantID) AS OpenedRestaurants
FROM zomato_csv
GROUP BY Year, Quarter, Month
ORDER BY Year, Month;

# 3. Count of Restaurants Based on Average Ratings
SELECT Rating, COUNT(RestaurantID) AS RestaurantCount
FROM zomato_csv
GROUP BY Rating
ORDER BY Rating DESC;

# 4. Create Buckets Based on Average Price and Count Restaurants in Each Bucket
SELECT 
  CASE 
    WHEN Average_Cost_for_two <= 200 THEN 'Low (<=200)'
    WHEN Average_Cost_for_two <= 500 THEN 'Medium (201-500)'
    WHEN Average_Cost_for_two <= 1000 THEN 'High (501-1000)'
    ELSE 'Luxury (>1000)'
  END AS Price_Bucket,
  COUNT(*) AS RestaurantCount
FROM zomato_csv
GROUP BY Price_Bucket;

# 5.Top 10 cuisines 
SELECT Cuisines, COUNT(*) AS Count
FROM zomato_csv
GROUP BY Cuisines
ORDER BY Count DESC
LIMIT 10;

# 6. Top Cities by Number of Restaurants
SELECT City, COUNT(*) AS Count
FROM zomato_csv
GROUP BY City
ORDER BY Count DESC
LIMIT 10;

# 7. Average Rating by City
SELECT City, ROUND(AVG(Rating), 2) AS AvgRating
FROM zomato_csv
GROUP BY City
ORDER BY AvgRating DESC;