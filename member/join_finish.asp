<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
	Dim gubun : gubun			= RP(Request("gubun"))
	Dim name : name				= RP(Request("name"))
	Dim id : id					= RP(Request("id"))
	Dim mobile1 : mobile1		= RP(Request("mobile1"))
	Dim mobile2 : mobile2		= RP(Request("mobile2"))
	Dim mobile3 : mobile3		= RP(Request("mobile3"))
	Dim email : email			= RP(Request("email"))
	Dim pname : pname			= RP(Request("pname"))
	Dim pmobile1 : pmobile1		= RP(Request("pmobile1"))
	Dim pmobile2 : pmobile2		= RP(Request("pmobile2"))
	Dim pmobile3 : pmobile3		= RP(Request("pmobile3"))
	Dim pk_fuid : pk_fuid		= RP(Request("pk_fuid")) '정상적인 경로로 회원가입 체크 파라메터

	If ((gubun <> "G" And gubun <> "C" And gubun <> "F") Or pk_fuid <> "D1FCDB0A-5C11-43DA-81C7-0FFF0678DE55" Or name = "" Or id = "") Then	
		sRtnMsg = "비 정상 접속 시도 입니다. 다시 확인해 주세요."
		CAll f_AlertURL(sRtnMsg, "/mobile/member/join.asp")
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
            <div class="detail-head join">
                <h3>가입완료</h3>
            </div>
            <p>가입이 정상적으로 완료 되었습니다.</p>
            <dl class="join_finish_info">
			<%If gubun = "C" Then%>
				<dt>이름 : </dt>
				<dd><%=name%></dd>
				<dt>보호자 이름: 
				<dd><%=pname%></dd>
				<dt>아이디 : </dt>
				<dd><%=id%></dd>
				<dt>보호자 휴대폰 : </dt>
				<dd><%=pmobile1%>-<%=pmobile2%>-<%=pmobile3%></dd>
				<dt>이메일 : </dt>
				<dd><%=email%></dd>
			<%Else%>
				<dt>이름 : </dt>
				<dd><%=name%></dd>
				<dt>아이디 : </dt>
				<dd><%=id%></dd>
				<dt>휴대폰 : </dt>
				<dd><%=mobile1%>-<%=mobile2%>-<%=mobile3%></dd>
				<dt>이메일 : </dt>
				<dd><%=email%></dd>			
			<%End If%>
            </dl>
            <a href="#none" class="btn ok_btn">확인</a>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->
<script>
    $(".ok_btn").on("click", function(){
        location.href = "/mobile/index.asp"
    });
</script>
</body>
</html>