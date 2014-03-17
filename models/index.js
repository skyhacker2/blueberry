var mongoose = require('mongoose');
var config = require('../config');

mongoose.connect(config.db, function (err) {
  if (err) {
    console.error('connect to %s error: ', config.db, err.message);
    process.exit(1);
  }
});



// models
require('./user');
var User = mongoose.model('User');

exports.User = User;


// 创建超级用户
User.findOne({'loginname': config.admin}, function(err, user) {
	if (err) {
		console.error('创建超级用户失败: ' + err.message);
		process.exit(1);
	}
	if (!user) {
		var newAdmin = new User();
		newAdmin.loginname = config.admin;
		newAdmin.password = config.password;
		newAdmin.role = "teacher";
		newAdmin.save();
	}
});