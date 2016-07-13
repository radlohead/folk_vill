<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
	'#######################################################
	'# FORM값 가져오기 START
	'#######################################################

	Dim id : id					= session("id")
	Dim password : password		= RP(Request("password"))

	'#######################################################
	'# FORM값 가져오기 END
	'#######################################################

	If id = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " location.href='/mobile/member/login.asp?RtnURL=/mobile/mypage/member_info_auth.asp';"
		Response.write "</script>"
		Response.End
	End If

	If id = "" Or password = "" Then
		Call f_AlertURL("비정상 접속 입니다.\n\n문제가 있으시면 관리자에게 문의해주세요.", "/mobile/mypage/member_info_auth.asp")
	End If

	Call OpenDbConnection() '데이터베이스 오픈

	'########################################################
	'# 회원정보 체크 프로시저 START
	'########################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_MEMBER_INFO_SELECT"
		.CommandType = adCmdStoredProc
		.Parameters.Append .CreateParameter("@id", adVarchar, adParamInput, 20, id)
		Set Rs = .Execute
	End With
	Set objCmd = Nothing

	'########################################################
	'# 회원정보 체크 프로시저 END
	'########################################################

	If Not(Rs.bof OR Rs.eof) Then

		'기본정보
		gubun				= Rs("GUBUN")
		id					= Rs("UID")
		pwd					= Rs("PWD")
		name				= Rs("NAME")
		gender				= Rs("GENDER")
		birthyear			= Rs("BIRTHYEAR")
		birthmonth			= Rs("BIRTHMONTH")
		birthday			= Rs("BIRTHDAY")
		birthsel			= Rs("BIRTHSEL")
		zip					= Rs("ZIP")
		address				= Rs("ADDRESS")
		address_detail		= Rs("ADDRESS_DETAIL")
		phone1				= Rs("PHONE1")
		phone2				= Rs("PHONE2")
		phone3				= Rs("PHONE3")
		mobile1				= Rs("MOBILE1")
		mobile2				= Rs("MOBILE2")
		mobile3				= Rs("MOBILE3")
		mobile				= mobile1&"-"&mobile2&"-"&mobile3
		email				= Rs("EMAIL")
		dbemail				= email

		if not isNull(email) AND email <> "" then
			email = split(email,"@")
			email1 = email(0)
			email2 = email(1)
		Else
			email1 = ""
			email2 = ""
		end If

		'2015/03/06 이메일 인증 회원가입시 도메인 선택없이 직접 입력하는 경우로 인해 빈값으로 수정
		email3 = ""

		'email_sel		= Rs("EMAILSEL")

		'If email_sel = "1" Then
		'	email3 = Trim(email2)
		'Else
		'	email3 = ""
		'End If

		mailing				= Rs("MAILING")
		sms					= Rs("SMS")
		ip					= Rs("IP")
		auth				= Rs("AUTH")
		regdate				= Rs("REGDATE")
		'14세미만 보호자 정보
		pname				= Rs("PNAME")
		pgender				= Rs("PGENDER")
		pbirthyear			= Rs("PBIRTHYEAR")
		pbirthmonth			= Rs("PBIRTHMONTH")
		pbirthday			= Rs("PBIRTHDAY")
		pmobile1			= Rs("PMOBILE1")
		pmobile2			= Rs("PMOBILE2")
		pmobile3			= Rs("PMOBILE3")
		pmobile				= pmobile1&"-"&pmobile2&"-"&pmobile3

		If gubun = "G" Then
			strgubun = "일반"
		ElseIf gubun = "F" Then
			strgubun = "외국인"
		Else
			strgubun = "14세미만"
		End If

		If gender = "M" Then
			strgender = "남"
		ElseIf gender = "F" Then
			strgender = "여"
		End If

		If pgender = "M" Then
			strpgender = "남"
		ElseIf pgender = "F" Then
			strpgender = "여"
		End If

		Rs.Close
	End If

	Call CloseDbConnection() '데이터베이스 클로즈
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
	<script type="text/javascript" src="/mobile/common/js/FormValidateCheck.js"></script>
	<script>
	$(document).ready(function() {
		alert('<%=birthmonth%>');
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
					/*if (objOption.value == "<%=birthday%>") {
						objOption.selected = true;
					}*/

					form.birthday.options.add(objOption);
				}
			}
		}
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
            <h2>마이페이지</h2>
        </div>

		<!--#include virtual="/mobile/mypage/inc/mypage_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-login">
            <div class="detail-head mypage">
                <h3>개인정보 변경</h3>
                <span class="text">회원님의 소중한 정보보호를 위해 비밀번호를<br/>
                                   입력해주시기 바랍니다.
                </span>
            </div>
            <div class="content member">
			<form action="/mobile/mypage/member_edit_proc.asp" method="post" id="frm" name="frm" class="join_form">
			<input type="hidden" id="id" name="id" value="<%=id%>">
			<input type="hidden" id="dbemail" name="dbemail" value="<%=dbemail%>">
			<input type="hidden" id="gubun" name="gubun" value="<%=gubun%>">


			<%
				If gubun = "C" Then '14세미만일 경우
			%>
				<label for="name" class="nameLa">이름</label>
				<input type="text" id="name" class="name" readonly value="<%=name%>" />
				<label for="name" class="nameLa">보호자 이름</label>
				<input type="text" id="name" class="name" readonly value="<%=strgender%>" />
				<label for="name" class="nameLa">성별</label>
				<input type="text" id="name" class="name" readonly value="<%=name%>" />
				<label for="name" class="nameLa">보호자 성별</label>
				<input type="text" id="name" class="name" readonly value="<%=strgender%>" />
			<%
				Else '일반/외국인일 경우
			%>
				<label for="name" class="nameLa">이름</label>
				<input type="text" id="name" class="name" name="name" readonly value="<%=name%>" />
				<label for="name" class="nameLa">성별</label>
				<input type="text" id="name" class="name" name="name" readonly value="<%=strgender%>" />
			<%
				End If
			%>

                    <label for="birth_date_01">생년월일</label>
                    <div class="select_box birth_date_box">
                        <div class="select">

						<select name="birthyear" id="birthyear" class="birth_date_01" title="년도 선택" onchange="javascript:setBirthDay('frm');">
						<%
							toyears = year(date)

							If gubun = "C" Then '14세미만일 경우
						%>
							<option value=''>년도</option>
							<%
								For j = (toyears - 14) To toyears Step + 1
							%>
							<option value="<%=j%>"><%=j%>년</option>
							<%Next%>
						<%
							Else '일반/외국인일 경우
						%>
							<option value=''>년도</option>
							<%
								For j = (toyears - 14) To 1900 Step - 1
							%>
							<option value="<%=j%>"><%=j%>년</option>
							<%Next%>
						<%
							End If
						%>
						</select>
                        </div>
                        <div class="select">
						<select name="birthmonth" id="birthmonth" title="월 선택" onchange="javascript:setBirthDay('frm');" class="birth_date_02">
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
							<select name="birthday" id="birthday" title="일 선택" class="birth_date_03">
								<option value=''>일</option>
							</select>
                        </div>
                    </div>
                    <div class="check_box_wrap">
						<span class="radioWrap block">
                        <!--<input type="checkbox" id="solar" class="solar" name="solar" value="solar">-->
						<input type="radio" name="birth_umyang" id="form_type_01" title="양력" class="solar" value="1" <%=GetChecked(birthsel, "1")%> />
                        <label for="solar"></label>
                        <span class="text mr25">양력</span>
						</span>
                        <span class="radioWrap block">
						<!--<input type="checkbox" id="lunar" class="lunar" name="lunar" value="lunar">-->
						<input type="radio" name="birth_umyang" id="form_type_02" title="음력" class="lunar" value="2" <%=GetChecked(birthsel, "2")%> />
                        <label for="lunar"></label>
                        <span class="text">음력</span>
						</span>
                    </div>

                    <label for="id">아이디</label>
                    <input type="text" id="id" class="id" name="id" value="<%=id%>" readonly="readonly" />

                    <div class="address_wrap">
                        <label for="add_01">주소</label>


						<span class="add_01_box">
							<input type="text" name="zipcode1" id="zipcode1" readonly="readonly" class="add_01" placeholder="우편번호1" />
							<input type="text" name="zipcode2" id="zipcode2" readonly="readonly" class="add_01" placeholder="우편번호2" />
							<!--<input type="submit" name="add_search_btn" class="add_search_btn" value="우편번호 찾기" />-->
							<a id="btnPopDaumPostcode" name="btnPopDaumPostcode" href="#" class="add_search_btn">우편번호 찾기</a>&nbsp; (* Daum Kakao Corp. 제공)
						</span>
						<input type="text" name="address" id="address" class="add_02" readonly="readonly" placeholder="주소" />
						<input type="text" name="address_detail" id="address_detail" maxlength="50" class="add_03" placeholder="상세주소" />

                    </div>

                    <label for="tel">전화번호</label>
                    <div class="select_box tel_box">
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
						<input type="text" name="phone2" id="phone2" class="tel_02" maxlength="4" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="txtOnlyNum(event)" />-
						<input type="text" name="phone3" id="phone3" class="tel_02" maxlength="4" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'')" onkeypress="txtOnlyNum(event)" />
                        <!--<input type="text" id="tel_02" class="tel_02" name="tel_02" placeholder="전화번호" />-->
                    </div>

                    <label for="phone">휴대폰 번호</label>
                    <div class="select_box phone_box">
				<%
					If gubun = "C" Then
				%>
					<select name="pmobile1" id="pmobile1" class="phone_01">
                        <option value="선택">선택</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    <input type="text" name="pmobile2" id="pmobile2" maxlength="8" class="phone_02" placeholder="휴대폰 번호" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="txtOnlyNum(event)" />
				<%
					Else
				%>
					<select name="mobile1" id="mobile1" class="phone_01">
                        <option value="선택">선택</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    <input type="text" name="mobile2" id="mobile2" maxlength="8" class="phone_02" placeholder="휴대폰 번호" onKeyUp="this.value=this.value.replace(/[^0-9]/g,'');" onkeypress="txtOnlyNum(event)" />
				<%
					End If
				%>
                    </div>
					<!--
                    <div class="check_box_wrap">
                        <input type="checkbox" id="sms" class="sms" name="sms" value="sms">
                        <label for="sms"></label>
                        <span class="text">SMS 수신동의</span>
                    </div>
					-->
					<div class="check_box_wrap">
						<span class="radioWrap block">
							<input type="radio" id="form_sms_agree1" name="sms" class="sms" value="Y" <%=GetChecked(sms, "Y")%> />
							<label for="form_sms_agree1"></label>
							<span class="text">SMS 수신동의</span>
						</span>
					</div>

                    <div class="select_box email_box">
                        <label for="email_01">이메일</label>
						<input type="text" id="email1" name="email1" class="email_01" placeholder="이메일 아이디" />
                        <span class="text_at">@</span>
						<input type="text" id="email2" name="email2" class="email_02" placeholder="이메일 주소" />
						<select id="email3" name="email3" class="email_03" onchange="changeEmailDomain(this);">
                            <option value="직접입력">직접입력</option>
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
					<div class="check_box_wrap">
						<span class="radioWrap block">
							<input type="radio" id="form_news_agree1" name="mailling" class="news_letter" value="Y" <%=GetChecked(mailing, "Y")%> />
							<label for="form_news_agree1"></label>
							<span class="text">뉴스레터 수신동의</span>
						</span>
					</div>
					<!--
                    <div class="check_box_wrap">
                        <input type="checkbox" id="news_letter" class="news_letter" name="news_letter" value="news_letter">
                        <label for="news_letter"></label>
                        <span class="text">뉴스레터 수신동의</span>
                    </div>
					-->

                    <ul class="caution">
                        <li>
                            <span class="icon">*</span>
                            <span>주문관련내용은 기본 발송 사항으로 이메일과 SMS로 발송됩니다.</span>
                        </li>
                    </ul>
                    <span class="cert_btn_box">
                        <a href="javascript:FormEditCheck();" class="btn join_ok_btn ok_btn">확인</a>
                        <a href="/mobile/mypage/member_info_auth.asp" class="btn cancel_btn">취소</a>
                    </span>
                </form>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->

<!-- 우편번호 찾기 팝업-->
<!--#include virtual="/mobile/member/inc/post_search.asp" -->

    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 1,
                initialSlide: 3
            });
        });
    </script>
<script>
    //아이디중복확인 팝업 취소버튼 클릭시 팝업사라짐
	/*
    function pop_close(){
        $(".id_dup.cancel_btn, .cancel_btn").on("click", function(){
            $(this).closest(".popup_wrap").css("visibility","hidden");
        });
        $(".id_dup_true.ok_btn, .popup_close-btn").on("click", function(){
            $(this).closest(".popup_wrap").css("visibility","hidden");
        });
    };
    pop_close();

    $(".join_ok_btn").on("click", function(){
        var form = document.join_form;
        var id_dup_form = document.id_dup_form;
        var id_dup_true_form = document.id_dup_true_form;
        var post_form = document.post_form;

        if(form.name.value == false){
            alert("이름을 입력해 주세요");
        }else if(form.sex.value == false){
            alert("성별을 입력해 주세요");
        }
        else if(form.birth_date_01.value == false){
            alert("년도를 선택해 주세요");
        }else if(form.birth_date_02.value == false){
            alert("월을 선택해 주세요");
        }else if(form.birth_date_03.value == false){
             lert("일을 선택해 주세요");
        }
        else if($(".solarLa").css("background-position") == "-36px 0px" && $(".lunarLa").css("background-position") == "-36px 0px"){
            alert("앙력과 음력을 선택해 주세요");
        }else if($(".solarLa").css("background-position") == "-58px 0px" && $(".lunarLa").css("background-position") == "-58px 0px"){
            alert("앙력과 음력중 하나만 선택해 주세요");
        }
        else if(form.id.value.length < 6 || form.id.value.length > 14){
            alert("아이디는 6~14자 이하로 입력해 주세요");
        }
        else if(id_dup_form.id_dup_chk.value.length < 6 || id_dup_form.id_dup_chk.value.length > 14){
            alert("아이디는 6~14자 이하로 입력해 주세요");
        }
        else if(form.pw.value.length < 6 || form.pw.value.length > 14){
            alert("비밀번호는 6~14자 이하로 입력해 주세요");
        }
        else if(form.pw_chk.value == false){
            alert("비밀번호를 한번 더 입력해 주세요");
        }
        else if(form.pw.value != form.pw_chk.value){
            alert("비밀번호가 일치하지 않습니다.");
        }
        else if($(".solar_popLa").css("background-position") == "-36px 0px" && $(".lunar_popLa").css("background-position") == "-36px 0px"){
            alert("지번과 도로명을 선택해 주세요");
        }else if($(".solar_popLa").css("background-position") == "-58px 0px" && $(".lunar_popLa").css("background-position") == "-58px 0px"){
            alert("지번과 도로명중 하나만 선택해 주세요");
        }
        else if(post_form.address.value == false){
            alert("주소를 입력해 주세요");
        }
        else if(form.tel_01.value == false){
            alert("전화번호 앞자리를 선택해 주세요");
        }
        else if(form.tel_02.value == false){
            alert("나머지 전화번호를 선택해 주세요");
        }
        else if(form.phone_01.value == false){
            alert("휴대폰번호 앞자리를 선택해 주세요");
        }
        else if(form.phone_02.value == false){
            alert("나머지 휴대폰번호를 선택해 주세요");
        }
        else if(form.email_01.value == false){
            alert("이메일 아이디를 입력해 주세요");
        }else if(form.email_02.value == false){
            alert("이메일 주소를 입력해 주세요");
        }
    });
	*/

</script>
</body>
</html>

<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" title="개인정보변경폼아이프레임"></iframe>
<script>
$(document).ready(function(){
	setTextbox("birthyear" , "<%=birthyear%>");
	setTextbox("birthmonth" , "<%=birthmonth%>");
	setTextbox("birthday" , "<%=birthday%>");
	setTextbox("zipcode1" , "<%=Left(zip,3)%>");
	setTextbox("zipcode2" , "<%=Right(zip,3)%>");
	setTextbox("address" , "<%=address%>");
	setTextbox("address_detail" , "<%=address_detail%>");
	setTextbox("phone1" , "<%=phone1%>");
	setTextbox("phone2" , "<%=phone2%>");
	setTextbox("phone3" , "<%=phone3%>");
	<%if gubun = "C" then%>
	setTextbox("pmobile1" , "<%=pmobile1%>");
	setTextbox("pmobile2" , "<%=pmobile2%><%=pmobile3%>");
	//setTextbox("pmobile3" , "<%=pmobile3%>");
	<%else%>
	setTextbox("mobile1" , "<%=mobile1%>");
	setTextbox("mobile2" , "<%=mobile2%><%=mobile3%>");
	//setTextbox("mobile3" , "<%=mobile3%>");
	<%end if%>
	setTextbox("email1" , "<%=email1%>");
	setTextbox("email2" , "<%=email2%>");
	setTextbox("email3" , "<%=email3%>");
});
</script>