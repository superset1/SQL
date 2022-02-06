--- Create database in MySQL for iperf3 utilities ---

CREATE DATABASE IF NOT EXISTS testhosts;

USE testhosts;

-- Create table for host list
CREATE TABLE IF NOT EXISTS hostlist (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    host_name VARCHAR (30) UNIQUE,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    description VARCHAR (100)
    ); 

-- Create table for iperf3
CREATE TABLE IF NOT EXISTS iperf3 (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    host_name VARCHAR (30) UNIQUE,
    date_check TIMESTAMP,
    status VARCHAR (15),
    speed VARCHAR (15),
    date_system INT, 
    FOREIGN KEY (host_name) REFERENCES hostlist (host_name) ON DELETE CASCADE
    );

-- Create table with unavailable hosts
CREATE TABLE IF NOT EXISTS unavailable_log (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    host_name VARCHAR (30),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR (15) DEFAULT 'NOT Available'
    ); 

-- Insert example hosts (delete if you don't need)
INSERT IGNORE hostlist (host_name, description) VALUES
('10.10.20.10', 'sklad'), ('10.10.20.11', 'linux1'),
('10.10.20.12', 'linux2'), ('10.10.20.13', 'linux3'),
('10.10.20.14', 'buhgalter'), ('10.10.20.15', 'sales'), 
('10.10.20.16', 'director'), ('10.10.20.17','zamdirector');