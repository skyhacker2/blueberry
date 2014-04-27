var connection = require('./connection'),
	dateFormat = require('date-format');

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

module.exports = Exam;