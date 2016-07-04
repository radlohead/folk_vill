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
                <h3>마상무예</h3>
                <div class="text-box">
                    <span class="text">말 위에서 되살아나는 선조들의 무예 </span>
                </div>
            </div>
            <div class="detail-content">
                <div class="show-time_wrap">
                    <div class="show-time">
                        <span class="text">
                          1회공연 <span class="time">11:00</span>  2회공연 <span class="time">14:30</span>
                        </span>
                        <span class="text02">
                          장소 <span class="time">마상무예공연장</span>
                        </span>
                    </div>
                    <a href="#none" class="map-btn horse">지도보기</a>
                </div>
                <div class="cont_body">
                    <p class="text">우리나라의 전통 기마문화를 엿볼 수 있는 기예가 펼쳐집니다. 가슴을 울리는 화려하고 역동적인 마상재를 기대해주세요.</p>
                    <div class="img_box">
                        <img src="/mobile/images/event/horse_img_01.jpg" alt="" />
                        <em>용맹과 기백이 넘치는 역사 속 기마무예</em>
                        <p class="text">우리나라는 기마민족의 후예인 만큼 달리는 말 위에서의 재주 또한 뛰어났습니다. 선조 이후로는 관무재라는 무예 시험의 종목으로 봄, 가을에 주로 행해진 기록도 존재합니다.</p>
                    </div>
                    <div class="img_box">
                        <img src="/mobile/images/event/horse_img_02.jpg" alt="" />
                        <em>하늘이 내린 말 위의 재주 마상재(馬上才)</em>
                        <p class="text">한국민속촌의 마상무예 공연은 우리나라 전통 마상무예를 재현해 다양하고 역동적인 마상재를 선보입니다.
                                        말 위에서 벌이는 궁술과 쌍검술을 포함해 서서타기, 거꾸로 타기 뒤로 타기, 옆으로 타기, 말 위에서 물구나무 서기 등 난이도가 높은 기예를 펼칩니다.
                        </p>
                    </div>
                    <p class="text_box">
                        <span class="icon">*</span>
                        <span class="text">날씨나 내부상황에 따라 시간 변경 및 취소될 수 있습니다.</span>
                    </p>
                </div>
                <div class="preview-slide-wrap">
                    <h4>공연 미리보기</h4>
                    <div class="preview-slide slider single-item">
                        <div><img src="/mobile/images/event/horse_slide01.jpg" alt="" /></div>
                        <div><img src="/mobile/images/event/horse_slide01.jpg" alt="" /></div>
                        <div><img src="/mobile/images/event/horse_slide01.jpg" alt="" /></div>
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
                initialSlide: 3
            });
            $('.single-item').slick({
                dots: true
            });
        });
    </script>

</body>
</html>