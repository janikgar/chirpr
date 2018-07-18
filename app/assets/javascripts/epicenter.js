$(document).on('turbolinks:load', function() {
	$('#unfollow_btn').hover(function(){
		$(this).removeClass('btn-primary');
		$(this).addClass('btn-danger');
		$(this).html('Unfollow');
	}, function(){
		$(this).html('Following');
		$(this).removeClass('btn-danger');
		$(this).addClass('btn-primary');
	});
	var currentPage = document.location.pathname
	var menuLinks = $('.navbar-fixed-top ul li a')
	for (var i = 0; i < menuLinks.length; i++) {
		if (menuLinks[i].pathname == currentPage) {
			menuLinks[i].classList.add('active');
		}
	}
});