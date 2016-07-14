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
                $('.multiple-items').slick({
                    infinite: true,
                    slidesToShow: 4,
                    initialSlide: 1
                });
                $('.single-item').slick({
                    dots: true
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
            <h2>행사·공연</h2>
        </div>

<!--#include virtual="/mobile/event/inc/event_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-show">
            <div class="detail-head">
                <h3>농악놀이</h3>
                <div class="text-box">
                    <span class="text">민족의 얼과 흥을 느낄 수 있는 한국민속촌 대표 공연</span>
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
                    <div class="text_box_wrap">
                        <p class="text_box">
                            <span class="icon">*</span>
                            <span class="text">날씨나 내부상황에 따라 시간 변경 및 취소될 수 있습니다.</span>
                        </p>
                        <p class="text_box">
                            <span class="icon">*</span>
                            <span class="text">우천시 농악놀이 공연은 사물놀이 공연으로 대체됩니다. </span>
                        </p>
                    </div>
                    <p class="text">한국민속촌 농악놀이 공연은 관람객이 직접 참여하여 즐길 수 있는 공연입니다. 풍년을 기원하며 신명나게 울리는 전통농악 놀이를 만나보세요.</p>
                    <div class="img_box">
                        <img src="/mobile/images/event/nongak_img_01.jpg" alt="" />
                        <h4>익살스런 재미, 버나돌리기</h4>
                        <span class="text">익살스런 춤사위와 재담이 오가는 가운데, 관객들이 함께 버나를 돌리며 놀이에 참여할 수 있습니다.</span>
                    </div>
                    <div class="img_box">
                        <img src="/mobile/images/event/nongak_img_02.jpg" alt="" />
                        <h4>비오는 날 호젓한 정취, 사물놀이</h4>
                        <span class="text">우천 시 정자에서 펼쳐지는 전통 악기의 강렬하고 역동적인 가락과 함께 고즈넉한 한국민속촌의 정취를 즐길 수 있습니다.  </span>
                    </div>
                    <div class="img_box">
                        <img src="/mobile/images/event/nongak_img_03.jpg" alt="" />
                        <h4>한국농악의 중심, 명인 정인삼 선생</h4>
                        <span class="text">한국민속촌 농악단 정인삼 선생은 한국민속 촌의 농악단을 지키면서 호남우도 농악의 명 맥을 이어오고 있습니다.
                                           또한, 국내 최초로 경기도 무형문화제 제56호 경기고깔 소고춤 보유자로 선정 되는 등 사라져가는 우리문화 전승에 크게 이바지하고 있는 명인이자 한국 농악의 대가입니다.
                        </span>
                    </div>
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
<!--#include virtual="/mobile/common/inc/footer.asp" -->
</div>
<article class="popup_wrap">
    <div class="dim-bg"></div>
    <div class="pop">
        <img src="" alt="" />
        <a href="#none" class="popup_close-btn">지도 닫기버튼</a>
    </div>
</article>

</body>
</html>