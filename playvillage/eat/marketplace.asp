<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
        <script>
            $(document).ready(function(){
                $('.single-items').slick({
                    slidesToShow: 2,
                    initialSlide: 0
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
                <h3>장터</h3>
            </div>
            <div class="detail-content buy_eat">
                <span class="photo-img map">
                    <a href="#none" class="map-btn map-btn_1">지도보기</a>
                    <img src="/mobile/images/play_village/eat/marketplace/marketplace_titleImg.jpg" alt="장터사진" />
                </span>
                <span class="text01">
                    장터에서는 각 지방에서 전해 내려오는 토속음식 20여가지와, 냉면, 묵비빔밥, 냉열무국수 등 입맛을 돋우는 계절음식을 맛볼 수 있습니다.
                    모든 음식은 일체 화학 조미료나 가공식품을 배제하며, 천연 조미료만 사용해 친환경 전통방식 그대로 옛날 전통의 맛을 그대로 담습니다.
                </span>
                <h4>메뉴소개</h4>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/marketplace/marketplace_img_01.jpg" alt="잔치국수" />
                        <h5>잔치국수</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/marketplace/marketplace_img_02.jpg" alt="손만두국" />
                        <h5>손만두국</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/marketplace/marketplace_img_03.jpg" alt="꼬치구이" />
                        <h5>꼬치구이</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/marketplace/marketplace_img_04.jpg" alt="잡채밥" />
                        <h5>잡채밥</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/marketplace/marketplace_img_05.jpg" alt="손수제비" />
                        <h5>손수제비</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/marketplace/marketplace_img_06.jpg" alt="순두부찌개" />
                        <h5>순두부찌개</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/marketplace/marketplace_img_07.jpg" alt="전통순대" />
                        <h5>전통순대</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/marketplace/marketplace_img_08.jpg" alt="동동주" />
                        <h5>동동주</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/marketplace/marketplace_img_09.jpg" alt="장국밥" />
                        <h5>장국밥</h5>
                    </div>
                </section>
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