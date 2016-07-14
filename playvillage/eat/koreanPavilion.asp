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
                <h3>한국관</h3>
            </div>
            <div class="detail-content buy_eat">
                <span class="photo-img map">
                    <a href="#none" class="map-btn map-btn_4">지도보기</a>
                    <img src="/mobile/images/play_village/eat/koreanPavilion/koreanPavilion_titleImg.jpg" alt="테라스그린 사진" />
                </span>
                <span class="text01">팔자로 뻗은 기와 지붕이 멋스러운 한국관은 정성이 듬뿍 담긴 고급스러운 한정식을 맛볼 수 있는 곳입니다.</span>
                <p class="text-box2">
                    <span class="icon">*</span>
                    <span class="text">단체 사전예약으로 코스별 한정식을 맛보실 수 있습니다.<br/>
                                          (수용인원 360명)</span>
                </p>
                <h4>메뉴소개</h4>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/koreanPavilion/koreanPavilion_img_01.jpg" alt="한방 갈비탕" />
                        <h5>한방 갈비탕</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/koreanPavilion/koreanPavilion_img_02.jpg" alt="한방 소꼬리곰탕" />
                        <h5>한방 소꼬리곰탕</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/koreanPavilion/koreanPavilion_img_03.jpg" alt="한방 도가니탕" />
                        <h5>한방 도가니탕</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/koreanPavilion/koreanPavilion_img_04.jpg" alt="차돌박이 된장찌개" />
                        <h5>차돌박이 된장찌개</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/koreanPavilion/koreanPavilion_img_05.jpg" alt="버섯 불고기 전골" />
                        <h5>버섯 불고기 전골</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/koreanPavilion/koreanPavilion_img_06.jpg" alt="한방 갈비찜" />
                        <h5>한방 갈비찜</h5>
                    </div>
                </section>
                <section class="section">
                    <div class="img_wrap left">
                        <img src="/mobile/images/play_village/eat/koreanPavilion/koreanPavilion_img_07.jpg" alt="도가니찜" />
                        <h5>도가니찜</h5>
                    </div>
                    <div class="img_wrap right">
                        <img src="/mobile/images/play_village/eat/koreanPavilion/koreanPavilion_img_08.jpg" alt="육회" />
                        <h5>육회</h5>
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