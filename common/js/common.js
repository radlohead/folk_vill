$(document).ready(function(){
//메뉴 클릭시 메뉴 display
	$(".gnb_btn").click(function(){
		if($(".dim").css("display") != "block"){
			$(".dim, aside.gnb").css("display","block");
			$(".wrap").css("display","none");
			console.log("11");
		}else if($(".dim").css("display") == "block"){
			$(".dim, aside.gnb").css("display","none");
			$(".wrap").css("display","block");
			console.log("22");
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

	//tab toggle버튼
	$(document).ready(function(){
		var tab = new Tab(".agree-tab");  //이용약관탭
		var tab2 = new Tab(".agree-tab02"); //개인정보보호정책탭
	});
	function Tab(selector){
		this.title = null;
		this.icon = null;
		this.content = null;
		this.init(selector);
		this.initEvent();
	};
	Tab.prototype.init = function(selector){
		this.title = $(selector + " .title");
		this.icon = $(selector + " .title .icon");
		this.content = $(selector + " .content");
	};
	Tab.prototype.initEvent = function(){
		var objThis = this;

		this.title.on('click', function(){
			objThis.selectItem($(this));
		})
	};
	Tab.prototype.selectItem = function(){
		this.icon.toggleClass("on");
		this.content.toggle();
	};

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

	//조각공원,먹거리살거리 이미지클릭시 지도팝업
	(function(){
		$(document).ready(function(){
			var sculpture = new Page_map();
			var eat = new Page_map();
			$(".popup_close-btn").click(function(){
				sculpture.close_btn();
				eat.close_btn();
			});
			$(".map-btn.sculpture").click(function(){
				sculpture.map("/mobile/images/page_map/sculpture/page_map_sculpture01.png");
			});

			//먹거리 이미지 클릭시 지도팝업
			for(var i = 0; i <= eat.str.length; i++){
				(function(e){
					$(".eat_img" + e).click(function(){
						eat.map("/mobile/images/page_map/eat/page_map_eat" + e + ".png");
					});
				})(i);
			}
			//살거리 이미지 클릭시 지도팝업
			for(var i = 0; i <= eat.str.length; i++){
				(function(e){
					$(".buy_img" + e).click(function(){
						eat.map("/mobile/images/page_map/buy/page_map_buy" + e + ".png");
					});
				})(i);
			}

		});
		function Page_map(){
			this.pop = null;
			this.str = $(".attraction .detail");
		}
		Page_map.prototype.map = function(map_src){
			this.pop = $(".popup_wrap .pop img");
			$(this.pop).attr("src", map_src);
			$(".popup_wrap").css("visibility","visible");
		};
		Page_map.prototype.close_btn = function(){
			$(".popup_wrap").css("visibility","hidden");
			this.pop = $(".popup_wrap .pop img");
			$(this.pop).attr("src", "");
		};
	})();

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
	$(window).load(function(){
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

	//공지사항 더보기 버튼 누르면 리스트 더 뽑아오기
	$(document).ready(function(){
		var board_list = new Board_list();
		board_list.num = 4;
		$(".list_more_btn").click(function(){
			board_list.init(board_list.num += 4);
		});
	});

	function Board_list(){
		this.list = null;
		this.init(4);
	};
	Board_list.prototype.init = function(num){
		this.list = $(".board-list .list tr");
		this.listNum = num;
		for(var i = 0; i < this.listNum; i++){
			this.list.eq(i).css({display:"table-row"});
		}
	};

	//팝업 띄우기
	/*
	function popup(){
		우편번호찾기팝업 띄우기
		$(".add_search_btn").on('click', function(){
			$(".post_pop").css("visibility",'visible');
		});
		아이디찾기팝업 띄우기
		$(".id_chk_btn").on('click', function(){
			$(".id_chk_pop").css("visibility",'visible');
		});
	}
	popup();
	*/

	//faq페이지 q&a 이벤트
	$(document).ready(function(){
		var faq = new Faq(".faq-tab .show_box");

		$(".faq-tab .show_box").click(function(){
			faq.hidden();
			faq.icon();
			$(this).parent().find(".hidden_box").css("display","table");
			$(this).find(".icon").addClass("on");
		});
	});
	function Faq(selector){
		this.$show_list = null;
		this.$hidden_list = null;
		this.$icon = $(selector).find(".icon");
		this.active(selector);
		this.icon();
		this.init(selector);
	}
	Faq.prototype.init = function(selector){
		this.$show_list = $(selector);
		this.$hidden_list = $(".faq-tab .hidden_box");
		this.$icon.eq(0).addClass("on");
	};
	Faq.prototype.icon = function(){
		this.$icon.removeClass("on");
	};
	Faq.prototype.active = function(selector){
		$(".faq-tab .hidden_box").eq(0).css("display","block");
	}
	Faq.prototype.hidden = function(){
		this.$hidden_list.css("display","none");
	};

	//로그인 페이지에서 비밀번호찾기 버튼클릭시 비밀번호 찾기 탭으로 이동
	(function(){
		if(location.href == "http://www.koreanfolk.co.kr/mobile/member/find_idpw.asp#tab2"){
			$(".menu2").trigger("click");
		}
		$(".pw_search").on("click", function(){
			$(".menu2").trigger("click");
		});
	})();

	//회원가입 아이디 중복확인과 우편번호 찾기시 팝업을 화면내에 띄우기
	$(document).ready(function(){
		//아이디 중복확인
		var id_chk = new PopupTop(".id_chk_btn");
		var ok_btn = new PopupTop(".id_dup.ok_btn");
	});
	function PopupTop(selector){
		this.btn = null;
		this.hgTop = null;
		
		this.event(selector);
	}
	PopupTop.prototype.event = function(selector){
		this.btn = $(selector);
		var objThis = this;

		//버튼 이벤트
		this.btn.click(function(e){
			var hgTop = $("body").scrollTop();
			$(".pop").css("top","0");
			$(".pop").css("top",hgTop);
		})
	};


	//pc,모바일 구분
	//(function(){
	//	var filter = "win16|win32|win64|mac";
	//	if( navigator.platform  ){
	//		if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
	//			//모바일 기기에서 접속
	//		}else{
	//			//PC에서 접속
	//			var reff = document.location.href;
	//			location.href = "http://www.koreanfolk.co.kr/";
	//		}
	//	}
	//})();
});