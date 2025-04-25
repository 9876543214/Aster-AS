const express = require('express');
const nodemailer = require('nodemailer');
const cors = require('cors');
const bodyParser = require('body-parser');
const { v4: uuidv4 } = require('uuid');
const mysql = require('mysql2/promise');
const passwords = require('./passwords.json');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());

// Database connection
const db = mysql.createPool({
    host: 'localhost',
    user: 'your-db-user',
    password: 'your-db-password',
    database: 'your-database-name',
});

// Email sending endpoint
app.post('/api/send-email', async (req, res) => {
    const { name, email, phone, occasion, message } = req.body;

    if (!name || !email || !message) {
        return res.status(400).send('Alle feltene må fylles ut.');
    }

    try {
        // Generate a unique confirmation token
        const token = uuidv4();

        // Store the token and user details in the database
        await db.query(
            'INSERT INTO email_confirmations (name, email, phone, occasion, message, token) VALUES (?, ?, ?, ?, ?, ?)',
            [name, email, phone, occasion, message, token]
        );

        // Send confirmation email
        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: passwords.sendEmail.user,
                pass: passwords.sendEmail.pass,
            },
        });

        const confirmationLink = `http://localhost:${PORT}/api/confirm-email?token=${token}`;
        const mailOptions = {
            from: passwords.sendEmail.user,
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

// Email confirmation endpoint
app.get('/api/confirm-email', async (req, res) => {
    const { token } = req.query;

    try {
        // Retrieve the user details using the token
        const [rows] = await db.query('SELECT * FROM email_confirmations WHERE token = ?', [token]);

        if (rows.length === 0) {
            return res.status(400).send('Ugyldig eller utløpt token.');
        }

        const { name, email, phone, occasion, message } = rows[0];

        // Send the contact email to the support email
        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: passwords.sendEmail.user,
                pass: passwords.sendEmail.pass,
            },
        });

        const mailOptions = {
            from: passwords.sendEmail.user,
            to: passwords.receiveEmail.user,
            subject: `${name}: ${occasion}`,
            text: `Navn: ${name}\nE-post: ${email}\nTelefon: ${phone}\n\nMelding:\n${message}`,
        };

        await transporter.sendMail(mailOptions);

        // Delete the token from the database
        await db.query('DELETE FROM email_confirmations WHERE token = ?', [token]);

        res.status(200).send('E-posten ble bekreftet og sendt til support.');
    } catch (error) {
        console.error('Error confirming email:', error);
        res.status(500).send('Noe gikk galt.');
    }
});

setInterval(async () => { // deletes expired records every 3 hours
    try {
        const [result] = await db.query('DELETE FROM email_confirmations WHERE expires_at < NOW()');
        if (result.affectedRows > 0) {
            console.log(`Deleted ${result.affectedRows} expired records.`);
        }
    } catch (error) {
        console.error('Error cleaning up expired records:', error);
    }
}, 10800000); // Run every 3 hours (10800000 ms)

// Start server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});