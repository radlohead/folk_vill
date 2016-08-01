<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script language="javascript">
	<!--
	//아이디찾기 폼 유효성 체크
	function goFindId(){

		var form = document.frm1;

		if($.trim($("[name=id_name]").val()) == ""){
		  alert('이름을 입력해 주세요.');
		  $("#id_name").focus();
		  return;
		}

		var handPhoneNo = "";
		if($.trim($("[name=id_mobile1]").val()) == "" || $.trim($("[name=id_mobile2]").val()) == "" || $.trim($("[name=id_mobile3]").val()) == ""){
			alert('휴대폰번호를 입력해 주세요.');
			return;
		} else {
			handPhoneNo = $.trim($("[name=id_mobile1]").val()) + "-" + $.trim($("[name=id_mobile2]").val()) + "-" + $.trim($("[name=id_mobile3]").val());
			var hpNumArr = handPhoneNo.split("-");
			if (!isHpNum(handPhoneNo) || hpNumArr.length < 3) {
				alert("휴대폰번호를 정확히 입력하세요.");
				return;
			}
		}

		var email = "";
		if($.trim($("[name=id_email1]").val()) == "" || $.trim($("[name=id_email2]").val()) == ""){
			alert('메일주소를 입력해 주세요.');
			return;
		} else {
			email = $.trim($("[name=id_email1]").val()) + "@" + $.trim($("[name=id_email2]").val());
			if (!isValid_email(email)) {
				//alert("메일주소를 정확히 입력해 주세요.");
				return;
			}
		}

		form.target = "blank_frame";
		form.submit();
	}

	//패스워드 찾기 폼 유효성 체크
	function goFindPwd(){
		var form = document.frm2;

		if( $.trim($("#pwd_id").val()) == "" ){
			alert("아이디를 입력해 주십시오");
			$("#pwd_id").focus();
			return false;
		}

		if( $.trim($("#pwd_name").val()) == "" ){
			alert("이름을 입력해 주십시오");
			$("#pwd_name").focus();
			return false;
		}

		var handPhoneNo = "";
		if($.trim($("[name=pwd_mobile1]").val()) == "" || $.trim($("[name=pwd_mobile2]").val()) == "" || $.trim($("[name=pwd_mobile3]").val()) == ""){
			alert('휴대폰번호를 입력해 주세요.');
			return;
		} else {
			handPhoneNo = $.trim($("[name=pwd_mobile1]").val()) + "-" + $.trim($("[name=pwd_mobile2]").val()) + "-" + $.trim($("[name=pwd_mobile3]").val());
			var hpNumArr = handPhoneNo.split("-");
			if (!isHpNum(handPhoneNo) || hpNumArr.length < 3) {
				alert("휴대폰번호를 정확히 입력하세요.");
				return;
			}
		}

		var email = "";
		if($.trim($("[name=pwd_email1]").val()) == "" || $.trim($("[name=pwd_email2]").val()) == ""){
			alert('메일주소를 입력해 주세요.');
			return;
		} else {
			email = $.trim($("[name=pwd_email1]").val()) + "@" + $.trim($("[name=pwd_email2]").val());
			if (!isValid_email(email)) {
				//alert("메일주소를 정확히 입력해 주세요.");
				return;
			}
		}

		form.target = "blank_frame";
		form.submit();
	}

	//이메일 도메인 체크
	function changeEmailDomainID(obj,flag) {
		if (flag == "GI") {//아이디 찾기
			var frm = document.frm1;

			if (obj.value == "") {
			  frm.id_email2.readOnly = false;
			  frm.id_email2.value = "직접입력";
			} else {
			  frm.id_email2.readOnly = true;
			  frm.id_email2.value = obj.value;
			}
		} else { //비밀번호 찾기
			var frm = document.frm2;

			if (obj.value == "") {
			  frm.pwd_email2.readOnly = false;
			  frm.pwd_email2.value = "직접입력";
			} else {
			  frm.pwd_email2.readOnly = true;
			  frm.pwd_email2.value = obj.value;
			}
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
					<form action="find_idpw_proc.asp" method="post" name="frm1" id="frm1" class="find_idpw_form">
					<table>
                        <colgroup>
                            <col width="30%" />
                            <col width="70%" />
                        </colgroup>
                    <tr>
					    <input type="hidden" name="flag" value="GI" />
                         <th><label for="name" class="nameLa">이름</label></th>
                         <td><input type="text" id="id_name" class="name" name="id_name" maxlength="30" /></td>
                    </tr>
                    <tr>
                        <th><label for="phone">휴대폰 번호</label></th>
                        <td>
                            <div class="select_box">
                                <div class="phone-select">
                                    <select name="id_mobile1" id="id_mobile1" class="phone_01">
                                        <option value="">선택</option>
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="019">019</option>
                                    </select>
                                </div>
                                <input type="text" id="id_mobile2" class="phone_02" name="id_mobile2" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="txtOnlyNum(event)" maxlength="4" />
                                <input type="text" id="id_mobile3" class="phone_03" name="id_mobile3" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="txtOnlyNum(event)" maxlength="4" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="email_01">이메일</label></th>
                        <td>
                            <div class="email_box">
                                <input type="text" id="id_email1" class="email_01" name="id_email1" />
                                <span class="whelk">@</span>
                                <input type="text" id="id_email2" class="email_02 hidden" name="id_email2" />
                                <div class="email-select">
                                    <select id="id_email3" name="id_email3" class="email_03" onchange="changeEmailDomainID(this,'GI');">
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
                            </div>
                        </td>
                    </tr>
                </table>

                        <a href="javascript:goFindId();" class="btn id_search_btn">아이디 찾기</a>
                    </form>
                </div>
                <!-- #tab2 pw찾기-->
                <div class="tab-content tabMenu2">
                    <p class="text02">가입하신 휴대폰/이메일로 비밀번호를 확인하실 수 있습니다.<br/>
                                    (임시 비밀번호 이메일 전송)
                    </p>
					<form action="find_idpw_proc.asp" method="post" name="frm2" id="frm2" class="find_idpw_form">
					<table>
					    <colgroup>
					        <col width="30%" />
					        <col width="70%" />
					    </colgroup>
					    <tr>
					        <th>
                                <input type="hidden" name="flag" value="GP" />
                                <label for="id">아이디</label>
                            </th>
                            <td><input type="text" name="pwd_id" id="pwd_id" maxlength="14" class="id" /></td>
                        </tr>
                        <tr>
                            <th><label for="name" class="nameLa">이름</label></th>
                            <td><input type="text" name="pwd_name" id="pwd_name" maxlength="30" class="name" /></td>
                        </tr>
                        <tr>
                            <th><label for="phone">휴대폰 번호</label></th>
                            <td>
                                <div class="select_box">
                                    <div class="phone-select">
                                        <select name="pwd_mobile1" id="pwd_mobile1" class="phone_01">
                                            <option value="">선택</option>
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                                        </select>
                                    </div>
                                    <input type="text" name="pwd_mobile2" id="pwd_mobile2" maxlength="4" class="phone_02" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="txtOnlyNum(event)" />
                                    <input type="text" name="pwd_mobile3" id="pwd_mobile3" maxlength="4" class="phone_03" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="txtOnlyNum(event)" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="email_01">이메일</label></th>
                            <td>
                                <div class="email_box">
                                    <input type="text" id="pwd_email1" name="pwd_email1" size="20" class="email_01"  />
                                    <span class="whelk">@</span>
                                    <input type="text" id="pwd_email2" name="pwd_email2" class="email_02 hidden"  />
                                    <div class="email-select">
                                        <select class="email_03" id="pwd_email3" name="pwd_email3" title="이메일 도메인 선택" onchange="changeEmailDomainID(this,'GP');">
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
                                </div>
                            </td>
                        </tr>
                        </table>
                        <a  href="javascript:void(0);" onclick="goFindPwd();" class="btn pw_search_btn">비밀번호 찾기</a>
                    </form>
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
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" title="아이디비밀번호찾기폼아이프레임"></iframe>