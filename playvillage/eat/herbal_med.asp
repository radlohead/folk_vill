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
                <h3>한약방</h3>
            </div>
            <div class="detail-content buy_eat">
                <span class="photo-img map">
                    <a href="#none" class="map-btn map-btn_5">지도보기</a>
                    <img src="/mobile/images/play_village/eat/herbal_med/herbal_med_titleImg.jpg" alt="전통찻집 사진" />
                </span>
                <span class="text01">
                    한국민속촌 한약방은 운치와 함께 따뜻한 정감을 느낄 수 있습니다.
                    한약방에서 판매하는 모든 한방차들은 밭에서 직접 재배한 한약재를 오랜 시간 달여 만들어서, 정성은 물론 맛 또한 일품입니다.
                </span>
                <h4>메뉴소개</h4>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/herbal_med/herbal_med_img_01.jpg" alt="십전대보탕" />
                        <h5>십전대보탕</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/herbal_med/herbal_med_img_02.jpg" alt="오미자차" />
                        <h5>오미자차</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/herbal_med/herbal_med_img_03.jpg" alt="식혜" />
                        <h5>식혜</h5>
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