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
            <h2>아이디·비밀번호 찾기</h2>
        </div>
    </div>

    <div class="contents">
        <div class="detail-login">
            <div class="detail-head">
                <h3>회원가입</h3>
            </div>
            <div class="head-title">
                <h4>회원정보 입력</h4>
                <span class="text">필수입력</span>
            </div>
            <form action="" method="post" class="join_form">
                <label for="name" class="nameLa">이름</label>
                <input type="text" id="name" class="name" name="name" placeholder="이름" />
                <label for="phone">휴대폰 번호</label>
                <div class="phone_box">
                    <select name="phone_01" class="phone_01">
                        <option value="선택">선택</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="019">019</option>
                    </select>
                    <input type="text" id="phone_02" class="phone_02" name="phone_02" placeholder="휴대폰 번호" />
                </div>
                <div class="email_box">
                    <label for="email_01">이메일</label>
                    <input type="text" id="email_01" class="email_01" name="email_01" placeholder="이메일 아이디" />
                    <input type="text" id="email_02" class="email_02" name="email_02" placeholder="이메일 주소" />
                    <select name="email_03" class="email_03">
                        <option value="직접입력">직접입력</option>
                        <option value="dreanwiz.com">dreanwiz.com</option>
                        <option value="empal.com">empal.com</option>
                        <option value="freechal.com">freechal.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="korea.com">korea.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="paran.com">paran.com</option>
                        <option value="unitel.co.kr">unitel.co.kr</option>
                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                    </select>
                </div>

                <a href="#none" class="btn id_search_btn">아이디 찾기</a>
            </form>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>
<!--#include virtual="/mobile/common/inc/script.html" -->

</body>
</html>