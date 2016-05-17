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
                <h2>할인정보
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->
            </aside>
        </div>

        <div class="slider single-items">
            <a href="/mobile/information/promotion_list.asp">할인프로모션</a>
            <a href="/mobile/information/credit_card.asp">제휴카드할인</a>
            <a href="/mobile/information/coupon_list.asp">쿠폰할인</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-discount">
            <div class="detail-head">
                <h3>쿠폰할인</h3>
                <span class="text">한국민속촌 온라인 회원에게 드리는 특별한 혜택!</span>
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
                        <td><span class="icon icon_discount_max33"></span></td>
                        <td>
                            <div>
                                <span class="text">홈페이지 신규회원을 위한</span>
                                <h4>봄 시즌 자유이용권 할인</h4>
                            </div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
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
            $('.single-items').slick({
                slidesToShow: 3,
                initialSlide: 2
            });
        });
    </script>

</body>
</html>