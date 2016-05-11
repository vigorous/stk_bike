$(document).ready(function () {
	/*左侧菜单栏和右侧主体自动高度控制*/
	function reHight(){
		$(".left-menu").css("height",$(window).height() - 170);
		$(".rt-main").css("height",$(window).height() - 175);
		$(".rt-detail").css("height",$(window).height() - 175);
		/*$("#iframepage").css("height",$(window).height() - 175);*/
		/*$("#iframepage").css("height",$(window).height() - 250);*/
	};
	reHight();
	
	/*顶部导航菜单栏和左侧菜单栏事件*/
	$(".menu-main .menu").bind("click",function(){
		$(this).addClass("lt-hover").siblings().removeClass("lt-hover");
	});
	$(".head-nav .nav-bar .nav-bar-list").bind("click",function(){
		$(this).addClass("bar-hover").siblings().removeClass("bar-hover");
	});
});