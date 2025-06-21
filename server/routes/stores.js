const express = require('express');
const router = express.Router();
const mysql = require('mysql2');
const bcrypt = require('bcryptjs');
const fs = require('fs');
const path = require('path');
const multer = require('multer');

// ✅ MySQL connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'e-commerce-db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
}).promise();

// ✅ Ensure uploads directory exists
const uploadDir = path.join(__dirname, '../uploads');
if (!fs.existsSync(uploadDir)) fs.mkdirSync(uploadDir, { recursive: true });

// ✅ Multer setup for logo upload
const storage = multer.diskStorage({
  destination: uploadDir,
  filename: (req, file, cb) => cb(null, Date.now() + path.extname(file.originalname)),
});
const upload = multer({ storage });

// ✅ POST /api/stores — Create store
router.post('/', upload.single('logo'), async (req, res) => {
  try {
    const {
      store_name, slug, description, store_email,
      facebook, instagram, theme, primary_color,
      currency, timezone, business_type, password,
    } = req.body;

    const hashedPassword = await bcrypt.hash(password, 10);
    const logo = req.file ? `/uploads/${req.file.filename}` : null;

    const sql = `
      INSERT INTO stores
      (store_name, slug, description, store_email, facebook, instagram,
       theme, primary_color, logo, currency, timezone, business_type, password)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const [result] = await pool.query(sql, [
      store_name, slug, description, store_email, facebook, instagram,
      theme, primary_color, logo, currency, timezone, business_type, hashedPassword,
    ]);

    res.status(201).json({ message: '✅ Store created successfully', store_id: result.insertId });
  } catch (err) {
    console.error('❌ Store creation failed:', err);
    res.status(500).json({ error: err.message || 'Unknown server error' });
  }
});

// ✅ GET /api/stores — All stores
router.get('/', async (req, res) => {
  try {
    const [stores] = await pool.query('SELECT * FROM stores');
    res.json(stores);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// ✅ GET /api/stores/:id — Get store by ID
router.get('/:id', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM stores WHERE id = ?', [req.params.id]);
    if (rows.length === 0) return res.status(404).json({ error: 'Store not found' });
    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
