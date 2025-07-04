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
const dogs = require('./routes/dogs');
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
app.use('/api.dogs', dogs);
// Export the app instead of listening here
module.exports = app;