<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/lib/encrypt_class.asp"-->
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
	Dim email1 : email1					= RP(Request("email1"))
	Dim email2 : email2					= LCase(RP(Request("email2")))
	'Dim email3 : email3				= RP(Request("email3"))
	Dim email3 : email3					= EmailDomainSelectFilter(email2)
	Dim email : email					= email1&"@"&email2
	Dim ip : ip							= Trim(Request.ServerVariables("REMOTE_HOST"))

	'#######################################################
	'# HTML FORM값 가져오기 END
	'#######################################################

	'이름 한글/영문 체크
	If Word_check(name,pattern6) = False Then f_AlertBack("잘못된 입력값으로 인해 접근이 차단 되었습니다.")
	'이메일 영문/숫자 체크 => 이메일 아이디에 (-,_)등이 있는 경우 처리하기 위해 주석
	'If Word_check(email1,pattern5) = False Then f_AlertBack("잘못된 입력값으로 인해 접근이 차단 되었습니다.")

'	Response.write gubun & "<br>"
'	Response.write name & "<br>"
'	Response.write email1 & "<br>"
'	Response.write email2 & "<br>"
'	Response.write email3 & "<br>"
'	Response.write email & "<br>"
'	Response.write ip & "<br>"
'	Response.End

	If gubun = "" Or name = "" Or email1 = "" Or email2 = "" Then 
		Call f_AlertURL("비정상 접속 입니다.\n\n문제가 있으시면 관리자에게 문의해주세요.", "join.asp")
	End If
	
	'2015/03/06
	'이메일 도메인 선택하지 않고 직접입력시 email3 부분 체크 못하는 부분 처리 함수
	Function EmailDomainSelectFilter(getValues)
		Dim arrList, arrItem, i

		arrList = "naver.com,chol.com,dreamwiz.com,empal.com,freechal.com,gmail.com,hanafos.com,hanmail.net,hanmir.com,hitel.net,hotmail.com,korea.com,lycos.co.kr,nate.com,netian.com,paran.com,yahoo.com,yahoo.co.kr,samsung.com"
		arrItem = Split(arrList,",") 

		For i = 0 To UBound(arrItem)
			If Trim(arrItem(i)) = getValues Then
				EmailDomainSelectFilter = getValues
				Exit For
			Else
				EmailDomainSelectFilter = ""				
			End If
		Next
	End Function

	Call OpenDbConnection() '데이터베이스 오픈

	'#######################################################
	'# 이메일 인증을 통한 회원가입 여부 체크 START
	'#######################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd								
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_MEMBER_EMAIL_AUTH_YN_CHECK"
		.CommandType = adCmdStoredProc
		'@EMAIL
		.Parameters.Append .CreateParameter("@EMAIL",adVarChar,adParamInput,100, email)
		.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
		.Execute
		Ret = .Parameters("@RET")
	End With
	Set Rs = objCmd.Execute
	Set objCmd = Nothing

	'#######################################################
	'# 이메일 인증을 통한 회원가입 여부 체크 END
	'#######################################################

	If Ret = "1" Then
		Response.Write "<script language='javascript'>"
		Response.Write " alert('이미 회원가입 본인인증 메일이 발송 되었습니다.\n\n본인인증 메일 확인후 회원가입을 완료해 주세요.');"
		'Response.Write " parent.location.href='http://www.koreanfolk.co.kr/';"
		Response.Write "</script>"
		Response.End	
	End If 

	'#######################################################
	'# 이메일 사용유무 체크 START
	'#######################################################
	
	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd								
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_CHECK_MEMBER_EMAIL_DUP" '실제 저장프로시저
		'.CommandText = "SP_HUGO7_CHECK_MEMBER_EMAIL_DUP_TEMP" '테스트 저장 프로시저
		.CommandType = adCmdStoredProc
		'@EMAIL
		.Parameters.Append .CreateParameter("@EMAIL",adVarChar,adParamInput,100, email)
		.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
		.Execute
		Ret = .Parameters("@RET")
	End With
	Set Rs = objCmd.Execute
	Set objCmd = Nothing

	'#######################################################
	'# 이메일 사용유무 체크 END
	'#######################################################

	If Ret = "1" Then

		'########################################################
		'# 본인인증 이메일 인증코드 생성 START
		'########################################################

		authcode = getStrRandom(24)		'본인인증 이메일 인증코드 생성
		
		'########################################################
		'# 본인인증 이메일 인증코드 생성 END
		'########################################################

		'########################################################
		'# 본인인증 이메일 프로시저 START
		'########################################################		

		Conn.BeginTrans() '트랜잭션 시작
		dberr = 0

		'########################################################
		'# TBL_EMAIL_AUTH Insert Start
		'########################################################

		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "SP_HUGO7_TBL_EMAIL_AUTH_INSERT"
			.CommandType = adCmdStoredProc
			.Parameters.Append .CreateParameter("@GUBUN",adVarChar,adParamInput,5, gubun)
			.Parameters.Append .CreateParameter("@NAME",adVarChar,adParamInput,30, name)
			.Parameters.Append .CreateParameter("@BIRTHYEAR",adVarChar,adParamInput,4, birthyear)
			.Parameters.Append .CreateParameter("@BIRTHMONTH",adVarChar,adParamInput,2, birthmonth)
			.Parameters.Append .CreateParameter("@BIRTHDAY",adVarChar,adParamInput,2, birthday)
			.Parameters.Append .CreateParameter("@EMAIL1",adVarChar,adParamInput,50, email1)
			.Parameters.Append .CreateParameter("@EMAIL2",adVarChar,adParamInput,50, email2)
			.Parameters.Append .CreateParameter("@EMAIL3",adVarChar,adParamInput,50, email3)
			.Parameters.Append .CreateParameter("@AUTHCODE",adVarChar,adParamInput,50, authcode)
			.Parameters.Append .CreateParameter("@IP",adVarChar,adParamInput,15, ip)			
			.Execute
		End With
		Set objCmd = Nothing

		'########################################################
		'# TBL_EMAIL_AUTH Insert END
		'########################################################
		
		dberr = dberr + Conn.Errors.Count

		If dberr > 0 Then
			Conn.RollbackTrans
			Response.Write "<script language='javascript'>"
			Response.Write " alert('["& Err.Description &"] 정보를 입력하는 동안 에러가 발생했습니다.');"
			Response.Write " history.back(-1);"
			Response.Write "</script>"
			Response.End
		Else 
			Conn.CommitTrans
			Call CloseDbConnection() '데이터베이스 클로즈

			'########################################################
			'# 본인인증 이메일 보내기 START
			'########################################################
			
			Dim mFrom, mFromName, mTo, mToName, myLink, strLink
						
			strLink = "https://www.koreanfolk.co.kr/mobile/member/Auth_Gateway.asp?email="& email &"&authcode="& authcode &"&gubun="& gubun
			
			mTo			= email
			mToName		= name
			'mFrom		= "hugo7@i-seesaw.com"
			mFrom		= "admin@ikfv.co.kr"
			mFromName	= "한국민속촌"
			myLink		= strLink

			'메일발송 프로시져
			Call SendMail(mTo, mToName, mFrom, mFromName, myLink)		

			'########################################################
			'# 본인인증 이메일 보내기 END
			'########################################################

			Response.Write "<script language='javascript'>"
			Response.Write " alert('회원가입 본인인증 메일이 발송 되었습니다.');"
			Response.Write " parent.location.href='http://www.koreanfolk.co.kr/mobile/';"
			Response.Write "</script>"
			Response.End	
		End If		

		'########################################################
		'# 본인인증 이메일 프로시저 END
		'########################################################		

	ElseIf Ret = "0" Then

		Response.Write "<script language='javascript'>"
		Response.Write "alert('동일한 이메일 계정으로 이미 가입되어 있습니다.\n\n확인후 로그인 해주세요.');"
		Response.Write "parent.location.href='http://www.koreanfolk.co.kr/mobile/member/login.asp';"
		Response.Write "</script>"
		Response.End

	End If

	'########################################################
	'# 본인인증 이메일 SMTP 보내기 Function 
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

	Sub SendMail(mTo, mToName, mFrom, mFromName, myLink)

	  Dim objMail
		
		mSubject = "[한국민속촌] "&mToName&"님의 회원가입 본인인증 메일 입니다."
		
		h_msg = read_file_temp("E:\www\edm\edm_auth.html")
		h_msg = Replace(h_msg, "|TONAME|", mToName)
		h_msg = Replace(h_msg, "|MYLINK|", myLink)
		'h_msg = Replace(h_msg, "|EDM_BANNER|", mBanner)

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
		iMsg.From = mFrom 'ToDo: Enter a valid email address.
		iMsg.Subject = mSubject
		iMsg.HTMLBody = h_msg  '// HTML 제목 깨짐 발생..

		iMsg.BodyPart.Charset="euc-kr"
		iMsg.HTMLBodyPart.Charset="euc-kr"
		iMsg.Send

		'Response.write h_msg

		Set iMsg = Nothing
		Set iConf = Nothing
		Set Flds = Nothing 

	End Sub

	'########################################################
	'# 본인인증 이메일 SMTP 보내기 Function 
	'########################################################
%>