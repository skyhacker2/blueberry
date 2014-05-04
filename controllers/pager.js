var config = require('../config.js'),
	Pager = require('../data/pager'),
	Single = require('../data/single'),
	Multiple = require('../data/multiple'),
	Fill = require('../data/fill'),
	Judge = require('../data/judge'),
	Exam = require('../data/exam'),
	EventProxy = require('eventproxy');

exports.showGeneratePager = function(req, res, next) {
	res.render('pager/generate-main.html');
}

exports.showGeneratePager1 = function(req, res, next) {
	var pager = req.session.pager;
	if (!pager) {
		pager = {
			pagerTitle: 	"",
			singleNum: 		config.single_num,
			multipleNum: 	config.multiple_num,
			judgeNum: 		config.judge_num,
			fillNum: 		config.fill_num,
			singleGrade: 	config.single_grade,
			multipleGrade: 	config.multiple_grade,
			judgeGrade: 	config.judge_grade,
			fillGrade: 		config.fill_grade,
			chapterId: 		1
		};
	}
	res.render('pager/generate-step1.html', {step: 1, nextUrl: "generatePager2", pager: pager});
}

exports.showGeneratePager2 = function(req, res, next) {
	// 随机生成一份试卷
	var pager = req.session.pager;
	if (!pager) {
		res.redirect('/generatePager1');
		return;
	}
	var ep = EventProxy.create('pager', 'questions', function(data, questions) {
		req.session.pager = data;
		res.render('pager/generate-step2.html', {step: 2, nextUrl: "generatePager3", pager: data});
	})
	Pager.generate(pager, function(data) {
		ep.emit('pager', data);
		Pager.getAllQuestionExcept(data, function(questions) {
			ep.emit('questions', questions);
		});
	});
	
	
}

exports.showGeneratePager3 = function(req, res, next) {
	var pager = req.session.pager;
	if (!pager) {
		res.render('error.html', {msg: "非法访问!"});
		return ;
	}
	Pager.getByIds(pager, function(pager) {
		res.render('pager/generate-step3.html', {step: 3, nextUrl: "generateFinish", pager: pager});
	});
	
}

exports.showGenerateFinish = function(req, res, next) {
	if (!req.session.pager) {
		res.render('error.html', {msg: "非法访问!"});
		return ;
	}
	delete req.session.pager;
	req.session.pager = null;
	res.render('pager/generate-finish.html');
}

exports.generatePager1 = function(req, res, next) {
	var pagerTitle 		= req.body.pagerTitle;
	var singleNum  		= +req.body.singleNum;
	var multipleNum 	= +req.body.multipleNum;
	var judgeNum 		= +req.body.judgeNum;
	var fillNum 		= +req.body.fillNum;
	var chapterId		= +req.body.chapterId;
	var singleGrade 	= +req.body.singleGrade;
	var multipleGrade 	= +req.body.multipleGrade;
	var judgeGrade 		= +req.body.judgeGrade;
	var fillGrade 		= +req.body.fillGrade;
	var grade 			= +req.body.grade;
	// 在session中查找是否有保存的试卷信息
	var pager = req.session.pager;
	if (pager) {
		pager.pagerTitle 	= pagerTitle;
		pager.singleNum 	= singleNum;
		pager.multipleNum	= multipleNum;
		pager.judgeNum 		= judgeNum;
		pager.fillNum 		= fillNum;
		pager.chapterId		= chapterId;
		pager.singleGrade 	= singleGrade;
		pager.multipleGrade = multipleGrade;
		pager.judgeGrade 	= judgeGrade;
		pager.fillGrade 	= fillGrade;
		pager.grade 		= grade;
	} else {
		pager = {
			pagerTitle: 	pagerTitle,
			singleNum: 		singleNum,
			multipleNum: 	multipleNum,
			judgeNum: 		judgeNum,
			fillNum: 		fillNum,
			chapterId: 		chapterId,
			singleGrade: 	singleGrade,
			multipleGrade: 	multipleGrade,
			judgeGrade: 	judgeGrade,
			fillGrade: 		fillGrade,
			grade: 			grade
		};
		req.session.pager = pager;
	}
	var msg = {
		code: 		0,
		message: 	"ok"
	};
	console.log(pager);
	res.end(JSON.stringify(msg));
}

exports.generatePager2 = function(req, res, next) {
	var pager = req.session.pager;
	if (!pager) {
		var msg = {
			code: 		1,
			message: 	"非法访问"
		};
		return res.end(JSON.stringify(msg));
	}
	// 试卷题目的id号
	pager.singleIds 		= req.body.singleIds;
	pager.multipleIds 		= req.body.multipleIds;
	pager.judgeIds			= req.body.judgeIds;
	pager.fillIds			= req.body.fillIds;

	var msg = {
		code: 		0,
		message: 	"ok"
	};
	res.end(JSON.stringify(msg));
	
}

exports.generatePager3 = function(req, res, next) {
	var pager = req.session.pager;
	if (!pager) {
		var msg = {
			code: 		1,
			message: 	"非法访问"
		};
		return res.end(JSON.stringify(msg));
	}

	console.log(pager);

	// 保存试卷
	Pager.save(pager, function() {
		var msg = {
			code: 0,
			message: 'ok'
		};
		return res.end(JSON.stringify(msg));
	});

}

exports.showPagerList = function(req, res, next) {
	Pager.getList(function(rows) {
		for (var i = 0; i < rows.length; i++) {
			rows[i].singleNum = rows[i].singles.split('-').length;
			rows[i].multipleNum = rows[i].multiples.split('-').length;
			rows[i].judgeNum = rows[i].judges.split('-').length;
			rows[i].fillNum = rows[i].fills.split('-').length;
		}
		res.render('pager/list.html', {pagerList: rows});
	});
}

exports.showPager = function(req, res, next) {
	var pagerId = req.params.pagerId;
	Pager.getById(pagerId, function(pager) {
		req.session.pager = pager;
		res.render('pager/pager.html', {pager: pager});
	});
}

function isArray(o) {
	return Object.prototype.toString.call(o) === '[object Array]';
}

exports.checkPager = function(req, res, next) {
	var pager = req.session.pager;
	if (!pager) {
		res.render('error.html', {msg: "非法访问!"});
		return ;
	}
	var grade = pager.grade;
	//pager.grade = +pager.grade;
	console.log(pager.grade);
	// 单选题
	for (var i = 0; i < pager._singles.length; i++) {
		var single = pager._singles[i];
		var answer = req.body['single-' + single.question_id];
		console.log("标准答案: " + single.answer);
		if (!answer || answer != single.answer) {
			grade -= pager.single_grade;
		}
	}
	// 多选题
	for (var i = 0; i < pager._multiples.length; i++) {
		var multiple = pager._multiples[i];
		var answers = req.body['multiple-' + multiple.question_id];
		var answer = answers;
		console.log("标准答案: " + multiple.answer);
		if(answers && isArray(answers)) {
			answer = answers.join('-');
		}
		if (!answer || answer != multiple.answer) {
			grade -= pager.multiple_grade;
		}
	}

	// 填空题
	for (var i = 0; i < pager._fills.length; i++) {
		var fill = pager._fills[i];
		var answers = req.body['fill-' + fill.question_id];
		var answer = answers;
		console.log("标准答案: " + fill.answer);
		if(answers && isArray(answers)) {
			answer = answers.join('-');
		}
		if (!answer || answer != fill.answer) {
			grade -= pager.fill_grade;
		}
	}

	// 判断题
	for (var i = 0; i < pager._judges.length; i++) {
		var judge = pager._judges[i];
		var answer = req.body['judge-' + judge.question_id];
		console.log("标准答案: " + judge.answer);
		if (!answer || answer != judge.answer) {
			grade -= pager.judge_grade;
		}
	}

	var studentId = req.session.user.id;
	Exam.add(pager, grade, pager.grade,  studentId, function() {
		res.render('pager/exam-result.html', {grade: grade, pager: pager});
	});
}

