<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/encrypt_class.asp"-->
<%
	'########################################################
	'# HTML FORM값 가져오기 START
	'########################################################

	Dim id : id					= LCase(RP(Request("id")))
	Dim password : password		= RP(Request("password"))
	Dim RtnURL : RtnURL			= RP(Request("RtnURL"))
	Dim ev : ev					= RP(Request("ev"))
	Dim couponSEQ : couponSEQ	= RP(Request("couponSEQ"))

	'Response.write RtnURL & "<br>"
	'Response.write ev & "<br>"
	'Response.write couponSEQ & "<br>"
	'Response.end

	'아이디 길이 체크
	If Len(id) > 14 Then f_AlertEnd("아이디 길이가 잘못 되었습니다.")
	'비밀번호 길이 체크
	If Len(password) > 14 Then f_AlertEnd("비밀번호 길이가 잘못 되었습니다.")

	If RtnURL = "" Or IsEmpty(RtnURL) Or IsNull(RtnURL) then
		RtnURL = "none"
	End If

	'########################################################
	'# HTML FORM값 가져오기 END
	'########################################################

	'########################################################
	'# 비밀번호 암호화 START
	'########################################################

	Set XTEncrypt = new XTclsEncrypt
	'response.write "md5"&XTEncrypt.MD5(password) & "<br>"
	'response.write "sha256"&XTEncrypt.SHA256(password) & "<br>"
	'response.write "sha-md5"&XTEncrypt.SHA256(XTEncrypt.MD5(password)) & "<br>"
	'response.write "md4-sha"&XTEncrypt.MD5(XTEncrypt.SHA256(password)) & "<br>"
	password = XTEncrypt.SHA256(password)
	Set XTEncrypt = Nothing

	'########################################################
	'# 비밀번호 암호화 END
	'########################################################

	Call OpenDbConnection() '데이터베이스 오픈

	'########################################################
	'# 로그인 체크 프로시저 START
	'########################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_LOGIN_CHECK"
		.CommandType = adCmdStoredProc
		'@UID, @PWD, @RET
		.Parameters.Append .CreateParameter("@UID",adVarChar,adParamInput,20, id)
		.Parameters.Append .CreateParameter("@PWD",adVarChar,adParamInput,100, password)
		.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
		.Execute
		Ret = .Parameters("@RET")
	End With
	Set Rs = objCmd.Execute
	Set objCmd = Nothing

	'########################################################
	'# 로그인 체크 프로시저 END
	'########################################################

	If Ret = "1" Then
		'세션생성
		Session.Timeout=60
		session("id")																= Trim(Rs("UID"))
		session("name")															= Trim(Rs("NAME"))

	ElseIf Ret = "0" Then
		If RtnURL = "none" Then
			Response.write "<script language='javascript'>"
			Response.write "alert('아이디, 패스워드를 다시 확인하시고 입력해주세요.');"
			Response.write  "parent.location.href='https://www.koreanfolk.co.kr/mobile/member/login.asp';"
			'Response.write  "parent.location.href='/member/login.asp';"
			Response.write "</script>"
			Response.End
		Else
			If ev = "" Then
				Response.Write "<form name='form1' method='post' action='https://www.koreanfolk.co.kr/mobile/member/login.asp' target='_parent'>"
				Response.Write "<input type='hidden' name='RtnURL' value=" & RtnURL & ">"
				Response.Write "</form>"
				Response.Write "<script language='javascript'>"
				Response.Write "alert('아이디, 패스워드를 다시 확인하시고 입력해주세요.');"
				Response.Write "document.form1.submit();"
				Response.Write "</script>"
				Response.End
			ElseIf ev = "coupon" Then
				Response.Write "<form name='form1' method='post' action='https://www.koreanfolk.co.kr/mobile/member/login.asp' target='_parent'>"
				Response.Write "<input type='hidden' name='RtnURL' value=" & RtnURL & ">"
				Response.Write "<input type='hidden' name='event' value='coupon'>"
				Response.Write "<input type='hidden' name='couponSEQ' value=" & couponSEQ & ">"
				Response.Write "</form>"
				Response.Write "<script language='javascript'>"
				Response.Write "alert('아이디, 패스워드를 다시 확인하시고 입력해주세요.');"
				Response.Write "document.form1.submit();"
				Response.Write "</script>"
				Response.End
			End If
		End if
	End If

	CloseDbConnection() '데이터베이스 클로즈

	If RtnURL = "none" Then
		Response.write "<script language='javascript'>"
		Response.write "parent.location.href='http://www.koreanfolk.co.kr/mobile/';"
		Response.write "</script>"
		Response.End
	Else
		If ev = "" then
			Response.write "<script language='javascript'>"
			'Response.WRite "alert('"&RtnURL&"');"
			Response.WRite "alert('로그인 완료');"
			Response.write "parent.location.href='" & RtnURL & "'"
			Response.write "</script>"
			Response.End
		ElseIf ev = "coupon" Then
			Response.Write "<form name='form1' method='post' action='http://www.koreanfolk.co.kr/mobile" & RtnURL & "' target='_parent'>"
			Response.Write "<input type='hidden' name='couponSEQ' value=" & couponSEQ & ">"
			Response.Write "</form>"
			Response.Write "<script language='javascript'>"
			Response.Write " document.form1.submit();"
			Response.Write "</script>"
			Response.End
		End If
	End if
%>