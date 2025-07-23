// netlify/functions/stores-list.js
import { neon } from '@netlify/neon';
const sql = neon();

export async function handler(event) {
  const { search = '', status, sort = 'desc' } = event.queryStringParameters || {};

  const filters = [];
  const values = [];

  if (search) {
    filters.push(`(s.store_name ILIKE $1 OR u.email ILIKE $2)`);
    values.push(`%${search}%`, `%${search}%`);
  }

  if (status && ['enabled', 'disabled'].includes(status)) {
    filters.push(`s.store_status = $${values.length + 1}`);
    values.push(status);
  }

  const whereClause = filters.length ? `WHERE ${filters.join(' AND ')}` : '';
  const sortDir = sort.toUpperCase() === 'ASC' ? 'ASC' : 'DESC';

  const query = `
    SELECT s.id, s.store_name, s.store_email, s.store_status, u.email AS owner_email
    FROM stores s
    JOIN users u ON s.id = u.store_id AND u.user_type = 'shop_owner'
    ${whereClause}
    ORDER BY s.id ${sortDir}
  `;

  try {
    const result = await sql.unsafe(query, values);
    return {
      statusCode: 200,
      body: JSON.stringify(result),
    };
  } catch (err) {
    console.error('Error fetching stores:', err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Failed to fetch stores' }),
    };
  }
}
