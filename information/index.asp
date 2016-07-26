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
    var topNav = document.getElementById("topNav-slide");

    topNav.addEventListener('touchstart', function(event) {
        var touch = event.touches[0];
        touchstartX = touch.clientX;
        touchstartY = touch.clientY;

        if(touchstartX > 0){
            topNav.addEventListener('touchmove', function(event){
                $(".slide-list ul").animate({
                    left: "-=" + touch.clientX
                },500);

            })
        }
//        console.log("~~")
//        console.log(touchstartX)
    }, false);

    topNav.addEventListener('touchend', function(event) {
        if(event.touches.length == 0) {
            var touch = event.changedTouches[event.changedTouches.length - 1];
            touchendX = touch.clientX;
            touchendY = touch.clientY;

            touchoffsetX = touchendX - touchstartX;
            touchoffsetY = touchendY - touchstartY;

            if(Math.abs(touchoffsetX) >= 10 && Math.abs(touchoffsetY) <= 10) {
                if(touchoffsetX < 0){
                    console.log("swipe left");
//                    $(".slide-list ul").animate({
//                        left: "-=" + 20
//                    },500);
                }
                else{
                    console.log("swipe right");

                }
            }
        }
    }, false);
})
</script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap map">
    <!-- 상단헤더 -->
    <!--#include virtual="/mobile/common/inc/header.asp" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>이용안내</h2>
        </div>

        <div id="topNav-slide" class="topNav-slide">
            <a href="#none" class="slide-arrow prev-btn"></a>
            <div class="slide-list">
                <ul>
                    <li><a href="/mobile/information/guide.asp">시간/요금</a></li>
                    <li><a href="/mobile/information/membership.asp">연간회원안내</a></li>
                    <li><a href="/mobile/information/traffic.asp">교통정보</a></li>
                    <li><a href="/mobile/information/convenience.asp">편의시설</a></li>
                    <li><a href="/mobile/information/notice_list.asp">공지사항</a></li>
                    <li><a href="/mobile/information/map.asp">가이드맵</a></li>
                </ul>
            </div>
            <a href="#none" class="slide-arrow next-btn"></a>
        </div>

    </div>

    <!-- 하단푸터 -->
    <!--#include virtual="/mobile/common/inc/footer.asp" -->
</div>

</body>
</html>