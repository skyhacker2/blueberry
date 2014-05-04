var connection = require('./connection'),
	config = require('../config');



// 通过id查找用户
exports.getUserById = function(id, role, callback) {
	if (role == 'teacher') {
		connection.query("SELECT * FROM question.teacher WHERE teacher_id=?", [id], function(err, rows) {
			if(rows.length > 0) {
				var user = rows[0];
				user.role = role;
				user.name = rows[0].teacher_name;
				user.id = rows[0].teacher_id;
				callback(err, user);
			} else {
				callback(err, null);
			}
		});
	} else {
		var query = connection.query("SELECT * FROM question.student WHERE student_id=?", [id], function(err, rows) {
			if(rows.length > 0) {
				var user = rows[0];
				user.role = role;
				user.name = rows[0].student_name;
				user.id = rows[0].student_id;
				callback(err, user);
			} else {
				callback(err, null);
			}
		});
	}
}

// 修改密码
exports.changePassword = function(id, role, newPassword, callback) {
	if (role == 'teacher') {
		connection.query("UPDATE question.teacher SET password = ? WHERE teacher_id = ?", [newPassword, id]);
	} else {
		connection.query("UPDATE question.student SET password = ? WHERE student_id = ?", [newPassword, id]);
	}
}

exports.getStudents = function(pageIndex, callback) {
	var start = (pageIndex-1) * config.page_size;
	var size = config.page_size;
	connection.query('SELECT * FROM question.student LIMIT ?, ?', [start, size], function(err, rows) {
		if (err) {
			console.log(err);
		} else {
			callback(rows);
		}
	})
}

exports.countStudents = function(callback) {
	connection.query('SELECT count(*) AS count FROM question.student', function(err, rows) {
		if (err) {
			console.log(err);
		} else {
			callback(rows[0].count);
		}
	})
};

