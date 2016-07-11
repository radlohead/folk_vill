<!--#include virtual="/common/lib/encoding.asp"-->
<!-- #include virtual="/common/inc/common.inc"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=UTF-8"

	Dim Ret : Ret = -1
	Dim id : id = Nvl(Trim(Request("id")), "")

	If id <> "" Then 

		Call OpenDbConnection() '데이터베이스 오픈

		'######################################################################
		' 아이디 중복 체크(회원 테이블,탈퇴 테이블 조회) START
		'######################################################################
		
		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd								
			.ActiveConnection = Conn
			.CommandText = "SP_HUGO7_CHECK_MEMBERID_DUP"
			.CommandType = adCmdStoredProc
			'@UID
			.Parameters.Append .CreateParameter("@UID",adVarChar,adParamInput,20, id)
			.Parameters.Append .CreateParameter("@RET",adInteger,adParamOutput,0)
			.Execute
			Ret = .Parameters("@RET")
		End With
		Set objCmd = Nothing
		
		'#######################################################################
		' 아이디 중복 체크 END
		'#######################################################################

		Call CloseDbConnection() '데이터베이스 클로즈

	End If 



If (Ret = 1) Then

	Response.Write "{"
	Response.write """status"" : ""success"","
	Response.write """data"" : ""{}"","
	Response.Write """message"" : null"
	Response.Write "}"

End If

%>	
