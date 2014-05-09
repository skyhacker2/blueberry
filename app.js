var express = require('express'),
	ejs = require('ejs'),
	path = require('path'),
	config = require('./config'),
	routes = require('./routes'),
	Chapter = require('./data/chapter'),
	Pager = require('./data/pager'),
	EventProxy = require('eventproxy');

var app = express();

// 设置view目录
app.set('views', __dirname + '/views');
// 设置模板引擎
app.engine('html', ejs.__express);
app.set('view engine', 'html');

// 设置图标
app.use(express.favicon('public/favicon.ico'));
// 打印日志
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.cookieParser('blueberry'));
app.use(express.session());

// 自定义中间件
// 认证用户是否登录
app.use(require('./controllers/sign').auth_user);

// 将session变量设置到locals中，使ejs能读取到变量
app.use(function(req, res, next) {
	res.locals.user = req.session ? req.session.user : "";

	// 查找所有章节
	Chapter.getAllChapters(function(err, chapters) {
		if(err) {
			console.log(err);
			res.locals.chapters = [];
			next();
		}
		Pager.count(function(count) {
			res.locals.pagerCount = count;
			res.locals.chapters = chapters;
			next();
		});
		
	});

});

// 路由
app.use(app.router);
routes(app);

var server = app.listen(config.port, function() {
    console.log('Listening on port %d', server.address().port);
});
