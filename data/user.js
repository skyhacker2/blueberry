
var users = [
	{ _id: 0, loginname: "admin", password: 123456, role: "teacher"},
	{ _id: 1, loginname: "eleven", password: 123456, role: "student"}
];

// 通过登陆名查找用户
exports.getUserByLoginName = function(loginname, callback) {
	for (var i = 0; i < users.length; i++) {
		var user = users[i];
		if (user.loginname == loginname) {
			return callback(null, user);
		}
	}
	callback(null, null);
}

// 通过id查找用户
exports.getUserById = function(id, callback) {
	for (var i = 0; i < users.length; i++) {
		var user = users[i];
		if (user._id == id) {
			return callback(null, user);
		}
	}
	callback(null, null);
}

