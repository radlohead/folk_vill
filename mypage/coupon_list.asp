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
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

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
            <div class="content">
                <table>
                    <caption>My 쿠폰 리스트</caption>
                    <colgroup>
                        <col style="width:22.4%">
                        <col style="width:60.1%">
                        <col style="width:17.3% ">
                    </colgroup>
                    <tr>
                        <td colspan="2">
                            <div class="board-list-title"><img src="/mobile/images/information/discount/coupon_list_title_01.jpg" alt="" /></div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
                </table>
                <a href="#none" class="more_btn">
                    <span class="text_icon_box">
                        <span class="text">더보기</span>
                        <span class="icon_img"><img src="/mobile/images/common/plus_icon.png" alt="" /></span>
                    </span>
                </a>
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
                initialSlide: 2
            });
        });
    </script>

</body>
</html>