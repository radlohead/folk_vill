<!--METADATA TYPE="typelib" UUID="00000205-0000-0010-8000-00AA006D2EA4" NAME="ADODB Type Library" -->
<%
'DB 커넥션
Dim Conn

Sub OpenDbConnection

	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.ConnectionString = "provider=SQLOLEDB;Data Source=sql8ssd-002.localnet.kr;Initial Catalog=koreanfolk_seesaw;User Id=koreanfolk_seesaw;Password=koreanfolk2013"
	Conn.ConnectionTimeout = 20
	Conn.Open                  


End Sub



Sub OpenDatabase         

	OpenDbConnection
	Conn.BeginTrans()

End Sub



Sub CloseDbConnection

	If VarType(Conn) = vbString Then

			If Conn.state Then             
			   Conn.Close
			End If

			Set Conn = nothing

	End If

End Sub



Sub CloseDatabase         

	If Conn.Errors.Count > 0 Then
			Conn.RollbackTrans()
	Else
			Conn.CommitTrans()
	End If

	CloseDbConnection

End Sub
%>