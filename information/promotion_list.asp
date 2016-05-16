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
            <div class="detail-content promotion-list">
                <table>
                    <caption>할인프로모션 리스트</caption>
                    <colgroup>
                        <col style="width:22.4%">
                        <col style="width:60.1%">
                        <col style="width:17.3% ">
                    </colgroup>
                    <tr>
                        <td><span class="icon icon_discount_33"></span></td>
                        <td>
                            <div>
                                <span class="text">낭만을 잊은 그대를 위한</span>
                                <h4>대학(원)생 특별할인</h4>
                            </div>
                        </td>
                        <td>
                            <span class="icon icon_more"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="icon icon_discount_max33"></span></td>
                        <td>
                            <div>
                                <span class="text">해피포인트 제휴 기념</span>
                                <h4>해피포인트 APP 할인</h4>
                            </div>
                        </td>
                        <td>
                            <span class="icon icon_more"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="icon icon_discount_max50"></span></td>
                        <td>
                            <div>
                                <span class="text">한복 입는 문화 만들기</span>
                                <h4>한복착용고객 할인</h4>
                            </div>
                        </td>
                        <td>
                            <span class="icon icon_more"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="icon icon_discount_max50"></span></td>
                        <td>
                            <div>
                                <span class="text">수원삼성 블루윙즈 제휴</span>
                                <h4>블루윙즈 제휴할인</h4>
                            </div>
                        </td>
                        <td>
                            <span class="icon icon_more"></span>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="icon icon_discount_about26"></span></td>
                        <td>
                            <div>
                                <span class="text">경기도 주요 관광지 제휴</span>
                                <h4>공동 통합티켓 할인</h4>
                            </div>
                        </td>
                        <td>
                            <span class="icon icon_more"></span>
                        </td>
                    </tr>
                </table>
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