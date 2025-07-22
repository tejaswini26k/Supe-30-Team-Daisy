// netlify/functions/customer-signup.js
import { neon } from '@netlify/neon';
const sql = neon();

export async function handler(event) {
  const { customer_name, email, password, phone_number, address, store_id } = JSON.parse(event.body || '{}');

  if (!email || !password || !customer_name || !phone_number || !address || !store_id) {
    return {
      statusCode: 400,
      body: JSON.stringify({ message: 'All fields are required' })
    };
  }

  try {
    const existing = await sql`SELECT customer_id FROM customers WHERE email = ${email}`;
    if (existing.length > 0) {
      return {
        statusCode: 409,
        body: JSON.stringify({ message: 'Customer already exists' })
      };
    }

    const result = await sql`
      INSERT INTO customers (customer_name, email, password, phone_number, address, store_id, date_joined)
      VALUES (${customer_name}, ${email}, ${password}, ${phone_number}, ${address}, ${store_id}, NOW())
      RETURNING customer_id
    `;

    return {
      statusCode: 201,
      body: JSON.stringify({
        message: 'Customer registered successfully!',
        customerId: result[0].customer_id,
        email
      })
    };
  } catch (err) {
    console.error('Signup error:', err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Server error during signup' })
    };
  }
}
