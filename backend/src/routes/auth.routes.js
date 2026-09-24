const express = require('express');

const {
  body,
} = require('express-validator');

const {
  register,
  login,
} = require('../controllers/auth.controller');

const validateRequest = require(
  '../middleware/validate.middleware'
);

const router = express.Router();


// REGISTER
router.post(
  '/register',

  [
    body('fullName')
      .isString()
      .withMessage('Full name must be text')
      .bail()
      .trim()
      .notEmpty()
      .withMessage('Full name is required')
      .isLength({ max: 150 })
      .withMessage('Full name is too long'),

    body('email')
      .isEmail()
      .withMessage('Please provide a valid email')
      .bail()
      .normalizeEmail(),

    body('password')
      .isString()
      .withMessage('Password must be text')
      .bail()
      .isLength({ min: 8, max: 72 })
      .withMessage(
        'Password must contain 8 to 72 characters'
      ),
  ],

  validateRequest,

  register
);


// LOGIN
router.post(
  '/login',

  [
    body('email')
      .isEmail()
      .withMessage('Please provide a valid email')
      .bail()
      .normalizeEmail(),

    body('password')
      .isString()
      .withMessage('Password must be text')
      .bail()
      .notEmpty()
      .withMessage('Password is required'),
  ],

  validateRequest,

  login
);

module.exports = router;