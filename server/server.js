const express = require('express');
const nodemailer = require('nodemailer');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Email sending endpoint
app.post('/api/send-email', async (req, res) => {
    const { name, email, message } = req.body;

    if (!name || !email || !message) {
        return res.status(400).send('Alle feltene må fylles ut.');
    }

    try {
        // Configure Nodemailer
        const transporter = nodemailer.createTransport({
            service: 'gmail', // Use your email provider
            auth: {
                user: 'noreply@aster.no', // Replace with your email
                pass: 'your-email-password', // Replace with your email password
            },
        });

        // Email options
        const mailOptions = {
            from: email, // Sender's email
            to: 'support@aster.no', // Your support email
            subject: `Ny melding fra ${name}`,
            text: `Navn: ${name}\nE-post: ${email}\n\nMelding:\n${message}`,
        };

        // Send email
        await transporter.sendMail(mailOptions);
        res.status(200).send('E-posten ble sendt.');
    } catch (error) {
        console.error('Error sending email:', error);
        res.status(500).send('Noe gikk galt.');
    }
});

// Start server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});