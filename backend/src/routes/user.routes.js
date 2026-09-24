const express = require('express');

const authenticate = require(
  '../middleware/auth.middleware'
);

const authorizeRoles = require(
  '../middleware/role.middleware'
);

const {
  getMyProfile,
  getAdminDashboard,
} = require('../controllers/user.controller');

const router = express.Router();


// GET LOGGED-IN USER PROFILE

router.get(
  '/me',
  authenticate,
  getMyProfile
);


// ADMIN-ONLY TEST ENDPOINT

router.get(
  '/admin-test',
  authenticate,
  authorizeRoles('admin'),
  getAdminDashboard
);


module.exports = router;