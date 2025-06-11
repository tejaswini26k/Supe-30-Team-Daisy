const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs'); // Run: npm install bcryptjs
const mysql = require('mysql2/promise');

// Create or import your pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'super_30',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// --- Signup ---
router.post('/signup', async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password)
    return res.status(400).json({ message: 'Email and password are required' });

  try {
    const [existing] = await pool.query('SELECT user_id FROM users WHERE email = ?', [email]);
    if (existing.length > 0) {
      return res.status(409).json({ message: 'User already exists' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const [result] = await pool.query(
      'INSERT INTO users (email, password_hash, user_type, created_at, updated_at) VALUES (?, ?, ?, NOW(), NOW())',
      [email, hashedPassword, 'customer']
    );

    res.status(201).json({
      message: 'User registered successfully!',
      userId: result.insertId,
      email
    });
  } catch (err) {
    console.error('Signup error:', err);
    res.status(500).json({ error: 'Server error during signup' });
  }
});

// --- Login ---
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password)
    return res.status(400).json({ message: 'Email and password are required' });

  try {
    const [users] = await pool.query('SELECT user_id, email, password_hash, user_type FROM users WHERE email = ?', [email]);

    if (users.length === 0)
      return res.status(401).json({ message: 'Invalid credentials' });

    const user = users[0];
    const isMatch = await bcrypt.compare(password, user.password_hash);

    if (!isMatch)
      return res.status(401).json({ message: 'Invalid credentials' });

    res.status(200).json({
      message: 'Login successful!',
      user: {
        id: user.user_id,
        email: user.email,
        userType: user.user_type
      }
    });
  } catch (err) {
    console.error('Login error:', err);
    res.status(500).json({ error: 'Server error during login' });
  }
});

module.exports = router;
