$(document).ready(function(){
	$(".gnb_btn").click(function(){
		if($(".dim").css("display") != "block"){
			$(".dim, aside").css("display","block");
		}else if($(".dim").css("display") == "block"){
			$(".dim").css("display","none");
		}
	});

	$(".dim").click(function(){
		$(this).add("aside").css("display","none");
	});

	(function(){
		var asideResize = function(){
			var docH = $(document).height();

			$(".dim").css({
				height : docH
			});
			
			var winW = $(window).width();
			var winH = $(window).height();
		}
	
		asideResize();

		$(window).on("resize", function(){
			asideResize();
		});
	})();
});