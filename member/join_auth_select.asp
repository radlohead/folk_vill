<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
	Dim gubun : gubun = RP(Request("gubun"))

	If (gubun <> "G" And gubun <> "C" And gubun <> "F") Then		
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
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script type="text/javascript"> 
	<!--
	function ChkMemAuthMobile(gb) {
		var frm = document.frm;

		if(gb == "G") {
			frm.action="join_general_step1.asp";
		} else if(gb == "C") {
			frm.action="join_child_step1.asp";
		} else if(gb == "F") {
			frm.action="join_foreigner_step1.asp";
		}
		frm.submit();
	}

	function ChkMemAuthEmail(gb) {
		var frm = document.frm;

		if(gb == "G") {
			frm.action="join_email_general_step1.asp";
		} else if(gb == "C") {
			frm.action="join_email_child_step1.asp";
		} else if(gb == "F") {
			frm.action="join_email_foreigner_step1.asp";
		}
		frm.submit();
	}
	//-->
	</script>
	<style>
	.signup_join_box .signup_text { 
		font-size:16px; 
		font-weight:bold; 
	}
	</style>
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
		<form id="frm" name="frm" method="post">
		<input type="hidden" name="gubun" value="<%=gubun%>">
        <div class="detail-login">
            <div class="detail-head">
                <h3>회원가입</h3>
            </div>
            <h4>회원가입 인증</h4>
            <p>한국민속촌은 회원님의 정보를 안전하게 보호하기 위해서 본인인증 절차를 시행하고 있습니다.</p>
            <div class="cert_box">
				<a href="javascript:void(0);" class="cert_btn phone_cert_btn" style="text-decoration: none;" onclick="ChkMemAuthMobile('<%=gubun%>'); return false;">
                    <span class="icon phone_icon"></span>
                    <span class="text">휴대폰 인증</span>
                </a>
				<a href="javascript:void(0);" class="cert_btn email_cert_btn" style="text-decoration: none;" onclick="ChkMemAuthEmail('<%=gubun%>'); return false;">
                    <span class="icon email_icon"></span>
                    <span class="text">이메일 인증</span>
                </a>
            </div>
        </div>
		</form>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->

</body>
</html>