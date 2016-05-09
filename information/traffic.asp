<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>한국 민속촌 모바일 사이트</title>
<!--#include virtual="/mobile/common/inc/css_script.html" -->
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
            <a href="#none">교통정보</a>
            <a href="#none">편의시설</a>
            <a href="#none">공지사항</a>
            <a href="#none">가이드맵</a>
            <a href="#none">시간/요금</a>
            <a href="#none">연간회원안내</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>교통정보</h3>
                <div class="text-box">
                    <span class="text">서울에서 30분이면<br/> 조선시대 마을이 눈 앞에!</span>
                </div>
            </div>
            <div class="detail-content">
                <!-- 2단탭배너 -->
                <div class="main-tab traffic">
                    <ul class="tabMenu">
                        <li class="menu1 on" rel="tabMenu1">
                            <h3><a href="#tab1"><img src="../images/common/tabMenu_blank_bg.png" alt="할인프로모션" /></a></h3>
                        </li>
                        <li class="menu2" rel="tabMenu2">
                            <h3><a href="#tab2"><img src="../images/common/tabMenu_blank_bg.png" alt="온라인 쿠폰" /></a></h3>
                        </li>
                    </ul>
                    <!-- #tab1 -->
                    <div class="tab-content tabMenu1">
                        <img src="../images/information/traffic_public.jpg" alt="대중교통" />
                    </div>
                    <!-- #tab2 -->
                    <div class="tab-content tabMenu2">
                        <img src="../images/information/traffic_car.jpg" alt="자가용" />
                    </div>
                </div>

            </div>
        </div>

    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>

</body>
</html>