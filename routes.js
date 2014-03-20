var site = require('./controllers/site'),
	sign = require('./controllers/sign'),
	online_testing = require('./controllers/online_testing'),
	pager = require('./controllers/pager');


module.exports = function(app) {
	app.get('/', site.index);
	app.get('/index', site.index);

	// 登陆登出
	app.get('/signin', sign.showSignin);
	app.post('/signin', sign.login);
	app.get('/signout', sign.signout);
	app.get('/changePassword', sign.showChangePassword);

	// 在线测试
	app.get('/online_testing/:chapter_id', online_testing.showTesting);

	// 试卷相关
	app.get('/generatePager/:chapter_id', pager.showGeneratePager);
};
