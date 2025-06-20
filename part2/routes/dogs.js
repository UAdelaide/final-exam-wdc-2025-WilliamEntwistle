const express = require('express');
const router = express.Router();
const db = require('../models/db');

router.get('/api/dogs', async (req, res) => {
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

module.exports = router;