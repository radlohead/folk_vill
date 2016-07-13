<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/lib/encrypt_class.asp"-->
<%
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " parent.location.href='/mobile/member/login.asp?RtnURL=/mobile/mypage/member_info_auth.asp';"
		Response.write "</script>"
		Response.End
	End If
	
	'#######################################################
	'# FORM값 가져오기 START
	'#######################################################

	Dim id : id						= session("id")
	Dim password : password			= RP(Request("password"))

	'#######################################################
	'# FORM값 가져오기 END
	'#######################################################
	
'	Response.write id & "<br>"
'	Response.write password & "<br>"
'	Response.End

	If id = "" Or password = "" Then 
		Call f_AlertParentUrl("비정상 접속 입니다.\n\n문제가 있으시면 관리자에게 문의해주세요.", "/mobile/mypage/member_info_auth.asp")
	End If 

	'########################################################
	'# 비밀번호 암호화 START
	'########################################################

	Set XTEncrypt = new XTclsEncrypt
'	response.write "md5"&XTEncrypt.MD5(password) & "<br>"
'	response.write "sha256"&XTEncrypt.SHA256(password) & "<br>"
'	response.write "sha-md5"&XTEncrypt.SHA256(XTEncrypt.MD5(password)) & "<br>"
'	response.write "md4-sha"&XTEncrypt.MD5(XTEncrypt.SHA256(password)) & "<br>"
	password = XTEncrypt.SHA256(password)
	Set XTEncrypt = nothing
	
'	Response.write "password=="&password
'	Response.End
	
	'########################################################
	'# 비밀번호 암호화 END
	'########################################################

	Call OpenDbConnection() '데이터베이스 오픈

	'########################################################
	'# 비밀번호 체크 프로시저 START
	'########################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd								
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_CHECK_MEMBER_PASSWORD"
		.CommandType = adCmdStoredProc
		'@UID, @PWD
		.Parameters.Append .CreateParameter("@UID",adVarChar,adParamInput,20, id)
		.Parameters.Append .CreateParameter("@PWD",adVarChar,adParamInput,100, password)
		.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
		.Execute
		Ret = .Parameters("@RET")
	End With
	Set Rs = objCmd.Execute
	Set objCmd = Nothing

	'########################################################
	'# 비밀번호 체크 프로시저 END
	'########################################################

	If Ret = "1" Then
		'Response.CharSet="euc-kr"
		Call CloseDbConnection() '데이터베이스 클로즈
		Response.Write "<form name='form1' method='post' action='/mobile/mypage/member_info.asp' target='_parent'>"
		Response.Write "<input type='hidden' name='password' value="&password&">"
		Response.Write "</form>"
		Response.Write "<script language='javascript'>"
		Response.Write " document.form1.submit();"
		Response.Write "</script>"
		Response.End	
	ElseIf Ret = "0" Then
		Call CloseDbConnection() '데이터베이스 클로즈
		Response.Write "<script language='javascript'>"
		Response.Write "alert('비밀번호를 정확하게 입력해 주세요.');"
		Response.Write "</script>"
		Response.End
	End If	
%>
