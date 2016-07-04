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
                <h3>개인정보 변경완료</h3>
            </div>
            <div class="content">
                <div class="member_modify">
                    <h4>회원님의 정보가 변경되었습니다.</h4>
                    <p>
                       회원정보는 개인정보취급방침에 따라 안전하게 보호되며,<br/>
                       회원님의 명백한 동의 없이 공개 또는<br/>
                       제 3자에게 제공되지 않습니다.<br/>
                       저희 한국민속촌에서는 고객님의 개인정보 보호에<br/>
                       최선을 다하겠습니다.
                    </p>
                </div>
                <span class="cert_btn_box">
                    <a href="/mobile/index.asp" class="btn ok_btn">메인으로</a>
                    <a href="#none" class="btn cancel_btn">취소</a>
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
                initialSlide: 3
            });
        });
    </script>

</body>
</html>