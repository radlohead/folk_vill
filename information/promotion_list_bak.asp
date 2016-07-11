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
            <h2>할인정보</h2>
            <aside>
                <h2>할인정보
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.asp" -->
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
                        <td colspan="2">
                            <div class="board-list-title"><img src="/mobile/images/information/discount/promotion_list_title_01.jpg" alt="" /></div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="board-list-title"><img src="/mobile/images/information/discount/promotion_list_title_02.jpg" alt="" /></div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="board-list-title"><img src="/mobile/images/information/discount/promotion_list_title_03.jpg" alt="" /></div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="board-list-title"><img src="/mobile/images/information/discount/promotion_list_title_04.jpg" alt="" /></div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="board-list-title"><img src="/mobile/images/information/discount/promotion_list_title_05.jpg" alt="" /></div>
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
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->
    <script>
        $(document).ready(function(){
            $('.single-items').slick({
                slidesToShow: 3,
                initialSlide: 0
            });
        });
    </script>

</body>
</html>