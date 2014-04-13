var connection = require('./connection.js');

exports.getByRandom = function(chapter_id, num, callback) {
	connection.query("SELECT * FROM question.fill WHERE chapter_id=? ORDER BY rand() LIMIT ?", 
		[chapter_id, num], function(err, rows) {
			callback(err, rows);
	});
}

exports.getAllExcept = function(chapter_id, excepts, callback) {
	connection.query("SELECT * FROM question.fill WHERE chapter_id = ?", [chapter_id], function(err, rows) {
		if(err) {
			consolg.log(err);
		} else {
			var data = rows.filter(function(s) {
				for (var i = 0; i < excepts.length; i++) {
					if (excepts[i].question_id == s.question_id) {
						return false;
					}
				}
				return true;
			});
			callback(data);
		}
	});
}