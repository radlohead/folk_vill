<%

'메일 보내기
' afile의 경우 url을 넣는다. 상대 절대 다 됨

Function getStringByFile(mailTFName_)
	Set oFso_ = Server.CreateObject("Scripting.FileSystemObject")
	Set mailTemplateFile_ = oFso_.OpenTextFile(Server.MapPath(mailTFName_), 1)
	strMailTemplateFile_ = mailTemplateFile_.readall
	mailTemplateFile_.close()
	Set mailTemplateFile_ = Nothing
	Set oFso_ = Nothing

	getStringByFile = strMailTemplateFile_		
End Function


Sub CDONTSend( from_, to_, content_, subject_)

	Set objmail = Server.CreateObject("CDO.Message")
	Set objConfig = Server.CreateObject("CDO.Configuration")

	Set Flds = objConfig.Fields

	Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 1
	Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpost") = 25
	Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
	Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "C:\Inetpub\mailroot\pickup"
	Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectionimeout") = 30
	Flds.update

	Set objmail.Configuration = objConfig

	objmail.From = from_
	objmail.To = to_
	objmail.Subject = subject_
	objmail.HTMLBody = content_


	'On Error Resume Next

	objmail.Send
	Set objmail = Nothing

End Sub

%>