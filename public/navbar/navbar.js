$(document).ready(function() {
	$('.app-bar .handler').on('click', function() {
		if($('.fa-angle-right', this).length) {
			$('.fa-angle-right', this).removeClass('fa-angle-right').addClass('fa-angle-left');
			$('.app-bar').addClass('mouse-enter');
			$(document.body).addClass('long-menu');
		} else {
			$('.fa-angle-left', this).removeClass('fa-angle-left').addClass('fa-angle-right');
			$('.app-bar').removeClass('mouse-enter');
			$(document.body).removeClass('long-menu');
		}

	});
	/*
	$('#account').on('click', function() {
		$li = $(this).closest('li');
		if ($li.hasClass('active')) {
			$li.removeClass('active');
			$('.app-bar .sub-menu').removeClass('shown');
			$(document.body).removeClass('sub-menu-shown');
		} else {
			$li.addClass('active');
			$('.app-bar #accout-menu').addClass('shown');
			$(document.body).addClass('sub-menu-shown');
		}
	});
	$('#generate-pager').on('click', function() {
		$li = $(this).closest('li');
		if ($li.hasClass('active')) {
			$li.removeClass('active');
			$('.app-bar .sub-menu').removeClass('shown');
			$(document.body).removeClass('sub-menu-shown');
		} else {
			$li.addClass('active');
			$('.app-bar #generate-pager-menu').addClass('shown');
			$(document.body).addClass('sub-menu-shown');
		}
	});
*/
	$(".main-menu a").on('click', function() {
		var menuType = $(this).data("menu-type");
		if (menuType) {
			menuType += "-menu";
			$li = $(this).closest('li');
			if ($li.hasClass('active')) {
				$('.main-menu li').removeClass('active');
				$('.sub-menu').removeClass('shown');
				$(document.body).removeClass('sub-menu-shown');
			} else {
				$('.main-menu li').removeClass('active');
				$('.sub-menu').removeClass('shown');
				$(document.body).addClass('sub-menu-shown');
				$li.addClass('active');
				$('#'+menuType).addClass('shown');
			}
		}
		
	});

	$('.content').on('click', function() {
		$('.app-bar .sub-menu').removeClass('shown');
		$(document.body).removeClass('sub-menu-shown');
		$('.main-menu li').removeClass('active');
	});

	$('.app-bar .handler').click();
});