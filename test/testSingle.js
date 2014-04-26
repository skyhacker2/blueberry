var Single = require('../data/single.js');

/*
Single.getByRandom(1, 5, function(err, rows) {
	console.log(rows.length);
});
*/
Single.getByIds(1, [2,3,4,5,6], function(rows) {
	for(var i = 0; i< rows.length; i++) {
		console.log(rows[i].topic);
	}
});