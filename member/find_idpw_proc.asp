<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/lib/encrypt_class.asp"-->
<%
	'#######################################################
	'# FORM값 가져오기 START
	'#######################################################

	Dim gbflag : gbflag					= RP(Request("flag"))

	'일반회원 아이디 찾기용
	Dim id_name : id_name				= RP(Request("id_name"))
	Dim id_mobile1 : id_mobile1			= RP(Request("id_mobile1"))
	Dim id_mobile2 : id_mobile2			= RP(Request("id_mobile2"))
	Dim id_mobile3 : id_mobile3			= RP(Request("id_mobile3"))
	Dim id_mobile : id_mobile			= id_mobile1&id_mobile2&id_mobile3
	Dim id_email1 : id_email1			= RP(Request("id_email1"))
	Dim id_email2 : id_email2			= RP(Request("id_email2"))
	Dim id_email  : id_email			= id_email1&"@"&id_email2

	'일반회원 비밀번호 찾기용
	Dim pwd_id	: pwd_id				= RP(Request("pwd_id"))
	Dim pwd_name : pwd_name				= RP(Request("pwd_name"))
	Dim pwd_mobile1 : pwd_mobile1		= RP(Request("pwd_mobile1"))
	Dim pwd_mobile2 : pwd_mobile2		= RP(Request("pwd_mobile2"))
	Dim pwd_mobile3 : pwd_mobile3		= RP(Request("pwd_mobile3"))
	Dim pwd_mobile : pwd_mobile			= pwd_mobile1&pwd_mobile2&pwd_mobile3
	Dim pwd_email1 : pwd_email1			= RP(Request("pwd_email1"))
	Dim pwd_email2 : pwd_email2			= RP(Request("pwd_email2"))
	Dim pwd_email  : pwd_email			= pwd_email1&"@"&pwd_email2

	'#######################################################
	'# FORM값 가져오기 END
	'#######################################################

'	Response.write gbflag & "<br />"
'	Response.write id_name & "<br />"
'	Response.write id_mobile1 & "<br />"
'	Response.write id_mobile2 & "<br />"
'	Response.write id_mobile3 & "<br />"
'	Response.write id_mobile & "<br />"
'	Response.write id_email1 & "<br />"
'	Response.write id_email2 & "<br />"
'	Response.write id_email & "<p>"
'	Response.write pwd_id & "<br />"
'	Response.write pwd_name & "<br />"
'	Response.write pwd_mobile1 & "<br />"
'	Response.write pwd_mobile2 & "<br />"
'	Response.write pwd_mobile3 & "<br />"
'	Response.write pwd_mobile & "<br />"
'	Response.write pwd_email1 & "<br />"
'	Response.write pwd_email2 & "<br />"
'	Response.write pwd_email & "<br />"
'	Response.End

	If (UCase(gbflag) <> "GI" And UCase(gbflag) <> "GP") Then
		sRtnMsg = "비 정상 접속 시도 입니다. 다시 확인해 주세요."
		CAll f_AlertParentUrl(sRtnMsg, "find_idpw.asp")
	End If

	Call OpenDbConnection() '데이터베이스 오픈

	If UCase(gbflag) = "GI" Then '아이디 찾기
		'########################################################
		'# 아이디 찾기 프로시저 START
		'########################################################

		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "SP_HUGO7_MEMBER_FINDID_SEARCH"
			.CommandType = adCmdStoredProc
			.Parameters.Append .CreateParameter("@NAME",adVarChar,adParamInput,30, id_name)
			.Parameters.Append .CreateParameter("@MOBILE",adVarChar,adParamInput,12, id_mobile)
			.Parameters.Append .CreateParameter("@EMAIL",adVarChar,adParamInput,100, id_email)
			.Parameters.Append .CreateParameter("@GBFLAG",adVarChar,adParamInput,2, gbflag)
			.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
			.Execute
			Ret = .Parameters("@RET")
		End With
		Set Rs = objCmd.Execute
		Set objCmd = Nothing

		If Ret = "1" Then
			Response.Write "<form name='form1' method='post' action='find_id_true.asp' target='_parent'>"
			Response.Write "<input type='hidden' name='id' value="&Rs("UID")&">"
			Response.Write "</form>"
			Response.Write "<script language='javascript'>"
			Response.Write " document.form1.submit();"
			Response.Write "</script>"
		ElseIf Ret = "0" Then
			Response.write "<script language='javascript'>"
			Response.write "parent.location.href='find_idpw_false.asp#tab1';"
			Response.write "</script>"
			Response.End
		End If

		'########################################################
		'# 아이디 찾기 프로시저 END
		'########################################################


	ElseIf UCase(gbflag) = "GP" Then '비밀번호 찾기

		'########################################################
		'# 임시 비밀번호 생성 START
		'########################################################

		temp_pwd = getStrRandom(14)		' 임시 비밀번호 생성

		'########################################################
		'# 임시 비밀번호 생성 END
		'########################################################

		'########################################################
		'# 비밀번호 암호화 START
		'########################################################

		Set XTEncrypt = new XTclsEncrypt
		'response.write "md5"&XTEncrypt.MD5(password) & "<br>"
		'response.write "sha256"&XTEncrypt.SHA256(password) & "<br>"
		'response.write "sha-md5"&XTEncrypt.SHA256(XTEncrypt.MD5(password)) & "<br>"
		'response.write "md4-sha"&XTEncrypt.MD5(XTEncrypt.SHA256(password)) & "<br>"
		password = XTEncrypt.SHA256(temp_pwd)
		Set XTEncrypt = Nothing

		'########################################################
		'# 비밀번호 암호화 END
		'########################################################

		'########################################################
		'# 비밀번호 찾기 프로시저 START
		'########################################################

		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "SP_HUGO7_MEMBER_FINDPWD_SEARCH"
			.CommandType = adCmdStoredProc
			.Parameters.Append .CreateParameter("@ID",adVarChar,adParamInput,20, pwd_id)
			.Parameters.Append .CreateParameter("@NAME",adVarChar,adParamInput,30, pwd_name)
			.Parameters.Append .CreateParameter("@MOBILE",adVarChar,adParamInput,12, pwd_mobile)
			.Parameters.Append .CreateParameter("@EMAIL",adVarChar,adParamInput,100, pwd_email)
			.Parameters.Append .CreateParameter("@TEMPPWD",adVarChar,adParamInput,100, password)
			.Parameters.Append .CreateParameter("@GBFLAG",adVarChar,adParamInput,2, gbflag)
			.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
			.Execute
			Ret = .Parameters("@RET")
		End With
		Set Rs = objCmd.Execute
		Set objCmd = Nothing

		'########################################################
		'# 비밀번호 찾기 프로시저 END
		'########################################################

		If Ret = "1" Then

			'################################
			' 비밀번호 찾기 smtp 보내기 start
			'################################
			Dim mFrom, mFromName, mTo, mToName, mPwd

			mTo = Trim(Rs("EMAIL"))
			mToName = Trim(Rs("NAME"))
			'mFrom = "admin@ikfv.co.kr"
			mFrom = "hugo7@i-seesaw.com"
			mFromName = "한국민속촌"
			mPwd = temp_pwd

			'메일발송 프로시져
			Call SendMail(mTo, mToName, mFrom, mFromName, mPwd)

			Response.write "<script language='javascript'>"
			Response.write "parent.location.href='find_pw_true.asp';"
			Response.write "</script>"
			Response.End

		ElseIf Ret = "0" Then
			Response.write "<script language='javascript'>"
			Response.write "parent.location.href='find_idpw_false.asp#tab2';"
			Response.write "</script>"
			Response.End
		End If
	End If

	CloseDbConnection() '데이터베이스 클로즈

	'########################################################
	'# 회원 비밀번호 찾기 SMTP 보내기 Function START
	'########################################################

	'File Templete 파일을 읽어서 문자로 반환
	function read_file_temp(filepath)
		Dim rStr, f
		set fso = Server.CreateObject("Scripting.FileSystemObject")

		if fso.FileExists(filepath) then
			set f = fso.OpenTextFile (filepath, 1)
			rStr = f.ReadAll
			set f = nothing
		end if

		set fso = nothing
		read_file_temp = rStr
	end function

	Sub SendMail(mTo, mToName, mFrom, mFromName, mPwd)

	  Dim objMail

		mSubject = "[한국민속촌] "&mToName&"님의 임시비밀번호를 알려드립니다."

		h_msg = read_file_temp("E:\www\edm\edm_findpw.html")
		h_msg = Replace(h_msg, "|TONAME|", mToName)
		h_msg = Replace(h_msg, "|PWD|", mPwd)

		Dim iMsg
		Dim iConf
		Dim Flds
		Dim strHTML
		Const cdoSendUsingPort = 1 '1:로컬, 2:외부 smtp
		set iMsg = CreateObject("CDO.Message")
		set iConf = CreateObject("CDO.Configuration")
		Set Flds = iConf.Fields
		Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = cdoSendUsingPort
		Flds.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25  '포트번호

		Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
		Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10

		Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") =  "" 'ID
		Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") =  "" '암호


		Flds.Update
		Set iMsg.Configuration = iConf

		iMsg.To = mTo 'ToDo: Enter a valid email address.
		'iMsg.From = mFrom 'ToDo: Enter a valid email address.
		iMsg.From = mFromName&"<"&mFrom&">" 'ToDo: Enter a valid email address.
		iMsg.Subject = mSubject
		iMsg.HTMLBody = h_msg  '// HTML 제목 깨짐 발생..

		iMsg.BodyPart.Charset="euc-kr"
		iMsg.HTMLBodyPart.Charset="euc-kr"
		iMsg.Send

		'Response.write h_msg
		'Response.end

		Set iMsg = Nothing
		Set iConf = Nothing
		Set Flds = Nothing

	End Sub

	'########################################################
	'# 회원 비밀번호 찾기 SMTP 보내기 Function END
	'########################################################
%>