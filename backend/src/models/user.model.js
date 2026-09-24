const pool = require('../config/db');

// Find a user using their email
const findUserByEmail = async (email) => {
  const result = await pool.query(
    'SELECT * FROM users WHERE LOWER(email) = LOWER($1)',
    [email]
  );

  return result.rows[0];
};

// Find a user using their ID
const findUserById = async (id) => {
  const result = await pool.query(
    `SELECT id, full_name, email, phone, country, role, created_at
     FROM users
     WHERE id = $1`,
    [id]
  );

  return result.rows[0];
};

// Create a new user
const createUser = async (fullName, email, passwordHash) => {
  const result = await pool.query(
    `INSERT INTO users (
      full_name,
      email,
      password_hash
    )
    VALUES ($1, $2, $3)
    RETURNING
      id,
      full_name,
      email,
      role,
      created_at`,
    [fullName, email, passwordHash]
  );

  return result.rows[0];
};

module.exports = {
  findUserByEmail,
  findUserById,
  createUser,
};