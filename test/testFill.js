var Fill = require('../data/fill.js');

Fill.getByRandom(2, 5, function(err, rows) {
	console.log(rows);
})