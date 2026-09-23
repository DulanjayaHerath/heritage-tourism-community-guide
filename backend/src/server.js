require('dotenv').config();

const app = require('./app');

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
  console.log('----------------------------------------');
  console.log('Heritage Tourism Backend');
  console.log(`Server running on http://localhost:${PORT}`);
  console.log(`Health API: http://localhost:${PORT}/api/health`);
  console.log('----------------------------------------');
});