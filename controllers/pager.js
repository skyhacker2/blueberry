var config = require('../config.js'),
	Pager = require('../data/pager'),
	Single = require('../data/single'),
	Multiple = require('../data/multiple'),
	Fill = require('../data/fill'),
	Judge = require('../data/judge'),
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
	res.render('pager/generate-step3.html', {step: 3, nextUrl: "generateFinish"});
}

exports.generatePager1 = function(req, res, next) {
	var pagerTitle 		= req.body.pagerTitle;
	var singleNum  		= +req.body.singleNum;
	var multipleNum 	= +req.body.multipleNum;
	var judgeNum 		= +req.body.judgeNum;
	var fillNum 		= +req.body.fillNum;
	var chapterId		= +req.body.chapterId;
	// 在session中查找是否有保存的试卷信息
	var pager = req.session.pager;
	if (pager) {
		pager.pagerTitle 	= pagerTitle;
		pager.singleNum 	= singleNum;
		pager.multipleNum	= multipleNum;
		pager.judgeNum 		= judgeNum;
		pager.fillNum 		= fillNum;
		pager.chapterId		= chapterId;
	} else {
		pager = {
			pagerTitle: 	pagerTitle,
			singleNum: 		singleNum,
			multipleNum: 	multipleNum,
			judgeNum: 		judgeNum,
			fillNum: 		fillNum,
			chapterId: 		chapterId
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

	// 保存试卷
	Pager.save(pager, function() {
		var msg = {
			code: 0,
			message: 'ok'
		};
		return res.end(JSON.stringify(msg));
	});

}
