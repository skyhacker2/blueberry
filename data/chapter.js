
var chapters = [
	{chapter_id: 1, title: "第一章"},
	{chapter_id: 2, title: "第二章"},
	{chapter_id: 3, title: "第三章"},
	{chapter_id: 4, title: "第四章"},
	{chapter_id: 5, title: "第五章"},
	{chapter_id: 6, title: "第六章"},
	{chapter_id: 7, title: "第七章"}
];

exports.getAllSection = function(callback) {
	return callback(chapters);
};

