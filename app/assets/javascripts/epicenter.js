$(window).on('load', doThings);

function doThings() {
	var pathName = window.location.pathname;
	console.log(pathName)
	$('.nav > li > a[href="'+pathName+'"]').parent().addClass('active');
}