// netlify/functions/get-customers.js
import { neon } from '@netlify/neon';
import { authenticate } from '../utils/auth.js';

const sql = neon();

export async function handler(event) {
  try {
    const { store_id, user_type } = authenticate(event);

    if (user_type !== 'shop_owner') {
      return { statusCode: 403, body: JSON.stringify({ message: 'Access denied' }) };
    }

    const query = `
      SELECT
        c.customer_id,
        c.customer_name,
        c.date_joined,
        c.phone_number,
        COUNT(DISTINCT o.order_id) AS no_of_orders,
        COALESCE(SUM(p.price * oi.quantity), 0) AS amount_spent
      FROM customers c
      LEFT JOIN orders o ON c.customer_id = o.customer_id
      LEFT JOIN order_items oi ON o.order_id = oi.order_id
      LEFT JOIN products p ON oi.product_id = p.product_id
      WHERE c.store_id = $1
      GROUP BY c.customer_id
      ORDER BY c.date_joined DESC;
    `;

    const customers = await sql.unsafe(query, [store_id]);
    return { statusCode: 200, body: JSON.stringify(customers) };

  } catch (err) {
    console.error('Fetch error:', err);
    return {
      statusCode: err.statusCode || 500,
      body: JSON.stringify({ error: err.message || 'Internal error' })
    };
  }
}
