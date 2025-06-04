import mysql from 'mysql2/promise';

const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.EMAIL_DB_WRITE_USER,
    password: process.env.EMAIL_DB_WRITE_PASS,
    database: 'email_confirmation',
});

async function deleteExpiredEmails() {
    try {
        const [result] = await db.query(
            'DELETE FROM email_confirmations WHERE expires_at < NOW()'
        );
        console.log(`Deleted ${result.affectedRows} expired emails.`);
    } catch (error) {
        console.error('Error deleting expired emails:', error);
    }
}

// Run every 3 hours (3 * 60 * 60 * 1000 ms)
setInterval(deleteExpiredEmails, 3 * 60 * 60 * 1000);

// run once on startup
deleteExpiredEmails();