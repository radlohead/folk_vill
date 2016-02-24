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
		var mainTab = document.getElementById("main-tab");
		var ul = mainTab.getElementsByClassName("tabMenu")[0];
		var li = ul.getElementsByTagName("li");
		var tabBody = mainTab.getElementsByClassName("tab-content");

		for(var i = 0; i < li.length; i++){
			(function(e){
				li[e].onclick = function(){
					for(var k = 0; k < tabBody.length; k++){
						tabBody[k].style.visibility = "hidden";
					}
					var str = tabBody[e];
					str.style.visibility = "visible";
				}
			})(i);
		}

	})();

});