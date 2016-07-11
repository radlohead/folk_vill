<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim id : id		= RP(Request("id"))

	If id <> "" Then
		ConvId = Right(id,3)
		id = Replace(id,ConvId,"***")
	Else
		sRtnMsg = "비 정상 접속 시도 입니다. 다시 확인해 주세요."
		CAll f_AlertURL(sRtnMsg, "find_idpw.asp")	
	End If 
%>
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
                    <div class="phone_cert_box">
                        <em>
                            회원님의 아이디는<br/>
                            <b><%=id%></b> 입니다.
                        </em>
                    </div>
                    <span class="cert_btn_box">
                        <a href="find_idpw.asp#tab2" class="btn pw_search ok_btn">비밀번호 찾기</a>
                        <a href="/mobile/" class="btn cancel_btn">메인으로</a>
                    </span>
                </div>
                <!-- #tab2 pw찾기-->
                <div class="tab-content tabMenu2">
                    <p class="text02">가입하신 휴대폰/이메일로 비밀번호를 확인하실 수 있습니다.<br/>
                                    (임시 비밀번호 이메일 전송)
                    </p>
                    <div class="phone_cert_box">
                        <span class="text">
                            회원님의 이메일로 임시 비밀번호를 전송하였습니다.
                            <em>로그인 후 마이페이지 > 비밀번호변경</em>에서<br/>수정하시기 바랍니다.
                        </span>
                    </div>
                    <span class="cert_btn_box">
                        <a href="#none" class="btn ok_btn">비밀번호 찾기</a>
                        <a href="#none" class="btn cancel_btn">메인으로</a>
                    </span>
                </div>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->

</body>
</html>