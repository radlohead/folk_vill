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
            <h2>회원가입</h2>
        </div>
    </div>

    <div class="contents">
        <div class="detail-login">
            <div class="detail-head">
                <h3>회원가입</h3>
            </div>
            <h4>약관동의</h4>
            <div class="tab agree-tab">
                <div class="title">
                    <h4>이용약관</h4>
                    <span class="icon on"></span>
                </div>
                <div class="content">
                    <!-- 이용약관 -->
                    <!--#include virtual="/mobile/member/inc/agreement.html" -->
                </div>
            </div>
            <div class="check_box_wrap">
                <input type="checkbox" id="terms_agree" class="terms_agree" name="terms_agree" value="terms_agree" />
                <label for="terms_agree" class="terms_agreeLa"></label>
                <span class="text">이용약관에 동의합니다</span>
            </div>

            <div class="tab agree-tab02">
                <div class="title">
                    <h4>개인정보보호정책</h4>
                    <span class="icon on"></span>
                </div>
                <div class="content">
                    <!-- 개인정보보호정책 -->
                    <!--#include virtual="/mobile/member/inc/ind_infor.html" -->
                </div>
            </div>
            <div class="check_box_wrap">
                <input type="checkbox" id="policy_agree" class="policy_agree" name="policy_agree" value="policy_agree" />
                <label for="policy_agree" class="policy_agreeLa"></label>
                <span class="text">개인정보보호정책에 동의합니다</span>
            </div>

            <div class="agree_box">
                <p class="text">한국민속촌 이용약관 및 개인보호정책에 동의하십니까?</p>
                <a href="#none" class="btn agree_btn">동의합니다</a>
                <a href="#none" class="btn no-agree_btn">동의하지 않습니다</a>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>
<!--#include virtual="/mobile/common/inc/script.html" -->

</body>
</html>