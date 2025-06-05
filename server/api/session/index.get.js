import { getCookie } from 'h3'
import mysql from 'mysql2/promise'

const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.USERS_DB_READ_USER,
    password: process.env.USERS_DB_READ_PASS,
    database: 'users',
})

export default defineEventHandler(async (event) => {
    const sessionToken = getCookie(event, 'loggedIn')
    console.log('Session token:', sessionToken)
    if (!sessionToken) console.log('No session token found in cookies')
    if (!sessionToken) return { loggedIn: false }

    const [rows] = await db.query(
        'SELECT * FROM sessions WHERE token = ?',
        [sessionToken]
    )
    return { loggedIn: rows.length > 0 }
})