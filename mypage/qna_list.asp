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
            <h2>이용안내</h2>
        </div>

<!--#include virtual="/mobile/mypage/inc/mypage_topmenu.html" -->
    </div>

    <div class="contents">
        <div class="detail-mypage">
            <div class="detail-head">
                <h3>1:1 상담문의</h3>
                <span class="text">고객님의 1:1 상담문의 내역을 확인하실 수 있습니다.</span>
            </div>
            <div class="content">
                <table>
                    <caption>1:1 상담문의 리스트</caption>
                    <colgroup>
                        <col style="width:82.5%">
                        <col style="width:17.5% ">
                    </colgroup>
                    <tr>
                        <td>
                            <div class="board-list-title">
                                <h4>직원분 칭찬합니다</h4>
                                <div class="text_icon_box">
                                    <span class="text_date">2016. 08. 08</span>
                                    <span class="icon prepare"></span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="board-list-title">
                                <h4>장터 이용 시 줄을 어떻게 서야</h4>
                                <div class="text_icon_box">
                                    <span class="text_date">2016. 08. 08</span>
                                    <span class="icon complete"></span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="board-list-title">
                                <h4>장터 이용 시 줄을 어떻게 서야</h4>
                                <div class="text_icon_box">
                                    <span class="text_date">2016. 08. 08</span>
                                    <span class="icon complete"></span>
                                </div>
                            </div>
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
                <a href="#none" class="btn inquiry_btn">1:1상담문의</a>
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