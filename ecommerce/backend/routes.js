const bcrypt = require('bcryptjs');



const express = require('express');
const router = express.Router();
const pool = require('./db');
const multer = require('multer');
const fs = require('fs');
const path = require('path');


// USERS
router.post('/signup', async (req, res) => {
  const { user_id, email, password, user_type = 'customer', store_id = null } = req.body;

  try {
    const [result] = await pool.query(
      `INSERT INTO users (user_id, email, password, user_type, store_id)
       VALUES (?, ?, ?, ?, ?)`,
      [user_id, email, password, user_type, store_id]
    );

    res.status(201).json({ user_id });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to sign up user' });
  }
});



router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  const [rows] = await pool.query(
    'SELECT * FROM users WHERE email = ?',
    [email]
  );

  if (rows.length === 0) {
    return res.status(401).json({ error: 'Invalid credentials' });
  }

  const user = rows[0];
  const isMatch = await bcrypt.compare(password, user.password);

  if (!isMatch) {
    return res.status(401).json({ error: 'Invalid credentials' });
  }

  // Remove password from response for security
  delete user.password;

  res.json(user);
});


router.get('/users', async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM users');
  res.json(rows);
});

// CUSTOMERS
router.get('/customers', async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM customers');
  res.json(rows);
});
router.post('/customers', async (req, res) => {
  const { customer_name, phone_number = null, address = null, email, password, store_id = null } = req.body;

  if (!customer_name || !email || !password) {
    return res.status(400).json({ error: 'customer_name, email, and password are required' });
  }

  try {
    const [result] = await pool.query(
      `INSERT INTO customers (
         customer_name, phone_number, address, email, password, date_joined, store_id
       ) VALUES (?, ?, ?, ?, ?, CURDATE(), ?)`,
      [customer_name, phone_number, address, email, password, store_id]
    );

    res.status(201).json({ customer_id: result.insertId });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create customer' });
  }
});



// ORDERS
router.get('/orders', async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM orders');
  res.json(rows);
});

router.post('/orders', async (req, res) => {
  const { customer_id, total_amount, status = 'Pending' } = req.body;

  try {
    const [result] = await pool.query(
      `INSERT INTO orders (date_ordered, total_amount, customer_id, status)
       VALUES (NOW(), ?, ?, ?)`,
      [total_amount, customer_id, status]
    );

    res.status(201).json({ order_id: result.insertId });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create order' });
  }
});


// ORDER ITEMS
router.get('/order_items', async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM order_items');
  res.json(rows);
});

router.post('/order_items', async (req, res) => {
  const { order_id, product_id, quantity, store_id } = req.body;

  try {
    const [result] = await pool.query(
      'INSERT INTO order_items (order_id, product_id, quantity, store_id) VALUES (?, ?, ?, ?)',
      [order_id, product_id, quantity, store_id]
    );

    res.status(201).json({ order_item_id: result.insertId });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error', details: err.message });
  }
});


// PRODUCTS
router.get('/products', async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM products');
  res.json(rows);
});

router.post('/products', async (req, res) => {
  const {
    product_name,
    description,
    price,
    stock_quantity,
    image_url,
    product_category,
    store_id
  } = req.body;

  const [result] = await pool.query(
    `INSERT INTO products
    (product_name, description, price, stock_quantity, image_url, product_category, store_id)
    VALUES (?, ?, ?, ?, ?, ?, ?)`,
    [product_name, description, price, stock_quantity, image_url, product_category, store_id]
  );

  res.status(201).json({ product_id: result.insertId });
});


// FEEDBACK
router.get('/feedback', async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM feedback');
  res.json(rows);
});

router.post('/feedback', async (req, res) => {
  const { customer_id, rating, review_description, product_id = null, store_id = null } = req.body;
  const [result] = await pool.query(
    `INSERT INTO feedback (review_date, customer_id, rating, product_id, store_id, review_description)
     VALUES (NOW(), ?, ?, ?, ?, ?)`,
    [customer_id, rating, product_id, store_id, review_description]
  );
  res.status(201).json({ feedback_id: result.insertId });
});


// SALES
router.get('/sales', async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM sales');
  res.json(rows);
});

router.post('/sales', async (req, res) => {
  const {
    sale_type,
    product_id,
    quantity_sold,
    unit_price_at_sale,
    store_id,
    customer_id = null
  } = req.body;

  // Input validation
  if (
    !sale_type || !product_id || !quantity_sold || !unit_price_at_sale || !store_id ||
    isNaN(quantity_sold) || isNaN(unit_price_at_sale)
  ) {
    return res.status(400).json({ error: 'Missing or invalid required fields' });
  }

  const total_sale_amount = quantity_sold * unit_price_at_sale;

  try {
    const [result] = await pool.query(
      `INSERT INTO sales (
        sale_date, sale_type, product_id, quantity_sold, unit_price_at_sale,
        total_sale_amount, store_id, customer_id
      ) VALUES (NOW(),?,?,?,?,?,?,?)`,
      [
        sale_type,
        product_id,
        quantity_sold,
        unit_price_at_sale,
        total_sale_amount,
        store_id,
        customer_id
      ]
    );

    res.status(201).json({ sale_id: result.insertId });
  } catch (err) {
    console.error('SQL Error:', err);
    res.status(500).json({ error: 'Database insert failed' });
  }
});


// STORES
/*router.get('/stores', async (req, res) => {
  const [rows] = await pool.query('SELECT * FROM stores');
  res.json(rows);
});

router.post('/stores', async (req, res) => {
  const { store_name, store_email, store_address } = req.body;
  const [result] = await pool.query(
    `INSERT INTO stores (store_name, store_email, store_address, created_at, updated_at)
     VALUES (?,?,?,NOW(),NOW())`,
    [store_name, store_email, store_address]
  );
  res.status(201).json({ store_id: result.insertId });
});*/

// Ensure the uploads directory exists
const uploadPath = path.join(__dirname, '../uploads');
if (!fs.existsSync(uploadPath)) fs.mkdirSync(uploadPath, { recursive: true });


const storage = multer.diskStorage({
  destination: uploadPath,
  filename: (req, file, cb) => cb(null, Date.now() + path.extname(file.originalname))
});
const upload = multer({ storage });

// CREATE STORE
router.post('/stores', upload.single('logo'), (req, res) => {
  const {
    store_name, slug, description, store_email,
    facebook, instagram, theme, primary_color,
    currency, timezone, business_type, password
  } = req.body;

  const logo = req.file ? `/uploads/${req.file.filename}` : null;

  const sql = `
    INSERT INTO stores
    (store_name, slug, description, store_email, facebook, instagram,
     theme, primary_color, logo, currency, timezone, business_type, password)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  const values = [store_name, slug, description, store_email, facebook, instagram,
    theme, primary_color, logo, currency, timezone, business_type, password];

  pool.query(sql, values, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Store created', id: result.insertId });
  });
});

// GET ALL STORES
router.get('/stores', (req, res) => {
  pool.query('SELECT * FROM stores', (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
});

// GET SINGLE STORE
router.get('/stores/:id', (req, res) => {
  pool.query(
    'SELECT * FROM stores WHERE store_id = ?',
    [req.params.id],
    (err, rows) => {
      if (err) return res.status(500).json({ error: err.message });
      if (rows.length === 0) return res.status(404).json({ error: 'Store not found' });
      res.json(rows[0]);
    }
  );
});


// UPDATE STORE
router.put('/:id', upload.single('logo'), (req, res) => {
  const {
    store_name, slug, description, store_email,
    facebook, instagram, theme, primary_color,
    currency, timezone, business_type, password
  } = req.body;

  const logo = req.file ? `/uploads/${req.file.filename}` : req.body.existingLogo;

  const sql = `
    UPDATE stores
    SET store_name = ?, slug = ?, description = ?, store_email = ?, facebook = ?,
        instagram = ?, theme = ?, primary_color = ?, logo = ?, currency = ?, timezone = ?,
        business_type = ?, password = ?
    WHERE store_id = ?`;

  const values = [store_name, slug, description, store_email, facebook, instagram,
    theme, primary_color, logo, currency, timezone, business_type, password, req.params.id];

  pool.query(sql, values, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Store updated' });
  });
});

// DELETE STORE
router.delete('/:id', (req, res) => {
  pool.query('DELETE FROM stores WHERE store_id = ?', [req.params.id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Store deleted' });
  });
});

// Example route (POST /stores)
router.post('/stores', upload.single('logo'), (req, res) => {
  const {
    store_name,
    slug,
    description,
    store_email,
    password,
    facebook,
    instagram,
    theme,
    primary_color,
    logo,
    currency,
    timezone,
    business_type
  } = req.body;
console.log("Received store data:", req.body);
console.log("Uploaded logo:", req.file);

  const sql = `
  INSERT INTO stores
  (store_name, slug, description, store_email, facebook, instagram,
   theme, primary_color, logo, currency, timezone, business_type, password)
  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
`;

  pool.query(sql, [
    store_name, slug, description, store_email, password, facebook, instagram,
    theme, primary_color, logo, currency, timezone, business_type
  ], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ message: 'Store created successfully', store_id: result.insertId });
  });
});


console.log('Exporting router:', typeof router);
module.exports = router;


