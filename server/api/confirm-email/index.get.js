import mysql from 'mysql2/promise';
import { transporter } from '../../config/emailConfig.js';

const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.EMAIL_DB_WRITE_USER,
    password: process.env.EMAIL_DB_WRITE_PASS,
    database: 'email_confirmation',
});

export default defineEventHandler(async (event) => {
    const { token } = getQuery(event);

    try {
        const [rows] = await db.query('SELECT * FROM email_confirmations WHERE token = ?', [token]);

        if (rows.length === 0) {
            throw createError({ statusCode: 400, message: 'Ugyldig eller utløpt token.' });
        }

        const { name, email, phone, occasion, message } = rows[0];


        const mailOptions = {
            from: process.env.SEND_EMAIL_USER,
            to: process.env.RECEIVE_EMAIL_USER,
            subject: `${name}: ${occasion}`,
            text: `Navn: ${name}\nE-post: ${email}\nTelefon: ${phone}\n\nAnledning: ${occasion}\n\nMelding:\n${message}`,
        };

        await transporter.sendMail(mailOptions);

        await db.query('DELETE FROM email_confirmations WHERE token = ?', [token]);

        return { success: true, message: 'E-posten ble bekreftet og sendt til support.' };
    } catch (error) {
        console.error('Error confirming email:', error);
        throw createError({ statusCode: 500, message: 'Noe gikk galt.' });
    }
});