require('dotenv').config();

const app = require('./app');
const pool = require('./config/db');

const PORT = process.env.PORT || 5000;

const startServer = async () => {
  try {

    // Test PostgreSQL connection
    await pool.query('SELECT 1');

    console.log('PostgreSQL connected successfully');

    // Start Express server
    app.listen(PORT, () => {

      console.log('----------------------------------------');

      console.log('Heritage Tourism Backend');

      console.log(`Server running on http://localhost:${PORT}`);

      console.log(
        `Health API: http://localhost:${PORT}/api/health`
      );

      console.log(
        `Database API: http://localhost:${PORT}/api/health/database`
      );

      console.log('----------------------------------------');

    });

  } catch (error) {

    console.error(
      'Failed to connect to PostgreSQL:',
      error.message
    );

    process.exit(1);

  }
};

startServer();