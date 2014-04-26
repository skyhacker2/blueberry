var Pager = require('../models/pager');


Pager.getTestPagerByRandom(1, function(pager) {
	console.log(pager);
});
