--- Create database in MySQL for iperf3 utilities ---

CREATE DATABASE hosts;

-- Create table
CREATE TABLE hostspeed (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    host_name VARCHAR(30),
    speed VARCHAR(15),
    date_check TIMESTAMP,
    status VARCHAR(15),
    date_system INT
    );

-- Insert hosts
INSERT INTO hostspeed (host_name) VALUES
('10.10.20.11'), ('10.10.20.12'), ('10.10.20.13'), ('10.10.20.14');

-- Show results
SELECT host_name FROM hostspeed;