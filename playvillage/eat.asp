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
            <div class="detail-head">
                <h3>먹거리</h3>
                <div class="text-box">
                    <span class="text" style="letter-spacing:-0.05em;">
                        정성이 가득 담긴 토속음식과 <br>테라스에서 즐기는 글로벌푸드
                    </span>
                </div>
            </div>
            <div class="detail-content attraction">
                <div class="detailWrap">
                    <section class="detail detail-eat">
                        <a href="eat/marketplace.asp" class="img eat_img1"><img src="/mobile/images/play_village/eat/eat_1.jpg" alt="장터 사진" /></a>
                        <h4>장터</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">민속마을 장터</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">한식</dd>
                        </dl>
                    </section>
                    <section class="detail detail-eat end">
                        <a href="eat/streetCornerHouse.asp" class="img eat_img2"><img src="/mobile/images/play_village/eat/eat_2.jpg" alt="길목집 사진" /></a>
                        <h4>길목집</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">상가마을</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">한식</dd>
                        </dl>
                    </section>
                </div>
                <div class="detailWrap">
                    <section class="detail">
                        <a href="eat/terrace.asp" class="img eat_img3"><img src="/mobile/images/play_village/eat/eat_3.jpg" alt="테라스그린 사진" /></a>
                        <h4>테라스그린</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">놀이마을</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">인도요리, 글로벌푸드</dd>
                        </dl>
                    </section>
                    <section class="detail end">
                        <a href="eat/koreanPavilion.asp" class="img eat_img4"><img src="/mobile/images/play_village/eat/eat_4.jpg" alt="길목집 사진" /></a>
                        <h4>한국관</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">상가마을</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">한식</dd>
                        </dl>
                    </section>
                </div>
                <div class="detailWrap">
                    <section class="detail">
                        <a href="eat/teahouse.asp" class="img eat_img5"><img src="/mobile/images/play_village/eat/eat_5.jpg" alt="전통찻집 사진" /></a>
                        <h4>전통찻집</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">상가마을</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">전통차, 커피, 디저트</dd>
                        </dl>
                    </section>
                    <section class="detail end">
                        <a href="eat/snack.asp" class="img eat_img6"><img src="/mobile/images/play_village/eat/eat_6.jpg" alt="민속주전부리 사진" /></a>
                        <h4>민속주전부리</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">상가마을</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">간식</dd>
                        </dl>
                    </section>
                </div>
                <div class="detailWrap">
                    <section class="detail">
                        <a href="eat/hotdog.asp" class="img eat_img7"><img src="/mobile/images/play_village/eat/eat_7.jpg" alt="레일로드핫도그 사진" /></a>
                        <h4>레일로드핫도그</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">놀이마을</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">양식</dd>
                        </dl>
                    </section>
                    <section class="detail end">
                        <a href="eat/icecream.asp" class="img eat_img8"><img src="/mobile/images/play_village/eat/eat_8.jpg" alt="달콤아이스크림 사진" /></a>
                        <h4>달콤아이스크림</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">놀이마을</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">아이스크림, 커피</dd>
                        </dl>
                    </section>
                </div>
                <div class="detailWrap">
                    <section class="detail">
                        <a href="eat/winnie.asp" class="img eat_img9"><img src="/mobile/images/play_village/eat/eat_9.jpg" alt="위니비니 사진" /></a>
                        <h4>위니비니</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">놀이마을</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">캔디, 초콜릿, 젤리 등</dd>
                        </dl>
                    </section>
                    <section class="detail end">
                        <a href="eat/chinesePlace.asp" class="img eat_img10"><img src="/mobile/images/play_village/eat/eat_10.jpg" alt="민속반점 사진" /></a>
                        <h4>민속반점</h4>
                        <dl>
                            <dt class="sub-title_01">위치</dt>
                            <dd class="text_01">놀이마을</dd>
                            <dt class="sub-title_02">분류</dt>
                            <dd class="text_02">중식</dd>
                        </dl>
                    </section>
                </div>
              <!--  <section class="detail">
                    <a href="eat/pizza.asp" class="img eat_img11"><img src="/mobile/images/play_village/eat/eat_11.jpg" alt="임실치즈피자 사진" /></a>
                    <h4>임실치즈피자</h4>
                    <dl>
                        <dt class="sub-title_01">위치</dt>
                        <dd class="text_01">놀이마을</dd>
                        <dt class="sub-title_02">분류</dt>
                        <dd class="text_02">양식</dd>
                    </dl>
                </section> -->
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