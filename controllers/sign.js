var User = require('../data').User,
	//validator是表单认证
	validator = require('validator'),
	//crypto是加密
	crypto = require('crypto'),
	config = require('../config');

exports.showSignin = function(req, res, next) {
	res.render('sign/signin');
}

// 登陆
exports.login = function(req, res, next) {
	var loginname = validator.trim(req.body.loginname);
	var password = validator.trim(req.body.password);
	var role = req.body.role;

	if (!loginname || !password) {
		res.render('sign/signin', {error: "信息不完整"});
	}

	User.getUserById(loginname, role, function(err, user) {
		console.log(user);
		if (err) {
			return next(err);
		}
		if (!user) {
			return res.render('sign/signin', {error: "这个用户不存在"});
		}

		if (password != user.password) {
			return res.render('sign/signin', {error: "密码错误"});
		}
		user.role = role;
		user.password = "";
		req.session.user = user;
		res.locals.user = user;
		var refer = req.session._loginReferer || 'index';
		res.redirect(refer);
	});

}
// 登出
exports.signout = function (req, res, next) {
  	req.session.destroy();	  // 删除session
  	res.clearCookie(config.auth_cookie_name, { path: '/' }); // 删除cookie
  	res.redirect('/signin');
};

// 修改密码
exports.showChangePassword = function(req, res, next) {
	res.render('sign/change-password');
}

exports.changePassword = function(req, res, next) {
	var newPassword = req.body.newPassword;
	console.log(newPassword);
	var user = req.session.user;
	User.changePassword(user.id, user.role, newPassword, function(err, rows) {
		var message;
		if(err) message = "修改密码失败";
		else message = "修改密码成功";
		var msg = {
			code: 0,
			message: message
		};
		//把javascript表示成javascript标示符（JSON）字符串
		res.end(JSON.stringify(msg));
	});
	
}

/**
* 验证用户 中间件
*/
exports.auth_user = function (req, res, next) {
	if (req.path.indexOf('signin') >= 0) {
		return next();
	}
	// 如果用户未登陆，跳到登陆页面
  	if (!req.session.user) {
  		req.session._loginReferer = req.path;
      	return res.redirect('/signin');
  	}
  	next();
};

// private
function gen_session(user, res) {
  var auth_token = encrypt(user._id + '\t' + user.loginname + '\t' + user.password, config.session_secret);
  res.cookie(config.auth_cookie_name, auth_token, {path: '/', maxAge: 1000 * 60 * 60 * 24 * 30}); //cookie 有效期30天
}

exports.gen_session = gen_session;

function encrypt(str, secret) {
  var cipher = crypto.createCipher('aes192', secret);
  var enc = cipher.update(str, 'utf8', 'hex');
  enc += cipher.final('hex');
  return enc;
}

function decrypt(str, secret) {
  var decipher = crypto.createDecipher('aes192', secret);
  var dec = decipher.update(str, 'hex', 'utf8');
  dec += decipher.final('utf8');
  return dec;
}