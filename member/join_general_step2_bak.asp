<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
	Dim gubun : gubun = RP(Request("gubun"))

	If gubun <> "G" Then
		sRtnMsg = "비 정상 접속 시도 입니다. 다시 확인해 주세요."
		CAll f_AlertURL(sRtnMsg, "join.asp")
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
            <h2>회원가입</h2>
        </div>
    </div>

    <div class="contents">
        <div class="detail-login">
            <div class="detail-head">
                <h3>회원가입</h3>
            </div>
            <h4>회원가입 인증</h4>
            <p>한국민속촌은 회원님의 정보를 안전하게 보호하기 위해서 본인인증 절차를 시행하고 있습니다.</p>
            <div class="phone_cert_box">
                <em>
                    휴대폰 본인인증으로 가입절차를<br/>
                    진행하시려면 ‘확인’ 버튼을 클릭해 주세요.
                </em>
                <span class="text">
                    회원님의 정보는 개인정보보호 정책에 의하여<br/>
                    회원님의 동의 없이 공개되거나<br/>
                    제 3자에게 제공되지 않습니다.
                </span>
            </div>
            <span class="cert_btn_box">
                <a href="join_general_step2.asp?gubun=<%=gubun%>" class="btn ok_btn">확인</a>
                <a href="join.asp" class="btn cancel_btn">취소</a>
            </span>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->

</body>
</html>