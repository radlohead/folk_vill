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
            <h2>고객의 말씀</h2>
        </div>

        <div class="slider single-items">
            <a href="/mobile/customer/faq.asp">자주묻는 질문</a>
            <a href="/mobile/customer/qna_form.asp">1:1 상담문의</a>
            <a href="/mobile/customer/voice_form.asp">칭찬/신고/제안</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-customer">
            <div class="detail-head">
                <h3>1:1 상담문의</h3>
                <span class="text">게시글은 비공개 형식으로 작성되며, 담당자의 답변은 평균 2일 ~ 3일 소요됩니다.</span>
            </div>
            <div class="content customer">
                <form class="write-page">
                    <div class="title_box">
                        <label for="title">제목</label>
                        <input type="text" name="title" id="title" class="title" />
                    </div>
                    <textarea name="content" placeholder="내용"></textarea>
                </form>
                <span class="cert_btn_box">
                    <a href="#none" class="btn ok_btn">등록하기</a>
                    <a href="#none" class="btn cancel_btn">취소하기</a>
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
            $('.single-items').slick({
                slidesToShow: 3,
                initialSlide: 1
            });
        });
    </script>

</body>
</html>