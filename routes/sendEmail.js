const express = require('express');
const { v4: uuidv4 } = require('uuid');
const nodemailer = require('nodemailer');
const db = require('../db'); // Adjust path to your database connection

const router = express.Router();

router.post('/send-email', async (req, res) => {
    console.log('Received request:', req.body);
    const { name, email, phone, occasion, message } = req.body;

    if (!name || !email || !message) {
        return res.status(400).send('Alle feltene må fylles ut.');
    }

    try {
        const token = uuidv4();
        await db.query(
            'INSERT INTO email_confirmations (name, email, phone, occasion, message, token) VALUES (?, ?, ?, ?, ?, ?)',
            [name, email, phone, occasion, message, token]
        );

        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: process.env.SEND_EMAIL_USER,
                pass: process.env.SEND_EMAIL_PASS,
            },
        });

        const confirmationLink = `/server/api/confirm-email?token=${token}`;
        const mailOptions = {
            from: process.env.SEND_EMAIL_USER,
            to: email,
            subject: 'Bekreft e-posten din',
            text: `Hei ${name},\n\nKlikk på lenken nedenfor for å bekrefte e-posten din:\n\n${confirmationLink}\n\nTakk!`,
        };

        await transporter.sendMail(mailOptions);
        res.status(200).send('Bekreftelses-e-posten ble sendt.');
    } catch (error) {
        console.error('Error sending confirmation email:', error);
        res.status(500).send('Noe gikk galt.');
    }
});

module.exports = router;