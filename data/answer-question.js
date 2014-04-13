var connection = require('./connection.js');

exports.getByRandom = function(chapter_id, num, callback) {
	connection.query("SELECT * FROM question.answerquestion WHERE chapter_id=? ORDER BY rand() LIMIT ?", 
		[chapter_id, num], function(err, rows) {
			callback(err, rows);
	});
}