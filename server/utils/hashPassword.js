import bcrypt from 'bcrypt'

const password = 'Password123'
const saltRounds = 10

bcrypt.hash(password, saltRounds, function (err, hash) {
    if (err) throw err
    console.log('Hashed password:', hash)
})