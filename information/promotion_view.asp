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
            <h2>할인정보</h2>
            <aside>
                <h2>이용안내
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->
            </aside>
        </div>

        <div class="slider multiple-items">
            <a href="/mobile/information/promotion_list.asp">할인프로모션</a>
            <a href="/mobile/information/credit_card.asp">제휴카드할인</a>
            <a href="/mobile/information/coupon_list.asp">쿠폰할인</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-discount">
            <div class="detail-head">
                <h3>할인프로모션</h3>
                <span class="text">알뜰하게 챙기고, 여유롭게 즐기는 방법</span>
            </div>
            <div class="detail-content board-view">
                 <article>
                     <h4>낭만을 잊은 그대를 위한 대학(원)생 특별할인</h4>
                     <span class="date-wrap">
                         <span class="title">이벤트기간</span>
                         <span class="date">2016.04.04</span>
                     </span>
                     <div class="content">
                         <img src="/mobile/images/information/discount/promotion_img.jpg" alt="낭만을 잊은 그대를 위한 대학(원)생을 위한 자유이용권 특별 할인" />
                     </div>
                 </article>
                 <span class="btns">
                     <a href="#none" class="btn prev-btn">이전 글 보기</a>
                     <a href="#none" class="btn next-btn">다음 글 보기</a>
                     <a href="#none" class="btn list-btn">목록</a>
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
                slidesToShow: 3,
                slidesToScroll: 1
            });
            $('.single-item').slick({
                dots: true
            });
        });
    </script>

</body>
</html>