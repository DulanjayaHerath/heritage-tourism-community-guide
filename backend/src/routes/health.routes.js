const express = require('express');

const {
  getHealth,
  getDatabaseHealth,
} = require('../controllers/health.controller');

const router = express.Router();

// Check Express server
router.get('/', getHealth);

// Check PostgreSQL connection
router.get('/database', getDatabaseHealth);

module.exports = router;