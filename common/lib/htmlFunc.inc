<%

'--------------------------------------------------------------------
' html태그처리 저장할때
'--------------------------------------------------------------------
Function HtmlSpecialChars(strSrc)
	Dim result
	If Not isnull(strSrc) And Len(strSrc) > 0 Then
		result = Replace(strSrc, ">", "&gt;")
		result = Replace(result, "<", "&lt;")
		result = Replace(result, "&nbsp;", "&amp;nbsp;")
		result = Replace(result, """", "&quot;")
		result = Replace(result, chr(34), "&quot;")
		result = Replace(result, "'", "''")
	else 
		result = ""
	end if
	HtmlSpecialChars = result
End Function

'--------------------------------------------------------------------
' html태그처리 읽을때
'--------------------------------------------------------------------
Function ReadHtmlSpecialChars(strSrc)
	Dim result
	If Not isnull(strSrc) And Len(strSrc) > 0 Then
		result = Replace(strSrc, "&gt;", ">")
		result = Replace(result, "&lt;", "<")
		result = Replace(result, "&amp;nbsp;", "&nbsp;")
		result = Replace(result, "&quot;", chr(34))
		result = Replace(result, "''", "'")
	else 
		result = ""
	end if
	ReadHtmlSpecialChars = result
End Function


' ---------------------------------------------------------------------------
'	엔터 값 바꾸어주기
'	input	: string (DB value , <br>)
' ---------------------------------------------------------------------------
Function Nl2br(enter_str)
	if enter_str<>"" then
		entenr_str = replace(enter_str,vbcrlf,"<br>")
	
	end if
	Nl2br = entenr_str
End Function

' ---------------------------------------------------------------------------
'	뉴이미지 표시
'	input	: str_date
' ---------------------------------------------------------------------------
Function NewImg(newDate, img)
	
	If DateDiff("d",CDate(newDate),date) = 0 then
		 NewImg = img
	End if
End Function

'** ---------------------------------------------------------------------------
' ' CheckBox나 Radio Button에 checked 넣기
'** ---------------------------------------------------------------------------
Function GetChecked(s1, s2)
	Dim returnValue
	If CStr(Nvl(s1,"")) = CStr(Nvl(s2,"")) Then
		returnValue = "checked"
	End If
	GetChecked = returnValue
End Function

'** ---------------------------------------------------------------------------
' ' Select에 selected 넣기
'** ---------------------------------------------------------------------------
Function GetSelected(s1, s2)
	Dim returnValue
	If CStr(Nvl(s1,"")) = CStr(Nvl(s2,"")) Then
		returnValue = "selected"
	End If
	GetSelected = returnValue
End Function
%>