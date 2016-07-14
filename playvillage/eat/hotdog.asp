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
                <h3>레일로드핫도그</h3>
            </div>
            <div class="detail-content buy_eat">
                <span class="photo-img map">
                    <a href="#none" class="map-btn map-btn_7">지도보기</a>
                    <img src="/mobile/images/play_village/eat/hotdog/hotdog_titleImg.jpg" alt="레일로드핫도그 사진" />
                </span>
                <span class="text01">
                    아이들이 정말 좋아하는 레일로드 핫도그와 수제 햄버거!
                    산 속을 달리는 칙칙폭폭 꼬마열차 소리를 배경으로 먹기도 쉽고 맛도 좋은 최고의 간식을 맛보세요~
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