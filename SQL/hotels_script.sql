-- CREATE DATABASE AND TABLES SECTION
CREATE DATABASE hotelsDB;
USE hotelsDB;

CREATE TABLE cities (
 city_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 city_name VARCHAR(20)
 );

CREATE TABLE hotels(
 hotel_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 hotel_name VARCHAR(20),
 stars_counts INT NOT NULL,
 creation_date DATE,
 city_id INT,
 FOREIGN KEY (city_id) references cities (city_id)
);

CREATE TABLE rooms(
 room_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 comfort_level VARCHAR(20),
 hotel_id INT,
 FOREIGN KEY (hotel_id) references hotels(hotel_id)
);

CREATE TABLE clients(
 client_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 client_name VARCHAR(50),
 client_number VARCHAR(20)
);

-- ALTER
ALTER TABLE clients ADD client_age INT;

CREATE TABLE orders(
 order_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 client_id INT,
 room_id INT,
 FOREIGN KEY (client_id) references clients(client_id),
 FOREIGN KEY (room_id) references rooms(room_id)
);
-- END OF CREATE DATABASE AND TABLES SECTION

-- FILLING IN TABLES SECTION
INSERT INTO cities (city_name)
VALUES ('Kyiv'), ('Chernivtsi'), ('Lviv'), 
('Ivano-Frankivsk'), ('Odesa'), ('Dnipro '), 
('Zaporizhzhia'), ('Kryvyi Rih'), ('Mykolaiv'), 
('Luhansk'), ('Vinnytsia'), ('Chernihiv'), 
('Cherkasy'), ('Kherson'), ('Khmelnytskyi'), 
('Kropyvnytskyi'), ('Mykolaiv'), ('Poltava'), 
('Rivne'), ('Sumy'), ('Ternopil'), 
('Uzhhorod'), ('Vinnytsia'), ('Zhytomyr');

INSERT INTO hotels (hotel_name, stars_counts, creation_date, city_id)
VALUES ('Bucovina', 5, '2000-02-12', 2), ('Kyiv', 4, '2004-06-23', 1),
('Bucovel', 5, '2010-01-01', 4), ('Terrasa', 3, '2011-11-01', 11),
('Victoria Gardens', 4, '2009-09-14', 15), ('Edelveiss', 2, '2002-06-17', 19),
('GremiHotel', 1, '2000-05-07', 12), ('GOOD ZONE', 2, '2004-05-19', 21),
('Gold Palace', 3, '2014-07-13', 13);

INSERT INTO rooms (comfort_level, hotel_id)
VALUES ('normal', 1), ('cheap', 1), ('lux', 1),
('normal', 2), ('cheap', 2), ('lux', 2),
('normal', 3), ('cheap', 3), ('lux', 3),
('normal', 4), ('cheap', 4), ('lux', 4),
('normal', 5), ('cheap', 5), ('lux', 5),
('normal', 6), ('cheap', 6), ('lux', 6),
('normal', 7), ('cheap', 7), ('lux', 7),
('normal', 8), ('cheap', 8), ('lux', 8),
('normal', 9), ('cheap', 9), ('lux', 9);

INSERT INTO clients (client_name, client_number, client_age)
VALUES ('Valeria', '380507484485', 21), ('Mariia', '380678572654', 35),
('Maryna', '380977502854', 19), ('Serhii', '380638603853', 45),
('Maksym', '380679467104', 61), ('Yevhen', '380977602875', 35),
('Dmytro', '380638674085', 29), ('Nataliia', '380507492381', 23),
('Valeriy', '380679285032', 47), ('Yevhen', '380677482934', 23);

INSERT INTO orders (client_id, room_id)
VALUES (1, 2), (2, 14), (3, 12),
(4, 8), (5, 4), (6, 11),
(7, 13), (8, 22), (2, 16),
(9, 25), (6, 18), (10, 15);
-- END OF FILLING IN TABLES SECTION

-- SELECT, WHERE, LIKE, NOT LIKE, AND, OR, IN
/*
SELECT * FROM clients;
SELECT client_name, client_number FROM clients;
SELECT client_name, client_number FROM clients WHERE client_name = 'Mariia';
SELECT client_name, client_number FROM clients WHERE client_name LIKE '_a%';
SELECT client_name, client_number FROM clients WHERE client_name LIKE '_a%m';
SELECT client_name, client_number FROM clients WHERE client_name LIKE '%i__';
SELECT client_name, client_number FROM clients WHERE client_number LIKE '___50%';

SELECT * FROM clients WHERE client_age IN (35, 47);
SELECT * FROM clients WHERE client_age IN (23, 35, 47) AND client_name = 'Yevhen';
SELECT * FROM clients WHERE client_id >= 3 AND client_number LIKE '___67%';
SELECT * FROM clients WHERE client_name = 'Yevhen' OR client_number NOT LIKE '___67%';
SELECT * FROM clients WHERE client_number <> 380679467104;
*/

-- COUNT and AS
/*
SELECT COUNT(*) FROM clients;
SELECT COUNT(hotel_id) AS hotel_rooms FROM rooms WHERE hotel_id = 1;
SELECT COUNT(client_name) FROM clients WHERE client_number LIKE '___50%';
*/

-- MIN
/*
SELECT MIN(stars_counts) FROM hotels;
SELECT MIN(hotel_name) FROM hotels;
SELECT MIN(creation_date) FROM hotels;
*/

-- MAX
/*
SELECT MAX(stars_counts) FROM hotels;
SELECT MAX(hotel_name) FROM hotels;
SELECT MAX(creation_date) FROM hotels;
*/

-- AVG and ROUND
/*
SELECT ROUND(AVG(client_age)) AS average_age FROM clients;

SELECT * FROM clients WHERE client_age > (SELECT ROUND(AVG(client_age)) FROM clients);
*/

-- GROUP BY and ORDER BY
/*
SELECT COUNT(client_age), client_age FROM clients GROUP BY client_age;

SELECT COUNT(client_age) AS count_age, client_age
FROM clients
GROUP BY client_age HAVING client_age >= 24
ORDER BY COUNT(client_age) DESC;

SELECT * FROM clients ORDER BY client_age DESC LIMIT 3 OFFSET 2;
*/

-- UPDATE
/*
UPDATE clients
SET client_number = '380675397475', client_name = 'Valeriana'
WHERE client_id = 1;
*/

-- INNER JOIN
/*
SELECT cities.city_name, hotels.hotel_name, hotels.creation_date
FROM cities
INNER JOIN hotels ON cities.city_id = hotels.city_id;
*/

-- LEFT JOIN
/*
SELECT cities.city_name, hotels.hotel_name
FROM cities
LEFT JOIN  hotels ON cities.city_id = hotels.city_id;
*/

-- RIGHT JOIN
/*
SELECT hotels.hotel_name, cities.city_name
FROM hotels
RIGHT JOIN cities ON cities.city_id = hotels.city_id;
*/
-- RIGHT JOIN and ORDER BY
/*
SELECT cities.city_name, hotels.hotel_name
FROM hotels
RIGHT JOIN cities ON cities.city_id = hotels.city_id
ORDER BY hotel_name DESC;
*/

-- CROSS JOIN
/*
SELECT orders.order_id, orders.client_id, clients.client_name
FROM orders
CROSS JOIN clients ON orders.client_id = clients.client_id;
*/

-- DELETE and TRUNCATE TABLE
/*
DELETE FROM orders WHERE client_id = 2 AND order_id = 9;
DELETE FROM orders;
TRUNCATE TABLE orders;
DROP TABLE orders;
*/

-- DROP DATABASE hotelsDB;
