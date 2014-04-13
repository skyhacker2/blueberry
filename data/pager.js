var Single = require('./single.js'),
	Multiple = require('./multiple.js'),
	Judge = require('./judge.js'),
	Fill = require('./fill.js'),
	AnswerQuestion = require('./answer-question.js'),
	connection = require('./connection.js'),
	config = require('../config.js'),
	EventProxy = require('eventproxy'),
	dateFormat = require('date-format');

var Pager = function(singles, multiples, judges, fills, answerQuestions) {
	this._singles = singles;
	this._multiples = multiples;
	this._judges = judges;
	this._fills = fills;
	this._answerQuestions = answerQuestions;
}

Pager.getTestPagerByRandom = function(chapter_id, callback) {
	Single.getByRandom(chapter_id, config.single_num, function(err, singles) {
		Multiple.getByRandom(chapter_id, config.multiple_num, function(err, multiples) {
			Judge.getByRandom(chapter_id, config.judge_num, function(err, judges) {
				Fill.getByRandom(chapter_id, config.fill_num, function(err, fills) {
					AnswerQuestion.getByRandom(chapter_id, config.answer_question_num, function(err, answerQuestions) {
						callback(new Pager(singles, multiples, judges, fills, answerQuestions));
					});
				});
			});
		});
	});
}

Pager.generate = function(pager, callback) {
	Single.getByRandom(pager.chapterId, pager.singleNum, function(err, singles) {
		Multiple.getByRandom(pager.chapterId, pager.multipleNum, function(err, multiples) {
			Judge.getByRandom(pager.chapterId, pager.judgeNum, function(err, judges) {
				Fill.getByRandom(pager.chapterId, pager.fillNum, function(err, fills) {
					pager.singles 	= singles;
					pager.multiples = multiples;
					pager.judges 	= judges;
					pager.fills 	= fills;
					callback(pager);
				});
			});
		});
	});
}

Pager.getAllQuestionExcept = function(pager, callback) {
	var ep = EventProxy.create('singles', 'multiples', 'judges', 'fills', 
		function(singles, multiples, judges, fills) {
			questions = {
				singles: 	singles,
				multiples: 	multiples,
				judges: 	judges,
				fills: 		fills
			};
			callback(questions);
	});

	Single.getAllExcept(pager.chapterId, pager.singles, function(singles) {
		ep.emit('singles', singles);
	});

	Multiple.getAllExcept(pager.chapterId, pager.multiples, function(multiples) {
		ep.emit('multiples', multiples);
	});

	Judge.getAllExcept(pager.chapterId, pager.judges, function(judges) {
		ep.emit('judges', judges);
	});

	Fill.getAllExcept(pager.chapterId, pager.fills, function(fills) {
		ep.emit('fills', fills);
	});
}

Pager.save = function(pager, callback ) {
	var singleIdsStr 	= pager.singleIds.join(',');
	var multipleIdsStr 	= pager.multipleIds.join(',');
	var judgeIdsStr 	= pager.judgeIds.join(',');
	var fillIdsStr 		= pager.fillIds.join(',');
	var now 			= dateFormat('yyyy-MM-dd hh:mm:ss');

	var result = connection.query("INSERT INTO blueberry.pager (singles, multiples, judges, fills, chapter_id, title, create_time) VALUES(?, ?, ?, ?, ?, ?, ?)", [singleIdsStr, multipleIdsStr, judgeIdsStr, fillIdsStr, pager.chapterId, pager.pagerTitle, now], function(err, rows) {
		if (err) {
			console.log(err);
		} else {
			callback();
		}
	});
}

module.exports = Pager;
