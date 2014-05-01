module.exports = {
	db: 'mongodb://127.0.0.1/blueberry',
  	session_secret: 'blueberry',
  	auth_cookie_name: 'blueberry',
  	port: 3000,

  	// 系统第一个用户，老师账号
  	admin: "admin",
  	password: "123456",

  	// mysql数据库
  	mysql_host: 'localhost',
  	mysql_user: 'root',
  	mysql_pass: '',
    mysql_question_db: 'question',
    mysql_port: '3306',

    // 试卷配置
    single_num: 5,   // 单选题数量
    multiple_num: 5, // 多选题数量
    fill_num: 5,     // 填空题数量
    judge_num: 5,    // 判断题数量
    answer_question_num: 5, // 解答题数量
    single_grade: 1,
    multiple_grade: 3,
    fill_grade: 5,
    judge_grade: 1,

    // page size
    page_size: 10

};