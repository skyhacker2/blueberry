var mysql = require('mysql'),
	config = require('../config.js');

module.exports = mysql.createPool({
	host: config.mysql_host,
	user: config.mysql_user,
	password: config.mysql_pass,
	port: config.mysql_port
});