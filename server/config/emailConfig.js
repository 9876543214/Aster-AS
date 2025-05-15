import nodemailer from 'nodemailer';

// Configure the email transport. Replace 'mailcluster.loopia.se' with your own email host.
export const transporter = nodemailer.createTransport({
    host: 'mailcluster.loopia.se', // Change this to your email provider's SMTP host (e.g., smtp.gmail.com for gmial)
    port: '587', // Use the correct port for your provider (587 for TLS (recommended), 465 for SSL)
    secure: false, // Set to true if using port 465 (SSL), false for other ports
    auth: {
        user: process.env.SEND_EMAIL_USER,
        pass: process.env.SEND_EMAIL_PASS,
    },
});