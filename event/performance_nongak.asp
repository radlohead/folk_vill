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
<!--#include virtual="/mobile/common/inc/gnb.html" -->

<div class="wrap">
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.html" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>행사·공연</h2>
            <aside>
                <h2>행사·공연
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->
            </aside>
        </div>

<!--#include virtual="/mobile/event/inc/event_topmenu.html" -->
    </div>

    <div class="contents">
        <div class="detail-show">
            <div class="detail-head">
                <h3>농악놀이</h3>
                <div class="text-box">
                    <span class="text">민족의 얼과 흥을 느낄 수 있는 <br/> 한국민속촌 대표 공연</span>
                </div>
            </div>
            <div class="detail-content">
                <div class="show-time_wrap">
                    <div class="show-time">
                        <span class="text">
                          1회공연 <span class="time">10:30</span>  2회공연 <span class="time">14:00</span>
                        </span>
                        <span class="text02">
                          장소 <span class="time">농악공연장</span>
                        </span>
                    </div>
                    <a href="#none" class="map-btn">지도보기</a>
                </div>
                <div class="cont_body">
                    <p class="text"></p>
                    <div class="img_box">
                        <span class="img"><img src="/mobile/images/event/nongak_img_01.jpg" alt="" /></span>
                        <span class="img"><img src="/mobile/images/event/nongak_img_02.jpg" alt="" /></span>
                    </div>
                    <div class="img_box02"><img src="/mobile/images/event/nongak_img_03.jpg" alt="" /></div>
                    <p class="text_box">
                        <span class="icon">*</span>
                        <span class="text">날씨나 내부상황에 따라 시간 변경 및 취소될 수 있습니다.</span>
                    </p>
                    <p class="text_box">
                        <span class="icon">*</span>
                        <span class="text">우천시 농악놀이 공연은 사물놀이 공연으로 대체됩니다. </span>
                    </p>
                </div>
                <div class="preview-slide-wrap">
                    <h4>공연 미리보기</h4>
                    <div class="preview-slide slider single-item">
                        <div><img src="/mobile/images/event/preview_slide01.jpg" alt="농악놀이" /></div>
                        <div><img src="/mobile/images/event/preview_slide01.jpg" alt="농악놀이" /></div>
                        <div><img src="/mobile/images/event/preview_slide01.jpg" alt="농악놀이" /></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->
</div>
<article class="popup_wrap">
    <div class="dim-bg"></div>
    <div class="pop">
        <img src="" alt="" />
        <a href="#none" class="popup_close-btn">지도 닫기버튼</a>
    </div>
</article>
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