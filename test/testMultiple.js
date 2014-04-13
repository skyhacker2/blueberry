var Multiple = require("../data/multiple.js");

Multiple.getByRandom(1, 5, function(err, rows) {
	console.log(rows.length);
});