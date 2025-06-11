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

// /api/customers/delete
// ✅ POST: Delete selected customers by IDs
router.post('/delete', (req, res) => {
    const { ids } = req.body;
  
    if (!Array.isArray(ids) || ids.length === 0) {
      return res.status(400).json({ error: 'No customer IDs provided' });
    }
  
    const query = 'DELETE FROM customers WHERE customer_id IN (?)';
    db.query(query, [ids], (err, result) => {
      if (err) {
        console.error('Error deleting customers:', err);
        return res.status(500).json({ error: 'Failed to delete customers' });
      }
      res.json({ success: true, deleted: result.affectedRows });
    });
  });

module.exports = router;
