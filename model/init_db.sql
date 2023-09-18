--
-- Drop Tables
--

SET foreign_key_checks = 0;
DROP TABLE if exists users;
SET foreign_key_checks = 1;

--
-- Create Tables
--
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,    
    mail VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    baby_name VARCHAR(255),
    creation_date DATE NOT NULL,
    weeks_pregnant INT,
    photo_url VARCHAR(255) 
);



