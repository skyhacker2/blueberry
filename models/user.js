var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var UserSchema = new Schema({
	loginname: {type: String},
  	username: { type: String, index: true },
  	password: { type: String},
  	role: { type: String}, // 角色 teacher student
  	create_at: { type: Date, default: Date.now },
  	update_at: { type: Date, default: Date.now },
});

mongoose.model('User', UserSchema);