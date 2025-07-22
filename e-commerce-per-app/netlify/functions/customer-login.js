// netlify/functions/customer-login.js
import { neon } from '@netlify/neon';
import jwt from 'jsonwebtoken';
const sql = neon();

export async function handler(event) {
  const { email, password, store_id } = JSON.parse(event.body || '{}');

  if (!email || !password || !store_id) {
    return {
      statusCode: 400,
      body: JSON.stringify({ message: 'Email, password, and store ID are required' })
    };
  }

  try {
    const users = await sql`
      SELECT customer_id, email, password, store_id
      FROM customers
      WHERE email = ${email} AND store_id = ${store_id}
    `;

    if (users.length === 0 || users[0].password !== password) {
      return {
        statusCode: 401,
        body: JSON.stringify({ message: 'Invalid credentials' })
      };
    }

    const customer = users[0];
    const token = jwt.sign(
      {
        customer_id: customer.customer_id,
        store_id: customer.store_id,
        user_type: 'customer'
      },
      process.env.JWT_SECRET || 'your-secret-key',
      { expiresIn: '1h' }
    );

    return {
      statusCode: 200,
      body: JSON.stringify({
        message: 'Login successful!',
        user: {
          id: customer.customer_id,
          email: customer.email,
          storeId: customer.store_id
        },
        token
      })
    };
  } catch (err) {
    console.error('Login error:', err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Server error during login' })
    };
  }
}
