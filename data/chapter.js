var connection = require('./connection.js');

// 查询所有章节
exports.getAllChapters = function(callback) {
	connection.query("SELECT * FROM question.chapter ORDER BY chapter_id", function(err, rows) {
		callback(err, rows);
	});
}

