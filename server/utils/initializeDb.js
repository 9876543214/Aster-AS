import fs from 'fs';
import path from 'path';
import mysql from 'mysql2/promise';

const initializeDatabase = async () => {
    try {
        // Read the SQL file
        const sqlFilePath = path.join(process.cwd(), 'server', 'db.sql');
        const sql = fs.readFileSync(sqlFilePath, 'utf8');

        // Connect to the database
        const connection = await mysql.createConnection({
            host: process.env.DB_HOST,
            user: process.env.DB_ROOT_USER || 'root', // Use root or a privileged user
            password: process.env.DB_ROOT_PASS || '', // Root password
        });

        // Split the SQL file into individual statements and execute them
        const statements = sql.split(';').filter((stmt) => stmt.trim()); // Remove empty statements
        for (const statement of statements) {
            await connection.query(statement);
        }

        console.log('Database initialized successfully.');
        await connection.end();
    } catch (error) {
        console.error('Error initializing database:', error);
    }
};

export default initializeDatabase;