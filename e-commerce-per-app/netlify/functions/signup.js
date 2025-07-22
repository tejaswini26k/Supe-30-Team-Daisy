// netlify/functions/signup.js
import { neon } from '@netlify/neon';
const sql = neon();

export async function handler(event) {
  const { email, password, userType } = JSON.parse(event.body || '{}');

  if (!email || !password) {
    return {
      statusCode: 400,
      body: JSON.stringify({ message: 'Email and password are required' }),
    };
  }

  try {
    const existing = await sql`SELECT user_id FROM users WHERE email = ${email}`;
    if (existing.length > 0) {
      return {
        statusCode: 409,
        body: JSON.stringify({ message: 'User already exists' }),
      };
    }

    const actualUserType = ['shop_owner', 'admin'].includes(userType) ? userType : 'shop_owner';

    const result = await sql`
      INSERT INTO users (email, password, user_type, created_at, updated_at)
      VALUES (${email}, ${password}, ${actualUserType}, NOW(), NOW())
      RETURNING user_id
    `;

    return {
      statusCode: 201,
      body: JSON.stringify({
        message: 'User registered successfully!',
        userId: result[0].user_id,
        email,
      }),
    };
  } catch (err) {
    console.error('Signup error:', err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Server error during signup' }),
    };
  }
}
