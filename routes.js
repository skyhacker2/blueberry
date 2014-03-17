var site = require('./controllers/site'),
	sign = require('./controllers/sign'),
	online_testing = require('./controllers/online_testing');

module.exports = function(app) {
	app.get('/', site.index);
	app.get('/index', site.index);

	// 登陆登出
	app.get('/signin', sign.showSignin);
	app.post('/signin', sign.login);
	app.get('/signout', sign.signout);

	// 在线测试
	app.get('/online_testing/:chapter_id', online_testing.showTesting);
};
