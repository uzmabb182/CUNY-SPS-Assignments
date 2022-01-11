SELECT * 
FROM flights;

-- Which destination in the flights database is the furthest distance away, based on information in the flights table
SELECT max(distance)
FROM flights;

SELECT * 
FROM planes;

-- What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
-- the most number of seats?
SELECT tailnum, engine, seats
FROM planes;

SELECT engine, count(engine), max(seats)
FROM planes
GROUP BY engine;


-- Show the total number of flights.
SELECT count(*)
FROM flights;

-- Show the total number of flights by airline (carrier).
SELECT carrier, count(carrier)
FROM flights
GROUP BY carrier;

-- Show all of the airlines, ordered by number of flights in descending order.
SELECT carrier, count(carrier)
FROM flights
GROUP BY carrier 
ORDER BY count(carrier) DESC;

-- Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order
SELECT carrier, count(carrier)
FROM flights
GROUP BY carrier 
ORDER BY count(carrier) DESC
LIMIT 5;

-- Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
-- flights in descending order.
SELECT carrier, count(carrier)
FROM flights
WHERE distance >= 1000 
GROUP BY carrier 
ORDER BY count(carrier) DESC
LIMIT 5;

-- Show all of the airlines, ordered by number of flights in dascending order for year 2013, with distance 1,000 miles or greater, 
-- ordered by number of flights in descending order.
SELECT carrier, count(carrier),year
FROM flights
WHERE distance >= 1000
GROUP BY carrier, year
HAVING year = 2013
ORDER BY count(carrier) DESC;

