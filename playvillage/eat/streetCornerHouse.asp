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
                <h3>길목집</h3>
            </div>
            <div class="detail-content buy_eat">
                <span class="photo-img map">
                    <a href="#none" class="map-btn map-btn_2">지도보기</a>
                    <img src="/mobile/images/play_village/eat/streetCornerHouse/streetCornerHouse_titleImg.jpg" alt="길목집 사진" />
                </span>
                <span class="text01">
                    전통적인 너와 지붕이 특색 있는 길목집은 고즈넉한 정취를 느낄 수 있습니다. 450명을 수용할 수 있는 넓은 홀과
                    함께 경산 쇠고기 국밥, 목포 낙지 비빔밥, 안동 산채 비빔밥, 동래 해물파전, 종로 녹두전 등 다양한 식사류와 안주류를 즐길 수 있습니다.
                </span>
                <h4>메뉴소개</h4>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/streetCornerHouse/streetCornerHouse_img_01.jpg" alt="경산 쇠고기국밥" />
                        <h5>경산 쇠고기국밥</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/streetCornerHouse/streetCornerHouse_img_02.jpg" alt="목포 낙지 비빔밥" />
                        <h5>목포 낙지 비빔밥</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/streetCornerHouse/streetCornerHouse_img_03.jpg" alt="안동 산채비빔밥" />
                        <h5>안동 산채비빔밥</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/streetCornerHouse/streetCornerHouse_img_04.jpg" alt="언양 불고기" />
                        <h5>언양 불고기</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/streetCornerHouse/streetCornerHouse_img_05.jpg" alt="동래 해물파전" />
                        <h5>동래 해물파전</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/streetCornerHouse/streetCornerHouse_img_06.jpg" alt="삼겹수육" />
                        <h5>삼겹수육</h5>
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