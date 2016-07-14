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
                <h3>테라스그린</h3>
            </div>
            <div class="detail-content buy_eat">
                <span class="photo-img map">
                    <a href="#none" class="map-btn map-btn_3">지도보기</a>
                    <img src="/mobile/images/play_village/eat/terrace/terrace_titleImg.jpg" alt="테라스그린 사진" />
                </span>
                <span class="text01">
                    한국식 전통과 프리미엄 아시안 푸드의 만남!
                    식사의 격조를 높여주는 테라스를 배경으로 남녀노소 누구나 건강하게 즐기는 20여 가지 글로벌푸드를 맛보세요
                </span>
                <h4>메뉴소개</h4>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/terrace/terrace_img_01.jpg" alt="인도식 치킨 바비큐" />
                        <h5>인도식 치킨 바비큐</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/terrace/terrace_img_02.jpg" alt="야채커리" />
                        <h5>야채커리</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/terrace/terrace_img_03.jpg" alt="쇠고기 카레덮밥" />
                        <h5>쇠고기 카레덮밥</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/terrace/terrace_img_04.jpg" alt="치킨 카레 덮밥" />
                        <h5>치킨 카레 덮밥</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/terrace/terrace_img_05.jpg" alt="플레인 난" />
                        <h5>플레인 난</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/terrace/terrace_img_06.jpg" alt="야채 사모사" />
                        <h5>야채 사모사</h5>
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