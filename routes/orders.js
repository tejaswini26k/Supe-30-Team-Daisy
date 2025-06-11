const express = require('express');
const router = express.Router();
const mysql = require('mysql2');

// Set up DB connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '', // Update if necessary
  database: 'super_30',
});

// GET all orders with customer names
router.get('/', (req, res) => {
  const sql = `
    SELECT o.order_id, o.date_ordered, o.total_amount, o.status, 
           c.customer_name
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    ORDER BY o.date_ordered DESC
  `;
  db.query(sql, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

// POST new order
router.post('/', (req, res) => {
  const { customer_id, total_amount, status } = req.body;
  const sql = 'INSERT INTO orders (date_ordered, total_amount, customer_id, status) VALUES (NOW(), ?, ?, ?)';
  db.query(sql, [total_amount, customer_id, status], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ message: 'Order created', orderId: result.insertId });
  });
});


// PUT update order status
router.put('/:orderId/status', (req, res) => {
  const { orderId } = req.params;
  const { status } = req.body;
  const sql = 'UPDATE orders SET status = ? WHERE order_id = ?';
  db.query(sql, [status, orderId], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Order status updated successfully' });
  });
});

module.exports = router;
