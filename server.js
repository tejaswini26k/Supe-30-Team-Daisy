const express = require('express');
const cors = require('cors');
const productsRoute = require('./routes/products');
const categoryRoute = require('./routes/categories');
const customerRoute = require('./routes/customers');
const cusdelRoute = require('./routes/customers_delete');
const ordersRoute = require('./routes/orders');
const customerORoute = require('./routes/customers_orders');
const cusAddRoute = require('./routes/customers_add'const express = require('express');
const cors = require('cors');
const productsRoute = require('./routes/products');
const customerRoute = require('./routes/customers');
const ordersRoute = require('./routes/orders');
const customerORoute = require('./routes/customers_orders');
const authRoute = require('./routes/auth');
const feedbackRoute = require('./routes/feedback');
const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json());
app.use('/uploads', express.static('uploads'));

app.use('/api/products', productsRoute);

app.use('/api/customers', customerRoute);

app.use('/api/orders', ordersRoute); 

app.use('/api/customers_orders', customerORoute);
app.use('/api/feedback', feedbackRoute);

app.use('/api/auth', authRoute);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
);
const authRoute = require('./routes/auth');

const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json());

app.use('/api/products', productsRoute);

app.use('/api/categories', categoryRoute);

app.use('/api/customers', customerRoute);

app.use('/api/customers', cusdelRoute);

app.use('/api/orders', ordersRoute); 

app.use('/api/customers_orders', customerORoute);

app.use('/api/customers_add',cusAddRoute);
app.use('/api/auth', authRoute);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
