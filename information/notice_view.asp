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
            <a href="/mobile/information/notice_list.asp">공지사항</a>
            <a href="/mobile/information/map.asp">가이드맵</a>
            <a href="/mobile/information/guide.asp">시간/요금</a>
            <a href="/mobile/information/membership.asp">연간회원안내</a>
            <a href="/mobile/information/traffic.asp">교통정보</a>
            <a href="/mobile/information/convenience.asp">편의시설</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>공지사항</h3>
                <div class="text-box">
                    <span class="text">한국민속촌에서 전하는 소식</span>
                </div>
            </div>
            <div class="detail-content board-view">
                <article>
                    <h4>한국민속촌 정기공연 변경안내 (4/18~)</h4>
                    <span class="date-wrap">
                        <span class="title">게시일</span>
                        <span class="date">2016.04.04</span>
                    </span>
                    <div class="content">
                        <img src="/mobile/images/information/notice_img2.jpg" alt="한국민속촌 정기공연 변경안내 그 동안 많은 분들이 사랑해 주신 줄타기 공연은 '국악 비보이 공연'으로 대체됩니다." />
                    </div>
                </article>
                <span class="btns">
                    <a href="#none" class="btn prev-btn">이전 글 보기</a>
                    <a href="#none" class="btn next-btn">다음 글 보기</a>
                    <a href="#none" class="btn list-btn">글 목록보기</a>
                </span>
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