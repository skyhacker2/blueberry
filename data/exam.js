var connection = require('./connection'),
	dateFormat = require('date-format');
	config = require('../config'),
	EventProxy = require('eventproxy'),
	Pager = require('./pager'),
	User = require('./user');

var Exam = {};

Exam.add = function(pager, grade, studentId, callback) {
	var now = dateFormat('yyyy-MM-dd hh:mm:ss');
	connection.query("INSERT INTO blueberry.exam (pager_id, pager_title, create_time, exam_grade, student_id) \
		VALUES(?, ?, ?, ?, ?)", [pager.pager_id, pager.title, now, grade, studentId], function(err) {
			if (err) {
				console.log(err);
			} else {
				callback();
			}
		});
}

Exam.getByStudentId = function(studentId, pageIndex, callback) {
	var start = (pageIndex-1) * config.page_size;
	var size = config.page_size;
	connection.query("SELECT * FROM blueberry.exam WHERE student_id = ? ORDER BY create_time DESC LIMIT ?, ?", [studentId, start, size], function(err, rows) {
		if (err) {
			console.log(err);
		} else {
			callback(rows);
		}
	});

}

Exam.countByStudentId = function(studentId, callback) {
	connection.query("SELECT count(*) AS count FROM blueberry.exam WHERE student_id = ?", [studentId], function(err, rows) {
		if (err) {
			console.log(err);
		}else {
			callback(rows[0].count);
		}
	});
}

Exam.getAll = function(callback) {
	connection.query('SELECT * FROM blueberry.exam', function(err, rows) {
		for (var i = 0; i < rows.length; i++) {
			Pager.getById(rows[i].pager_id, function(pager) {
				rows[i].total_grade = pager.grade;

			})
		}
	});
}

module.exports = Exam;