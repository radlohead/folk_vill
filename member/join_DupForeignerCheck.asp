<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
	'#######################################################
	'# HTML FORM값 가져오기 START
	'#######################################################

	Dim gubun : gubun					= RP(Request("gubun"))
	Dim name : name						= RP(Request("authName"))
	Dim birthyear : birthyear			= RP(Request("birthyear"))
	Dim birthmonth : birthmonth			= RP(Request("birthmonth"))
	Dim birthday : birthday				= RP(Request("birthday"))
	Dim fullbirthday : fullbirthday		= birthyear&birthmonth&birthday
	Dim mobile1 : mobile1				= RP(Request("mobile1"))
	Dim mobile2 : mobile2				= RP(Request("mobile2"))
	'Dim mobile3 : mobile3				= RP(Request("mobile3"))
	'Dim mobile  : mobile				= mobile1&mobile2&mobile3
	Dim mobile  : mobile				= mobile1&mobile2

	'생년월일 숫자 체크
	If Word_check(birthyear,pattern1) = False Then	f_AlertBack("잘못된 입력값으로 인해 접근이 차단 되었습니다.")
	If Word_check(birthmonth,pattern1) = False Then	f_AlertBack("잘못된 입력값으로 인해 접근이 차단 되었습니다.")
	If Word_check(birthday,pattern1) = False Then	f_AlertBack("잘못된 입력값으로 인해 접근이 차단 되었습니다.")	
	
	'휴대폰 숫자 체크
	If Word_check(mobile1,pattern1) = False Then f_AlertBack("잘못된 입력값으로 인해 접근이 차단 되었습니다.")
	If Word_check(mobile2,pattern1) = False Then f_AlertBack("잘못된 입력값으로 인해 접근이 차단 되었습니다.")
	'If Word_check(mobile3,pattern1) = False Then f_AlertBack("잘못된 입력값으로 인해 접근이 차단 되었습니다.")

'	Response.write gubun & "<br>"
'	Response.write name & "<br>"
'	Response.write birthyear & "<br>"
'	Response.write birthmonth & "<br>"
'	Response.write birthday & "<br>"
'	Response.write fullbirthday & "<br>"
'	Response.write mobile1 & "<br>"
'	Response.write mobile2 & "<br>"
'	Response.write mobile3 & "<br>"
'	Response.write mobile & "<br>"
'	Response.End

	If name = "" Or fullbirthday = "" Or mobile = "" Then 
		Call f_AlertURL("비정상 접속 입니다.\n\n문제가 있으시면 관리자에게 문의해주세요.", "join.asp")
	End If 

	Call OpenDbConnection() '데이터베이스 오픈

	'########################################################
	'# 일반/외국인 회원가입 유무 체크 프로시저 START
	'########################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd								
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_GENERAL_MEMBER_DUP_CHECK"
		.CommandType = adCmdStoredProc
		'@NAME, @FULLBIRTHDAY, @MOBILE
		.Parameters.Append .CreateParameter("@NAME",adVarChar,adParamInput,30, name)
		.Parameters.Append .CreateParameter("@FULLBIRTHDAY",adVarChar,adParamInput,8, fullbirthday)
		.Parameters.Append .CreateParameter("@MOBILE",adVarChar,adParamInput,12, mobile)
		.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
		.Execute
		Ret = .Parameters("@RET")
	End With
	Set Rs = objCmd.Execute
	Set objCmd = Nothing

	'########################################################
	'# 일반/외국인 회원가입 유무 체크 프로시저 END
	'########################################################

	If Ret = "1" Then
		'Response.CharSet="euc-kr"
		Call CloseDbConnection() '데이터베이스 클로즈
		Response.Write "<form name='form1' method='post' action='https://www.koreanfolk.co.kr/mobile/member/join_foreigner_step2.asp' target='_parent'>"
		Response.Write "<input type='hidden' id='gunun' name='gubun' value="&gubun&">"
		Response.Write "<input type='hidden' id='joinDupleChecked' name='joinDupleChecked' value='Y'>"
		Response.Write "</form>"
		Response.Write "<script language='javascript'>"
		Response.Write " document.form1.submit();"
		Response.Write "</script>"
	ElseIf Ret = "0" Then
		Call CloseDbConnection() '데이터베이스 클로즈
		Response.Write "<script language='javascript'>"
		Response.Write "alert('입력하신 정보로 이미 회원가입이 되어 있습니다.\n\n확인후 로그인 해주세요.');"
		Response.Write "parent.location.href='login.asp';"
		Response.Write "</script>"
		Response.End
	End If
%>