Create database if not exists `email_confirmation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
create user if not exists `{EMAIL_DB_READ_USER}`@`%` identified by '{EMAIL_DB_READ_PASS}';
grant select on `email_confirmation`.* to `{EMAIL_DB_READ_USER}`@`%`;
create user if not exists `{EMAIL_DB_WRITE_USER}`@`%` identified by '{EMAIL_DB_WRITE_PASS}';
grant insert, update, delete, select on `email_confirmation`.* to `{EMAIL_DB_WRITE_USER}`@`%`;
USE `email_confirmation`;
CREATE TABLE email_confirmations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    occasion VARCHAR(255),
    message TEXT NOT NULL,
    token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NULL
);

DELIMITER $$

CREATE TRIGGER set_expires_at
BEFORE INSERT ON email_confirmations
FOR EACH ROW
BEGIN
    SET NEW.expires_at = NOW() + INTERVAL 3 DAY;
END$$

DELIMITER ;

create database if not exists `aster_content` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aster_content`;
create user if not exists `{ASTER_DB_READ_USER}`@`%` identified by '{ASTER_DB_READ_PASS}';
grant select on `aster_content`.* to `{ASTER_DB_READ_USER}`@`%`;
create user if not exists `{ASTER_DB_WRITE_USER}`@`%` identified by '{ASTER_DB_WRITE_PASS}';
grant insert, update, delete, select on `aster_content`.* to `{ASTER_DB_WRITE_USER}`@`%`;
USE `aster_content`;
CREATE TABLE aster_index_content_text (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);
CREATE TABLE aster_index_content_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name TEXT,
    folder_name TEXT
);
Create TABLE aster_about_content_text (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);
CREATE TABLE aster_about_content_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name TEXT,
    folder_name TEXT
);
CREATE TABLE aster_consultant_content_text (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);
CREATE TABLE aster_consultant_content_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name TEXT,
    folder_name TEXT
);
CREATE TABLE aster_contact_content_text (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);
CREATE TABLE aster_work_content_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name TEXT,
    folder_name TEXT
);
CREATE TABLE aster_work_content_text (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);

Create database if not exists `users` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
create user if not exists `{USERS_DB_READ_USER}`@`%` identified by '{USERS_DB_READ_PASS}';
grant select on `users`.* to `{USERS_DB_READ_USER}`@`%`;
create user if not exists `{USERS_DB_WRITE_USER}`@`%` identified by '{USERS_DB_WRITE_PASS}';
grant insert, update, delete, select on `users`.* to `{USERS_DB_WRITE_USER}`@`%`;
USE `users`;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create database if not exists `default_aster_content` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
create user if not exists `{DEFAULT_CONTENT_DB_READ_USER}`@`%` identified by '{DEFAULT_CONTENT_DB_READ_PASS}';
grant select on `default_content`.* to `{DEFAULT_CONTENT_DB_READ_USER}`@`%`;
create user if not exists `{DEFAULT_CONTENT_DB_WRITE_USER}`@`%` identified by '{DEFAULT_CONTENT_DB_WRITE_PASS}';
grant insert, update, delete, select on `default_content`.* to `{DEFAULT_CONTENT_DB_WRITE_USER}`@`%`;
USE `default_content`;
create TABLE if not exists `default_aster_index_content_text` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);
create TABLE if not exists `default_aster_index_content_images` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name TEXT,
    folder_name TEXT
);
create TABLE if not exists `default_aster_about_content_text` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);
create TABLE if not exists `default_aster_about_content_images` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name TEXT,
    folder_name TEXT
);
create TABLE if not exists `default_aster_consultant_content_text` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);
create TABLE if not exists `default_aster_consultant_content_images` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name TEXT,
    folder_name TEXT
);
create TABLE if not exists `default_aster_contact_content_text` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);
create TABLE if not exists `default_aster_work_content_images` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name TEXT,
    folder_name TEXT
);
create TABLE if not exists `default_aster_work_content_text` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT
);