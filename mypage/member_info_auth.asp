<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%	
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " location.href='/mobile/member/login.asp?RtnURL=/mobile/mypage/member_info_auth.asp';"
		Response.write "</script>"
		Response.End
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
	<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/common/js/common.js"></script>
	<script type="text/javascript" src="/common/js/Validate.js"></script>
<script type="text/javascript">		
function FormPwdCheck() {
	var form = document.frm;
		
	if($.trim($("[name=password]").val())==""){
		alert('비밀번호를 입력해 주세요.');
		$("#password").val("");
		$("#password").focus(); 
		return;
	}			

	form.target="blank_frame";
	form.action="/mobile/mypage/member_info_auth_proc.asp";
	form.submit();
}
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
            <h2>마이페이지</h2>
        </div>
		<!--#include virtual="/mobile/mypage/inc/mypage_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-mypage">
            <div class="detail-head">
                <h3>개인정보 변경</h3>
                <span class="text">회원님의 소중한 정보보호를 위해 비밀번호를<br/>입력해주시기 바랍니다.</span>
            </div>
            <div class="content member">
			<form method="post" name="frm" name="frm" class="member_info_form">
			    <table>
			        <colgroup>
			            <col width="30%" />
			            <col width="70%" />
			        </colgroup>
                    <tr>
                        <th><label for="pw">비밀번호</label></th>
                        <td>
                            <input type="password" name="password" id="password" maxlength="14" class="pw"  onkeydown="if(event.keyCode==13) javascript:FormPwdCheck();" />
                       </td>
                    </tr>
				</table>
                            <span class="cert_btn_box">
                                <a href="javascript:FormPwdCheck();" class="btn member_info_btn ok_btn">확인</a>
                                <a href="http://www.koreanfolk.co.kr/mobile/" class="btn cancel_btn">취소</a>
                            </span>
			</form>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->
    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 1,
                initialSlide: 3
            });
			
			/*
            $(".member_info_btn").on("click", function(){
                var mi_form = document.member_info_form;

                if(mi_form.pw.value == false){
                    alert("비밀번호를 선택해 주세요");
                }else if(mi_form.pw.value.length < 6 || mi_form.pw.value.length > 14){
                    alert("비밀번호는 6~14자 이하로 입력해 주세요");
                }
            });
			*/
        });
    </script>

</body>
</html>
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" title="개이정보변경인증폼아이프레임"></iframe>