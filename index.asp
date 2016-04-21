<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>한국 민속촌 모바일 사이트</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
<meta name="format-detection" content="telephone=no, address=no, email=no" />
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/swiper.min.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="css/media_q.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="js/swiper.min.js"></script>
<script src="js/common.js"></script>
<script>
	$(document).ready(function(){
		var mySwiper_a = new Swiper('.main-slide', {
			pagination:'.main-slide .swiper-pagination',
			paginationClickable: true,
			nextButton: '.main-slide .swiper-button-next',
			prevButton: '.main-slide .swiper-button-prev',
			autoplay: 2500,
			loop:true
		});
		var mySwiper_b = new Swiper('.tabMenu1', {
			paginationClickable: true,
			nextButton: '.tabMenu1 .swiper-button-next',
			prevButton: '.tabMenu1 .swiper-button-prev',
			autoplay: 2500,
			loop:false  //할인프로모션 이미지가 2개이상이면 true로 변환해줘야함
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
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/inc/gnb.html" -->

	<div class="wrap">
<!-- 상단헤더 -->
		<div class="header_wrap">
			<header>
				<h1 class="logo">
					<a href="#">
						<img src="images/logo.png" alt="" />
					</a>
				</h1>
				<a href="#" class="gnb_btn">

				</a>
			</header>
		</div>

<!-- 메인슬라이드 -->
		<div class="main-slide swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="images/main_slide01.jpg" alt="웰컴투 조선 2016년 4월9일 부터 6월12일까지" /></div>
				<div class="swiper-slide"><img src="images/main_slide01.jpg" alt="웰컴투 조선 2016년 4월9일 부터 6월12일까지" /></div>
				<div class="swiper-slide"><img src="images/main_slide01.jpg" alt="웰컴투 조선 2016년 4월9일 부터 6월12일까지" /></div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination">

			</div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>

<!-- 메뉴컨텐츠 -->
		<div class="main-content-menu">
			<ul>
				<li class="menu01"><img src="images/main-content-menu01.gif" alt="시간,요금"/></li>
				<li class="menu02"><img src="images/main-content-menu02.gif" alt="오시는 길"/></li>
				<li class="menu03"><img src="images/main-content-menu03.gif" alt="제휴카드"/></li>
				<li class="menu04"><img src="images/main-content-menu04.gif" alt="가이드맵"/></li>
			</ul>
		</div>

<!-- 2단탭배너 -->
		<div class="main-tab">
			<ul class="tabMenu">
				<li class="menu1 on" rel="tabMenu1">
					<h2><a href="#tab1"><img src="images/tabMenu_blank_bg.png" alt="할인프로모션" /></a></h2>
				</li>
				<li class="menu2" rel="tabMenu2">
					<h2><a href="#tab2"><img src="images/tabMenu_blank_bg.png" alt="온라인 쿠폰" /></a></h2>
				</li>
			</ul>
			<!-- #tab1 -->
			<div class="tab-content swiper-container tabMenu1">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><img src="images/main-tab1_img01.jpg" alt="수원삼성블루윙즈 제휴할인 안내 2016년 2월13일 부터 4월30일까지" /></div>
				</div>
				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
			<!-- #tab2 -->
			<div class="tab-content tabMenu2">탭2내용</div>
		</div>

<!-- 한국민속촌 정기공연 -->
		<div class="today">
			<div class="main-top">
				<h3><img src="images/today_title.png" alt="한국민속촌 정기공연 머리말" /></h3>
				<a href="#none" class="more_btn"><span class="hidden">더보기</span></a>
			</div>
			<div class="today-slide swiper-container">
				<div class="text-btn_box">
					<section class="text_box">
						<h4>농악놀이</h4>
						<span class="text"><b>1회공연</b> 11:00</span>
						<span class="text"><b>2회공연</b> 14:00</span>
						<span class="text"><b>장소</b> 공연장</span>
					</section>
					<!-- Add Arrows -->
					<div class="btns">
						<div class="swiper-button-prev"><img src="images/today-prev_btn.png" alt="" /></div>
						<div class="plus_btn"><img src="images/today-plus_btn.png" alt="" /></div>
						<div class="swiper-button-next"><img src="images/today-next_btn.png" alt="" /></div>
					</div>
				</div>
				<div class="swiper-wrapper">
					<div class="swiper-slide"><img src="images/today_img01.jpg" alt="한국민속촌 정기공연 농악놀이" /></div>
					<div class="swiper-slide"><img src="images/today_img01.jpg" alt="한국민속촌 정기공연 농악놀이" /></div>
				</div>
			</div>
		</div>

<!-- 공지사항 -->
		<div class="notice">
			<div class="main-top">
				<h3><img src="images/notice_title.png" alt="공지사항 머리말" /></h3>
				<a href="#none" class="more_btn"><span class="hidden">더보기</span></a>
			</div>
			<ul>
				<li>
					<span class="icon guide_icon"></span>
					<a href="#none" class="text orange">한국민속촌 정기공연 변경안내(4/18~)</a>
				</li>
				<li>
					<span class="icon guide_icon"></span>
					<a href="#none" class="text">아시안 푸드 레스토랑 '테라스그린' 오픈 안내</a>
				</li>
				<li>
					<span class="icon discount_icon"></span>
					<a href="#none" class="text">해피포인트 제휴 할인 이벤트</a>
				</li>
			</ul>
		</div>

<!-- 생생현장 -->
		<div class="vivi-site">
			<div class="main-top">
				<h3><img src="images/vivi-site_title.png" alt="한국민속촌 생생현장 머리말" /></h3>
			</div>
			<div class="video">
				<!--<a href="#none"><img src="images/video_img.jpg" alt="한국민속촌 생생현장 영상" /></a>-->
				<iframe width="100%" height="100%" src="https://www.youtube.com/embed/cD7EwWfuYDk" frameborder="0" allowfullscreen></iframe>
			</div>
			<ul class="sns_link">
				<li class="facebook"><a href="#none">페이스북 링크</a></li>
				<li class="twitter"><a href="#none">트위터 링크</a></li>
				<li class="blog"><a href="#none">한국민속촌 블로그 링크</a></li>
				<li class="kakaostory"><a href="#none">카카오스토리 링크</a></li>
			</ul>
		</div>

<!-- 하단푸터 -->
		<footer>
			<ul class="footer_link">
				<li class="pc"><a href="#none">PC버전</a></li>
				<li class="login"><a href="#none">로그인</a></li>
				<li class="group"><a href="#none">단체프로그램</a></li>
			</ul>
			<ul class="footer_link2">
				<li class="infor"><a href="#none">개인정보 취급방침</a> |</li>
				<li class="terms"><a href="#none">이용약관</a></li>
			</ul>
			<div class="address-wrap">
				<address>
					<p>주소 : 경기도 용인시 기흥구 민속촌로 90</p>
					<p>문의전화 : 031.288.0000</p>
				</address>
				<p>Copyright@KFV All Rights Reserved.</p>
			</div>
			<span class="foot-logo">한국민속촌 하단로고</span>
		</footer>
	</div>


</body>
</html>