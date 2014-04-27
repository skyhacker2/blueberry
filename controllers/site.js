var Pager = require('../data/pager'),
	Message = require('../data/message'),
	EventProxy = require('eventproxy');
exports.index = function(req, res, next) {
	var user = req.session.user;
	var data = {};

	if (user.role == 'teacher') {
		var ep = EventProxy.create('pagerList', 'message', function(pagerList, messages) {
			res.render('index', {pagerList: pagerList, messages: messages});
		});
		Pager.getList(function(rows) {
			ep.emit('pagerList', rows);
		});
		Message.getAll(function(rows) {
			ep.emit('message', rows);
		});
	} else {
		var ep = EventProxy.create('message', function(messages) {
			res.render('index', {messages: messages});
		});
		Message.getAll(function(rows) {
			ep.emit('message', rows);
		});
	}

}