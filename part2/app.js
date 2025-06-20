const express = require('express');
const path = require('path');
require('dotenv').config();

const app = express();

// Middleware
app.use(express.json());
app.use(express.static(path.join(__dirname, '/public')));

// cookies
var cookieParser = require('cookie-parser');
app.use(cookieParser());

// Routes
const walkRoutes = require('./routes/walkRoutes');
const userRoutes = require('./routes/userRoutes');

// Session
var session = require('express-session');
app.use(session({
    secret: 'dog-secret',
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }
}));

app.use('/api/walks', walkRoutes);
app.use('/api/users', userRoutes);
app.get('/api/dogs', async (req, res) => {
    try {
        const [rows] = await db.execute(`
            SELECT d.name AS dog_name, d.size, u.username AS owner_username
            FROM Dogs d
            Join Users u ON d.owner_id = u.user_id
            `);
            res.json(rows);
    } catch (err) {
        res.sendStatus(500).json({ error: 'Failed' });
    }
});
// Export the app instead of listening here
module.exports = app;