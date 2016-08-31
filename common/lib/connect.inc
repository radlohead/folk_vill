<%
	Dim StrConnect, DbConn, Conn, Rs

	'실제DB 커넥션
	Sub OpenDbConnection()
		StrConnect = "Provider=SQLOLEDB.1;User ID="&DbID&";Password="&DbPW&";Initial Catalog="&DbNm&";Data Source="&DbServer&";"
		Set Conn = Server.CreateObject("ADODB.Connection") 	
		Conn.Open StrConnect
	End Sub

	Sub RsClose()
		Rs.close
		Set Rs = Nothing
	End Sub

	Sub CloseDbConnection()
		Conn.close
		Set Conn = Nothing
	End Sub
%>