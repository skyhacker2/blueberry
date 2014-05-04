var Exam = require('../data/exam'),
	User = require('../data/user'),
	Pager = require('../data/Pager'),
	config = require('../config'),
	EventProxy = require('eventproxy');

exports.getExams = function(req, res, next) {
	var user = req.session.user;
	var pageIndex = req.query.pageIndex;
	if (!pageIndex) {
		pageIndex = 1
	}
	
	if (user.role == 'student') {
		Exam.countByStudentId(user.id, function(num) {
			var pagination = {
				pageIndex: +pageIndex,
				pageSize: config.page_size,
				pageTotal: Math.ceil(num / config.page_size),
				path: '/exams'
			};
			console.log(pagination);
			Exam.getByStudentId(user.id, pageIndex, function(rows) {
				res.render('exam/student-exam.html', {exams: rows, pagination: pagination});
			});
		});
	} else if(user.role == 'teacher') {
		User.countStudents(function(num) {
			var pagination = {
				pageIndex: +pageIndex,
				pageSize: config.page_size,
				pageTotal: Math.ceil(num / config.page_size),
				path: '/exams'
			};
			Pager.getList(function(pagers) {
				User.getStudents(pageIndex, function(students) {
					var count = 0;
					var end = pagers.length * students.length;
					var infos = [];
					for (var i = 0; i < students.length; i ++) {
						(function(i) {
							infos[i] = {
								student_id: students[i].student_id,
								student_name: students[i].student_name,
								grades: []
							};
							var finishOne = function(grade, j) {
								count++;
								infos[i].grades[j] = grade;
								if(count == end) {
									res.render('exam/teacher-exam.html', {pagination: pagination, pagers: pagers, infos: infos});
								}
							}

							for (var j = 0;  j< pagers.length; j++) {
								(function(j) {
									Exam.getGrade(pagers[j].pager_id, students[i].student_id, function(grade) {
										if (grade > 0) {
											grade = grade + ' / ' + pagers[j].grade;
										} else {
											grade = '未完成';
										}
										finishOne(grade, j);
									});
								})(j);
								
							}
						})(i);
					}
				});
				
			});
		});
	}
}