# Aster Website

This repository contains the source code for the official website of **Aster**, a small company specializing in IT consulting and logistics The website is built using **Nuxt 3** and **Vue.js** and includes features such as a contact form, customer showcase, and responsive design. I have done everything from planning and designing to coding and testing this website.

(PS: I am not responisble for the choice of images, fonts, and colors)

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
   (Note: Project isnt finished, so the setup might not work properly)
- [Folder Structure](#folder-structure)

---

## Features

- **Responsive Design**: Optimized for desktop and mobile devices.
- **Contact Form**: Users can send inquiries directly from the website.
- **Customer Showcase**: Highlights key customers with logos and descriptions.
- **Hero Banner**: Engaging introduction to the company.
- **Email Confirmation**: Sends confirmation emails using `nodemailer` and a custom EJS template.
- **Dynamic Content**: Built with reusable Vue components.

---

## Technologies Used

- **Nuxt 3**: Framework for building Vue.js applications.
- **Vue.js**: Frontend framework for building user interfaces.
- **Nitro**: Backend framework used in Nuxt projects.
- **Nodemailer**: For sending emails.
- **MySQL**: Database for storing email confirmations.
- **EJS**: Templating engine for email templates.
- **FontAwesome**: Icons for UI elements.
- **CSS**: Styling.

---

## Prerequisites

- npm, pnpm, yarn, or bun
- Mariadb ver 11.7 or above installed locally

---

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/9876543214/Aster-AS.git
   cd Aster-AS
   ```

2. Install dependencies:
   ```bash
   # npm
   
   npm install

   # pnpm

   pnpm install

   # yarn

   yarn install

   # bun

   bun install
   ```

3. Fill out the variables in the "env_example" file, then rename the file to ".env"
   Note:
   - Leave no space between the "=" and the value you entered
   - Passwords can be left empty


5. Edit all the variables (text with "{}" around it) in the "db.sql" file in the "server" folder to the values you entered in the ".env" file with the corresponding variable names


6. Edit "emailConfig" in "server/config" to your own email host


7. Create databases and table structure

   - Open "Command Prompt" as administrator
  
   - Navigate to the "bin" folder in you locally installed MariaDB

   ```bash

   cd "Program Files"\"MariaDB 11.7"\bin

   # Example file path

   ```

   - Start the MariaDB service
  
   ```bash

   net start mariadb

   ```

   - Enter MariaDB with your root user
  
   ```bash

   mariadb -u root -p

   # The default administrative user in MariaDB is "root".
   # If you have renamed the admin user during setup or are using a custom admin user, replace "root" with the correct username.
   # Remove "-p" if your admin user does not use a password

   ```

   - Paste the entire content of the "db.sql" file with the changed variables into mariadb
  
   - Paste the entire content of the "default_data.sql" file in the "server/utils" folder into mariadb
  
8. Navigate back to the root folder of the cloned repostitory in a terminal/cmd

   - Exit mariadb
  
   ```bash

   exit;

   ```

   - Navigate to your cloned repo
   
   ```bash

   cd C:\path\to\cloned\repo

   # Change the file path to your cloned repo

   ```
  
9. Start development server

   ```bash

   # npm
   
   npm run dev

   # pnpm

   pnpm dev

   # yarn

   yarn dev

   # bun

   bun dev

   ```

---

## Folder Structure

Work in progress