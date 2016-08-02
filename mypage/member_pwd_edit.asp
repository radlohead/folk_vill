<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%	
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " location.href='/mobile/member/login.asp?RtnURL=/mobile/mypage/member_pwd_edit.asp';"
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
    <!--#include virtual="/mobile/common/inc/script.asp" -->
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script type="text/javascript">		
	function FormPwdCheck() {
		var form = document.frm;

		if(!HasContent(form.password1.value)) {			
			alert("현재 비밀번호를 입력해 주세요");
			form.password.focus();
			return;
		} else if(!HasContent(form.password1.value)) {
			alert("새로운 비밀번호를 입력해 주세요");
			form.password1.focus();
			return;
		} else if(form.password1.value.length < 6 || Trim(form.password1.value).length > 14) {
			alert("비밀번호는 6~14자이어야 합니다");
			form.password1.focus();
			return;
		} else if(!HasContent(form.password2.value)) {
			alert("비밀번호 확인을 입력해 주세요");
			form.password2.focus();
			return;
		} else if(form.password2.value.length < 6 || Trim(form.password2.value).length > 14) {
			alert("비밀번호 확인은 6~14자이어야 합니다");
			form.password1.focus();
			return;
		} else if(form.password1.value != form.password2.value ) {
			alert("비밀번호와 확인이 일치하지 않습니다.");
			//form.password1.focus();
			return;
		} else if(!isValid_passwd(form.password1.value)) {
			//alert("비밀번호를 바르게 입력해 주세요.");
			form.password1.focus();
			return;
		} else {
			form.target="blank_frame";
			form.action="member_pwd_edit_proc.asp";
			form.submit();
		}
	}
	</script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap member_pwd_edit">
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
                <h3>비밀번호 변경</h3>
            </div>
            <div class="content member">
                <form name="frm" id="frm" method="post" class="member_info_form pw_change_form">
                    <table>
                        <colgroup>
                            <col width="30%" />
                            <col width="70%" />
                        </colgroup>
                        <tr>
                            <th rowspan="2"><label for="now_pw">현재<br/> 비밀번호</label></th>
                            <td class="bdb0 pdb0"><input type="password" id="password" class="now_pw" name="password" maxlength="14" /></td>
                        </tr>
                        <tr>
                            <td class="pdt0"><span class="text">현재 사용중인 비밀번호를 입력해주십시오</span></td>
                        </tr>
                        <tr>
                            <th rowspan="2"><label for="new_pw">새로운<br/> 비밀번호</label></th>
                            <td class="bdb0 pdb0"><input type="password" id="password1" class="new_pw" name="password1" maxlength="14" /></td>
                        </tr>
                        <tr>
                            <td class="pdt0"><span class="text">6~14자의 영문,영문+숫자만 사용합니다</span></td>
                        </tr>
                        <tr>
                            <th rowspan="2"><label for="pw_chk">비밀번호<br/> 재확인</label></th>
                            <td class="bdb0 pdb0"><input type="password" id="password2" class="pw_chk" name="password2" maxlength="14" /></td>
                        </tr>
                        <tr>
                            <td class="pdt0"><span class="text">비밀번호를 한번 더 입력해주십시오</span></td>
                        </tr>
                    </table>

                    <ul class="caution">
                        <li>
                            <p>
                                <span>생년월일, 전화번호 등 개인정보와 관련된 숫자, 연속된
                                          숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수
                                          있으니 사용을 자제해 주세요.
                                </span>
                            </p>
                        </li>
                    </ul>

                    <span class="cert_btn_box">
                        <a href="javascript:FormPwdCheck()" class="btn member_pwd_btn ok_btn">확인</a>
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

</body>
</html>
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" title="비밀번호변경폼아이프레임"></iframe>