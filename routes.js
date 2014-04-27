var site = require('./controllers/site'),
	sign = require('./controllers/sign'),
	online_testing = require('./controllers/online_testing'),
	pager = require('./controllers/pager'),
	message = require('./controllers/message');


module.exports = function(app) {
	app.get('/', site.index);
	app.get('/index', site.index);

	// 登陆登出
	app.get('/signin', sign.showSignin);
	app.post('/signin', sign.login);
	app.get('/signout', sign.signout);
	app.get('/changePassword', sign.showChangePassword);
	app.post('/changePassword.json', sign.changePassword);

	// 在线测试
	app.get('/online_testing/:chapter_id', online_testing.showTesting);
	app.post('/online_testing', online_testing.checkAnswer);

	// 试卷相关
	app.get('/generatePager1', pager.showGeneratePager1);
	app.get('/generatePager2', pager.showGeneratePager2);
	app.get('/generatePager3', pager.showGeneratePager3);
	app.post('/generatePager1.json', pager.generatePager1); // 试卷头
	app.post('/generatePager2.json', pager.generatePager2); // 保存试卷
	app.post('/generatePager3.json', pager.generatePager3);
	app.get('/generateFinish', pager.showGenerateFinish);

	// 消息
	app.post('/message.json', message.newMessage);
	app.delete('/message/:msgId.json', message.delete);

	// 考试
	app.get('/pagers', pager.showPagerList);
	app.get('/pagers/:pagerId', pager.showPager);
	app.post('/pagers/:pagerId', pager.checkPager);
};
