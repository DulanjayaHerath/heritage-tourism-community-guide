const bcrypt = require('bcrypt');

const {
  findUserByEmail,
  createUser,
} = require('../models/user.model');

const {
  generateToken,
} = require('../services/token.service');


// REGISTER USER
const register = async (req, res) => {
  try {

    const { fullName, email, password } = req.body;

    const normalizedEmail = email.trim().toLowerCase();

    // Check if email already exists
    const existingUser = await findUserByEmail(
      normalizedEmail
    );

    if (existingUser) {
      return res.status(409).json({
        success: false,
        message: 'Email is already registered',
      });
    }

    // Hash password
    const passwordHash = await bcrypt.hash(
      password,
      12
    );

    // Save user in PostgreSQL
    const user = await createUser(
      fullName.trim(),
      normalizedEmail,
      passwordHash
    );

    // Generate JWT
    const token = generateToken(user);

    return res.status(201).json({
      success: true,
      message: 'Registration successful',
      data: {
        user,
        token,
      },
    });

  } catch (error) {

    console.error(
      'Registration error:',
      error.message
    );

    if (error.code === '23505') {
      return res.status(409).json({
        success: false,
        message: 'Email is already registered',
      });
    }

    return res.status(500).json({
      success: false,
      message: 'Internal server error',
    });

  }
};


// LOGIN USER
const login = async (req, res) => {
  try {

    const { email, password } = req.body;

    const normalizedEmail = email.trim().toLowerCase();

    // Find registered user
    const user = await findUserByEmail(
      normalizedEmail
    );

    if (!user) {
      return res.status(401).json({
        success: false,
        message: 'Invalid email or password',
      });
    }

    // Verify password
    const isPasswordValid = await bcrypt.compare(
      password,
      user.password_hash
    );

    if (!isPasswordValid) {
      return res.status(401).json({
        success: false,
        message: 'Invalid email or password',
      });
    }

    // Generate JWT
    const token = generateToken(user);

    // Remove password hash from response
    const {
      password_hash,
      ...safeUser
    } = user;

    return res.status(200).json({
      success: true,
      message: 'Login successful',
      data: {
        user: safeUser,
        token,
      },
    });

  } catch (error) {

    console.error(
      'Login error:',
      error.message
    );

    return res.status(500).json({
      success: false,
      message: 'Internal server error',
    });

  }
};

module.exports = {
  register,
  login,
};