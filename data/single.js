var connection = require('./connection.js');



// 随机选出题目
exports.getByRandom = function(chapter_id, num, callback) {
	connection.query("SELECT * FROM question.single WHERE chapter_id=? ORDER BY rand() LIMIT ?", 
		[chapter_id, num], function(err, rows) {
			callback(err, rows);
	});
}

exports.getAllExcept = function(chapter_id, excepts, callback) {
	connection.query("SELECT * FROM question.single WHERE chapter_id = ?", [chapter_id], function(err, rows) {
		if(err) {
			console.log(err);
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

exports.getByIds = function(chapter_id, ids, callback) {
	var queryStr = "SELECT * FROM question.single WHERE chapter_id = " + chapter_id + " AND ";
	for (var i = 0; i < ids.length-1; i++) {
		queryStr += "question_id = " + ids[i] + " OR ";
	}
	queryStr += "question_id = " + ids[ids.length-1];
	connection.query(queryStr, function(err, rows) {
		if (err) {
			console.log(err);
		} else {
			// 排序
			var results = [];
			for (var i = 0; i < ids.length; i++) {
				for (var j = 0; j < rows.length; j++) {
					if (rows[j].question_id == ids[i]) {
						results[i] = rows[j];
					}
				}
			}
			callback(results);
		}
	})
}
