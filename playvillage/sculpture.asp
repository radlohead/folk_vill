<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap">
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.asp" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>놀이마을</h2>
            <aside>
                <h2>놀이마을
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.asp" -->
            </aside>
        </div>

<!--#include virtual="/mobile/playvillage/inc/play_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-show">
<!--전통민속관 내용-->
            <div class="detail-head">
                <h3>조각공원</h3>
                <span class="text">아름다운 자연과 어우러진 산책길</span>
            </div>
            <div class="content sculpture">
                <span class="photo-img map">
                    <a href="#none" class="map-btn sculpture">지도보기</a>
                    <img src="/mobile/images/play_village/sculpture/sculpture_img01.jpg" alt="조각공원 사진1" />
                </span>
                <span class="text01">
                    철쭉, 목련 등 봄철 피어나는 꽃과 함께 계절에 변화를 한눈에 볼 수 있는 한국민속촌의 숨은 명소입니다.
                    수려한 자연 경관과 함께 예술조각 작품이 어울려 역사와 놀이 뿐만 아니라 문화예술 공간으로 관람객들의 사랑을 받고 있습니다.<br/><br/>
                    조각공원 입구에서는 88올림픽 이후 우리와 친숙해진 이탈리아의 조각가 스타치올리, 정상에는 착시 예술의 대가 쿠르즈디에즈,
                    상파울로 비엔날레 대상 수상 작가 레오폴드 말레르 등 국제적으로 명망있는 작가들의 작품과 우리나라 여류 조각계의
                    1세대이자 타계하신 故 김정숙, 원로 조각가이신 민복진, 전뢰진. 최만린 등 국내 조각계의 중진 20여명의 작품이 설치되어있습니다.
                </span>
            </div>
            <div class="preview-slide-wrap">
                <h4>미리보기</h4>
                <div class="preview-slide slider single-item">
                    <div><img src="/mobile/images/play_village/sculpture/sculpture_slide01.jpg" alt="" /></div>
                    <div><img src="/mobile/images/play_village/sculpture/sculpture_slide02.jpg" alt="" /></div>
                    <div><img src="/mobile/images/play_village/sculpture/sculpture_slide03.jpg" alt="" /></div>
                    <div><img src="/mobile/images/play_village/sculpture/sculpture_slide04.jpg" alt="" /></div>
                    <div><img src="/mobile/images/play_village/sculpture/sculpture_slide05.jpg" alt="" /></div>
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
        <img src="" alt="지도" />
        <a href="#none" class="popup_close-btn">지도 닫기버튼</a>
    </div>
</article>
<!--#include virtual="/mobile/common/inc/script.asp" -->
    <script>
        $(document).ready(function(){
            $('.single-items').slick({
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