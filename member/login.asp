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
            <h2>로그인</h2>
        </div>
    </div>

    <div class="contents">
        <div class="detail-login">
            <div class="detail-head">
                <h3>LOGIN</h3>
                    <div class="text-box">
                        <span class="text">한국민속촌에 오신 것을 환영합니다.</span>
                    </div>
            </div>
            <div class="detail-content login">
                <form class="login" action="" method="post">
                    <label for="login_id" class="hidden">아이디</label>
                    <input type="text" id="login_id" class="login_id" name="login_id" placeholder="아이디" />
                    <label for="login_pw" class="hidden">비밀번호</label>
                    <input type="text" id="login_pw" class="login_pw" name="login_pw" placeholder="비밀번호" />

                    <div class="check_box_wrap">
                        <input type="checkbox" id="id_save" class="id_save" name="id_save" value="id_save" />
                        <label for="id_save" class="id_saveLa"></label>
                        <span class="text">아이디 저장하기</span>
                    </div>

                    <label for="login_btn" class="hidden">로그인</label>
                    <input type="submit" id="login_btn" class="login_btn" name="login_btn" value="로그인" />

                    <div class="search_box">
                        <a href="/mobile/member/find_idpw.asp" class="id_search">아이디 찾기</a>
                        <a href="/mobile/member/find_idpw.asp#tab2" class="pw_search">비밀번호 찾기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <article class="join_box">
        <p class="ex_text">
            한국민속촌에 가입하시면</br>
            더 많은 혜택을 누리실 수 있습니다.
        </p>
        <a href="/mobile/member/join.asp" class="btn join_btn">한국민속촌 회원가입</a>
    </article>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>
<!--#include virtual="/mobile/common/inc/script.html" -->

</body>
</html>