import mysql from 'mysql2/promise'
import bcrypt from 'bcrypt'
import { v4 as uuidv4 } from 'uuid'
import { setCookie } from 'h3'

const db = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.USERS_DB_WRITE_USER,
    password: process.env.USERS_DB_WRITE_PASS,
    database: 'users',
})

export default defineEventHandler(async (event) => {
    const body = await readBody(event)
    const { username, password } = body

    // Find user by username
    const [rows] = await db.query(
        'SELECT id, name, password FROM users WHERE name = ? LIMIT 1',
        [username]
    )
    const user = rows[0]

    if (!user) {
        return { success: false, message: 'User not found' }
    }
    // Compare password with hash
    const passwordMatch = await bcrypt.compare(password, user.password)
    if (!passwordMatch) {
        return { success: false, message: 'Incorrect password' }
    }

    const sessionToken = uuidv4()

    await db.query(
        'INSERT INTO sessions (user_id, token, created_at) VALUES (?, ?, NOW())',
        [user.id, sessionToken]
    )

    setCookie(event, 'loggedIn', sessionToken, {
        httpOnly: true,
        path: '/',
        maxAge: 60 * 60 * 24, // 1 day
        sameSite: 'lax',
        secure: process.env.NODE_ENV === 'production'
    })

    return { success: true, user: { id: user.id, username: user.name } }
})