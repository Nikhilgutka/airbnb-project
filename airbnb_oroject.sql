--- Write a query to show names from Listings table
SELECT 
    name 
FROM Listing;
--- Write a query to fetch total listings from the listings table
SELECT 
    COUNT(*) AS total_listings
FROM Listings;
      --- Write a query to fetch total listing_id from the booking_details table
SELECT 
    COUNT(listing_id) AS total_listings
FROM Booking_Details;
---  Write a query to fetch host ids from listings table
SELECT 
    COUNT(DISTINCT listing_id) AS total_unique_listings
FROM Booking_Details;
--- Write a query to fetch host ids from listings table
SELECT 
    host_id
FROM Listings;
--- Write a query to fetch all unique host name from listings table
SELECT 
    DISTINCT host_name
FROM Listings;
--- Write a query to show all unique neighbourhood_group from listings table
SELECT 
    DISTINCT neighbourhood_group
FROM Listings;
--- Write a query to show all unique neighbourhood from listings table
SELECT 
    DISTINCT neighbourhood
FROM Listings;
--- Write a query to fetch unique room_type from listings tables
SELECT 
    DISTINCT room_type
FROM Listings;
--- Write a query to show all values of Brooklyn & Manhattan from listings tables
SELECT *
FROM Listings
WHERE neighbourhood_group IN ('Brooklyn', 'Manhattan');
--- Write a query to show maximum price from booking_details table
SELECT 
    MAX(price) AS max_price
FROM Booking_Details;
--- Write a query to show minimum price fron booking_details table
SELECT 
    MIN(price) AS min_price
FROM Booking_Details;
--- Write a query to show average price from booking_details table
SELECT 
    AVG(price) AS average_price
FROM Booking_Details;
--- Write a query to show minimum value of minimum_nights from booking_details table
SELECT 
    MIN(minimum_nights) AS min_minimum_nights
FROM Booking_Details;
--- Write a query to show maximum value of minimum_nights from booking_details table
SELECT 
    MAX(minimum_nights) AS max_minimum_nights
FROM Booking_Details;
--- Write a query to show average availability_365
SELECT 
    AVG(availability_365) AS avg_availability_365
FROM Booking_Details;
--- Write a query to show id , availability_365 and all availability_365 values greater than 300
SELECT 
    listing_id, 
    availability_365,price
FROM Booking_Details
WHERE availability_365 > 300;
--- Write a query to show count of id where price is in between 300 to 400
SELECT 
    COUNT(listing_id) AS count_ids_in_price_range
FROM Booking_Details
WHERE price BETWEEN 300 AND 400;
--- Write a query to show count of id where minimum_nights spend is less than 5
SELECT 
    COUNT(listing_id) AS count_ids_with_minimum_nights_less_than_5
FROM Booking_Details
WHERE minimum_nights < 5;
--- Write a query to show count where minimum_nights spend is greater than 100
SELECT 
    COUNT(listing_id) AS count_ids_with_minimum_nights_greater_than_100
FROM Booking_Details
WHERE minimum_nights > 100;
--- Write a query to show all data of listings & booking_details
SELECT *
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id;
SELECT *
FROM Listings l
LEFT JOIN Booking_Details b ON l.id = b.listing_id;
--- Write a query to show host name and price
SELECT 
    l.host_name, 
    b.price
FROM Listings l
LEFT JOIN Booking_Details b ON l.id = b.listing_id;
--- Write a query to show room_type and price
SELECT 
    l.room_type, 
    b.price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id;
--- Write a query to show neighbourhood_group & minimum_nights spend
SELECT 
    l.neighbourhood_group, 
    b.minimum_nights
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id;
--- Write a query to show neighbourhood & availability_365
SELECT 
    l.neighbourhood, 
    b.availability_365
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id;
--- Write a query to show total price by neighbourhood_group
SELECT 
    l.neighbourhood_group, 
    SUM(b.price) AS total_price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.neighbourhood_group;
--- Write a query to show maximum price by neighbourhood_group
SELECT 
    l.neighbourhood_group, 
    MAX(b.price) AS max_price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.neighbourhood_group;
--- Write a query to show maximum night spend by neighbourhood_group
SELECT 
    l.neighbourhood_group, 
    MAX(b.price * b.minimum_nights) AS max_night_spend
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.neighbourhood_group;
--- Write a query to show maximum reviews_per_month spend by neighbourhood
SELECT 
    l.neighbourhood, 
    MAX(b.reviews_per_month) AS max_reviews_per_month
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.neighbourhood;
--- Write a query to show maximum price by room type
SELECT 
    l.room_type, 
    MAX(b.price) AS max_price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.room_type;
--- Write a query to show average number_of_reviews by room_type
SELECT 
    l.room_type, 
    AVG(b.number_of_reviews) AS avg_number_of_reviews
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.room_type;
--- Write a query to show average price by room type
SELECT 
    l.room_type, 
    AVG(b.price) AS avg_price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.room_type;
--- Write a query to show average night spend by room type
SELECT 
    l.room_type, 
    AVG(b.price * b.minimum_nights) AS avg_night_spend
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.room_type;
--- Write a query to show average price by room type but average price is less than 100
SELECT 
    l.room_type, 
    AVG(b.price) AS avg_price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.room_type
HAVING AVG(b.price) < 100;
--- Write a query to show average night by neighbourhood and average_nights is greater than 5
SELECT 
    l.neighbourhood, 
    AVG(b.minimum_nights) AS avg_nights
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.neighbourhood
HAVING AVG(b.minimum_nights) > 5;
--- Write a query to show all data from listings where price is greater than 200 using sub-query.
SELECT *
FROM Listings
WHERE id IN (
    SELECT listing_id
    FROM Booking_Details
    WHERE price > 200
);
--- Write a query to show all values from booking_details table where host id is 314941 using sub-query.
SELECT *
FROM Booking_Details
WHERE listing_id IN (
    SELECT id
    FROM Listings
    WHERE host_id = 314941
);
--- Find all pairs of id having the same host id, each pair coming once only.
SELECT 
    l1.id AS id1, 
    l2.id AS id2
FROM Listings l1
JOIN Listings l2 ON l1.host_id = l2.host_id AND l1.id < l2.id;
--- Write an sql query to show fetch all records that have the term cozy in name
SELECT *
FROM Listings
WHERE name LIKE '%cozy%';
--- Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
SELECT 
    b.price, 
    l.host_id, 
    l.neighbourhood_group
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
WHERE l.neighbourhood_group = 'Manhattan';
--- Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100
SELECT 
    l.id, 
    l.host_name, 
    l.neighbourhood, 
    b.price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
WHERE l.neighbourhood IN ('Upper West Side', 'Williamsburg')
  AND b.price > 100;
--- Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
SELECT 
    l.id, 
    l.host_name, 
    l.neighbourhood, 
    b.price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
WHERE l.host_name = 'Elise'
  AND l.neighbourhood = 'Bedford-Stuyvesant';
--- Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
SELECT 
    l.host_name, 
    b.availability_365, 
    b.minimum_nights
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
WHERE b.availability_365 > 100
  AND b.minimum_nights > 100;
--- Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+(doubt)
SELECT 
    l.id, 
    l.host_name, 
    b.number_of_reviews, 
    b.reviews_per_month
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
WHERE b.number_of_reviews > 500
  AND b.reviews_per_month > 5;
--- Write a query to show neighbourhood_group which have most total number of review
SELECT 
    l.neighbourhood_group, 
    SUM(b.number_of_reviews) AS total_reviews
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.neighbourhood_group
ORDER BY total_reviews DESC
LIMIT 1;
--- Write a query to show host name which have most cheaper total price
SELECT 
    l.host_name, 
    SUM(b.price) AS total_price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.host_name
ORDER BY total_price ASC
LIMIT 1;
--- Write a query to show host name which have most costly total price
SELECT 
    l.host_name, 
    SUM(b.price) AS total_price
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.host_name
ORDER BY total_price DESC
LIMIT 1;
--- Write a query to show host name which have max price using sub-query
SELECT l.host_name
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
WHERE b.price = (
    SELECT MAX(price)
    FROM Booking_Details
);
--- Write a query to show neighbourhood_group where price is less than 100
SELECT DISTINCT l.neighbourhood_group
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
WHERE b.price < 100;
--- Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.
SELECT 
    l.room_type, 
    MAX(b.price) AS max_price, 
    AVG(b.availability_365) AS avg_availability_365
FROM Listings l
JOIN Booking_Details b ON l.id = b.listing_id
GROUP BY l.room_type
ORDER BY max_price ASC;








