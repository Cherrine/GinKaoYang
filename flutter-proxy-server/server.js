const express = require('express');
const httpProxy = require('http-proxy');
const cors = require('cors');
const mysql = require('mysql2');

// Initialize the Express app
const app = express();
app.use(cors());
// Create a proxy server instance (optional: if you're forwarding requests)
const apiProxy = httpProxy.createProxyServer();

// Connect to MySQL database
const db = mysql.createConnection({
    host: 'localhost',   // Update with your MySQL server details
    user: 'root',        // Your MySQL username
    password: 'vx7nkGMbRu#@2@D',// Your MySQL password
    database: 'test_db'  // The name of your database
});

// Test the MySQL connection
db.connect(err => {
    if (err) {
        console.error('MySQL connection failed:', err);
        return;
    }
    console.log('Connected to MySQL');
});

// Create a route to proxy requests to another server (optional)
app.use('/api', (req, res) => {
    apiProxy.web(req, res, { target: 'http://target-server-url' }); // Proxying (optional)
});

// Create a route to interact with MySQL
app.get('/mysql-data', (req, res) => {
    const sqlQuery = 'SELECT * FROM your_table_name'; // Replace with your query
    db.query(sqlQuery, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Error querying MySQL' });
        } else {
            res.json(results);
        }
    });
});

// Start the server
app.listen(3000, () => {
    console.log('Server running on port 3000');
});