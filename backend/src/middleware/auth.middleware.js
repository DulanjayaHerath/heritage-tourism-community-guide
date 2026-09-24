const jwt = require('jsonwebtoken');

const {
  findUserById,
} = require('../models/user.model');

const authenticate = async (req, res, next) => {
  try {

    // Read the Authorization header
    const authHeader = req.headers.authorization;

    // Check whether a Bearer token was provided
    if (
      !authHeader ||
      !authHeader.startsWith('Bearer ')
    ) {
      return res.status(401).json({
        success: false,
        message: 'Authentication required',
      });
    }

    // Extract the JWT
    const token = authHeader.split(' ')[1];

    if (!token) {
      return res.status(401).json({
        success: false,
        message: 'Authentication token missing',
      });
    }

    // Verify the JWT
    const decoded = jwt.verify(
      token,
      process.env.JWT_SECRET,
      {
        algorithms: ['HS256'],
      }
    );

    // Validate the user ID
    if (
      !Number.isSafeInteger(decoded.userId) ||
      decoded.userId <= 0
    ) {
      return res.status(401).json({
        success: false,
        message: 'Invalid authentication token',
      });
    }

    // Retrieve the current user from PostgreSQL
    const user = await findUserById(
      decoded.userId
    );

    if (!user) {
      return res.status(401).json({
        success: false,
        message: 'User no longer exists',
      });
    }

    // Attach authenticated user to request
    req.user = user;

    next();

  } catch (error) {

    if (error.name === 'TokenExpiredError') {
      return res.status(401).json({
        success: false,
        message: 'Authentication token expired',
      });
    }

    if (error.name === 'JsonWebTokenError') {
      return res.status(401).json({
        success: false,
        message: 'Invalid authentication token',
      });
    }

    console.error(
      'Authentication error:',
      error.message
    );

    return res.status(500).json({
      success: false,
      message: 'Internal server error',
    });

  }
};

module.exports = authenticate;