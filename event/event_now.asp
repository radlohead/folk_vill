<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
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

<div class="slider multiple-items">
    <a href="/mobile/event/event_now.asp">민속촌NOW</a>
    <a href="index.asp?02" class="menu2">농악놀이</a>
    <a href="index.asp?03" class="menu3">국악비보이</a>
    <a href="index.asp?04" class="menu4">마상무예</a>
    <a href="index.asp?05" class="menu5">전통혼례</a>
    <a href="index.asp?06" class="menu6">조선캐릭터</a>
</div>
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

</body>
</html>