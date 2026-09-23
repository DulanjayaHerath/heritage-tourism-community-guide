const pool = require('../config/db');

// Check whether the Express server is running
const getHealth = (req, res) => {
  res.status(200).json({
    success: true,
    message: 'Heritage Tourism API is running',
    timestamp: new Date().toISOString(),
  });
};

// Check whether PostgreSQL is connected
const getDatabaseHealth = async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT NOW() AS current_time'
    );

    res.status(200).json({
      success: true,
      message: 'Database connection successful',
      databaseTime: result.rows[0].current_time,
    });

  } catch (error) {

    console.error(
      'Database connection failed:',
      error.message
    );

    res.status(503).json({
      success: false,
      message: 'Database connection failed',
    });

  }
};

module.exports = {
  getHealth,
  getDatabaseHealth,
};