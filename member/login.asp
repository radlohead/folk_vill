<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--include virtual="/common/inc/forceSSL.inc"-->
<%
	RtnURL		= Request("RtnURL")
	ev			= Request("event")
	couponSEQ	= Request("couponSEQ")
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
	<script type="text/javascript">
	<!--
	function ChkLogin() {
		var frm = document.frm;

		if ($.trim(frm.id.value) == ""){
			alert ("아이디를 입력해 주세요.");
			frm.id.focus();
			return false;
		}

		if ($.trim(frm.password.value) == ""){
			alert ("비밀번호를 입력해 주세요.");
			frm.password.focus();
			return false;
		}

		// 로그인 정보 저장 체크확인하여 진행
		if(frm.id_save.checked) saveLogin(frm.id.value);
		else saveLogin("");

		frm.target = "blank_frame";
		return true;
		//frm.submit();
	}

	window.onload = function() {
		init();
	}

	function init() {
		//document.frm.id.focus();
		// userid 쿠키에서 id 값을 가져온다.
		var id = getCookie("userid");
		if(id != "") {
			document.frm.password.focus();
		} else {
			//document.frm.id.focus();
		}
		getLogin();
	}
	 
	// 로그인 정보 저장
	function confirmSave(checkbox) {
	  var isRemember;
	 
	  // 로그인 정보 저장한다고 선택할 경우
	  if(checkbox.checked) {
		//isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? \n\nPC방 등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해 주십시오.");document.frm.id.focus();
		isRemember = true;document.frm.id.focus();
	 
		//alert(isRemember);
		
		if(!isRemember)
		  checkbox.checked = false;
	  }
	}
	 
	// 쿠키값 가져오기
	function getCookie(key) {
		var cook = document.cookie + ";";
		var idx =  cook.indexOf(key, 0);
		var val = "";
	 
		if(idx != -1) {
			cook = cook.substring(idx, cook.length);
			begin = cook.indexOf("=", 0) + 1;
			end = cook.indexOf(";", begin);
			val = unescape( cook.substring(begin, end) );
		}
		return val;
	}
	 
	// 쿠키값 설정
	function setCookie(name, value, expiredays) {
		var today = new Date();
		today.setDate( today.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
	}
	 
	// 쿠키에서 로그인 정보 가져오기
	function getLogin() {

		var frm = document.frm;
	 
		// userid 쿠키에서 id 값을 가져온다.
		var id = getCookie("userid");
		// alert(id);
		// 가져온 쿠키값이 있으면
		if(id != "") {
			frm.id.value = id;
			frm.id_save.checked = true;
		}
	}
	 
	// 쿠키에 로그인 정보 저장
	function saveLogin(id) {
		if(id != "") {
			// userid 쿠키에 id 값을 30일간 저장
			setCookie("userid", id, 30);
		}else{
			// userid 쿠키 삭제
			setCookie("userid", id, -1);
		}
	}
	//-->
	</script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap">
	<!-- 상단헤더 -->
	<!--#include virtual="/mobile/common/inc/header.asp" -->

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
			<form class="login" action="login_proc.asp" method="post" name="frm">
			<input type="hidden" name="RtnURL" value="<%=RtnURL%>" />
			<input type="hidden" name="ev" value="<%=ev%>" />
			<input type="hidden" name="couponSEQ" value="<%=couponSEQ%>" />
				<label for="id" class="hidden">아이디</label>
				<input type="text" id="id" class="id" name="id" maxlength="14" OnKeyDown="if (event.keyCode==13) ChkLogin();" placeholder="아이디" />
				<label for="password" class="hidden">비밀번호</label>
				<input type="password" id="password" class="password" name="password" maxlength="14" OnKeyDown="if (event.keyCode==13) ChkLogin();" placeholder="비밀번호" />

				<div class="check_box_wrap">
					<input type="checkbox" id="id_save" class="id_save" name="id_save" onclick="confirmSave(this);" />
					<label for="id_save" class="id_saveLa"></label>
					<span class="text">아이디 저장하기</span>
				</div>

				<label for="login_btn" class="hidden">로그인</label>
				<input type="submit" id="login_btn" class="login_btn" name="login_btn" value="로그인" onclick="return ChkLogin();" />

				<div class="search_box">
					<a href="/mobile/member/find_idpw.asp" class="id_search">아이디 찾기</a>
					<span class="vbar">|</span>
					<a href="/mobile/member/find_idpw.asp#tab2" class="pw_search">비밀번호 찾기</a>
				</div>
			</form>
            </div>
        </div>
    </div>
    <article class="join_box">
        <p class="ex_text"><span class="color_orange">한국민속촌</span>에 <span class="color_orange">가입</span>하시면</br><span class="color_orange">더 많은 혜택</span>을 누리실 수 있습니다.</p>
        <span class="ex_textImg"><img src="/mobile/images/member/login-comment.png" alt=""/></span>
        <a href="/mobile/member/join.asp" class="btn join_btn">한국민속촌 회원가입</a>
    </article>

	<!-- 하단푸터 -->
	<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->

</body>
</html>
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" title="로그인아이프레임"></iframe>