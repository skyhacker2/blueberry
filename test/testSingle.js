var Single = require('../data/single.js');

Single.getByRandom(1, 5, function(err, rows) {
	console.log(rows.length);
});