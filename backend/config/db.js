const mysql = require('mysql2/promise');

const db = mysql.createPool({
  host: 'localhost',          
  user: 'xpertoneuser',       
  password: 'Xpertone@2025!', 
  database: 'xpertone',       
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

(async () => {
  try {
    const conn = await db.getConnection();
    console.log('✅ Connected to local MySQL database on EC2');
    conn.release();
  } catch (err) {
    console.error('❌ MySQL connection failed:', err.message);
  }
})();

module.exports = db;
