$(function() {
	
	$('#manu>ul>li>a').css('color', '#FFFFFF');
	$('#manu>ul>li>a').css('font-size', '18px');
	
	$('#manu>ul>li>a').hover(function() {
		$(this).css('color', '#435F5A');
	}, function() {
		$(this).css('color', '#000000');
	})

	$('#manu>ul>li>ul>li>a').hover(
			function() {
				$(this).css('color', '#34756A');
				$(this).parent().parent().parent().children('#manu>ul>li>a')
						.css('color', '#435F5A');
			},
			function() {
				$(this).css('color', '#000000');
				$(this).parent().parent().parent().children('#manu>ul>li>a')
						.css('color', '#000000');
			});
	$("header").hover(
			function() {
				$(this).children().children().eq(1).children().children()
						.children().children("a").css("color", "#000000");

			},
			function() {
				$(this).children().children().eq(1).children().children()
						.children().children("a").css("color", "#FFFFFF");
				$(this).children().children().eq(1).children().children()
						.children().children("a").css("font-size", "18px");

			})
			$("header").mouseover(function(){
				$(this).parent().children().eq(2).fadeOut(2000);
			});
			$("header").mouseleave(function(){
				$(this).parent().children().eq(2).fadeIn(2000);
			});

});


