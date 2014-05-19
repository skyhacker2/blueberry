var connection = require('./connection.js'),
	dateFormat = require('date-format');

var Message = {

};

Message.save = function(title, body, author, callback) {
	//用来记录现在时间
	var now = dateFormat('yyyy-MM-dd hh:mm:ss');
	connection.query("INSERT INTO blueberry.message (msg_title, msg_body, create_time, author) VALUES (?, ?, ?, ?)", 
		[title, body, now, author], function(err, rows) {
			if (err) {
				console.log(err);
			} else {
				callback();
			}
		});
}

Message.getAll = function(callback) {
	connection.query("SELECT * FROM blueberry.message ORDER BY create_time DESC", function(err, rows) {
		if(err) {
			console.log(err);
		} else {
			callback(rows);
		}
	});
}

Message.delete =function(msgId, callback) {
	connection.query(" DELETE FROM blueberry.message WHERE msg_id = ?", [msgId], function(err) {
		if (err) {
			console.log(err);
		} else {
			callback();
		}
	});
}

module.exports = Message;