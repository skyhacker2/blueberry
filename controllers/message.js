var Message = require('../data/message');

exports.newMessage = function(req, res, next) {
	var title = req.body.msgTitle;
	var body  = req.body.msgBody;
	var author = req.session.user.name;

	Message.save(title, body, author, function() {
		var msg = {
			code: 0,
			message: 'ok'
		};
		//把javascript转换为javascript表示法（JSON）字符串
		res.end(JSON.stringify(msg));
	});
}

exports.delete = function(req, res, next) {
	var msgId = req.params.msgId;
	Message.delete(msgId, function() {
		var msg = {
			code: 0,
			message: 'ok'
		};
		//把javascript转换为javascript表示法（JSON）字符串
		res.end(JSON.stringify(msg));
	});
}