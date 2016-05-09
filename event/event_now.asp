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
        <h2>행사·공연</h2>
        <div class="slider multiple-items">
            <a href="#none">농악놀이</a>
            <a href="#none">줄타기</a>
            <a href="#none">마상무예</a>
            <a href="#none">전통혼례</a>
            <a href="#none">농악놀이</a>
            <a href="#none">줄타기</a>
            <a href="#none">마상무예</a>
            <a href="#none">전통혼례</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-show">
            <div class="detail-head">
                <h3>농악놀이</h3>
                <div class="text-box">
                    <span class="text">민족의 얼과 흥을 느낄 수 있는 <br/> 한국민속촌 대표 공연</span>
                    <p class="show-time">
                        <span class="icon"></span>
                        <span class="text">
                          1회공연 <span class="time">10:30</span>  <span class="line"></span>  2회공연 <span class="time">14:00</span>
                        </span>
                    </p>
                </div>
            </div>
            <div class="detail-content">
                <img src="/mobile/images/event/nongak_img.jpg" alt="한국농악의 중심 명인 정인삼 선생" />
            </div>
        </div>
        <div class="preview-slide-wrap">
            <div class="preview-slide slider single-item">
                <div><img src="/mobile/images/event/preview_slide01.jpg" alt="농악놀이" /></div>
                <div><img src="/mobile/images/event/preview_slide01.jpg" alt="농악놀이" /></div>
                <div><img src="/mobile/images/event/preview_slide01.jpg" alt="농악놀이" /></div>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->
</div>
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