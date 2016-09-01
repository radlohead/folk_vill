<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
	Dim gubun : gubun = RP(Request("gubun"))

	If gubun <> "F" Then
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
    <title>한국민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
	<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script type="text/javascript"> 
	<!--
	function FormGeneralCheck() {	
		var v_normal = /[^가-힝]/g; //본래는 '히+ㅎ'까지 체크해야 하나 euc-kr은 '힝'까지만 가능

		if($.trim($("[name=authName]").val())==""){
		  alert('이름을 입력해 주세요.');
		  $("#authName").focus();
		  return;
		} else if (v_normal.test($.trim($("[name=authName]").val()))) {
		  alert("이름은 한글만 사용 가능합니다.");
		  return;
		}

		if ($("#birthyear").val() == "" || $("#birthmonth").val() == "" || $("#birthday").val() == "") {
			alert("생년월일을 선택해 주세요.");
			return;
		}
	 
		if ($("#mobile1").val() == "") {
			alert("휴대폰 첫번째 번호를 선택해 주세요.");
			$("#mobile1").focus();
			return;
		}

		if ($("#mobile2").val() == "") {
			//alert("휴대폰 가운데 번호를 입력해 주세요.");
			alert("휴대폰 번호를 입력해 주세요.");
			$("#mobile2").focus();
			return;
		}

		/*
		if ($("#mobile3").val() == "") {
			alert("휴대폰 마지막 번호를 입력해 주세요.");
			$("#mobile3").focus();
			return;
		}
		*/

		var birthDay = $("#birthyear").val()+$("#birthmonth").val()+$("#birthday").val();

		if (isBelow14(birthDay)) {
		  if (confirm("고객님은 만 14세 미만이므로 회원가입 시 보호자의 동의가 필요합니다.\n[확인]버튼을 누르시면, 만 14세미만회원가입 페이지로 이동합니다.")) {
			document.location.replace("join_child_step1.asp?gubun=C");
		  }
		} else {
			var frm = document.myFrm;

			frm.target="blank_frame";
			frm.action="https://www.koreanfolk.co.kr/mobile/member/join_DupForeignerCheck.asp";
			frm.submit();
		}
	}

	//[11] 만 14세 이하 체크 스크립트
	function isBelow14( scn1 )
	{
		 today = new Date();
		 ThisYear = today.getFullYear();
		 ThisMonth = today.getMonth()+1;
		 ThisDay = today.getDate();

		 UserBirthYear = parseInt( scn1.substring( 0, 4 ), 10 );
		 userBirthMonth = parseInt( scn1.substring( 4, 6 ), 10 );
		 userBirthDay = parseInt( scn1.substring( 6, 8 ), 10 );
		 
		 yearDiff = ThisYear - UserBirthYear;
		 monthDiff = ThisMonth - userBirthMonth;
		 dayDiff = ThisDay - userBirthDay;

		 if ( yearDiff == 14 ) // 년도 차이가 13이면
		 {
			  if ( monthDiff < 0 ) // 만 14세 이하!~
				   return true;
			  else if ( monthDiff == 0 )
				   if ( dayDiff < 0 ) // 만 14세 이하!~
						return true;
			  else
				   return false;
		 }
		 else if ( yearDiff < 14)
		 {
			  return true;
		 }
		 else
		 {
			  return false;
		 }
	} 
		 
	function setBirthDay(fm) {
		var form = document.getElementById(fm);
		var oldMaxDay = form.birthday.length;
		
		if (form.birthyear.value == "" || form.birthmonth.value == "") {
			for (var i = oldMaxDay; i >= 1; i--) {
				form.birthday.options[i] = null;
			}
		} else {
			var newMaxDay = new Date(new Date(form.birthyear.value, form.birthmonth.value, 1) - 24 * 60 * 60 * 1000).getDate();
			if (oldMaxDay - 1 - newMaxDay > 0) {
				for (var i = oldMaxDay; i > newMaxDay; i--) {
					form.birthday.options[i] = null;
				}
			} else if (oldMaxDay - 1 - newMaxDay < 0) {
				for (var i = oldMaxDay; i <= newMaxDay; i++) {
					var objOption = document.createElement("option");

					var val = "";
					if (i < 10) {
					  val = "0"+i;
					} else {
					  val = i;
					}

					objOption.text = i + "일";
					objOption.value = val;
					
					form.birthday.options.add(objOption);
				}
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
            <div class="detail-head">
                <h3>회원가입</h3>
            </div>
            <div class="head-title">
                <h4>회원가입 인증</h4>
                <span class="text02">
                    한국민속촌은 회원님의 정보를 안전하게 보호하기 위해서<br/>
                    본인인증 절차를 시행하고 있습니다.
                </span>
            </div>
			<form id="myFrm" name="myFrm" method="post" class="join_form step2">
			<input type="hidden" name="gubun" value="<%=gubun%>">
			<table>
                <colgroup>
                    <col width="30%" />
                    <col width="70%" />
                </colgroup>
                <tr>
                    <th><label for="name" class="nameLa">이름</label></th>
                    <td><input type="text" id="authName" name="authName" class="name" placeholder="이름" /></td>
                </tr>
                <tr>
                    <th><label for="birth_date_01">생년월일</label></th>
                    <td>
                        <div class="select_box birth_date_box">
                            <div class="select">
                                <select name="birthyear" id="birthyear" class="birth_date_01" onchange="javascript:setBirthDay('myFrm');">
                                    <option value="">년도</option>
                                    <%
                                        toyears = year(date)

                                        For j = (toyears - 14) To 1900 Step - 1
                                    %>
                                    <option value="<%=j%>"><%=j%>년</option>
                                    <%Next%>
                                </select>
                            </div>
                            <div class="select">
                                <select name="birthmonth" id="birthmonth" class="birth_date_02" onchange="javascript:setBirthDay('myFrm');">
                                    <option value="">월</option>
                                    <%
                                        For j = 1 To 12
                                            If Len(j) < 2 Then
                                                j = "0" & j
                                            End If
                                    %>
                                    <option value="<%=j%>"><%=CInt(j)%>월</option>
                                    <%Next%>
                                </select>
                            </div>
                            <div class="select">
                                <select name="birthday" id="birthday" class="birth_date_03">
                                    <option value="">일</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th><label for="phone">휴대폰 번호</label></th>
                    <td>
                        <div class="select_box">
                            <div class="phone-select">
                                <select name="mobile1" id="mobile1" class="phone_01">
                                    <option value="선택">선택</option>
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                            </div>
                            <input type="text" name="mobile2" id="mobile2" maxlength="8" class="phone_02" placeholder="휴대폰 번호" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="txtOnlyNum(event)" />
                        </div>
                    </td>
                </tr>
            </table>
                <span class="cert_btn_box">
                    <a href="javascript:FormGeneralCheck();" class="btn ok_btn">확인</a>
                    <a href="join.asp" class="btn cancel_btn">취소</a>
                </span>
            </form>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!-- 아이디중복확인 팝업-->
<!--#include virtual="/mobile/member/inc/id_duplicate_chk.asp" -->

<!-- 우편번호 찾기 팝업-->
<!--#include virtual="/mobile/member/inc/post_search.asp" -->

<!--#include virtual="/mobile/common/inc/script.asp" -->

</body>
</html>
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" title="일반회원가입인증아이프레임"></iframe>