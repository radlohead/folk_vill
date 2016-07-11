<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/lib/encrypt_class.asp"-->
<%	
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " parent.location.href='/mobile/member/login.asp?RtnURL=/mobile/customer/voice_form.asp';"
		Response.write "</script>"
		Response.End
	End If	
	
	'#######################################################
	'# FORM값 가져오기 START
	'#######################################################
	
	Dim code : code				= RP(Request("code"))
	Dim id : id					= session("id")
	Dim name : name				= session("name")	
	
	'전화번호
	Dim phone1 : phone1			= ""
	Dim phone2 : phone2			= ""
	Dim phone3 : phone3			= ""

	Dim title : title			= SimpleSQLInjectionXSSFilter(Request("title"))
	Dim content : content		= SimpleSQLInjectionXSSFilter(Request("content"))
	Dim ip : ip					= Request.ServerVariables("REMOTE_HOST")

	'#######################################################
	'# FORM값 가져오기 END
	'#######################################################

	Call OpenDbConnection() '데이터베이스 열기

		'이메일 정보 가져오기
		strSQL = "SELECT EMAIL FROM TBL_MEMBER WHERE UID = '" & session("id") & "'"
		Set Rs = Conn.Execute(strSQL)

		If Not(Rs.BOF And Rs.EOF) Then
			email = Rs("EMAIL")
		Else
			email = ""
		End If

	Call RsClose()
	Call CloseDbConnection()

'	Response.write code & "<br>"
'	Response.write id & "<br>"
'	Response.write name & "<br>"
'	Response.write email & "<br>"
'	Response.write content & "<br>"
'	Response.write ip & "<br>"
'	Response.End

	Call OpenDbConnection() '데이터베이스 오픈	
	Conn.BeginTrans() '트랜잭션 시작

	'#######################################################
	'# TBL_VOIC TABLE Insert START
	'#######################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_VOICE_INSERT"
		.CommandType = adCmdStoredProc

		'기본정보
		.Parameters.Append .Createparameter("@CODE",adVarChar,adparamInput,5,code)
		.Parameters.Append .Createparameter("@UID",adVarChar,adparamInput,20,id)
		.Parameters.Append .Createparameter("@NAME",adVarChar,adparamInput,30,name)
		.Parameters.Append .Createparameter("@EMAIL",adVarchar,adparamInput,50,email)
		.Parameters.Append .CreateParameter("@PHONE1",adVarChar,adParamInput,3, phone1)
		.Parameters.Append .CreateParameter("@PHONE2",adVarChar,adParamInput,4, phone2)
		.Parameters.Append .CreateParameter("@PHONE3",adVarChar,adParamInput,4, phone3)
		.Parameters.Append .Createparameter("@TITLE",adVarchar,adparamInput,200,title)
		.Parameters.Append .Createparameter("@CONTENTS",adVarchar,adparamInput,2147483647,content)
		.Parameters.Append .Createparameter("@FILES",adVarChar,adparamInput,50,"")
		.Parameters.Append .Createparameter("@IP",adVarchar,adparamInput,15,ip)
		
		On Error Resume Next		
		.Execute ,,adExecuteNoRecords

	End With
	Set objCmd = Nothing

	'#######################################################
	'# TBL_VOIC TABLE Insert END
	'#######################################################

	If Conn.Errors.Count <> 0 Then	
		Conn.RollbackTrans
		Call CloseDbConnection
		Response.Write "<script language='javascript'>"
		Response.Write " alert('정보를 입력하는 동안 에러가 발생했습니다.');"
		Response.Write "</script>"
		Response.End
	Else
		Conn.CommitTrans
		Call CloseDbConnection

		'#######################################################
		'# 칭찬/신고/제안 내용 이메일 전송 시작
		'#######################################################
		Dim mFrom, mFromName, mTo, mToName, mTitle, mContents, mAnswer, mGubun

		mTo			= "admin@ikfv.co.kr"
		mToName		= "한국민속촌"
		mTo2		= "kfv_cust@ikfv.co.kr" '2014/01/24 한국민속촌 임원그룹 메일 추가
		mToName2	= "한국민속촌"	
		mFrom		= email
		mFromName	= name
		mTitle		= title
		mContents	= Replace(content,vblf,"<br>") '에디터 사용하지 않을때 변환
		mAnswer		= ""
		mGubun		= ""

		'메일발송 프로시저
		Call SendMail(mTo, mToName, mFrom, mFromName, mTitle, mContents, mAnswer, mGubun)	

		'#######################################################
		'# 칭찬/신고/제안 내용 이메일 전송 종료
		'#######################################################

		Response.Write "<script language='javascript'>"
		Response.Write " alert('칭찬/신고/제안 내용이 등록 되었습니다.\n\n답변은 마이페이지에서 확인하실 수 있습니다.');"
		Response.Write " parent.location.href='/mobile/customer/faq.asp';"
		Response.Write "</script>"	
		Response.End

	End If

	'File Templete 파일을 읽어서 문자로 반환
	Function read_file_temp(filepath)

		Dim rStr, f
		set fso = Server.CreateObject("Scripting.FileSystemObject")

		if fso.FileExists(filepath) then
			set f = fso.OpenTextFile (filepath, 1)
			rStr = f.ReadAll
			set f = nothing
		end if

		set fso = nothing
		read_file_temp = rStr

	End Function

	Sub SendMail(mTo, mToName, mFrom, mFromName, mTitle, mContents, mAnswer, mGubun)

		Dim objMail
		
		mSubject = mFromName & "님의 칭찬/신고/제안 내용입니다."
		
		h_msg = read_file_temp("E:\www\edm\edm_voice.html")

		h_msg = Replace(h_msg, "|TONAME|", mFromName)
		h_msg = Replace(h_msg, "|TITLE|", mTitle)
		h_msg = Replace(h_msg, "|CONTENTS|", mContents)

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
		
		'iMsg.To		= mTo 'ToDo: Enter a valid email address.
		
		iMsg.To			= mToName&"<"&mTo&">;"&mToName2&"<"&mTo2&">"
		'iMsg.From		= mFrom							' ToDo: Enter a valid email address.
		iMsg.From		= mFromName&"<"&mFrom&">"		' ToDo: Enter a valid email address.
		iMsg.Subject	= mSubject
		iMsg.HTMLBody	= h_msg							' HTML 제목 깨짐 발생..

		iMsg.BodyPart.Charset="euc-kr"
		iMsg.HTMLBodyPart.Charset="euc-kr"
		iMsg.Send

		'Response.write h_msg
		'Response.End

		Set iMsg = Nothing
		Set iConf = Nothing
		Set Flds = Nothing 

	End Sub
%>