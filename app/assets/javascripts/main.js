$(document).ready(function(){	
	$(".loading").css("display", "none");
	$(".notice").css("display", "none");
	//$("nav ul li ul").css("display", "none");
	
	// MENU
	$("nav .submenu").toggle(showSubMenu, hideSubMenu);
});

function showSubMenu() {
	$(this).find('ul').slideDown();
}

function hideSubMenu() {
	$(this).find('ul').slideUp();
}

function showLoading() {
	$(".loading").css("display", "");
}

function hideLoading() {
	$(".loading").css("display", "none");
}

function showNotice(msg) {
	$(document).ready(function(){
		$("#flash_notice").html('<p class="notice">' + msg + '</p>');
		$(".notice").css("display", "");
		setTimeout("$('.notice').css('display', 'none')", 2000);
	});
}