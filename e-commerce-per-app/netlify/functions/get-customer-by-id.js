// netlify/functions/get-customer-by-id.js
import { neon } from '@netlify/neon';
import { authenticate } from '../utils/auth.js';

const sql = neon();

export async function handler(event) {
  const { id } = event.pathParameters || {};

  try {
    authenticate(event);

    const result = await sql`
      SELECT customer_id AS id, customer_name AS name, email, phone_number AS phone,
             address, date_joined
      FROM customers
      WHERE customer_id = ${id}
    `;

    if (result.length === 0) {
      return { statusCode: 404, body: JSON.stringify({ message: 'Customer not found' }) };
    }

    return { statusCode: 200, body: JSON.stringify(result[0]) };
  } catch (err) {
    console.error('Get by ID error:', err);
    return { statusCode: 500, body: JSON.stringify({ error: 'Internal server error' }) };
  }
}
