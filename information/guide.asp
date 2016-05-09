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
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->

        <div class="slider multiple-items">
            <a href="/mobile/information/guide.asp">시간/요금</a>
            <a href="/mobile/information/membership.asp">연간회원안내</a>
            <a href="/mobile/information/traffic.asp">교통정보</a>
            <a href="/mobile/information/convenience.asp">편의시설</a>
            <a href="/mobile/information/notice_list.asp">공지사항</a>
            <a href="/mobile/information/map.asp">가이드맵</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-guide">
            <div class="detail-head">
                <h3>운영시간</h3>
                <div class="text-box">
                    <span class="text">2월~4월 한국민속촌 이용시간</span>
                    <span class="guide-time">
                        평일 <span class="time">09:30~18:00</span><br />
                        주말 <span class="time">09:30~18:00</span>
                    </span>
                </div>
            </div>
            <div class="detail-content">
                <img src="/mobile/images/information/guide_img01.gif" alt="운영시간에 대한 안내" />
            </div>
            <div class="detail-head detail-head02">
                <h3>이용요금</h3>
                <div class="text-box">
                    <span class="text02">한국민속촌은 일반 입장권과 함께</span>
                    <span class="text02">15여 종의 놀이기구를 이용할 수 있는</span>
                    <span class="text02">자유이용권을 판매합니다.</span>
                </div>
            </div>
            <div class="detail-content">
                <img src="/mobile/images/information/guide_img02.gif" alt="이용요금에 대한 안내" />
                <div class="pre-infor-tab">
                    <div class="title">
                        <h3>우대정보</h3>
                        <span class="icon"></span>
                    </div>
                    <div class="content"><img src="/mobile/images/information/pre-infor_img.gif" alt=""/></div>
                </div>
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