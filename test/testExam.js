var Exam = require('../data/exam');

Pager.getList(function(pagers) {
	User.getStudents(1, function(students) {
		var infos = [];
		for (var i = 0; i < students.length; i ++) {
			(function(i) {
				infos[i] = {
					student_id: students[i].student_id,
					student_name: students[i].student_name,
					grades: []
				};
				var finishOne = function(info) {
					infos[i].grades.push(info);
					console.log(infos[i]);
				}

				for (var j = 0;  j< pagers.length; j++) {
					(function(j) {
						Exam.getGrade(pagers[j].pager_id, students[i].student_id, function(grade) {
							finishOne(grade);
						});
					})(j);
				}
			})(i);
			
		}
		
	});
});