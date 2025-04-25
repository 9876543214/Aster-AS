Create database if not exists `email_confirmation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
create user if not exists `{EMAIL_DB_READ_USER}`@`%` identified by '{EMAIL_DB_READ_PASS}';
grant select on `email_confirmation`.* to `{EMAIL_DB_READ_USER}`@`%`;
create user if not exists `{EMAIL_DB_WRITE_USER}`@`%` identified by '{EMAIL_DB_WRITE_PASS}';
grant insert, update, delete on `email_confirmation`.* to `{EMAIL_DB_WRITE_USER}`@`%`;
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
    expires_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP + INTERVAL 3 DAY
);

create database if not exists `aster_content` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aster_content`;
create user if not exists `{ASTER_DB_READ_USER}`@`%` identified by '{ASTER_DB_READ_PASS}';
grant select on `aster_content`.* to `{ASTER_DB_READ_USER}`@`%`;
create user if not exists `{ASTER_DB_WRITE_USER}`@`%` identified by '{ASTER_DB_WRITE_PASS}';
grant insert, update, delete on `aster_content`.* to `{ASTER_DB_WRITE_USER}`@`%`;
USE `aster_content`;
CREATE TABLE aster_index_content_text (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT,
)