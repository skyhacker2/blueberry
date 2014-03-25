exports.showGeneratePager = function(req, res, next) {
	res.render('pager/generate-main.html');
}

exports.showGeneratePager1 = function(req, res, next) {
	res.render('pager/generate-step1.html', {step: 1, nextUrl: "generatePager2"});
}

exports.showGeneratePager2 = function(req, res, next) {
	res.render('pager/generate-step2.html', {step: 2, nextUrl: "generatePager3"});
}

exports.showGeneratePager3 = function(req, res, next) {
	res.render('pager/generate-step3.html', {step: 3, nextUrl: "generateFinish"});
}