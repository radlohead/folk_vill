<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
	'#######################################################
	'# HTML FORM값 가져오기 START
	'#######################################################

	Dim email : email			= Trim(Request("email"))
	Dim authcode : authcode		= Trim(Request("authcode"))
	Dim gubun : gubun			= Trim(Request("gubun"))

	'Response.write email & "<br>"
	'Response.write authcode & "<br>"
	'Response.write gubun & "<br>"
	'Response.End

	If email = "" Or authcode = "" Then 
		Call f_AlertURL("비정상 접속 입니다.\n\n문제가 있으시면 관리자에게 문의해주세요.", "http://www.koreanfolk.co.kr/mobile/member/join.asp")
	End If 

	Call OpenDbConnection() '데이터베이스 오픈

	'######################################################################
	' 이메일 인증 정보 체크 START
	'######################################################################

	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd								
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_EMAIL_AUTH_CHECK"
		.CommandType = adCmdStoredProc
		'@EMAIL, @AUTHCODE
		.Parameters.Append .CreateParameter("@EMAIL",adVarChar,adParamInput,50, email)
		.Parameters.Append .CreateParameter("@AUTHCODE",adVarChar,adParamInput,50, authcode)
		.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
		.Execute
		Ret = .Parameters("@RET")
	End With
	Set Rs = objCmd.Execute
	Set objCmd = Nothing

	'######################################################################
	' 이메일 인증 정보 체크 END
	'######################################################################

	If Ret = "1" Then
		'Response.CharSet="euc-kr"

		'이메일 인증후 회원가입 여부 확인
		Dim flag : flag =  Trim(Rs("FLAG"))

		If flag = "N" Then
			If gubun = "G" Then 
				Response.Write ("<form name='form1' method='post' action='/mobile/member/join_email_general_form.asp'>")
			ElseIf gubun = "C" Then
				Response.Write ("<form name='form1' method='post' action='/mobile/member/join_email_child_form.asp'>")
			Else
				Response.Write ("<form name='form1' method='post' action='/mobile/member/join_email_foreigner_form.asp'>")
			End If 
			Response.Write ("<input type='hidden' name='param_r1' value='email'>")
			Response.Write ("<input type='hidden' name='gubun' value="&gubun&">")
			Response.Write ("<input type='hidden' name='name' value="&Trim(Rs("NAME"))&">")
			Response.Write ("<input type='hidden' name='birthyear' value="&Trim(Rs("BIRTHYEAR"))&">")
			Response.Write ("<input type='hidden' name='birthmonth' value="&Trim(Rs("BIRTHMONTH"))&">")
			Response.Write ("<input type='hidden' name='birthday' value="&Trim(Rs("BIRTHDAY"))&">")
			Response.Write ("<input type='hidden' name='email1' value="&Trim(Rs("EMAIL1"))&">")
			Response.Write ("<input type='hidden' name='email2' value="&Trim(Rs("EMAIL2"))&">")
			Response.Write ("<input type='hidden' name='email3' value="&Trim(Rs("EMAIL3"))&">")
			Response.Write ("</form>")
			Response.Write ("<script language='javascript'>")
			Response.Write (" document.form1.submit();")
			Response.Write ("</script>")
		Else
			Response.Write "<script language='javascript'>"
			Response.Write "alert('이미 사용된 인증정보 입니다.');"
			Response.Write "parent.location.href='/moile/';"
			Response.Write "</script>"
			Response.End			
		End If 	

	ElseIf Ret = "0" Then
		Response.Write "<script language='javascript'>"
		Response.Write "alert('이메일 인증정보가 존재하지 않습니다.\n\n문제가 있으시면 관리자에게 문의해주세요.');"
		Response.Write "parent.location.href='http://www.koreanfolk.co.kr/mobile/';"
		Response.Write "</script>"
		Response.End
	End If
%>