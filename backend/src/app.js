const express = require('express');

const cors = require('cors');

const healthRoutes = require(
  './routes/health.routes'
);

const authRoutes = require(
  './routes/auth.routes'
);

const userRoutes = require(
  './routes/user.routes'
);

const app = express();


// Middleware
app.use(cors());

app.use(express.json({ limit: '10kb' }));


// API routes

app.use(
  '/api/health',
  healthRoutes
);

app.use(
  '/api/auth',
  authRoutes
);

app.use(
  '/api/users',
  userRoutes
);


// Handle unknown routes

app.use((req, res) => {

  return res.status(404).json({
    success: false,
    message: 'API endpoint not found',
  });

});


// Global error handler

app.use((error, req, res, next) => {

  if (error.type === 'entity.parse.failed') {

    return res.status(400).json({
      success: false,
      message: 'Invalid JSON request body',
    });

  }

  if (error.type === 'entity.too.large') {

    return res.status(413).json({
      success: false,
      message: 'Request body is too large',
    });

  }

  console.error(error);

  return res.status(500).json({
    success: false,
    message: 'Internal server error',
  });

});


module.exports = app;