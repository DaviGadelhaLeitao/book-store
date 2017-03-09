var main = function() {
	$("back-to-top-btn").click(function() {
		$("html, body").animate({scrollTop : 0}, "slow");
		return false;
	});
};

$(document).ready(main);