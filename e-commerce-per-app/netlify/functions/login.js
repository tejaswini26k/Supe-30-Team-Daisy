// netlify/functions/login.js
import { neon } from '@netlify/neon';
import jwt from 'jsonwebtoken';

const sql = neon();

export async function handler(event) {
  const { email, password } = JSON.parse(event.body || '{}');

  if (!email || !password) {
    return {
      statusCode: 400,
      body: JSON.stringify({ message: 'Email and password are required' }),
    };
  }

  try {
    const users = await sql`
      SELECT user_id, email, password, user_type, store_id
      FROM users
      WHERE email = ${email}
    `;

    if (users.length === 0 || users[0].password !== password) {
      return {
        statusCode: 401,
        body: JSON.stringify({ message: 'Invalid credentials' }),
      };
    }

    const user = users[0];
    const token = jwt.sign(
      {
        user_id: user.user_id,
        store_id: user.store_id,
        user_type: user.user_type,
      },
      'your-secret-key',
      { expiresIn: '1h' }
    );

    return {
      statusCode: 200,
      body: JSON.stringify({
        message: 'Login successful!',
        user: {
          id: user.user_id,
          email: user.email,
          userType: user.user_type,
          storeId: user.store_id,
        },
        token,
      }),
    };
  } catch (err) {
    console.error('Login error:', err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Server error during login' }),
    };
  }
}
