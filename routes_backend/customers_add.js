const express = require('express');
const router = express.Router();
const mysql = require('mysql2');

// DB Connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'e-commerce-app',
});

// POST /api/customers_add
router.post('/', (req, res) => {
  const { customer_name, phone_number, email, address } = req.body;

  if (!customer_name || !phone_number || !email || !address) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  const query = `
  INSERT INTO customers 
    (customer_name, phone_number, email, address, no_of_orders, amount_spent, date_joined, user_id)
  VALUES (?, ?, ?, ?, 0, 0, NOW(), NULL)
`;


  db.query(query, [customer_name, phone_number, email, address], (err, result) => {
    if (err) {
      console.error('DB Insert Error:', err);
      return res.status(500).json({ error: 'Database error' });
    }
    res.status(201).json({ message: 'Customer added', customer_id: result.insertId });
  });
});

module.exports = router;
