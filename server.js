const express = require('express');
const cors = require('cors');

// const productsRoute = require('./routes/products');
const ordersRoute = require('./routes/orders'); 
const customerRoute = require('./routes/customers');
const authRoute = require('./routes/auth');


const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json());

// app.use('/api/products', productsRoute);
app.use('/api/orders', ordersRoute); 
app.use('/api/customers', customerRoute);
app.use('/api/auth', authRoute);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
