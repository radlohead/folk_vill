<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.html" -->
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap">
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.html" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>먹거리·살거리</h2>
            <aside>
                <h2>먹거리·살거리
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->
            </aside>
        </div>

        <div class="slider single-items">
            <a href="/mobile/playvillage/eat.asp">먹거리</a>
            <a href="/mobile/playvillage/buy.asp">살거리</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>살거리</h3>
                <div class="text-box">
                    <span class="text">
                        전통을 담고 있는 다양한 상품을<br/>
                        만나보세요
                    </span>
                </div>
            </div>
            <div class="detail-content attraction">
                <section class="detail detail-eat">
                    <a href="#" class="img buy_img1"><img src="/mobile/images/play_village/buy/buy_1.jpg" alt="농촌특산품매장 사진" /></a>
                    <h4>농촌특산품매장</h4>
                    <dl>
                        <dt class="sub-title_01">위치</dt>
                        <dd class="text_01">상가마을</dd>
                    </dl>
                </section>
                <section class="detail detail-eat end">
                    <a href="#" class="img buy_img2"><img src="/mobile/images/play_village/buy/buy_2.jpg" alt="기념1매장 사진" /></a>
                    <h4>기념1매장</h4>
                    <dl>
                        <dt class="sub-title_01">위치</dt>
                        <dd class="text_01">상가마을</dd>
                    </dl>
                </section>
                <section class="detail">
                    <a href="#" class="img buy_img3"><img src="/mobile/images/play_village/buy/buy_3.jpg" alt="고향기념품매장 사진" /></a>
                    <h4>고향기념품매장</h4>
                    <dl>
                        <dt class="sub-title_01">위치</dt>
                        <dd class="text_01">상가마을</dd>
                    </dl>
                </section>
                <section class="detail end">
                    <a href="#" class="img buy_img4"><img src="/mobile/images/play_village/buy/buy_4.jpg" alt="귀신店 사진" /></a>
                    <h4>귀신店</h4>
                    <dl>
                        <dt class="sub-title_01">위치</dt>
                        <dd class="text_01">놀이마을</dd>
                    </dl>
                </section>
                <section class="detail">
                    <a href="#" class="img buy_img5"><img src="/mobile/images/play_village/buy/buy_5.jpg" alt="토이빌리지 사진" /></a>
                    <h4>토이빌리지</h4>
                    <dl>
                        <dt class="sub-title_01">위치</dt>
                        <dd class="text_01">놀이마을</dd>
                    </dl>
                </section>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>
<article class="popup_wrap">
    <div class="dim-bg"></div>
    <div class="pop">
        <img src="" alt="지도" />
        <a href="#none" class="popup_close-btn">지도 닫기버튼</a>
    </div>
</article>
<!--#include virtual="/mobile/common/inc/script.html" -->
    <script>
        $(document).ready(function(){
            $('.single-items').slick({
                slidesToShow: 2,
                initialSlide: 1
            });
        });
    </script>
</body>
</html>