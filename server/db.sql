Create database if not exists `email_confirmation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
create user if not exists `aster_email_read_user`@`%` identified by '';
grant select on `email_confirmation`.* to `aster_email_read_user`@`%`;
create user if not exists `aster_email_write_user`@`%` identified by 'TaleogLive55';
grant insert, update, delete, select on `email_confirmation`.* to `aster_email_write_user`@`%`;
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
create user if not exists `aster_aster_read_user`@`%` identified by '';
grant select on `aster_content`.* to `aster_aster_read_user`@`%`;
create user if not exists `aster_aster_write_user`@`%` identified by 'TaleogLive55';
grant insert, update, delete, select on `aster_content`.* to `aster_aster_write_user`@`%`;
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
create user if not exists `aster_users_read_user`@`%` identified by '';
grant select on `users`.* to `aster_users_read_user`@`%`;
create user if not exists `aster_users_write_user`@`%` identified by 'TaleogLive55';
grant insert, update, delete, select on `users`.* to `aster_users_write_user`@`%`;
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
create user if not exists `aster_default_read_user`@`%` identified by '';
grant select on `default_aster_content`.* to `aster_default_read_user`@`%`;
create user if not exists `aster_default_write_user`@`%` identified by 'TaleogLive55';
grant insert, update, delete, select on `default_aster_content`.* to `aster_default_write_user`@`%`;
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
create user if not exists `aster_consultants_read_user`@`%` identified by '';
grant select on `consultants`.* to `aster_consultants_read_user`@`%`;
create user if not exists `aster_consultants_write_user`@`%` identified by 'TaleogLive55';
grant insert, update, delete, select on `consultants`.* to `aster_consultants_write_user`@`%`;
flush privileges;
USE `consultants`;
CREATE TABLE consultants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    description TEXT,
    title VARCHAR(255),
    image_file_name VARCHAR(255)
);