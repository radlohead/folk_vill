<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
        <script>
            $(document).ready(function(){
                $('.single-items').slick({
                    slidesToShow: 2,
                    initialSlide: 1
                });
            });
        </script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap">
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.asp" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>먹거리·살거리</h2>
        </div>

        <div class="slider single-items">
            <a href="/mobile/playvillage/eat.asp">먹거리</a>
            <a href="/mobile/playvillage/buy.asp">살거리</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head2">
                <h3>농촌특산품매장</h3>
            </div>
            <div class="detail-content buy_eat buy">
                <span class="photo-img map">
                    <a href="#none" class="map-btn map-btn_1">지도보기</a>
                    <img src="/mobile/images/play_village/buy/specialty_titleImg.jpg" alt="농촌특산품매장 사진" />
                </span>
                <span class="text01">
                    한국민속촌 농촌특산품매장은 ‘전통의 명가’ 한국민속촌 농촌특산품을 한자리에 모아 놓은 매장입니다.
                    순수 우리 콩으로 만든 된장과 태양초 건고추를 사용한 고추장을 비롯한 장류와 기름류, 차류, 주류, 건강식품에 이르는 다양한 농촌특산품을 만나보세요.
                </span>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<article class="popup_wrap">
    <div class="dim-bg"></div>
    <div class="pop">
        <img src="" alt="지도" />
        <a href="#none" class="popup_close-btn">지도 닫기버튼</a>
    </div>
</article>

</body>
</html>