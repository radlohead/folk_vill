<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
DIM sSiteCode, sSitePw, sResponseData, sCPRequest, action_flag, gubun
Dim email1, email2, email3, birthyear, birthmonth, birthday, gender
DIM IPIN_DLL, clsIPINDll
DIM iRtn, sRtnMsg
DIM sVNumber, sName, sDupInfo, sAgeCode, sGenderCode, sBirthDate, sNationalInfo, sCPRequestNum

action_flag		=  Nvl(RP(Trim(Request("param_r1"))), "")
gubun			=  Nvl(RP(Trim(Request("gubun"))), "")

If action_flag = "email" Then

	sName		= Nvl(Trim(Request("name")), "")
	birthyear	= Nvl(Trim(Request("birthyear")), "")
	birthmonth	= Nvl(Trim(Request("birthmonth")), "")
	birthday	= Nvl(Trim(Request("birthday")), "")
	email1		= Nvl(Trim(Request("email1")), "")
	email2		= Nvl(Trim(Request("email2")), "")
	email3		= Nvl(Trim(Request("email3")), "")

'	Response.write sName & "<br>"
'	Response.write birthyear & "<br>"
'	Response.write birthmonth & "<br>"
'	Response.write birthday & "<br>"
'	Response.write email1 & "<br>"
'	Response.write email2 & "<br>"
'	Response.write email3 & "<br>"
'=================================================================
Else
	sRtnMsg = "비정상 접속 시도 입니다. 다시 확인해 주세요."
	CAll f_AlertURL(sRtnMsg, "/mobile/member/join.asp")
End If
'=================================================================
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script type="text/javascript" src="/mobile/common/js/FormValidateCheck.js"></script>
	<script>
	$(document).ready(function() {
		$("#btnPopDaumPostcode").click(function() {
			jsPopDaumPostcode();
		});
	});
	</script>
	<!-- 다음 주소 검색 삽입부분 신규 버전-->
	<!-- http일 경우 사용 start -->
<!--<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>-->
<!-- http일 경우 사용 end -->
<!-- https일 경우 사용 start -->
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
	<!-- https일 경우 사용 end -->
	<script language="javascript">
	<!--
	function jsPopDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				var addr = data.address.replace(/(\s|^)\(.+\)$|\S+~\S+/g, '');

				/* 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. */
				$("#zipcode1").val(data.postcode1);
				$("#zipcode2").val(data.postcode2);
				//$("#txtPartAddr1").val(data.address);
				//새우편번호 5자리
				$("#txtZoneCode").val(data.zonecode);

				//$("#txtPartAddr2").val($("#txtPartAddr1").val().replace(addr, ""));
				$("#address").val(addr);

				$("#address_detail").focus();
				//jsCoordinateAjax("default");
			}
		}).open();
	}
	//-->
	</script>
	<!-- 다음 주소 검색 삽입부분 -->
	<script type="text/javascript">
	<!--
	//생연월일 일 가져오기
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
					/*
					if (objOption.value == "<%=birthday%>") {
						objOption.selected = true;
					}
					*/

					form.birthday.options.add(objOption);
				}
			}
		}
	}

	//이메일 주소 선택 셀렉트 박스
	function chMail(){
		var email = $("#email3").val();
		$("#email2").val(email);
	}

	function mail_Restet(){
		$("#email2").val("");
		$("#email3").val("");	
	}	

	window.onload = function() {
		setBirthDay('frm');
		$("#birthday").val('<%=birthday%>');
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
                <h4>회원정보 입력</h4>
                <span class="text">필수입력</span>
            </div>
            <form id="frm" name="frm" action="join_form_proc.asp" method="post" class="join_form">
			<input type="hidden" id="idDupleChecked" name="idDupleChecked" value="N">
			<input type="hidden" name="auth" value="<%=action_flag%>">
			<input type="hidden" name="ipin_di" value="<%=sDupInfo%>">					
			<input type="hidden" name="gubun" value="<%=gubun%>">
			<input type="hidden" name="name" value="<%=sName%>">
			<table>
			    <colgroup>
			        <col width="30%"/>
			        <col width="70%"/>
			    </colgroup>

			    <tr>
                    <th><label for="name" class="nameLa">이름</label></th>
                <!--<input type="text" id="name" class="name" name="name" placeholder="이름" />-->
				    <td><span class="predata"><%=sName%></span></td>
                </tr>
            	<tr>
                    <th><label for="sex" class="sexLa">성별</label></th>
                    <td>
                        <span class="check_box_wrap">
                            <input type="radio" name="gender" id="gender_type_01" class="solar" value="1" checked>
                            <!--<label for="solar" class="solarLa"></label>-->
                            <span class="text mr25">남</span>
                            <input type="radio" name="gender" id="gender_type_02" class="lunar" value="2">
                            <span class="text">여</span>
                        </span>
                        <!--<input type="text" id="sex" class="sex" name="sex" placeholder="남" />-->
                    </td>
                </tr>
                <tr>
                    <th rowspan="2"><label for="birth_date_01">생년월일</label></th>
                    <td class="bd0">
                        <div class="select_box birth_date_box">
                            <div class="select">
                                <select name="birthyear" id="birthyear" class="birth_date_01" onchange="javascript:setBirthDay('frm');">
                                    <option value=''>년도</option>
                                    <%
                                        For j = 1900 To CInt(year(date))
                                    %>
                                    <option value="<%=j%>"><%=j%>년</option>
                                    <%Next%>
                                </select>
                            </div>
                            <div class="select">
                                <select name="birthmonth" id="birthmonth" class="birth_date_02">
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
                                    <option value=''>일</option>
                                </select>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="check_box_wrap">
                            <input type="radio" name="birth_umyang" id="form_type_01" class="solar" value="1" checked>
                            <!--<label for="solar" class="solarLa"></label>-->
                            <span class="text mr25">양력</span>
                            <input type="radio" name="birth_umyang" id="form_type_02" class="lunar" value="2">
                            <!--<label for="lunar" class="lunarLa"></label>-->
                            <span class="text">음력</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th rowspan="3"><label for="id">아이디</label></th>
                    <td><input type="text" id="id" class="id mt5" name="id" size="20" maxlength="14" /></td>
                </tr>
                <tr>
                    <td class="bd0"><a href="javascript:checkid_mode_m(frm.id.value);" class="btn id_chk_btn" style="background:#766342;">아이디 중복확인</a></td>
                </tr>
                <tr>
                    <td><span class="text ds-block mt5 mb5">6~14자의 영문,영문+숫자만 사용합니다</span></td>
                </tr>
                <tr>
                    <th rowspan="2"><label for="pw">비밀번호</label></th>
                    <td class="bd0"><input type="password" name="password1" id="password1" maxlength="14" class="pw mt5" /></td>
                </tr>
                <tr>
                    <td><span class="text ds-block mt5 mb5">6~14자의 영문,영문+숫자만 사용합니다</span></td>
                </tr>
                <tr>
                    <th rowspan="2"><label for="pw_chk">비밀번호 확인</label></th>
                    <td class="bd0"><input type="password" name="password2" id="password2" maxlength="14" class="pw_chk mt5" /></td>
                </tr>
                <tr>
                    <td><span class="text ds-block mt5 mb5">비밀번호를 한번 더 입력해주십시오</span></td>
                </tr>
                <tr>
                    <th rowspan="3"><label for="add_01">주소</label></th>
                    <td class="bd0">
                        <span class="add_01_box ds-block mt5">
                            <input type="text" name="zipcode1" id="zipcode1" readonly="readonly" class="add_03" style="width:27%;" />
                            <input type="text" name="zipcode2" id="zipcode2" readonly="readonly" class="add_03" style="width:27%;" />
                            <a id="btnPopDaumPostcode" name="btnPopDaumPostcode" href="#" class="add_search_btn"><img src="/mobile/images/member/post-search-btn.png" alt="우편번호 찾기" /></a>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td class="bd0"><input type="text" name="address" id="address" class="add_02 mt5 mb5" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td><input type="text" name="address_detail" id="address_detail" maxlength="50" class="add_03 mb5" /></td>
                </tr>
                <tr>
                    <th><label for="tel">전화번호</label></th>
                    <td>
                        <div class="phone-select">
                            <select name="phone1" id="phone1" class="tel_01">
                                <option value="">선택</option>
                                <option value="02">02</option>
                                <option value="031">031</option>
                                <option value="032">032</option>
                                <option value="033">033</option>
                                <option value="041">041</option>
                                <option value="042">042</option>
                                <option value="043">043</option>
                                <option value="051">051</option>
                                <option value="052">052</option>
                                <option value="053">053</option>
                                <option value="054">054</option>
                                <option value="055">055</option>
                                <option value="061">061</option>
                                <option value="062">062</option>
                                <option value="063">063</option>
                                <option value="064">064</option>
                                <option value="0502">0502</option>
                                <option value="0505">0505</option>
                                <option value="0506">0506</option>
                                <option value="070">070</option>
                            </select>
                        </div>
                        <input type="text" name="phone2" id="phone2" class="tel_02" maxlength="4" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="txtOnlyNum(event)" />
                        <input type="text" name="phone3" id="phone3" class="tel_02" maxlength="4" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'')" onkeypress="txtOnlyNum(event)" />
					</td>
                </tr>
                <tr>
                    <th rowspan="2"><label for="phone">휴대폰</label></th>
                    <td class="pdt5 bd0">
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
                <tr>
                    <td>
                        <div class="check_box_wrap">
                            <div style="overflow:hidden; margin-bottom:5px;">
                                <!--<input type="checkbox" id="sms" class="sms" name="sms" value="sms">-->
                                <input type="radio" id="form_sms_agree1" name="sms" class="sms" value="Y" />
                                <!--<label for="sms"></label>-->
                                <span class="text">SMS 수신동의</span>
                            </div>
                            <div>
                                <input type="radio" id="form_sms_agree2" name="sms" class="sms" value="N" />
                                <!--<label for="sms"></label>-->
                                <span class="text">SMS 수신동의하지 않음</span>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th rowspan="2"><label for="email_01">이메일</label></th>
                    <td class="pdt5 bd0">
                        <input type="text" id="email1" name="email1" class="email_01" />
                        <span class="whelk">@</span>
                        <input type="text" id="email2" name="email2" class="email_02" />
                        <!--이메일 인증시 이메일은 미리입력됨 아래 input참조-->
                        <!--<input type="text" id="email_02" class="email_02" name="email_02" value="naver.com" />-->
                        <div class="email-select">
                            <select id="email3" name="email3" onchange="changeEmailDomain(this);">
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="check_box_wrap">
                            <div style="overflow:hidden; margin-bottom:5px;">
                                <input type="radio" id="form_news_agree1" name="mailling" class="news_letter" value="Y" />
                                <!--<label for="news_letter"></label>-->
                                <span class="text">뉴스레터 수신동의</span>
                            </div>
                            <div>
                                <input type="radio" id="form_news_agree2" name="mailling" class="news_letter" value="N" />
                                <!--<label for="news_letter"></label>-->
                                <span class="text">뉴스레터 수신동의하지 않음</span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>

                <ul class="caution">
                    <li>
                        <span class="icon">*</span>
                        <span>이메일 주소는 아이디/비밀번호 찾기시 이용되오니 정확히 입력하시기 바랍니다.</span>
                    </li>
                    <li>
                        <span class="icon">*</span>
                        <span>주문관련내용은 기본 발송 사항으로 이메일과 SMS로 발송됩니다.</span>
                    </li>
                </ul>
                <span class="cert_btn_box">
                    <a href="javascript:EmailFormGeneralInsertCheck();" class="btn join_ok_btn ok_btn">확인</a>
                    <a href="/mobile/memeber/join.asp" class="btn cancel_btn">취소</a>
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

<script>
    //아이디중복확인 팝업 취소버튼 클릭시 팝업사라짐
    function pop_close(){
        $(".id_dup.cancel_btn, .cancel_btn").on("click", function(){
            $(this).closest(".popup_wrap").css("visibility","hidden");
        });
        $(".id_dup_true.ok_btn, .popup_close-btn").on("click", function(){
            $(this).closest(".popup_wrap").css("visibility","hidden");
        });
    };
    pop_close();

	/*
	// 퍼블작업 
    $(".join_ok_btn").on("click", function(){

        var form				= document.join_form;
        var id_dup_form			= document.id_dup_form;
        var id_dup_true_form	= document.id_dup_true_form;
        var post_form			= document.post_form;

        if(form.name.value == false){
			alert("이름을 입력해 주세요");
        }else if(form.sex.value == false){
			alert("성별을 입력해 주세요");
        }else if(form.birth_date_01.value == false){
			alert("년도를 선택해 주세요");
        }else if(form.birth_date_02.value == false){
			alert("월을 선택해 주세요");
        }else if(form.birth_date_03.value == false){
			alert("일을 선택해 주세요");
        }else if($(".solarLa").css("background-position") == "-36px 0px" && $(".lunarLa").css("background-position") == "-36px 0px"){
			alert("앙력과 음력을 선택해 주세요");
        }else if($(".solarLa").css("background-position") == "-58px 0px" && $(".lunarLa").css("background-position") == "-58px 0px"){
			alert("앙력과 음력중 하나만 선택해 주세요");
        }else if(form.id.value.length < 6 || form.id.value.length > 14){
			alert("아이디는 6~14자 이하로 입력해 주세요");
        }else if(id_dup_form.id_dup_chk.value.length < 6 || id_dup_form.id_dup_chk.value.length > 14){
			alert("아이디는 6~14자 이하로 입력해 주세요");
        }else if(form.pw.value.length < 6 || form.pw.value.length > 14){
			alert("비밀번호는 6~14자 이하로 입력해 주세요");
        }else if(form.pw_chk.value == false){
			alert("비밀번호를 한번 더 입력해 주세요");
        }else if(form.pw.value != form.pw_chk.value){
			alert("비밀번호가 일치하지 않습니다.");
        }else if($(".solar_popLa").css("background-position") == "-36px 0px" && $(".lunar_popLa").css("background-position") == "-36px 0px"){
			alert("지번과 도로명을 선택해 주세요");
        }else if($(".solar_popLa").css("background-position") == "-58px 0px" && $(".lunar_popLa").css("background-position") == "-58px 0px"){
			alert("지번과 도로명중 하나만 선택해 주세요");
        }else if(post_form.address.value == false){
			alert("주소를 입력해 주세요");
        }else if(form.tel_01.value == false){
			alert("전화번호 앞자리를 선택해 주세요");
        }else if(form.tel_02.value == false){
			alert("나머지 전화번호를 선택해 주세요");
        }else if(form.phone_01.value == false){
			alert("휴대폰번호 앞자리를 선택해 주세요");
        }else if(form.phone_02.value == false){
			alert("나머지 휴대폰번호를 선택해 주세요");
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
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="yes" hspace="0" vspace="0" title="이메일인증일반회원가입폼아이프레임"></iframe>
<%
	If action_flag = "email" Then 
%>
<script>
$(document).ready(function(){
	$("#email1").val('<%=email1%>');
	$("#email2").val('<%=email2%>');
	$("#email3").val('<%=email3%>');
	$("#birthyear").val('<%=birthyear%>');
	$("#birthmonth").val('<%=birthmonth%>');
	$("#birthday").val('<%=birthday%>');

	/*
	setTextbox('birthyear' , '<%=birthyear%>');
	setTextbox('birthmonth' , '<%=birthmonth%>');
	setTextbox('birthday' , '<%=birthday%>');
	setTextbox('email1' , '<%=email1%>');
	setTextbox('email2' , '<%=email2%>');
	setTextbox('email3' , '<%=email3%>');
	*/

	$("#email1").attr("readonly",true);
	$("#email2").attr("readonly",true);
	$("#email2").attr("onfocus", "");
	$("#email3").attr("onclick", "");
	$("#email3").attr("onchange", "");

	$('#email3').focus(function() {
		this.initialSelect = this.selectedIndex;
	});
	$('#email3').change(function() {
		this.selectedIndex = this.initialSelect;
	});


});
</script>
<%
	End If 
%>