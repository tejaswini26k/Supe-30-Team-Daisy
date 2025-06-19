const express = require('express');
const cors = require('cors');
const routes = require('./routes');

console.log('Imported routes:', typeof routes);
const app = express();
const port = 5000;

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/uploads', express.static('uploads'));

app.use('/api', routes);

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
