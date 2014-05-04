var connection = require('./connection'),
	dateFormat = require('date-format');
	config = require('../config'),
	EventProxy = require('eventproxy'),
	Pager = require('./pager'),
	User = require('./user');

var Exam = {};

Exam.add = function(pager, grade, pagerGrade, studentId, callback) {
	var now = dateFormat('yyyy-MM-dd hh:mm:ss');
	connection.query("INSERT INTO blueberry.exam (pager_id, pager_title, create_time, exam_grade, pager_grade, student_id) \
		VALUES(?, ?, ?, ?, ?, ?)", [pager.pager_id, pager.title, now, grade, pagerGrade, studentId], function(err) {
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


Exam.getFullInfo = function(pageIndex, callback) {
	User.getStudents(pageIndex, function(users) {
		var infos = [];
		var finishOne = function(info) {
			infos.push(info);
			if(infos.length == users.length) {
				callback(infos);
			}
		}
		for (var i = 0; i < users.length; i++) {
			(function() {
				var user = users[i];
				connection.query('SELECT * FROM blueberry.exam WHERE student_id = ?',[user.student_id], function(err, exams) {
					if (err) {
						console.log(err);
					} else {
						user.exams = exams
						user.exams.sort(function(a, b) {
							if (a.exam_id < b.exam_id) {
								return -1;
							} else {
								return 1;
							}
						});
						finishOne(user);
					}
				});
			})();
		}
	});
}

Exam.getAll = function(callback) {
	connection.query('SELECT * FROM blueberry.exam', function(err, rows) {
		if (err) {
			console.log(err);
		} else {
			callback(rows);
		}
	});
}
Exam.getGrade = function(pagerId, studentId, callback) {
	connection.query('SELECT * FROM blueberry.exam WHERE pager_id = ? AND student_id = ? ORDER BY exam_grade DESC',[pagerId, studentId], function(err, rows) {
		if(err) {
			console.log(err);
		} else {
			if(rows.length > 0) {
				callback(rows[0].exam_grade);
			} else {
				callback(-1);
			}
		}
	});
}
/*
Exam.getFullList = function(pageIndex, callback) {
	User.getStudents(pageIndex, function(users) {
		var list = [];
		var finishOne = function(info) {
			list.push(info);
			if (list.length == users.length) {
				callback(list);
			}
		}
		for (var i = 0; i < users.length; i++) {
			(function() {

			})();
		}
	});
}
*/
module.exports = Exam;