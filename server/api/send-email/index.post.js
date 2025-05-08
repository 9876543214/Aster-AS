// filepath: c:\Users\Ulrik\IT-utvikling\Vue.js\Aster\aster-as\server\api\send-email
import nodemailer from 'nodemailer';
import { v4 as uuidv4 } from 'uuid';
import mysql from 'mysql2/promise';

const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.EMAIL_DB_WRITE_USER,
    password: process.env.EMAIL_DB_WRITE_PASS,
    database: 'email_confirmation',
});

export default defineEventHandler(async (event) => {
    const body = await readBody(event); // Parse the request body
    const { name, email, phone, occasion, message } = body;

    console.log('Request body:', body); // Log the request body
    console.log('Environment variables:', {
        DB_HOST: process.env.DB_HOST,
        EMAIL_DB_WRITE_USER: process.env.EMAIL_DB_WRITE_USER,
        EMAIL_DB_WRITE_PASS: process.env.EMAIL_DB_WRITE_PASS,
        SEND_EMAIL_USER: process.env.SEND_EMAIL_USER,
        SEND_EMAIL_PASS: process.env.SEND_EMAIL_PASS,
        BASE_URL: process.env.BASE_URL,
    });

    if (!name || !email || !message) {
        throw createError({ statusCode: 400, message: 'Alle feltene må fylles ut.' });
    }

    try {
        const token = uuidv4();
        console.log('Generated token:', token); // Log the generated token

        await db.query(
            'INSERT INTO email_confirmations (name, email, phone, occasion, message, token) VALUES (?, ?, ?, ?, ?, ?)',
            [name, email, phone, occasion, message, token]
        );
        console.log('Database query executed successfully'); // Log after the query

        const transporter = nodemailer.createTransport({
            host: 'mailcluster.loopia.se',
            port: '587',
            secure: false, // true for 465, false for other ports
            auth: {
                user: process.env.SEND_EMAIL_USER,
                pass: process.env.SEND_EMAIL_PASS,
            },
        });
        console.log('Transporter created successfully'); // Log after creating the transporter

        const confirmationLink = `${process.env.BASE_URL}/emailConfirmation?token=${token}`;
        console.log('Confirmation link:', confirmationLink); // Log the confirmation link

        const mailOptions = {
            from: process.env.SEND_EMAIL_USER,
            to: email,
            subject: 'Bekreft e-posten din',
            text: `Hei ${name},\n\nKlikk på lenken nedenfor for å bekrefte e-posten din:\n\n${confirmationLink}\n\nTakk!`,
        };
        console.log('Mail options:', mailOptions); // Log the mail options

        await transporter.sendMail(mailOptions);
        console.log('Email sent successfully'); // Log after sending the email

        return { success: true, message: 'Bekreftelses-e-posten ble sendt.' };
    } catch (error) {
        console.error('Error sending confirmation email:', error); // Log the error
        throw createError({ statusCode: 500, message: 'Noe gikk galt.' });
    }
});