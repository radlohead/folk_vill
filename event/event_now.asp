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
            <h2>행사·공연</h2>
        </div>


<!--#include virtual="/mobile/event/inc/event_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>민속촌NOW</h3>
                <div class="text-box">
                    <span class="text">살아있는 ‘진짜’ 전통을<br/>
                                       경험하는 즐거움</span>
                </div>
            </div>
            <div class="detail-content board-list">
                <table>
                    <caption>한국 민속촌 민속촌NOW 게시판</caption>
                    <colgroup>
                        <col width="35">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td><span class="icon guide_icon"></span></td>
                            <td>
                                <div>
                                    <h4 style="color:#f08200;">2016 조선문화축제 ‘웰컴투조선’</h4>
                                    <span class="date">기간 : 2016.4.9 ~ 6.12</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="icon guide_icon"></span></td>
                            <td>
                                <div>
                                    <h4>한국민속촌 12지신 수호대를 소개합니다</h4>
                                </div>
                            </td>
                        </tr>
                    </tbody>
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
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                initialSlide: 0
            });
        });
    </script>

</body>
</html>