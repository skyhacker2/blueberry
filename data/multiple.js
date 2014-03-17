
var multiples = [
	{
		question_id: 0,
		topic: "多选题11111",
		optionA: "选项1", 
		optionB: "选项2",
		optionC: "选项3",
		optionD: "选项4",
		answer: "A,B,C",
		chapter_id: 1
	},
	{
		question_id: 1,
		topic: "多选题2222",
		optionA: "选项1", 
		optionB: "选项2",
		optionC: "选项3",
		optionD: "选项4",
		answer: "A,B,C",
		chapter_id: 1
	},
	{
		question_id: 2,
		topic: "多选题222",
		optionA: "选项1", 
		optionB: "选项2",
		optionC: "选项3",
		optionD: "选项4",
		answer: "A,B,C",
		chapter_id: 1
	}
];

exports.getMultipleRandom = function(num, callback) {
	return callback(null, multiples);
};