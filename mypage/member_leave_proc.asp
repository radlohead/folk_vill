<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/lib/encrypt_class.asp"-->
<%
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " parent.location.href=/mobile/member/login.asp?RtnURL=/mobile/mypage/member_leave.asp';"
		Response.write "</script>"
		Response.End
	End If

	'#######################################################
	'# FORM값 가져오기 START
	'#######################################################

	Dim id : id							= RP(Request("id"))
	Dim password : password				= RP(Request("password"))
	Dim reason : reason					= RP(Request("reason"))
	Dim reason_text : reason_text		= SimpleSQLInjectionXSSFilter(Request("reason_text"))

	'#######################################################
	'# FORM값 가져오기 END
	'#######################################################
	
'	Response.write id & "<br>"
'	Response.write password & "<br>"
'	Response.End

	If id = "" Or password = "" Then 
		Call f_AlertParentUrl("비정상 접속 입니다.\n\n문제가 있으시면 관리자에게 문의해주세요.", "/mobile/mypage/member_leave.asp")
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
	
	'Response.write "password=="&password & "<br>"
	'Response.End
	
	'########################################################
	'# 비밀번호 암호화 END
	'########################################################

	Call OpenDbConnection() '데이터베이스 오픈

	'########################################################
	'# 회원정보 체크 프로시저 START
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
	'# 회원정보 체크 프로시저 END
	'########################################################


'	Response.write Ret
'	Response.end

	If Ret = "1" Then '회원정보가 일치할 경우

		Call OpenDbConnection() '데이터베이스 오픈
		Conn.BeginTrans() '트랜잭션 시작
		
		'########################################################
		'# TBL_MEMBER_LEAVE Insert, TBL_MEMBER Delete START
		'########################################################

		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd								
			
			.ActiveConnection = Conn
			.CommandText = "SP_HUGO7_TBL_MEMBER_LEAVE_INSERT_M"
			.CommandType = adCmdStoredProc
			'기본정보
			.Parameters.Append .CreateParameter("@UID",adVarChar,adParamInput,20, id)
			.Parameters.Append .CreateParameter("@PWD",adVarChar,adParamInput,100, password)
			'.Parameters.Append .CreateParameter("@REASON",adVarChar,adParamInput,10, reason)
			'.Parameters.Append .CreateParameter("@REASON_TEXT",adVarChar,adParamInput,2147483647, REASON_TEXT)
			
			On Error Resume Next		
			.Execute ,,adExecuteNoRecords
		End With
		Set objCmd = Nothing

		'########################################################
		'# TBL_MEMBER_LEAVE Insert, TBL_MEMBER Delete END
		'########################################################

		If Conn.Errors.Count <> 0 Then	
			Conn.RollbackTrans
			Call CloseDbConnection() '데이터베이스 클로즈
			'Response.Write Err.Description
			Response.Write "<script language='javascript'>"
			Response.Write " alert('정보를 입력하는 동안 에러가 발생했습니다.');"
			Response.Write "</script>"
			Response.End
		Else
			Conn.CommitTrans
			Call CloseDbConnection() '데이터베이스 클로즈

			'세션삭제
			session("id")			= ""
			session("name")			= ""

			'세션 클리어
			session.abandon

			Response.Write "<script language='javascript'>"
			'Response.Write " alert('비밀번호가 성공적으로 수정 되었습니다.');"
			Response.Write " parent.location.href='/mobile/mypage/member_leave_finish.asp';"
			Response.Write "</script>"	
			Response.End
		End If	

	ElseIf Ret = "0" Then '회원정보가 일치하지 않을 경우
		Call CloseDbConnection() '데이터베이스 클로즈
		Response.Write "<script language='javascript'>"
		Response.Write "alert('회원정보가 일치하지 않습니다.');"
		Response.Write "</script>"
		Response.End
	End If	
%>