

var singles = [
	{
		question_id: 0,
		topic: "试题1",
		optionA: "选项1",
		optionB: "选项2",
		optionC: "选项3",
		optionD: "选项4",
		answer: "A",
		chapter_id: 1
	},
	{
		question_id: 1,
		topic: "试题2",
		optionA: "选项1",
		optionB: "选项2",
		optionC: "选项3",
		optionD: "选项4",
		answer: "B",
		chapter_id: 1
	}
];

exports.getSingleRandom = function(num, callback) {
	return callback(null, singles);
};