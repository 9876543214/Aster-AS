import nodemailer from 'nodemailer';
import { v4 as uuidv4 } from 'uuid';
import mysql from 'mysql2/promise';
import ejs from 'ejs';
import path from 'path';
import { transporter } from '../../config/emailConfig.js';

const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.EMAIL_DB_WRITE_USER,
    password: process.env.EMAIL_DB_WRITE_PASS,
    database: 'email_confirmation',
});

export default defineEventHandler(async (event) => {
    const body = await readBody(event);
    const { name, email, phone, occasion, message } = body;

    if (!name || !email || !message) {
        throw createError({ statusCode: 400, message: 'Alle feltene må fylles ut.' });
    }

    try {
        const token = uuidv4();

        const confirmationLink = `${process.env.BASE_URL}emailConfirmation?token=${token}`;
        const templatePath = path.resolve('server/templates/emailTemplate.ejs');
        const emailHtml = await ejs.renderFile(templatePath, { name, confirmationLink });

        const mailOptions = {
            from: process.env.SEND_EMAIL_USER,
            to: email,
            subject: 'Bekreft e-posten din',
            html: emailHtml,
        };

        await transporter.sendMail(mailOptions);
        console.log('Email sent successfully');

        // Only save to DB if email was sent
        await db.query(
            'INSERT INTO email_confirmations (name, email, phone, occasion, message, token) VALUES (?, ?, ?, ?, ?, ?)',
            [name, email, phone, occasion, message, token]
        );
        console.log('Database query executed successfully');

        return { success: true, message: 'Bekreftelses-e-posten ble sendt.' };
    } catch (error) {
        console.error('Error sending confirmation email:', error);
        throw createError({ statusCode: 500, message: 'Noe gikk galt.' });
    }
});