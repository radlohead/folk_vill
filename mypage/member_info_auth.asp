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
                <h3>개인정보 변경</h3>
                <span class="text">회원님의 소중한 정보보호를 위해 비밀번호를<br/>
                                   입력해주시기 바랍니다.
                </span>
            </div>
            <div class="content member">
                <form action="" method="post" class="member_info_form">
                    <label for="pw">비밀번호</label>
                    <input type="text" id="pw" class="pw" name="pw" placeholder="비밀번호를 입력해주세요" />
                    <span class="cert_btn_box">
                        <a href="#none" class="btn ok_btn">확인</a>
                        <a href="#none" class="btn cancel_btn">취소</a>
                    </span>
                </form>
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
                initialSlide: 3
            });
        });
    </script>

</body>
</html>