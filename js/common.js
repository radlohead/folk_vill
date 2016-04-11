$(document).ready(function(){
//메뉴 클릭시 메뉴 display
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

//메뉴버튼 클릭시 나오는 메뉴아래 깔리는 bg device height 값에 맞춤
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

//메인 tabMenu
	(function(){
		$(".main-tab .swiper-slide").hide();
		$(".main-tab .slide01").show();

		$(".tabMenu li a img").click(function(){
			var tabMenu_src = $(".tabMenu li a img").attr("src");
			var src = $(this).attr("src");
			var src_on = src.replace(".gif", "_on.gif");
			var src_off = tabMenu_src.replace("_on.gif",".gif");


			if(src.indexOf("_on") != "-1"){
				$(".tabMenu li a img").attr("src", src_off);
				$(this).attr("src", src_on);
			}else{
				if(src.indexOf("_on") == "-1"){
					$(this).attr("src", src_on);
				}
			}
		});
	})();

});