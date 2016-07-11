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
            <aside>
                <h2>행사·공연
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.asp" -->
            </aside>
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
            <div class="detail-content board_now-view">
                <article>
                    <h4>2016 조선문화축제 ‘웰컴투조선’</h4>
                    <span class="date-wrap">
                        <span class="title">행사기간</span>
                        <span class="date">2016. 4. 9 ~ 6. 12</span>
                    </span>
                    <div class="content">
                        <img src="/mobile/images/event/event_now_img.jpg" alt="2016 조선문화축제 ‘웰컴투조선’" />
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