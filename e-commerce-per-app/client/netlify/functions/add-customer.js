// netlify/functions/add-customer.js
import { neon } from '@netlify/neon';
import { authenticate } from '../utils/auth.js';

const sql = neon();

export async function handler(event) {
  const { customer_name, email, phone_number, address, password } = JSON.parse(event.body || '{}');

  if (!customer_name || !email || !phone_number || !password) {
    return { statusCode: 400, body: JSON.stringify({ message: 'Missing required fields' }) };
  }

  try {
    const { store_id } = authenticate(event);

    await sql`
      INSERT INTO customers (customer_name, email, phone_number, address, password, date_joined, store_id)
      VALUES (${customer_name}, ${email}, ${phone_number}, ${address}, ${password}, NOW(), ${store_id})
    `;

    return { statusCode: 201, body: JSON.stringify({ message: 'Customer added successfully' }) };

  } catch (err) {
    console.error('Insert error:', err);
    return { statusCode: 500, body: JSON.stringify({ error: 'Database insert failed' }) };
  }
}
