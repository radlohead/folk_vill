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
            <h2>마이페이지</h2>
        </div>

<!--#include virtual="/mobile/mypage/inc/mypage_topmenu.html" -->
    </div>

    <div class="contents">
        <div class="detail-mypage">
            <div class="detail-head">
                <h3>My 쿠폰</h3>
                <span class="text">고객님께서 발급받으신 쿠폰을 확인하실 수 있습니다.</span>
            </div>
            <div class="detail-content coupon-view">
                <p class="coupon-title">
                    <em>COUPON</em>
                    <span class="text">신규회원을 위한 봄시즌 자유이용권 25% 할인쿠폰</span>
                </p>
                <article>
                    <span class="coupon"><img src="/mobile/images/information/discount/coupon_img01.png" alt="할인쿠폰" /></span>
                    <span class="coupon_bottom_bg"></span>
                    <dl>
                        <dt>이름</dt>
                        <dd>안정근</dd>
                        <dt>휴대폰</dt>
                        <dd>010-9383-5241</dd>
                        <dt>생년월일</dt>
                        <dd>1986-04-30</dd>
                        <dt>사용기간</dt>
                        <dd>2016-03-01 ~ 2016-04-30</dd>
                    </dl>
                </article>
                <h4>우대혜택</h4>
                <span class="benefit_img"><img src="/mobile/images/information/MCOU.jpg" alt=""/></span>
                <span class="coupon_down_wrap">
                    <a href="#none" class="coupon_down">쿠폰 발급받기</a>
                </span>
                <h4>이용안내</h4>
                <ul>
                    <li><span class="text">마이페이지 > MY 쿠폰페이지에서 확인 가능</span></li>
                    <li><span class="text">본인에 한해 적용되며, 중복할인 제외</span></li>
                    <li><span class="text">쿠폰과 함께 본인 확인이 가능한 신분증을 매표소에 제출</span></li>
                    <li><span class="text">신분증은 이름과 생년월일이 확인되는 신분증으로 제시 (주민등록증, 의료보험증, 등본, 학생증, 여권, 기타 자격증 등)</span></li>
                    <li><span class="text">쿠폰과 신분증의 생년월일이 다를 경우 할인혜택 적용 불가</span></li>
                </ul>
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
                slidesToScroll: 1,
                initialSlide: 0
            });
        });
    </script>

</body>
</html>