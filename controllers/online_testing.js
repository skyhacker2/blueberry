var Pager = require('../data/pager.js');
exports.showTesting = function(req, res, next) {
	var chapter_id = req.session.chapter_id;
	var test_pager = req.session.test_pager;

	if (chapter_id && chapter_id == req.params.chapter_id && test_pager) {
		return res.render('online_testing/online_testing', {chapter_id: chapter_id, pager: test_pager});
	};
	Pager.getTestPagerByRandom(req.params.chapter_id, function(pager) {
		req.session.test_pager = pager;	// 将试卷放到session保存
		req.session.chapter_id = req.params.chapter_id;
		return res.render('online_testing/online_testing', {chapter_id: req.params.chapter_id, pager: pager});
	});
	
};

exports.checkAnswer = function(req, res, next) {
	var body = req.body;
	var pager = req.session.test_pager;
	if (!pager) {
		res.redirect('/');
	}
	var singles = pager._singles;
	for (var i = 0; i < singles.length; i++) {
		var single = singles[i];
		single['userAnswer'] = body["single-" + single.question_id];
		single['isRight'] = single['userAnswer'].toUpperCase() == single['answer'].toUpperCase();
	}
	console.log(singles);
	res.end(JSON.stringify(req.body));
}