Create database if not exists `email_confirmation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
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