var Exam = require('../data/exam'),
	config = require('../config');

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
		
	}
}