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
	<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/common/js/common.js"></script>
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
                <h3>비밀번호 변경</h3>
            </div>
            <div class="content member">
                <form name="frm" id="frm" method="post" class="member_info_form">
                    <label for="now_pw">현재 비밀번호</label>
                    <input type="password" id="password" class="now_pw" name="password" placeholder="현재 사용중인 비밀번호를 입력해주십시오" maxlength="14" />

                    <label for="new_pw">새로운 비밀번호</label>
                    <input type="password" id="password1" class="new_pw" name="password1" placeholder="6~14자의 영문,영문+숫자만 사용합니다" maxlength="14" />

                    <label for="pw_chk">비밀번호 재확인</label>
                    <input type="password" id="password2" class="pw_chk" name="password2" placeholder="비밀번호를 한번 더 입력해주십시오" maxlength="14" />

                    <ul class="caution">
                        <li>
                            <span class="icon">*</span>
                            <span>6~14자의 영문,영문+숫자만 사용하실 수 있습니다.</span>
                        </li>
                        <li>
                            <span class="icon">*</span>
                            <span>생년월일, 전화번호 등 개인정보와 관련된 숫자, 연속된
                                      숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수
                                      있으니 사용을 자제해 주세요.
                            </span>
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
    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 1,
                initialSlide: 4
            });
			
			/*
            $(".member_pwd_btn").on("click", function(){
                var mi_form = document.member_info_form;

                if(mi_form.now_pw.value == false){
                    alert("현재 사용중인 비밀번호를 입력해 주세요");
                }else if(mi_form.new_pw.value.length < 6 || mi_form.new_pw.value.length > 14){
                    alert("비밀번호는 6~14자 이하로 입력해 주세요");
                }else if(mi_form.pw_chk.value == false){
                    alert("비밀번호를 한번 더 입력해 주세요");
                }
                else if(mi_form.new_pw.value != mi_form.pw_chk.value){
                    alert("비밀번호가 일치하지 않습니다.");
                }
            });
			*/
        });
    </script>

</body>
</html>
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" title="비밀번호변경폼아이프레임"></iframe>