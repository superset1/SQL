--- Create database in MySQL for iperf3 utilities ---

CREATE DATABASE hosts;

-- Create table for host list
CREATE TABLE hostspeed (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    host_name VARCHAR (30) UNIQUE,
    description VARCHAR (100),
    created TIMESTAMP DEFAULT,
    ); 

-- Create table for iperf3
CREATE TABLE hostspeed (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    host_id VARCHAR (30),
    speed VARCHAR (15),
    date_check TIMESTAMP,
    status VARCHAR (15),
    date_system INT, 
    FOREIGN KEY (host_id) REFERENCES hosts (host_name) ON UPDATE CASCADE
    ); 

-- Insert hosts
INSERT INTO hostspeed (host_name) VALUES
('10.10.20.11'), ('10.10.20.12'), ('10.10.20.13'), ('10.10.20.14');

-- Show results
SELECT host_name FROM hostspeed;
