<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.html" -->
    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 1
            });
            $('.single-item').slick({
                dots: true
            });
        });
    </script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.html" -->

<div class="wrap">
    <!-- 상단헤더 -->
    <!--#include virtual="/mobile/common/inc/header.html" -->

    <div class="header_title_slide">
        <!--#include virtual="/mobile/common/inc/rg_menu.html" -->

        <div class="slider multiple-items">
            <a href="/mobile/information/map.asp">가이드맵</a>
            <a href="/mobile/information/guide.asp">시간/요금</a>
            <a href="/mobile/information/membership.asp">연간회원안내</a>
            <a href="/mobile/information/traffic.asp">교통정보</a>
            <a href="/mobile/information/convenience.asp">편의시설</a>
            <a href="/mobile/information/notice_list.asp">공지사항</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>가이드맵</h3>
                <div class="text-box">
                    <span class="text">조선시대로 떠나는 시간여행</span>
                </div>
            </div>
            <div class="detail-content">
                <div class="content-head">
                    <a href="#none" class="pdf-down"><img src="/mobile/images/common/pdf-down.gif" alt="민속촌 지도 pdf파일 다운받기 버튼" /></a>
                    <div class="map"><img src="/mobile/images/information/map.png" alt="한국민속촌 가이드맵" /></div>
                </div>
                <!-- 2단탭배너 -->
                <div class="main-tab map">
                    <ul class="tabMenu">
                        <li class="menu1 on" rel="tabMenu1">
                            <h3><a href="#tab1"><img src="/mobile/images/common/tabMenu_blank_bg2.png" alt="상가마을" /></a></h3>
                        </li>
                        <li class="menu2" rel="tabMenu2">
                            <h3><a href="#tab2"><img src="/mobile/images/common/tabMenu_blank_bg2.png" alt="민속마을" /></a></h3>
                        </li>
                        <li class="menu3" rel="tabMenu3">
                            <h3><a href="#tab2"><img src="/mobile/images/common/tabMenu_blank_bg2.png" alt="놀이마을" /></a></h3>
                        </li>
                        <li class="menu4" rel="tabMenu4">
                            <h3><a href="#tab2"><img src="/mobile/images/common/tabMenu_blank_bg2.png" alt="장터" /></a></h3>
                        </li>
                    </ul>
                    <!-- #tab1 -->
                    <div class="tab-content tabMenu1">
                        <img src="/mobile/images/information/shop_vill.jpg" alt="상가마을" />
                    </div>
                    <!-- #tab2 -->
                    <div class="tab-content tabMenu2">
                        <img src="/mobile/images/information/folk_vill.jpg" alt="민속마을" />
                    </div>
                    <!-- #tab3 -->
                    <div class="tab-content tabMenu3">
                        <img src="/mobile/images/information/play_vill.jpg" alt="놀이마을" />
                    </div>
                    <!-- #tab4 -->
                    <div class="tab-content tabMenu4">
                        <img src="/mobile/images/information/market_place.jpg" alt="장터" />
                    </div>
                </div>

            </div>
        </div>

    </div>

    <!-- 하단푸터 -->
    <!--#include virtual="/mobile/common/inc/footer.html" -->
</div>
<!--#include virtual="/mobile/common/inc/script.html" -->
    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 1
            });
            $('.single-item').slick({
                dots: true
            });
        });
    </script>

</body>
</html>