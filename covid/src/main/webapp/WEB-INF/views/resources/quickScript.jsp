<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	(function(global, $) {
		var $menu = $('.floating-menu li.m'), $contents = $('.scroll'), $doc = $('html, body');
		$(function() {
			$menu.on('click','a',function(e) {
								var $target = $(this).parent(), idx = $target.index(),
										 section = $contents.eq(idx), 
										 offsetTop = $section.offset().top;
								$doc.stop().animate({
									scrollTop : offsetTop;
								}, 800);
								return false;
							});
		});
	
		$(window).scroll(function() {
					var scltop = $(window).scrollTop();
					$.each($contents, function(idx, item) {
								var $target = $contents.eq(idx), i = $target
										.index(), targetTop = $target.offset().top;
	
								if (targetTop <= scltop) {
									$menu.removeClass('on');
									$menu.eq(idx).addClass('on');
								}
								if (!(200 <= scltop)) {
									$menu.removeClass('on');
								}
							})
	
				});
	
		var btnTop = $('.btn-top');
		btnTop.on('click', 'a', function(e) {
			e.preventDefault();
			$doc.stop().animate({
				scrollTop : 0
			}, 800)
		});
	
	}(window, window.jQuery));
	
</script>