$(document).ready(function() {
	$("#show-answer").click(function() {
		if($(".answer").css('visibility') == 'hidden') {
			$(".answer").css('visibility', 'visible');
		} else {
			$(".answer").css('visibility', 'hidden');
		}
	});
	// 时间倒数
	var reciprocal = function() {
		var second = 30 * 60; // 30分钟考试时间
		var counter = function() {
			second -= 1;
			var m = Math.floor(second / 60);
			var s = Math.floor(second - m * 60);
			$(".clock").html(m + "分钟" + s + "秒");
			if (m == 0 && s == 0) {
				alert("考试结束");
				$(".answer").toggle();
			} else {
				setTimeout(counter, 1000);
			}
		}
		counter();
	}
	reciprocal();
});