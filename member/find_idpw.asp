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
            <h2>아이디·비밀번호 찾기</h2>
        </div>
    </div>

    <div class="contents">
        <div class="detail-login">
            <!-- 2단탭배너 -->
            <div class="idpw-tab">
                <ul class="tabMenu">
                    <li class="menu1 on" rel="tabMenu1">
                    <!--id찾기-->
                        <h3><a href="#tab1"></a></h3>
                    </li>
                    <li class="menu2" rel="tabMenu2">
                    <!--pw찾기-->
                        <h3><a href="#tab2"></a></h3>
                    </li>
                </ul>
                <!-- #tab1 id찾기-->
                <div class="tab-content tabMenu1">
                    <p class="text">가입하신 이메일/휴대폰으로 아이디를 확인하실 수 있습니다.</p>
                    <form name="id_search_form" action="" method="post">
                        <label for="name" class="nameLa">이름</label>
                        <input type="text" id="name" class="name" name="name" placeholder="이름" />
                        <label for="phone">휴대폰 번호</label>
                        <div class="phone_box">
                            <select name="phone_01" class="phone_01">
                                <option value="">선택</option>
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
                                <option value="">직접입력</option>
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
                <!-- #tab2 pw찾기-->
                <div class="tab-content tabMenu2">
                    <p class="text02">가입하신 휴대폰/이메일로 비밀번호를 확인하실 수 있습니다.<br/>
                                    (임시 비밀번호 이메일 전송)
                    </p>
                    <form name="pw_search_form" action="" method="post">
                        <label for="id">아이디</label>
                        <input type="text" id="id" class="id" name="id" placeholder="아이디" />
                        <label for="name" class="nameLa">이름</label>
                        <input type="text" id="name" class="name" name="name" placeholder="이름" />
                        <label for="phone">휴대폰 번호</label>
                        <div class="phone_box">
                            <select name="phone_01" class="phone_01">
                                <option value="">선택</option>
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
                                <option value="">직접입력</option>
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

                        <a href="#none" class="btn pw_search_btn">비밀번호 찾기</a>
                    </form>
                </div>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>
<!--#include virtual="/mobile/common/inc/script.html" -->

<script>
    //아이디 찾기
    $(".id_search_btn").on("click", function(){
        var is_form = document.id_search_form;

        if(is_form.name.value == false){
            alert("이름을 입력해 주세요");
        }
        else if(is_form.phone_01.value == false){
            alert("휴대폰번호 앞자리를 선택해 주세요");
        }
        else if(is_form.phone_02.value == false){
            alert("나머지 휴대폰번호를 선택해 주세요");
        }
        else if(is_form.email_01.value == false){
            alert("이메일 아이디를 입력해 주세요");
        }else if(is_form.email_02.value == false){
            alert("이메일 주소를 입력해 주세요");
        }
    });

    //비밀번호 찾기
    $(".pw_search_btn").on("click", function(){
        var ps_form = document.pw_search_form;

        if(ps_form.id.value.length < 6 || ps_form.id.value.length > 14){
            alert("아이디는 6~14자 이하로 입력해 주세요");
        }
        else if(ps_form.name.value == false){
            alert("이름을 입력해 주세요");
        }
        else if(ps_form.phone_01.value == false){
            alert("휴대폰번호 앞자리를 선택해 주세요");
        }
        else if(ps_form.phone_02.value == false){
            alert("나머지 휴대폰번호를 선택해 주세요");
        }
        else if(ps_form.email_01.value == false){
            alert("이메일 아이디를 입력해 주세요");
        }else if(ps_form.email_02.value == false){
            alert("이메일 주소를 입력해 주세요");
        }
    });
</script>

</body>
</html>