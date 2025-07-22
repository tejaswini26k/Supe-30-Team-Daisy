// netlify/functions/store-status.js
import { neon } from '@netlify/neon';
const sql = neon();

export async function handler(event) {
  const { storeId } = event.pathParameters || {};
  const { status } = JSON.parse(event.body || '{}');

  if (!['enabled', 'disabled'].includes(status)) {
    return {
      statusCode: 400,
      body: JSON.stringify({ error: 'Invalid status value' }),
    };
  }

  try {
    await sql`UPDATE stores SET store_status = ${status} WHERE id = ${storeId}`;
    return {
      statusCode: 200,
      body: JSON.stringify({ message: `Store ${status} successfully` }),
    };
  } catch (err) {
    console.error('Error updating store status:', err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: 'Failed to update status' }),
    };
  }
}
