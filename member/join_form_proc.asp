<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/lib/encrypt_class.asp"-->
<%
	'#######################################################
	'# FORM값 가져오기 START
	'#######################################################

	Dim gubun		: gubun				= RP(Request("gubun"))		// 14세미만 >> C
	Dim id			: id				= RP(Request("id"))
	Dim password	: password			= RP(Request("password1"))
	Dim name		: name				= RP(Request("name"))
	Dim gender		: gender			= RP(Request("gender"))
	Dim cname		: cname				= RP(Request("cname"))
	Dim csex		: csex				= RP(Request("csex"))


	If gender = "1" Or csex = "남" Then
		gender = "M"
	Else
		gender = "F"
	End If

	If name = "" Then
		name = cname
	End If

	Dim birthyear		: birthyear		= RP(Request("birthyear"))
	Dim birthmonth		: birthmonth	= RP(Request("birthmonth"))
	Dim birthday		: birthday		= RP(Request("birthday"))
	Dim birth_umyang	: birth_umyang	= RP(Request("birth_umyang"))

	If Len(birthmonth) < 2 Then
		birthmonth = "0" & Cstr(birthmonth)
	Else
		birthmonth = Cstr(birthmonth)
	End If

	If Len(birthday) < 2 Then
		birthday = "0" & Cstr(birthday)
	Else
		birthday = Cstr(birthday)
	End If

	'주소 정보
	Dim zipcode1 : zipcode1				= RP(Request("zipcode1"))
	Dim zipcode2 : zipcode2				= RP(Request("zipcode2"))
	Dim zipcode : zipcode				= zipcode1&"-"&zipcode2
	Dim address : address				= RP(Request("address"))
	Dim address_detail : address_detail	= RP(Request("address_detail"))

	'전화번호
	Dim phone1 : phone1					= RP(Request("phone1"))
	Dim phone2 : phone2					= RP(Request("phone2"))
	Dim phone3 : phone3					= RP(Request("phone3"))

	If (phone1 <> "" And phone2 <> "" And phone3 <> "") Then
		phone1 = phone1
		phone2 = phone2
		phone3 = phone3
	Else
		phone1 = ""
		phone2 = ""
		phone3 = ""
	End If

	'휴대폰
	Dim mobile1 : mobile1				= RP(Request("mobile1"))
	Dim mobile2 : mobile2				= RP(Request("mobile2"))
	Dim mobile3 : mobile3				= RP(Request("mobile3"))

	If mobile3 = "" Then
		If Len(mobile2) = 7 Then
			mobile2 = Left(mobile2, 3)
			mobile3 = Right(mobile2, 4)
		Else
			mobile2 = Left(mobile2, 4)
			mobile3 = Right(mobile2, 4)
		End If
	End If

	Dim mobile : mobile					= mobile1&mobile2&mobile3
	'이메일
	Dim email1 : email1					= RP(Request("email1"))
	Dim email2 : email2					= RP(Request("email2"))
	Dim email3 : email3					= RP(Request("email3"))

	Dim email_sel1

	If email3 = "" Then
		email_sel1 = "2"
	Else
		email_sel1 = "1"
	End If

	Dim email  : email					= email1&"@"&email2
	Dim mailling : mailling				= RP(Request("mailling"))
	Dim sms : sms						= RP(Request("sms"))
	Dim ipaddress : ipaddress			= RP(Request.ServerVariables("REMOTE_HOST"))
	Dim req_auth : req_auth				= RP(Request("auth"))			// 모바일여부 >> mobile
	Dim IPIN_DI	: IPIN_DI				= Nvl(Request("ipin_di"), "")

	'14미만 가입 추가 정보
	Dim pname : pname					= RP(Request("pname"))
	Dim pgender : pgender				= RP(Request("pgender"))
	Dim pbirthyear : pbirthyear			= RP(Request("pbirthyear"))
	Dim pbirthmonth : pbirthmonth		= RP(Request("pbirthmonth"))
	Dim pbirthday : pbirthday			= RP(Request("pbirthday"))
	Dim pmobile1 : pmobile1				= RP(Request("pmobile1"))
	Dim pmobile2 : pmobile2				= RP(Request("pmobile2"))
	Dim pmobile3 : pmobile3				= RP(Request("pmobile3"))

	If pmobile3 = "" Then
		If Len(pmobile2) = 7 Then
			pmobile2 = Left(pmobile2, 3)
			pmobile3 = Right(pmobile2, 4)
		Else
			pmobile2 = Left(pmobile2, 4)
			pmobile3 = Right(pmobile2, 4)
		End If
	End If

	Dim pmobile : pmobile				= pmobile1&pmobile2&pmobile3

	If pgender <> "" Then
		If pgender = "1" Then
			pgender = "M"
		Else
			pgender = "F"
		End If
	End If

	'#######################################################
	'# FORM값 가져오기 END
	'#######################################################

	'아이디 길이 체크
	If Len(id) > 14 Then f_AlertEnd("아이디 길이가 잘못 되었습니다.")
	'비밀번호 길이 체크
	If Len(password) > 14 Then f_AlertEnd("비밀번호 길이가 잘못 되었습니다.")

'	Response.write gubun & "<br>"
'	Response.write id & "<br>"
'	Response.write password & "<br>"
'	Response.write name & "<br>"
'	Response.write gender & "<br>"
'	Response.write birthyear & "<br>"
'	Response.write birthmonth & "<br>"
'	Response.write birthday & "<br>"
'	Response.write birth_umyang & "<br>"
'	Response.write zipcode & "<br>"
'	Response.write address & "<br>"
'	Response.write address_detail & "<br>"
'	Response.write phone1 & "<br>"
'	Response.write phone2 & "<br>"
'	Response.write phone3 & "<br>"
'	Response.write mobile1 & "<br>"
'	Response.write mobile2 & "<br>"
'	Response.write mobile3 & "<br>"
'	Response.write mobile & "<br>"
'	Response.write email1 & "<br>"
'	Response.write email2 & "<br>"
'	Response.write email3 & "<br>"
'	Response.write email_sel1 & "<br>"
'	Response.write email & "<br>"
'	Response.write mailling & "<br>"
'	Response.write sms & "<br>"
'	Response.write ipaddress & "<br>"
'	Response.write req_auth & "<p>"
'	Response.write pname & "<br>"
'	Response.write pgender & "<br>"
'	Response.write pbirthyear & "<br>"
'	Response.write pbirthmonth & "<br>"
'	Response.write pbirthday & "<br>"
'	Response.write pmobile1 & "<br>"
'	Response.write pmobile2 & "<br>"
'	Response.write pmobile3 & "<br>"
'	Response.write pmobile & "<br>"
'	Response.End

	'########################################################
	'# 비밀번호 암호화 START
	'########################################################

	Set XTEncrypt = new XTclsEncrypt
	'response.write "md5"&XTEncrypt.MD5(password) & "<br>"
	'response.write "sha256"&XTEncrypt.SHA256(password) & "<br>"
	'response.write "sha-md5"&XTEncrypt.SHA256(XTEncrypt.MD5(password)) & "<br>"
	'response.write "md4-sha"&XTEncrypt.MD5(XTEncrypt.SHA256(password)) & "<br>"
	password = XTEncrypt.SHA256(password)
	Set XTEncrypt = nothing

	'Response.write "password=="&password
	'Response.End

	'########################################################
	'# 비밀번호 암호화 END
	'########################################################

	Call OpenDbConnection() '데이터베이스 오픈

	'########################################################
	'# 아이디 사용유무 체크 프로시저 START
	'########################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_CHECK_MEMBERID_DUP"	 '아이디유무 체크
		.CommandType = adCmdStoredProc
		'@UID
		.Parameters.Append .CreateParameter("@UID",adVarChar,adParamInput,20, id)
		.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
		.Execute
		Ret = .Parameters("@RET")					'(유:0, 무:1)
	End With
	Set objCmd = Nothing

	If Ret = 0 then
		'Call f_AlertBack("이미 사용중인 아이디 입니다.\n\n아이디 중복 체크를 하신후 가입해 주세요.")
		Response.write "<script language='javascript'>"
		Response.write " alert('이미 사용중인 아이디 입니다.\n\n아이디 중복 체크를 하신후 가입해 주세요.');"
		Response.write "</script>"
		Response.End
	End If

	'########################################################
	'# 아이디 사용유무 체크 프로시저 END
	'########################################################

	'#######################################################
	'# 이메일 사용유무 체크 START
	'#######################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_CHECK_MEMBEREMAIL_DUP"
		.CommandType = adCmdStoredProc
		'@EMAIL
		.Parameters.Append .CreateParameter("@EMAIL",adVarChar,adParamInput,100, email)
		.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
		.Execute
		Ret = .Parameters("@RET")
	End With
	Set objCmd = Nothing

	If Ret = 0 then
		'Call f_AlertBack("이미 사용중인 E-mail 입니다.\n\n아이디 중복 체크를 하신후 가입해 주세요.")
		Response.write "<script language='javascript'>"
		Response.write " alert('이미 사용중인 메일주소 입니다.\n\n메일주소를 확인 하신후 가입해 주세요.');"
		Response.write "</script>"
		Response.End
	End If

	'#######################################################
	'# 이메일 사용유무 체크 END
	'#######################################################

	If req_auth = "ipin" Then ' 아이핀 인증일 경우
		'########################################################
		'# 아이핀 인증일 경우 가입여부 체크 프로시저 START
		'########################################################

		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "SP_HUGO7_MEMBER_IPINCHK"		'아이핀정보 유무 체크
			.CommandType = adCmdStoredProc
			'@IPIN_DI
			.Parameters.Append .CreateParameter("@IPIN_DI",adVarChar,adParamInput,100, IPIN_DI)
			.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
			.Execute
			Ret = .Parameters("@RET")					'(유:0, 무:1)
		End With
		Set objCmd = Nothing

		If Ret = 0 then
			'Call f_AlertBack("해당 정보로 이미 가입되어 있습니다.\n\n문제가 있으시면 관리자에게 문의해주세요.")
			Response.write "<script language='javascript'>"
			Response.write " alert('해당 정보로 이미 가입되어 있습니다.\n\n문제가 있으시면 관리자에게 문의해주세요.');"
			Response.write "</script>"
			Response.End
		End If

		'########################################################
		'# 아이핀 인증일 경우 가입여부 체크 프로시저 END
		'########################################################
	ElseIf req_auth = "email" Then '이메일 인증일 경우
		'########################################################
		'# 이메일 인증일 경우 가입여부 체크 프로시저 START
		'########################################################

		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "SP_HUGO7_CHECK_MEMBER_EMAILCHK"
			.CommandType = adCmdStoredProc
			'@NAME, @EMAIL
			.Parameters.Append .CreateParameter("@NAME",adVarChar,adParamInput,20, name)
			.Parameters.Append .CreateParameter("@EMAIL",adVarChar,adParamInput,100, email)
			.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
			.Execute
			Ret = .Parameters("@RET")
		End With
		Set Rs = objCmd.Execute
		Set objCmd = Nothing

		If Ret = 0 then
			'Call f_AlertBack("해당 정보로 이미 가입되어 있습니다.\n\n문제가 있으시면 관리자에게 문의해주세요.")
			Response.write "<script language='javascript'>"
			Response.write " alert('해당 정보로 이미 가입되어 있습니다.\n\n문제가 있으시면 관리자에게 문의해주세요.');"
			Response.write "</script>"
			Response.End
		End If

		'########################################################
		'# 이메일 인증일 경우 가입여부 체크 프로시저 END
		'########################################################
	ElseIf req_auth = "mobile" Then '휴대폰 인증일 경우
		'########################################################
		'# 휴대폰 인증일 경우 가입여부 체크 프로시저 START
		'########################################################

		'14세미만회원가입일 경우 부모 휴대폰 번호로 가입여부 체크
		If gubun = "C" Then
			Set objCmd = Server.CreateObject("ADODB.Command")
			With objCmd
				.ActiveConnection = Conn
				.CommandText = "SP_HUGO7_CHECK_MEMBER_PMOBILECHK"
				.CommandType = adCmdStoredProc
				'@NAME, @PMOBILE
				.Parameters.Append .CreateParameter("@NAME",adVarChar,adParamInput,20, name)
				.Parameters.Append .CreateParameter("@PMOBILE",adVarChar,adParamInput,12, pmobile)
				.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
				.Execute
				Ret = .Parameters("@RET")
			End With
			Set Rs = objCmd.Execute
			Set objCmd = Nothing
		'일반회원,외국인회원일 경우 휴대폰 번호로 가입여부 체크
		Else
			Set objCmd = Server.CreateObject("ADODB.Command")
			With objCmd
				.ActiveConnection = Conn
				.CommandText = "SP_HUGO7_CHECK_MEMBER_MOBILECHK"
				.CommandType = adCmdStoredProc
				'@NAME, @MOBILE
				.Parameters.Append .CreateParameter("@NAME",adVarChar,adParamInput,20, name)
				.Parameters.Append .CreateParameter("@MOBILE",adVarChar,adParamInput,12, mobile)
				.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
				.Execute
				Ret = .Parameters("@RET")
			End With
			Set Rs = objCmd.Execute
			Set objCmd = Nothing
		End If

		If Ret = 0 then
			'Call f_AlertBack("해당 정보로 이미 가입되어 있습니다.\n\n문제가 있으시면 관리자에게 문의해주세요.")
			Response.write "<script language='javascript'>"
			Response.write " alert('해당 정보로 이미 가입되어 있습니다.\n\n문제가 있으시면 관리자에게 문의해주세요.');"
			Response.write "</script>"
			Response.End
		End If

		'########################################################
		'# 휴대폰 인증일 경우 가입여부 체크 프로시저 END
		'########################################################
	Else
		Response.write "<script language='javascript'>"
		Response.write " alert('비 정상 접속 시도 입니다. 다시 확인해 주세요.');"
		Response.write " parent.location.href='/mobile/member/join.asp';"
		Response.write "</script>"
		Response.End
	End If

	Call CloseDbConnection() '데이터베이스 클로즈

	Call OpenDbConnection() '데이터베이스 오픈
	Conn.BeginTrans() '트랜잭션 시작

	'########################################################
	'# TBL_MEMBER Insert START
	'########################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_MEMBER_INSERT2"
		.CommandType = adCmdStoredProc
		'기본정보
		.Parameters.Append .CreateParameter("@GUBUN",adVarChar,adParamInput,5, gubun)
		.Parameters.Append .CreateParameter("@UID",adVarChar,adParamInput,20, id)
		.Parameters.Append .CreateParameter("@PWD",adVarChar,adParamInput,100, password)
		.Parameters.Append .CreateParameter("@NAME",adVarChar,adParamInput,30, name)
		.Parameters.Append .CreateParameter("@GENDER",adChar,adParamInput,1, gender)
		.Parameters.Append .CreateParameter("@BIRTHYEAR",adVarChar,adParamInput,4, birthyear)
		.Parameters.Append .CreateParameter("@BIRTHMONTH",adVarChar,adParamInput,2, birthmonth)
		.Parameters.Append .CreateParameter("@BIRTHDAY",adVarChar,adParamInput,2, birthday)
		.Parameters.Append .CreateParameter("@BIRTHSEL",adChar,adParamInput,1, birth_umyang)
		.Parameters.Append .CreateParameter("@ZIP",adVarChar,adParamInput,7, zipcode)
		.Parameters.Append .CreateParameter("@ADDRESS",adVarChar,adParamInput,100, address)
		.Parameters.Append .CreateParameter("@ADDRESS_DETAIL",adVarChar,adParamInput,100, address_detail)
		.Parameters.Append .CreateParameter("@PHONE1",adVarChar,adParamInput,3, phone1)
		.Parameters.Append .CreateParameter("@PHONE2",adVarChar,adParamInput,4, phone2)
		.Parameters.Append .CreateParameter("@PHONE3",adVarChar,adParamInput,4, phone3)
		.Parameters.Append .CreateParameter("@MOBILE1",adVarChar,adParamInput,3, mobile1)
		.Parameters.Append .CreateParameter("@MOBILE2",adVarChar,adParamInput,4, mobile2)
		.Parameters.Append .CreateParameter("@MOBILE3",adVarChar,adParamInput,4, mobile3)
		.Parameters.Append .CreateParameter("@EMAIL",adVarChar,adParamInput,50, email)
		.Parameters.Append .CreateParameter("@EMAILSEL",adChar,adParamInput,1, email_sel1)
		.Parameters.Append .CreateParameter("@MAILING",adChar,adParamInput,1, mailling)
		.Parameters.Append .CreateParameter("@SMS",adChar,adParamInput,1, sms)
		.Parameters.Append .CreateParameter("@IP",adVarChar,adParamInput,15, ipaddress)
		'14세미만 보호자정보
		.Parameters.Append .CreateParameter("@PNAME",adVarChar,adParamInput,30, pname)
		.Parameters.Append .CreateParameter("@PGENDER",adChar,adParamInput,1, pgender)
		.Parameters.Append .CreateParameter("@PBIRTHYEAR",adVarChar,adParamInput,4, pbirthyear)
		.Parameters.Append .CreateParameter("@PBIRTHMONTH",adVarChar,adParamInput,2, pbirthmonth)
		.Parameters.Append .CreateParameter("@PBIRTHDAY",adVarChar,adParamInput,2, pbirthday)
		.Parameters.Append .CreateParameter("@PMOBILE1",adVarChar,adParamInput,3, pmobile1)
		.Parameters.Append .CreateParameter("@PMOBILE2",adVarChar,adParamInput,4, pmobile2)
		.Parameters.Append .CreateParameter("@PMOBILE3",adVarChar,adParamInput,4, pmobile3)
		.Parameters.Append .CreateParameter("@AUTH",adVarChar,adParamInput,10, req_auth)
		.Parameters.Append .CreateParameter("@IPIN_DI",adVarChar,adParamInput,100, IPIN_DI)

		On Error Resume Next
		.Execute
	End With
	Set objCmd = Nothing

	'########################################################
	'# TBL_MEMBER Insert END
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
		Response.Write "<form name='form1' method='post' action='https://www.koreanfolk.co.kr/mobile/member/join_finish.asp' target='_parent'>"
		Response.Write "<input type='hidden' name='gubun' value="&gubun&">"
		Response.Write "<input type='hidden' name='name' value="&name&">"
		Response.Write "<input type='hidden' name='id' value="&id&">"
		Response.Write "<input type='hidden' name='mobile1' value="&mobile1&">"
		Response.Write "<input type='hidden' name='mobile2' value="&mobile2&">"
		Response.Write "<input type='hidden' name='mobile3' value="&mobile3&">"
		Response.Write "<input type='hidden' name='email' value="&email&">"
		Response.Write "<input type='hidden' name='pname' value="&pname&">"
		Response.Write "<input type='hidden' name='pmobile1' value="&pmobile1&">"
		Response.Write "<input type='hidden' name='pmobile2' value="&pmobile2&">"
		Response.Write "<input type='hidden' name='pmobile3' value="&pmobile3&">"
		Response.Write "<input type='hidden' name='pk_fuid' value='D1FCDB0A-5C11-43DA-81C7-0FFF0678DE55'>"
		Response.Write "</form>"
		Response.Write "<script language='javascript'>"
		'Response.Write " alert('한국민속촌 회원가입이 완료 되었습니다.');"
		Response.Write " document.form1.submit();"
		Response.Write "</script>"
		Response.End
	End If
%>