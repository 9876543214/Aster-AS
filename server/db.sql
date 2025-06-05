Create database if not exists `email_confirmation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
create user if not exists `{EMAIL_DB_READ_USER}`@`%` identified by '{EMAIL_DB_READ_PASS}';
grant select on `email_confirmation`.* to `{EMAIL_DB_READ_USER}`@`%`;
create user if not exists `{EMAIL_DB_WRITE_USER}`@`%` identified by '{EMAIL_DB_WRITE_PASS}';
grant insert, update, delete, select on `email_confirmation`.* to `{EMAIL_DB_WRITE_USER}`@`%`;
flush privileges;
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
flush privileges;
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
flush privileges;
USE `users`;
CREATE TABLE if not exists users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE sessions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
insert into users (name, password) values ('admin', '$2b$10$Tfcqk16bns/fCx7DaOpSVux44YB0xYmO/GIXuKqTItnOwcIQBrMR.');

create database if not exists `default_aster_content` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
create user if not exists `{DEFAULT_CONTENT_DB_READ_USER}`@`%` identified by '{DEFAULT_CONTENT_DB_READ_PASS}';
grant select on `default_content`.* to `{DEFAULT_CONTENT_DB_READ_USER}`@`%`;
create user if not exists `{DEFAULT_CONTENT_DB_WRITE_USER}`@`%` identified by '{DEFAULT_CONTENT_DB_WRITE_PASS}';
grant insert, update, delete, select on `default_content`.* to `{DEFAULT_CONTENT_DB_WRITE_USER}`@`%`;
flush privileges;
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




create database if not exists `consultants` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
create user if not exists `{CONSULTANTS_DB_READ_USER}`@`%` identified by '{CONSULTANTS_DB_READ_PASS}';
grant select on `consultants`.* to `{CONSULTANTS_DB_READ_USER}`@`%`;
create user if not exists `{CONSULTANTS_DB_WRITE_USER}`@`%` identified by '{CONSULTANTS_DB_WRITE_PASS}';
grant insert, update, delete, select on `consultants`.* to `{CONSULTANTS_DB_WRITE_USER}`@`%`;
flush privileges;
USE `consultants`;
CREATE TABLE consultants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    description TEXT,
    title VARCHAR(255),
    image_file_name VARCHAR(255),  
);
