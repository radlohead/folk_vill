$(document).ready(function(){
//메뉴 클릭시 메뉴 display
	$(".gnb_btn").click(function(){
		if($(".dim").css("display") != "block"){
			$(".dim, aside.gnb").css("display","block");
			$(".wrap").css("display","none");
		}else if($(".dim").css("display") == "block"){
			$(".dim, aside.gnb").css("display","none");
			$(".wrap").css("display","block");
		}
	});

	$(".gnb .close-btn").click(function(){
		$(".dim, aside.gnb").css("display","none");
		$(".wrap").css("display","block");
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
		$(".tabMenu li").click(function(){
			$(".tabMenu li").removeClass("on");
			$(this).addClass("on");
			$(".tab-content").hide()
			var activeTab = $(this).attr("rel");
			$("." + activeTab).fadeIn();
		});
	})();

//navigation
	(function(jQuery){
		jQuery.fn.extend({
			accordion: function() {
				return this.each(function() {

					var $ul = $(this);

					if($ul.data('accordiated'))
						return false;

					$.each($ul.find('ul, li>div'), function(){
						$(this).data('accordiated', true);
						$(this).hide();
					});

					$.each($ul.find('a'), function(){
						$(this).click(function(e){
							activate(this);
							return void(0);
						});
					});

					var active = (location.hash)?$(this).find('a[href=' + location.hash + ']')[0]:'';

					//if(active){
					//	activate(active, 'toggle');
					//	$(active).parents().show();
					//}

					function activate(el,effect){
						$(el).parent('li').toggleClass('active').siblings().removeClass('active').children('ul, div').slideUp('fast');
						$(el).siblings('ul, div')[(effect || 'slideToggle')]((!effect)?'fast':null);
					}

				});
			}
		});
	})(jQuery);

	//gnb실행구문
	$('.navi').accordion();

	(function(){
		$(document).ready(function(){
			$(window).trigger('resize');
		});
		$(window).resize(function(){
			var h_height = $("header").outerHeight();
			$(".header_wrap").outerHeight(h_height);
		});
	})();

});