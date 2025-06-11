const express = require('express');
const router = express.Router();
const mysql = require('mysql2');

// DB Connection (replace values as per your local setup)
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // your MySQL password
  database: 'e-commerce-app',
});

// GET /api/categories
router.get('/', (req, res) => {
    const query = 'SELECT * FROM customers';
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error fetching customers:', err);
        return res.status(500).json({ error: 'Database error' });
      }
      res.json(results);
    });
  });

module.exports = router;
