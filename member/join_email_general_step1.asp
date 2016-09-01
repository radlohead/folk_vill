<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
	Dim gubun : gubun = RP(Request("gubun"))

	If (gubun <> "G" And gubun <> "C" And gubun <> "F") Then
		sRtnMsg = "비 정상 접속 시도 입니다. 다시 확인해 주세요."
		CAll f_AlertURL(sRtnMsg, "http://www.koreanfolk.co.kr/mobile/member/join.asp")
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
	<script type="text/javascript" src="/common/js/common.js"></script>
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script type="text/javascript"> 
	<!--
	//alert('<%=gubun%>');
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

		var email = "";
		if($.trim($("[name=email1]").val()) == "" || $.trim($("[name=email2]").val()) == ""){
			alert('메일주소를 입력해 주세요.');
			return;
		} else {
			email = $.trim($("[name=email1]").val()) + "@" + $.trim($("[name=email2]").val());
			if (!isValid_email(email)) {
				//alert("메일주소를 정확히 입력해 주세요.");
				return;
			}
		}

		var birthDay = $("#birthyear").val()+$("#birthmonth").val()+$("#birthday").val();

		if (isBelow14(birthDay)) {
		  if (confirm("고객님은 만 14세 미만이므로 회원가입 시 보호자의 동의가 필요합니다.\n[확인]버튼을 누르시면, 만 14세미만회원가입 페이지로 이동합니다.")) {
			document.location.replace("/mobile/member/join_child_email_step1.asp?gubun=C");
		  }
		} else {
			var frm = document.myFrm;

			frm.target="blank_frame";
			frm.action="https://www.koreanfolk.co.kr/mobile/member/join_Email_DupAllCheck.asp";
			frm.submit();
		}
	}

	//[11] 만 14세 이하 체크 스크립트
	function isBelow14( scn1 ) {
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

	//이메일 도메인 체크
	function changeEmailDomainID(obj) {	
		var frm = document.myFrm;

		if (obj.value == "") {
		  frm.email2.readOnly = false;
		  frm.email2.value = "직접입력";
		} else {
		  frm.email2.readOnly = true;
		  frm.email2.value = obj.value;
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
            <h2>이메일 인증 폼</h2>
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
			<table>
			    <colgroup>
			        <col width="30%" />
			        <col width="70%" />
			    </colgroup>
			    <tr>
                    <th>
                        <input type="hidden" name="gubun" value="<%=gubun%>">
                        <!--<form name="join_form" action="" method="post" class="join_form step2">-->
                        <label for="name" class="nameLa">이름</label>
                    </th>
                    <td>
                        <!--<input type="text" id="name" class="name" name="name" placeholder="이름" />-->
                        <input type="text" id="authName" name="authName" title="이름" style="ime-mode:active" />
                    </td>
				</tr>
                <tr>
                <th>
                    <label for="birth_date_01">생년월일</label>
                </th>
                    <td>
                        <div class="select_box birth_date_box">
                            <div class="select" style="width:29.3%;">

                            <select name="birthyear" id="birthyear" title="년도 선택" onchange="javascript:setBirthDay('myFrm');">
                                <option value=''>년도</option>
                                <%
                                toyears = year(date)

                                For j = (toyears - 14) To 1900 Step - 1
                                %>
                                <option value="<%=j%>"><%=j%>년</option>
                                <%Next%>
                            </select>
                            <!--
                            <select name="birth_date_01" class="birth_date_01">
                            <option value="">년도</option>
                            </select>-->
                            </div>
                            <div class="select">
                            <select name="birthmonth" id="birthmonth" title="월 선택" onchange="javascript:setBirthDay('myFrm');" class="birth_date_02">
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
                            <!--
                            <select name="birth_date_02" class="birth_date_02">
                            <option value="">월</option>
                            </select>
                            -->
                            </div>
                            <div class="select" style="float:right;">
                            <select name="birthday" id="birthday" title="일 선택" class="birth_date_03">
                                <option value=''>일</option>
                            </select>
                            <!--
                            <select name="birth_date_03" class="birth_date_03">
                            <option value="">일</option>
                            </select>
                            -->
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>
                        <label for="email_01">이메일</label>
                    </th>
                    <td>
                        <div class="email_box">
                            <input type="text" id="email1" name="email1" style="ime-mode:disabled" class="email_01" />
                            <span class="whelk">@</span>
                            <input type="text" id="email2" name="email2" style="ime-mode:disabled" class="email_02 hidden" />
                            <!--
                            <input type="text" id="email_01" class="email_01" name="email_01" placeholder="이메일 아이디" />
                            <input type="text" id="email_02" class="email_02" name="email_02" placeholder="이메일 주소" />
                            -->
                            <div class="select">
                                <select id="email3" name="email3" title="이메일 도메인 선택" onchange="changeEmailDomainID(this);" class="email_03">
                                    <option value="직접입력">직접입력</option>
                                    <option value="dreanwiz.com">dreanwiz.com</option>
                                    <option value="empal.com">empal.com</option>
                                    <option value="freechal.com">freechal.com</option>                          
                                    <option value="korea.com">korea.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="daum.net">daum.net</option>
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
                <span class="cert_btn_box">
					<a href="javascript:FormGeneralCheck();" class="btn join_email_general_step1 ok_btn">확인</a>
					<a href="join.asp" class="btn cancel_btn">취소</a>
                    <!--
					<a href="#none" class="btn join_email_general_step1 ok_btn">확인</a>
                    <a href="#none" class="btn cancel_btn">취소</a>
					-->
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

<script>
/*
    $(".join_email_general_step1.ok_btn").on("click", function(){
        var form = document.join_form;
        if(form.name.value == false){
            alert("이름을 입력해 주세요");
        }else if(form.birth_date_01.value == false){
            alert("년도를 선택해 주세요");
        }else if(form.birth_date_02.value == false){
            alert("월을 선택해 주세요");
        }else if(form.birth_date_03.value == false){
            alert("일을 선택해 주세요");
        }else if(form.email_01.value == false){
            alert("이메일 아이디를 입력해 주세요");
        }else if(form.email_02.value == false){
            alert("이메일 주소를 입력해 주세요");
        }
    });
*/
</script>
</body>
</html>
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" style="border:0px solid #000;" title="이메일인증일반회원가입아이프레임"></iframe>