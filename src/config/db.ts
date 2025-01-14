import mysql from 'mysql2';
import 'dotenv/config';

const config = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PSWORD,
  database: process.env.DB_DATABASE,
  port: 3306,
  connectionLimit: 10,
};

const mysqlPool = mysql.createPool(config);

const db = mysqlPool.promise();

export default db;
