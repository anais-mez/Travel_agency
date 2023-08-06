-- Customers number

SELECT count(Id_c) FROM Customers;

-- Customers number per city

SELECT count(Customers.Id_c) AS Customer_numbre_per_city, address.city FROM Customers
INNER JOIN Customers_Address ON Customers.Id_c = Customers_Address.Id_c_Customers
INNER JOIN address ON Customers_Address.Id_a_address = Address.Id_a
GROUP BY Address.city;

-- Average cost trip

SELECT DISTINCT (sum(Flat_rate) + sum(length*0.3)) / max(Id_ticket) AS total FROM ticket
INNER JOIN Ticket_Way_point ON Ticket.Id_ticket = Ticket_Way_point.Id_ticket_Ticket
INNER JOIN Ticket_Length ON Ticket.Id_ticket = Ticket_Length.Id_ticket_Ticket               
INNER JOIN length ON Ticket_Length.Id_length_Length = Length.Id_length;

-- The most popular cities

SELECT t1.City, (x_1 + x_2)
FROM (
    SELECT t.City_2 AS City, count(t.City_2) AS x_2
    FROM (
        SELECT Length.City_2
        FROM Ticket, Length, Ticket_Length
        WHERE Ticket.Id_ticket = Ticket_Length.Id_ticket_Ticket
        AND Length.Id_length = Ticket_Length.Id_length_Length)
        GROUP BY City_2
    ) AS t2,
    (SELECT t.City_1 AS City, count(t.City_1) AS x_1
    FROM (
        SELECT Length.City_1
        FROM Ticket, Length, Ticket_Length
        WHERE Ticket.Id_ticket = Ticket_Length.Id_ticket_Ticket
        AND Length.Id_length = Ticket_Length.Id_length_Length)
        GROUP BY City_1
    ) AS t1
WHERE t1.City = t2.City
GROUP BY t1.City;

-- Percent of way-point

SELECT (count(DISTINCT Length.Id_length) / (count(DISTINCT Length.Id_length) + count(DISTINCT Way_point.Id_w))*100) AS "pourcentage inter",
(count(DISTINCT Way_point.ID_w) / (count(DISTINCT Length.Id_length) + count(DISTINCT Way_point.Id_way))*100) AS "pourcentage intra"
FROM Length
INNER JOIN Trip_Length ON Length.Id_length = Trip_Length.Id_length_Length
INNER JOIN Trip ON Trip.Id_trip = Trip_Length.Id_trip_Trip 
INNER JOIN Trip_Way_point ON Trip_Way_point.Id_w_Way_point = Way_point.Id_w;

-- Number trip use plane

SELECT count(Id_trip) AS Trip_number FROM Trip 
INNER JOIN trip_transport ON trip.Id_trip = trip_transport.Id_trip_Trip 
INNER JOIN transport ON trip_transport.Id_t_transport = transport.Id_t 
WHERE Type_t = 'Plane';

-- Number trip use plane and bus

SELECT count(Id_trip) AS Trip_number 
FROM ( 
SELECT Id_trip FROM Trip 
INNER JOIN trip_transport ON trip.Id_trip = trip_transport.Id_trip_Trip 
INNER JOIN transport ON trip_transport.Id_t_Transport = transport.Id_t 
WHERE Type_t = 'Bus' 
UNION ALL 
SELECT Id_trip FROM Trip 
INNER JOIN trip_transport ON trip_transport.Id_t_transport = transport.Id_t 
WHERE Type_t = 'Plane') Trip; 

-- The transport the most use since 3 months

SELECT max(Type_t)
FROM Transport
INNER JOIN trip_transport ON transport.Id_t = trip_transport.Id_t_Transport
INNER JOIN trip ON trip_transport.Id_trip_Trip = trip.Id_trip
WHERE trip.End_date < Date_ADD(now(), INTERVAL - 3 MONTH);

-- Average cost of ticket for transport

SELECT t1.Average_bus, t2.Average_boat, t3.Average_Plane, t4.Average_train
FROM (SELECT DISTINCT COALESCE(ROUND(AVG(length*0.3),2), 0) AS Average_bus
FROM transport
INNER JOIN trip_transport ON trip_transport.Id_t_Transport=transport.Id_t
INNER JOIN trip ON trip_transport.Id_trip_Trip=trip.Id_trip
INNER JOIN trip_length ON trip.Id_trip=trip_length.Id_trip_Trip
INNER JOIN length ON trip_length.Id_length_Length=length.Id_length
WHERE City_access = City_1 AND type_t='Bus'
OR City_access = City_2 AND type_t='BUS') AS t1
JOIN
(SELECT DISTINCT COALESCE(ROUND(AVG(length*0.3),2), 0) AS Average_boat
FROM transport
INNER JOIN trip_transport ON trip_transport.Id_t_Transport=transport.Id_t
INNER JOIN trip ON trip_transport.Id_trip_Trip=trip.Id_trip
INNER JOIN trip_length ON trip.Id_trip=trip_length.Id_trip_Trip
INNER JOIN length ON trip_length.Id_length_Length=length.Id_length
WHERE City_access = City_1 AND type_t='Boat'
OR City_access = City_2 AND type_t='Boat') AS t2
JOIN 
(SELECT DISTINCT COALESCE(ROUND(AVG(length*0.3),2), 0) AS Average_Plane
FROM transport
INNER JOIN trip_transport ON trip_transport.Id_t_Transport=transport.Id_t
INNER JOIN trip ON trip_transport.Id_trip_Trip=trip.Id_trip
INNER JOIN trip_length ON trip.Id_trip=trip_length.Id_trip_Trip
INNER JOIN length ON trip_length.Id_length_Length=length.Id_length
WHERE City_access = City_1 AND type_t='Plane'
OR City_access = City_2 AND type_t='Plane') AS t3
JOIN
(SELECT DISTINCT COALESCE(ROUND(AVG(length*0.3),2), 0) AS Average_train
FROM transport
INNER JOIN trip_transport ON trip_transport.Id_t_Transport=transport.Id_t
INNER JOIN trip ON trip_transport.Id_trip_Trip=trip.Id_trip
INNER JOIN trip_length ON trip.Id_trip=trip_length.Id_trip_Trip
INNER JOIN length ON trip_length.Id_length_Length=length.Id_length
WHERE City_access = City_1 AND type_t='Train'
OR City_access = City_2 AND type_t='Train') AS t4

-- Percent of Men and Women

SELECT (SELECT count(*)
FROM Travelers
WHERE travelers.gender = 'Man') /
(SELECT count(*)
FROM Travelers
INNER JOIN customers ON travelers.Id_c = customers.Id_c
INNER JOIN customers_trip ON customers.Id_c = customers_trip.Id_c_Customers
INNER JOIN trip ON customers_trip.Id_trip_trip = trip.Id_trip)*100 AS percentage_man,
(SELECT count(*)
FROM travelers
WHERE travelers.gender = 'Woman') /
(SELECT count(*)
FROM travelers
INNER JOIN customers ON travelers.Id_c = customers.Id_c
INNER JOIN customers_trip ON customers.Id_c = customers_trip.Id_c_Customers
INNER JOIN trip ON customers_trip.Id_trip_trip = trip.Id_trip)*100 AS percentage_woman;

-- Number of senior

SELECT (COUNT(travellers.Age)/(COUNT(customers.Id_c)+COUNT(travellers.Id_travel))*100) AS "average_number_senior"
FROM travellers
INNER JOIN customers ON travellers.Id_c = customers.Id_c
INNER JOIN customers_trip ON customers.Id_c = customers_trip.Id_c_Customers
INNER JOIN trip ON customers_trip.Id_trip_Trip = trip.Id_trip
WHERE trip.End_date < Date_ADD(NOW(), interval - 6 month)
AND travellers.Age> Date_ADD(NOW(), interval + 65 year);

-- Number of children

SELECT ((sum(trip.End_date > Date_sub(now(), INTERVAL 6 MONTH)
AND travelers.Age > Date_sub(now(), INTERVAL 18 YEAR)
OR customers.Age > Date_sub(now(), INTERVAL - 18 YEAR)) /
count(trip.End_date > Date_sub(now(), INTERVAL 6 MONTH)
AND travelers.Age > Date_sub(now(), INTERVAL 18 YEAR)
OR customers.Age > Date_sub(now(),INTERVAL - 18 YEAR))*100))
AS average_number_children
FROM travelers
INNER JOIN customers ON travelers.Id_c = customers.Id_c
INNER JOIN customers_trip ON customers.Id_c = customers_trip.Id_c_Customers
INNER JOIN trip ON customers_trip.Id_trip_trip = trip.Id_trip

-- The most use of payment type

SELECT Payment_type, count(*)
FROM Ticket
WHERE Purchase_date BETWEEN '2021-01-01' AND now()
GROUP BY Payment_type
HAVING count(*) >= ALL (SELECT count(*)
FROM Ticket
GROUP BY Payment_type);

-- The oldest staff

SELECT Lastname_staff, Firstname_staff, Hiring_date
FROM Staff
ORDER BY Hiring_date ASC; 

-- Know the different information for a trip: Travel number, its price, 
-- departure date, number of cities crossed

SELECT DISTINCT trip.Id_trip, length.City_1 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
    AND trip.Id_trip= 1
GROUP BY length.City_1;
SELECT DISTINCT trip.Id_trip, length.City_2 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
    AND trip.Id_trip= 1
GROUP BY length.City_2;
SELECT * FROM 
(SELECT DISTINCT trip.Id_trip, length.City_1 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
GROUP BY trip.Id_trip, length.City_1) as t1 UNION
(SELECT DISTINCT trip.Id_trip, length.City_2 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
GROUP BY trip.Id_trip, length.City_2)
;
SELECT DISTINCT trip.Id_trip, length.City_1 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
GROUP BY trip.Id_trip, length.City_1;
SELECT result.Id_trip, COUNT(*) FROM (SELECT * FROM 
(SELECT DISTINCT trip.Id_trip, length.City_1 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
GROUP BY trip.Id_trip, length.City_1) as t1 UNION
(SELECT DISTINCT trip.Id_trip, length.City_2 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
GROUP BY trip.Id_trip, length.City_2)) as result
GROUP BY result.Id_trip;
SELECT DISTINCT trip.Id_trip, (length.Length * 0.3) AS l1
FROM length, trip, trip_length
WHERE trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length;
SELECT DISTINCT trip.Id_trip, way_point.Flat_rate
FROM way_point, trip, trip_way_point
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point;
SELECT t1.Id_trip, ROUND(SUM(t1.l1 + t2.Flat_rate),2)
FROM (SELECT DISTINCT trip.Id_trip, (length.Length * 0.3) AS l1
FROM length, trip, trip_length
WHERE trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length) AS t1, (SELECT DISTINCT trip.Id_trip, way_point.Flat_rate
FROM way_point, trip, trip_way_point
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point) AS t2
WHERE t1.Id_trip = t2.Id_trip
GROUP BY t1.Id_trip;
SELECT DISTINCT trip.Id_trip, trip.Start_date
FROM trip;
 
 
 
 SELECT DISTINCT tt1.Id_trip, tt2.Number_city, tt3.Total_price, tt4.Start_date
 FROM 
 (SELECT * FROM 
(SELECT DISTINCT trip.Id_trip, length.City_1 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
GROUP BY trip.Id_trip, length.City_1) as t1 

UNION

(SELECT DISTINCT trip.Id_trip, length.City_2 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
GROUP BY trip.Id_trip, length.City_2)) AS tt1

 JOIN 
 
 (SELECT result.Id_trip, COUNT(*) AS Number_city FROM (SELECT * FROM 
(SELECT DISTINCT trip.Id_trip, length.City_1 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
GROUP BY trip.Id_trip, length.City_1) as t1 

UNION

(SELECT DISTINCT trip.Id_trip, length.City_2 AS City FROM way_point, length, trip, trip_way_point, trip_length
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point
	AND trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length
GROUP BY trip.Id_trip, length.City_2)) as result
GROUP BY result.Id_trip) AS tt2

 ON tt1.Id_trip = tt2.Id_trip
 
 
 JOIN 
 
 (SELECT t1.Id_trip, ROUND(SUM(t1.l1 + t2.Flat_rate),2) AS Total_price
FROM (SELECT DISTINCT trip.Id_trip, (length.Length * 0.3) AS l1
FROM length, trip, trip_length
WHERE trip.Id_trip = trip_length.Id_trip_Trip
    AND length.Id_length = trip_length.Id_length_Length) AS t1, (SELECT DISTINCT trip.Id_trip, way_point.Flat_rate
FROM way_point, trip, trip_way_point
WHERE trip.Id_trip = trip_way_point.Id_trip_Trip
	AND way_point.Id_w = trip_way_point.Id_w_Way_point) AS t2
WHERE t1.Id_trip = t2.Id_trip
GROUP BY t1.Id_trip) AS tt3
 ON tt1.Id_trip = tt3.Id_trip
 
JOIN (SELECT DISTINCT trip.Id_trip, trip.Start_date
FROM trip) AS tt4
ON tt1.Id_trip = tt4.Id_trip
