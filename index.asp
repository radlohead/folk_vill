<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<title>한국 민속촌 모바일 사이트</title>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
	<meta name="format-detection" content="telephone=no, address=no, email=no" />
	<link rel="stylesheet" type="text/css" href="common/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="common/css/swiper.min.css" />
	<link rel="stylesheet" type="text/css" href="common/css/index.css" />
	<link rel="stylesheet" type="text/css" href="common/css/media.css" />
	<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery.easing.min.js"></script>
	<script type="text/javascript" src="/mobile/common/js/swiper.min.js"></script>
    <script type="text/javascript" src="/mobile/common/js/common.js"></script>
	<script>
    //할인프로모션 온라인쿠폰 배너 높이값
    	function mainTab(){
            var tabMenuH = $(".tabMenu").height();
            var tabMenu1H = $(".tabMenu1").height();
            $(".main-tab").height(tabMenuH + tabMenu1H);
    	}
    	$(window).load(function(){
    	    mainTab();
    	});
    </script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->
	<div class="wrap">
		<!--#include virtual="/mobile/common/inc/header_wrap.asp" --><!-- 상단헤더 -->

<!-- 메인슬라이드 -->
		<!--#include file="main_slide.asp" -->

<!-- 메뉴컨텐츠 -->
		<div class="main-content-menu">
			<ul>
				<li class="menu01"><a href="/mobile/information/guide.asp"><img src="/mobile/images/index/main-content-menu01.gif" alt="시간,요금"/></a></li>
				<li class="menu02"><a href="/mobile/information/traffic.asp"><img src="/mobile/images/index/main-content-menu02.gif" alt="오시는 길"/></a></li>
				<li class="menu03"><a href="/mobile/information/credit_card.asp"><img src="/mobile/images/index/main-content-menu03.gif" alt="제휴카드"/></a></li>
				<li class="menu04"><a href="/mobile/information/map.asp"><img src="/mobile/images/index/main-content-menu04.gif" alt="가이드맵"/></a></li>
			</ul>
		</div>

<!-- 2단탭배너 -->


		<div class="main-tab">
			<ul class="tabMenu">
				<li class="menu1 on" rel="tabMenu1">
					<h2><a href="#tab1"><img src="/mobile/images/common/tabMenu_blank_bg.png" alt="할인프로모션" /></a></h2>
				</li>
				<li class="menu2" rel="tabMenu2">
					<h2><a href="#tab2"><img src="/mobile/images/common/tabMenu_blank_bg.png" alt="온라인 쿠폰" /></a></h2>
				</li>
			</ul>
			<!-- #tab1 -->
			<!--#include file="discount_promotion.asp" -->
			<!-- #tab2 -->
			<!--#include file="online_coupon.asp" -->
		</div>

<!-- 한국민속촌 정기공연 -->
		<div class="today">
			<div class="main-top">
				<h3><img src="/mobile/images/index/today_title.png" alt="한국민속촌 정기공연 머리말" /></h3>
				<a href="/mobile/event/performance_nongak.asp" class="more_btn"><span class="hidden">더보기</span></a>
			</div>
			<div class="today-slide swiper-container">
				<div class="text-btn_box">
                    <section class="text_box"></section>
					<!-- Add Arrows -->
					<div class="btns">
						<div class="swiper-button-prev"><img src="/mobile/images/index/today-prev_btn.png" alt="" /></div>
						<!--<div class="plus_btn"><a href="http://localhost/folk_vill/m/event/event_now.html"><img src="/mobile/images/index/today-plus_btn.png" alt="클릭시 링크 이동" /></a></div>-->
						<div class="swiper-button-next"><img src="/mobile/images/index/today-next_btn.png" alt="" /></div>
					</div>
				</div>
				<div class="swiper-wrapper">
					<div class="swiper-slide img01">
					    <div class="text-btn_box">
                            <section class="text_box">
                                <h4>농악놀이</h4>
                                <span class="text"><b>1회공연</b> 11:00</span>
                                <span class="text"><b>2회공연</b> 14:00</span>
                                <span class="text"><b>장소</b> 공연장</span>
                            </section>
                            <!--<div class="btns">-->
                                <!--<div class="plus_btn"><a href="http://localhost/folk_vill/m/event/event_now.html"><img src="/mobile/images/index/plus_btn_bg.png" alt="클릭시 링크 이동" /></a></div>-->
                            <!--</div>-->
                        </div>
					    <a href="/mobile/event/performance_nongak.asp"><img src="/mobile/images/index/today_img01.jpg" alt="한국민속촌 정기공연 농악놀이" /></a>
					</div>
					<div class="swiper-slide img02">
					    <div class="text-btn_box">
                            <section class="text_box">
                                <h4>마상무예</h4>
                                <span class="text"><b>1회공연</b> 11:00</span>
                                <span class="text"><b>2회공연</b> 14:00</span>
                                <span class="text"><b>장소</b> 공연장</span>
                            </section>
                        </div>
					    <a href="/mobile/event/performance_horse.asp"><img src="/mobile/images/index/today_img02.jpg" alt="한국민속촌 정기공연 마상무예" />
                        </a>
                    </div>
					<div class="swiper-slide img03">
					    <div class="text-btn_box">
                            <section class="text_box">
                                <h4>국악비보이</h4>
                                <span class="text"><b>1회공연</b> 11:00</span>
                                <span class="text"><b>2회공연</b> 14:00</span>
                                <span class="text"><b>장소</b> 공연장</span>
                            </section>
                        </div>
					    <a href="/mobile/event/performance_bboy.asp"><img src="/mobile/images/index/today_img03.jpg" alt="한국민속촌 정기공연 국악비보이" />
                        </a>
                    </div>
					<div class="swiper-slide img04">
					    <div class="text-btn_box">
                            <section class="text_box">
                                <h4>전통혼례</h4>
                                <span class="text"><b>1회공연</b> 11:00</span>
                                <span class="text"><b>2회공연</b> 14:00</span>
                                <span class="text"><b>장소</b> 공연장</span>
                            </section>
                        </div>
					    <a href="/mobile/event/performance_wedding.asp"><img src="/mobile/images/index/today_img04.jpg" alt="한국민속촌 정기공연 전통혼례" />
                        </a>
                    </div>
				</div>
			</div>
		</div>

<!-- 공지사항 -->
		<!--#include virtual="/mobile/notice.asp" -->

<!-- 생생현장 -->
		<div class="vivi-site">
			<div class="main-top">
				<h3><img src="/mobile/images/index/vivi-site_title.png" alt="한국민속촌 생생현장 머리말" /></h3>
			</div>
			<div class="video">
				<iframe src="https://www.youtube.com/embed/cD7EwWfuYDk" allowfullscreen></iframe>
			</div>
		</div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->
	</div>
	<script>

		function mainTab(){
			var tabMenuH = $(".tabMenu").height();
			var tabMenu1H = $(".tabMenu1").height();
			$(".main-tab").height(tabMenuH + tabMenu1H);
		}

		$(document).ready(function(){

			mainTab();
			//슬라이드 이미지 개수가 1이하이면 화살표제거 및 autoplay delete
            var mainSlideStatus;
            var tabMenu1Status;
            var tabMenu2Status;
            var mainSlide = $(".main-slide .swiper-slide").length;
            var tabMenu1 = $(".tabMenu1 .swiper-slide").length;
            var tabMenu2 = $(".tabMenu2 .swiper-slide").length;
            (mainSlide > 1) ? mainSlideStatus =  true : mainSlideStatus = false;
            (tabMenu1 > 1) ? tabMenu1Status =  true : tabMenu1Status = false;
            (tabMenu2 > 1) ? tabMenu2Status =  true : tabMenu2Status = false;

			var mySwiper_a = new Swiper('.main-slide', {
				pagination:'.main-slide .swiper-pagination',
				paginationClickable: true,
				nextButton: '.main-slide .swiper-button-next',
				prevButton: '.main-slide .swiper-button-prev',
				autoplay: 2500,
				loop:mainSlideStatus
			});
			var mySwiper_b = new Swiper('.tabMenu1', {
				paginationClickable: true,
				nextButton: '.tabMenu1 .swiper-button-next',
				prevButton: '.tabMenu1 .swiper-button-prev',
				autoplay: 2500,
				loop:tabMenu1Status  //할인프로모션 이미지가 2개이상이면 true로 변환해줘야함
			});
			var mySwiper_e = new Swiper('.tabMenu2', {
				paginationClickable: true,
				nextButton: '.tabMenu2 .swiper-button-next',
				prevButton: '.tabMenu2 .swiper-button-prev',
				autoplay: 2500,
				loop:tabMenu2Status  //할인프로모션 이미지가 2개이상이면 true로 변환해줘야함
			});
			var mySwiper_c = new Swiper('.today-slide', {
				paginationClickable: true,
				nextButton: '.today-slide .swiper-button-next',
				prevButton: '.today-slide .swiper-button-prev',
				autoplay: 2500,
				loop:true
			});

		});
	</script>
</body>
</html>