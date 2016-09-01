<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
        <script>
            $(document).ready(function(){
                $('.single-item').slick({
                    dots: true
                });
            });
        </script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap perfo-bboy">
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
                <h3>국악비보이</h3>
                <div class="text-box">
                    <span class="text">우리 전통 음악과<br>비보잉의 즐거운 만남
                    </span>
                </div>
            </div>
            <div class="detail-content">
                <div class="show-time_wrap">
                    <div class="show-time">
                        <span class="text">
                          1회공연 <span class="time">11:30</span>  2회공연 <span class="time">15:00</span>
                        </span>
                        <span class="text02">
                          장소 <span class="time">농악공연장</span>
                        </span>
                    </div>
                    <a href="#none" class="map-btn bboy">지도보기</a>
                </div>

                <div class="cont_body">
				<div class="text_box_wrap">
                   <p class="text_box">
                            <span class="icon">*</span>
                            <span class="text">날씨나 내부상황에 따라 시간 변경 및 취소될 수 있습니다.</span>
                        </p>
                        <p class="text_box">
                            <span class="icon">*</span>
                            <span class="text">2016년 6월 27일(월)부터 10월 2일(일)까지 주말/공휴일만 진행 </span>
                        </p>
				</div>
                    <p class="text">경쾌한 국악을 배경으로 역동적인 춤사위가 펼쳐지는 국악비보이 공연은 현대적으로 재해석한 전통의 재미를 만끽할 수 있어 더욱 특별합니다.</p>
                    <div class="img_box">
                        <img src="/mobile/images/event/bboy_img_01.jpg" alt="" />
                        <em>우리나라에 뿌리를 내린 음악 ‘국악’(國樂)</em>
                        <p class="text">우리나라 전통음악인 국악에는 선조들의 흥이 고스란히 담겨있습니다.</p>
                    </div>
                    <div class="img_box">
                        <img src="/mobile/images/event/bboy_img_02.jpg" alt="" />
                        <em>전통의 가락과 현대적인 비보이 댄스의 어울림</em>
                        <p class="text">한국민속촌 국악비보이는 국악의 선율을 배경으로 역동적인 안무를 선보입니다. 또한, 공연 중간중간 코믹함을 가미하여 남녀노소 누구나 재미있게 즐길 수 있는 이색 공연입니다.</p>
                    </div>
                
                </div>
                <div class="preview-slide-wrap">
                    <h4>공연 미리보기</h4>
                    <div class="preview-slide slider single-item">
                        <div><img src="/mobile/images/event/bboy_slide01.jpg" alt="" /></div>
                        <div><img src="/mobile/images/event/bboy_slide02.jpg" alt="" /></div>
                        <div><img src="/mobile/images/event/bboy_slide03.jpg" alt="" /></div>
						<div><img src="/mobile/images/event/bboy_slide04.jpg" alt="" /></div>
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