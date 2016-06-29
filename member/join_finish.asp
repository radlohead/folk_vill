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
            <h2>회원가입</h2>
        </div>
    </div>

    <div class="contents">
        <div class="detail-login">
            <div class="detail-head join">
                <h3>가입완료</h3>
            </div>
            <p>가입이 정상적으로 완료 되었습니다.</p>
            <dl class="join_finish_info">
                <dt>이 름  :</dt>
                <dd>지예은</dd>
                <!--<dt>보호자 이름  :</dt>-->
                <!--<dd>지병민</dd>-->
                <dt>아이디  :</dt>
                <dd>zergle83</dd>
                <!--<dt>보호자 휴대폰  :</dt>-->
                <!--<dd>010-2369-1234</dd>-->
                <dt>휴대폰  :</dt>
                <dd>010-2369-1234</dd>
                <dt>이메일  :</dt>
                <dd>yeeun2013@nate.com</dd>
            </dl>
            <a href="#none" class="btn ok_btn">확인</a>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>
<!--#include virtual="/mobile/common/inc/script.html" -->
<script>
    $(".ok_btn").on("click", function(){
        location.href = "/mobile/index.asp"
    });
</script>
</body>
</html>