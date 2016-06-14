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

	//(function(){
	//	$(document).ready(function(){
	//		$(window).trigger('resize');
	//		$(window).load('resize');
	//	});
	//	$(window).resize(function(){
	//		var h_height = $("header").outerHeight();
	//		$(".header_wrap").outerHeight(h_height);
	//	});
	//})();

	//서브page rg_menu toggle버튼
	function rg_menu(){
		var aside = $(".title aside");
		var icon = $("aside .icon");
		var menu = $("aside .menu");
		$("aside > h2").click(function(){
			menu.toggle();
			icon.toggleClass("on");
		});
	}
	rg_menu();

	//시간요금페이지 우대정보 toggle버튼
	(function(){
		var title = $(".pre-infor-tab .title");
		var icon = $(".title .icon");
		var content = $(".pre-infor-tab .content");
		$(title).click(function(){
			content.toggle();
			icon.toggleClass("on");
		});
	})();

	//dim popup height값 구하기
	(function(){
		var dimResize = function(){
			var docH = $(document).height();
			$(".dim-bg").css({
				height : docH
			});
			var winW = $(window).width(),
				winH = $(window).height(),
				headerH = $(".header_wrap").outerHeight();
			$(".pop").css({
				left:(winW/2) - ($(".pop").width()/2),
				top: headerH
			});
		};

		dimResize();

		$(window).on('resize', function(){
			dimResize();
		});
	})();

	//popup 클릭시 지도띄우기 tab1번을 클릭하면 n번이미지 띄우기
	(function(){
		$(".popup_close-btn").click(function(){
			$(".popup_wrap").css("visibility","hidden");
			var pop = $(".popup_wrap .pop img");
			$(pop).attr("src", "");
		});
		$(".map-btn").click(function(){
			$(".popup_wrap").css("visibility","visible");
		});

		$(".tabMenu1 .map-btn").click(function(){
			var pop = $(".popup_wrap .pop img");
			$(pop).attr("src", "/mobile/images/page_map/page_map_display01.png");
			$(".popup_wrap").css("visibility","visible");
		});
		$(".tabMenu2 .map-btn").click(function(){
			var pop = $(".popup_wrap .pop img");
			$(pop).attr("src", "/mobile/images/page_map/page_map_display02.png");
			$(".popup_wrap").css("visibility","visible");
		});
		$(".tabMenu3 .map-btn").click(function(){
			var pop = $(".popup_wrap .pop img");
			$(pop).attr("src", "/mobile/images/page_map/page_map_display03.png");
			$(".popup_wrap").css("visibility","visible");
		});
		$(".tabMenu4 .map-btn").click(function(){
			var pop = $(".popup_wrap .pop img");
			$(pop).attr("src", "/mobile/images/page_map/page_map_display04.png");
			$(".popup_wrap").css("visibility","visible");
		});
		$(".show-time_wrap .map-btn").click(function(){
			var pop = $(".popup_wrap .pop img");
			$(pop).attr("src", "/mobile/images/page_map/page_map_performance_nongak.png");
			$(".popup_wrap").css("visibility","visible");
		});
		$(".map-btn.bboy").click(function(){
			var pop = $(".popup_wrap .pop img");
			$(pop).attr("src", "/mobile/images/page_map/page_map_performance_bboy.png");
			$(".popup_wrap").css("visibility","visible");
		});
		$(".map-btn.horse").click(function(){
			var pop = $(".popup_wrap .pop img");
			$(pop).attr("src", "/mobile/images/page_map/page_map_performance_horse.png");
			$(".popup_wrap").css("visibility","visible");
		});
		$(".map-btn.wedding").click(function(){
			var pop = $(".popup_wrap .pop img");
			$(pop).attr("src", "/mobile/images/page_map/page_map_performance_wedding.png");
			$(".popup_wrap").css("visibility","visible");
		});
	})();

	//메인 한국민속촌 정기공연 +버튼에 url삽입
	//var today_slide = function(){};
	//today_slide.prototype.common = function(){
	//	this.active = $(".today .swiper-slide-active > a").attr("href");
	//	this.text_box = $(".today .swiper-slide-active .text_box").html();
	//	$(".plus_btn > a").attr("href", this.active);
	//	$(".today-slide > .text-btn_box .text_box").html(this.text_box);
	//	this.timer = setInterval(this.common, 100);
	//};
    //
	//var today = new today_slide();
	//today.common();

	//메인 한국민속촌 정기공연 +버튼에 url삽입
	function today_slide(){
		var active = $(".today .swiper-slide-active > a").attr("href");
		var text_box = $(".today .swiper-slide-active .text_box").html();
		$(".plus_btn > a").attr("href", active);
		$(".today-slide > .text-btn_box .text_box").html(text_box);
		var timer = setTimeout(today_slide, 100);
	};
	today_slide();

//놀이마을 전설의고향 bg높이값구하기
	$(document).ready(function(){
		var junseolH = new contentH();
	});
	$(window).resize(function(){
		var junseolH = new contentH();
	});
	function contentH(){
		var $junseol = null,
			$junseol_bg = null,
			$infor = null;

		this.common();
	}
	contentH.prototype.common = function(){
		this.$junseol = $(".detail-junseol"),
			this.$junseol_bg = $(".detail-junseol .bg"),
			this.$infor = $(".detail-junseol .infor"),
			this.$junseol_bgH = this.$junseol_bg.height();
		this.$inforH = this.$infor.height();

		var $junseolH = this.$junseol_bgH + this.$inforH;
		//this.$junseol.height(this.$junseol_bgH + this.$inforH);
		this.$junseol.css("height", $junseolH);
		this.$infor.css("visibility","visible");
	};

});