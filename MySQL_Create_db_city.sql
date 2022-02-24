--- 20:09 Started testing ---
--- Creating DB
CREATE DATABASE IF NOT EXISTS testcity;
USE testcity;

-- Started creating a table city
CREATE TABLE IF NOT EXISTS city (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (100) UNIQUE NOT NULL
    ); 

-- Started creating a table street
CREATE TABLE IF NOT EXISTS street (
    street_id INT PRIMARY KEY AUTO_INCREMENT,
    city_id INT NOT NULL,
    name VARCHAR (100) NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city (city_id) ON DELETE CASCADE
    );

--- 20:16 Started inserting data
INSERT IGNORE city (name) VALUES
('Москва'), ('Липецк'), ('Новгород'), 
('Питер'), ('Калининград'), ('Хабаровск'),
('Город без улиц');

INSERT IGNORE street (city_id, name) VALUES
('1', 'Арбат'), ('2', 'Румынская'), ('1', 'Пролетарская'), ('3', 'Гоголя'), 
('4', 'Ленина'), ('1', 'Серышева'), ('2', 'Московская'), ('3', 'Карамзина'), 
('2', 'Дьяченко'), ('5', 'Гагарина'), ('4', 'Литовская'), ('2', 'Минская'), 
('1', 'Пушкина'), ('3', 'Льва-Толстого'), ('2', 'Октябрьская'), ('4', 'Воткинская'), 
('2', 'Постышева'), ('2', 'Гоголя'), ('4', 'Пролетарская'), ('6', 'Чкалова');

--- 20:37 Started answering questions 1-7
SELECT name FROM city ORDER BY name;
UPDATE city set name='Липецк Великий' WHERE name='Липецк';
DELETE FROM city where city_id BETWEEN 100 and 200;
SELECT name FROM street where city_id=(
    SELECT city_id FROM city WHERE name='Москва');
SELECT city.name AS City, count(street.name) AS 'Number of streets' FROM city JOIN street on city.city_id=street.city_id GROUP BY city.name;
SELECT city.name AS City, count(street.name) AS 'Number of streets' FROM city LEFT JOIN street on city.city_id=street.city_id GROUP BY city.name;
DELETE FROM city;

--- 21:12 Started creating a table Measure
CREATE TABLE IF NOT EXISTS measure (
   measure_id INT PRIMARY KEY AUTO_INCREMENT,
   code VARCHAR(30) NOT NULL,
   measure_date DATE NOT NULL,
   value NUMERIC(20,5) NOT NULL
);

--- 21:21 Started inserting data
INSERT INTO measure(code, measure_date, value) VALUES 
('Температура','2005.08.05','20.5'), ('Температура','2005.09.01','14.2'),
('Температура','2007.12.15','-28.5'), ('Температура','2007.05.15','17'),
('Давление','2005.08.05','760'), ('Давление','2005.09.01','800'),
('Давление','2007.12.15','780'), ('Давление','2007.05.15','765');

--- 21:41 Started answering question 8
SELECT value FROM measure WHERE code='Температура' AND measure_date='2007.12.15';
--- 21:42 Completed testing ---