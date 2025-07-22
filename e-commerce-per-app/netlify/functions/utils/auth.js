// utils/auth.js
import jwt from 'jsonwebtoken';

export function authenticate(event) {
  const authHeader = event.headers.authorization || '';
  const token = authHeader.split(' ')[1]; // Bearer <token>

  if (!token) throw { statusCode: 401, message: 'Token missing' };

  try {
    return jwt.verify(token, process.env.JWT_SECRET || 'your-secret-key');
  } catch (err) {
    throw { statusCode: 403, message: 'Invalid token' };
  }
}
