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
                <h3>칭찬/신고/제안</h3>
                <span class="text">고객님의 1:1 상담문의 내역을 확인하실 수 있습니다.</span>
            </div>
            <div class="content qna-view">
                <article>
                    <h4>직원 분 칭찬합니다</h4>
                    <span class="date-wrap">
                        <span class="writer">작성자</span>
                        <span class="name">지병민</span>
                        <span class="title">작성일</span>
                        <span class="date">2016. 08. 08</span>
                    </span>
                    <div class="question-comment">
                       직원 분 칭찬합니다.<br/>
                       너무 친절해서요. 이런 거 잘 안하는데 너무 친절해서<br/>
                       글 남깁니다.
                    </div>
                    <p class="answer_date">
                        <span class="text">답변일</span>
                        <span class="date">2016. 08. 08</span>
                    </p>

                    <div class="answer-comment preparing">
                       <span class="text">답변 준비중입니다</span>
                    </div>

                    <!--<div class="answer-comment">-->
                       <!--네 감사합니다.-->
                    <!--</div>-->
                </article>
                 <span class="btns">
                     <a href="#none" class="btn prev-btn">이전 글 보기</a>
                     <a href="#none" class="btn next-btn">다음 글 보기</a>
                     <span class="rg_btn">
                         <a href="#none" class="btn del-btn">삭제</a>
                         <a href="#none" class="btn list-btn">목록</a>
                     </span>
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
                slidesToShow: 4,
                slidesToScroll: 1,
                initialSlide: 0
            });
        });
    </script>

</body>
</html>