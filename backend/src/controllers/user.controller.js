// GET CURRENT USER PROFILE

const getMyProfile = async (req, res) => {
  try {

    const user = req.user;

    return res.status(200).json({
      success: true,
      message: 'User profile retrieved successfully',
      data: {
        user,
      },
    });

  } catch (error) {

    console.error(
      'Get profile error:',
      error.message
    );

    return res.status(500).json({
      success: false,
      message: 'Internal server error',
    });

  }
};


// TEST ADMIN ACCESS

const getAdminDashboard = (req, res) => {

  return res.status(200).json({
    success: true,
    message: 'Welcome to the admin dashboard',
    data: {
      user: req.user,
    },
  });

};


module.exports = {
  getMyProfile,
  getAdminDashboard,
};