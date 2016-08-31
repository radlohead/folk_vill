<%

'--------------------------------------------------------------------
' ' 파일에 내용을 읽기
'--------------------------------------------------------------------
Function ReadFile(filename)
	dim openf, sentence,fsso
	set fsso=CreateObject("Scripting.FileSystemObject")
	If not fsso.FileExists(filename) then openfile_function=""
	SET openf=fsso.OpenTextFile(filename,1)
	While openf.AtEndOfStream<>true
		sentence=sentence & openf.readline & vbcrlf
	Wend
	openf.close : SET openf=nothing
	set fsso =nothing
	ReadFile = sentence
End function

'--------------------------------------------------------------------
' ' 파일에 내용을 쓰기
'--------------------------------------------------------------------
Sub WriteFile(filename, sentence)
	dim makef,fsso
	SET makef=fso.CreateTextFile(filename,True,False)
	makef.writeline sentence
	makef.close : SET makef= nothing
	Set fsso = nothing
End sub

'--------------------------------------------------------------------
' ' 다운로드
'--------------------------------------------------------------------
Sub FileDownload(DownloadFolder, FileName)
	Dim objStream, strFileDownload

	Response.ContentType = "application/unknown"
	Response.AddHeader "Content-Disposition","attachment; filename=" & FileName & ""

	Set objStream = Server.CreateObject("ADODB.Stream")
	objStream.Open

	objStream.Type = 1
	objStream.LoadFromFile DownloadFolder & FileName
	strFileDownload = objStream.Read

	objStream.Close
	Set objStream = Nothing

	Response.BinaryWrite strFileDownload
End Sub

'--------------------------------------------------------------------
' ' 유니크한 파일경로및 파일이름을 얻어내는 함수
'--------------------------------------------------------------------
Function GetUniqueName(byRef strFileName, DirectoryPath)
    Dim strName, strExt
    ' 확장자를 제외한 파일명을 얻는다.
    strName = Mid(strFileName, 1, InstrRev(strFileName, ".") - 1) 
    strExt = Mid(strFileName, InstrRev(strFileName, ".") + 1) '확장자를 얻는다 

    Dim fso
    Set fso = Server.CreateObject("Scripting.FileSystemObject")

    Dim bExist : bExist = True 
    '우선 같은이름의 파일이 존재한다고 가정
    Dim strFileWholePath : strFileWholePath = DirectoryPath & "\" & strName & "." & strExt 
    '저장할 파일의 완전한 이름(완전한 물리적인 경로) 구성
    Dim countFileName : countFileName = 0 
    '파일이 존재할 경우, 이름 뒤에 붙일 숫자를 세팅함.

    Do While bExist ' 우선 있다고 생각함.
        If (fso.FileExists(strFileWholePath)) Then ' 같은 이름의 파일이 있을 때
            countFileName = countFileName + 1 '파일명에 숫자를 붙인 새로운 파일 이름 생성
            strFileName = strName & "(" & countFileName & ")." & strExt
            strFileWholePath = DirectoryPath & "\" & strFileName
        Else
            bExist = False
        End If
    Loop
    GetUniqueName = strFileWholePath
End Function


'--------------------------------------------------------------------
' ' 전체파일경로에서 파일명만 가져오는 함수
'--------------------------------------------------------------------
Function GetFileName(byRef strFileName)
	GetFileName = Mid(strFileName, InstrRev(strFileName, "\") + 1)
End Function

'--------------------------------------------------------------------
' ' 파일을 삭제하는 함수
'--------------------------------------------------------------------
Sub DelFile(filePath, fileName) 
			
	'2013/09/03 박주현 추가
	if Right(filePath ,1) <> "\" then filePath = filePath & "\"
	
	Dim FSO
	Set FSO = Server.CreateObject("Scripting.FileSystemObject")

	If(fileName <> "" And FSO.FileExists(filePath & fileName)) Then 
		FSO.DeleteFile(filePath & fileName)
	End If
	Set FSO = Nothing
End Sub	

'--------------------------------------------------------------------
' ' 함수설명 : 폴더 크기 반환 함수                                                      
' ' 변수설명 : str : 경로                                                               
'--------------------------------------------------------------------
Function GetFolderSize(str)
	DIM FSO, F, S
	SET FSO = CreateObject("Scripting.FileSystemObject")
	SET F = FSO.GetFolder(str)
	S = F.SIZE
	GetFolderSize = S
	SET FSO = NOTHING
	SET F   = NOTHING
End Function

'--------------------------------------------------------------------
' ' 파일용량 구하는 함수
'--------------------------------------------------------------------
Function GetFileSize(fileSize) 
	Dim returnSize
	If fileSize <= 0 Then
		returnSize = "0 Byte"
	ElseIf fileSize < 1024 Then
		returnSize = FormatNumber(fileSize,0) & " Byte"
	ElseIf fileSize < 1048576 Then
		returnSize = FormatNumber(Round(fileSize/1024),0) & " KByte"
	ElseIf fileSize < 1073741827 Then
		returnSize = FormatNumber(Round(fileSize/1048576),0) & " MByte"
	Else
		returnSize = FormatNumber(Round(fileSize/1073741827),0) & " GByte"
	End If
	GetFileSize = returnSize
End Function


'Dim Sql, Rs
'Dim page, TotalRecordCount, TotalPageCount, RecordNumber
' ---------------------------------------------------------------------------
' 리스트 콜(서브쿼리, 조인)
' ---------------------------------------------------------------------------
Sub ProcRecordSQL()

	SQL = "SELECT COUNT(*) rowCnt FROM " & TableName & " WHERE (" & WhereClause & ")"
	
	If Debug = true And DebugMode = 1 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = Conn.Execute(SQL)
	TotalRecordCount = Rs("rowCnt")

	TotalPageCount = CLng((CLng(TotalRecordCount)-1)/CLng(pgSize))+1
	RecordNumber = CLng(TotalRecordCount)-(CLng(pg-1)*CLng(pgSize))
	SelSize = (CLng(pg-1)*CLng(pgSize))
	
	SQL = ""
	Rs.Close

	SQL = "SELECT TOP "&pgSize&" "& SelectField
	SQL = SQL&" FROM "&TableName
	SQL = SQL&" WHERE  "&UniqueField&" NOT IN ( " 
	SQL = SQL&"		SELECT TOP "&SelSize&"  "&UniqueField
	SQL = SQL&"		FROM "&TableName&"  WHERE "&WhereClause
	SQL = SQL&"		ORDER BY "&OrderBy
	SQL = SQL&" ) AND "&WhereClause
	SQL = SQL&" ORDER BY "&OrderBy 

	If Debug = true And DebugMode = 2 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = Conn.Execute(SQL)

End Sub

Sub ProcRecordSQL2()

	SQL = "SELECT COUNT(*) rowCnt FROM " & TableName & " WHERE (" & WhereClause & ")"
	
	If Debug = true And DebugMode = 1 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = DbConn2.Execute(SQL)
	TotalRecordCount = Rs("rowCnt")

	TotalPageCount = CLng((CLng(TotalRecordCount)-1)/CLng(pgSize))+1
	RecordNumber = CLng(TotalRecordCount)-(CLng(pg-1)*CLng(pgSize))
	SelSize = (CLng(pg-1)*CLng(pgSize))
	
	SQL = ""
	Rs.Close

	SQL = "SELECT TOP "&pgSize&" "& SelectField
	SQL = SQL&" FROM "&TableName
	SQL = SQL&" WHERE  "&UniqueField&" NOT IN ( " 
	SQL = SQL&"		SELECT TOP "&SelSize&"  "&UniqueField
	SQL = SQL&"		FROM "&TableName&"  WHERE "&WhereClause
	SQL = SQL&"		ORDER BY "&OrderBy
	SQL = SQL&" ) AND "&WhereClause
	SQL = SQL&" ORDER BY "&OrderBy 

	If Debug = true And DebugMode = 2 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = DbConn2.Execute(SQL)

End Sub

Sub ProcRecordSQL3()

	SQL = "SELECT COUNT(*) rowCnt FROM " & TableName & " WHERE (" & WhereClause & ")"
	
	If Debug = true And DebugMode = 1 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = DbConn3.Execute(SQL)
	TotalRecordCount = Rs("rowCnt")

	TotalPageCount = CLng((CLng(TotalRecordCount)-1)/CLng(pgSize))+1
	RecordNumber = CLng(TotalRecordCount)-(CLng(pg-1)*CLng(pgSize))
	SelSize = (CLng(pg-1)*CLng(pgSize))
	
	SQL = ""
	Rs.Close

	SQL = "SELECT TOP "&pgSize&" "& SelectField
	SQL = SQL&" FROM "&TableName
	SQL = SQL&" WHERE  "&UniqueField&" NOT IN ( " 
	SQL = SQL&"		SELECT TOP "&SelSize&"  "&UniqueField
	SQL = SQL&"		FROM "&TableName&"  WHERE "&WhereClause
	SQL = SQL&"		ORDER BY "&OrderBy
	SQL = SQL&" ) AND "&WhereClause
	SQL = SQL&" ORDER BY "&OrderBy 

	If Debug = true And DebugMode = 2 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = DbConn3.Execute(SQL)

End Sub

'Dim Sql, Rs
'Dim page, TotalRecordCount, TotalPageCount, RecordNumber
' ---------------------------------------------------------------------------
' 리스트 콜(서브쿼리, 조인)
' ---------------------------------------------------------------------------
Sub ProcRecordSQL1(pg1, pgSize1)

	SQL = "SELECT COUNT(*) rowCnt FROM " & TableName & " WHERE (" & WhereClause & ")"
	
	If Debug = true And DebugMode = 1 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = DbConn.Execute(SQL)
	TotalRecordCount = Rs("rowCnt")

	TotalPageCount = CLng((CLng(TotalRecordCount)-1)/CLng(pgSize1))+1
	RecordNumber = CLng(TotalRecordCount)-(CLng(pg1-1)*CLng(pgSize1))
	SelSize = (CLng(pg1-1)*CLng(pgSize1))
	
	SQL = ""
	Rs.Close

	SQL = "SELECT TOP "&pgSize1&" "& SelectField
	SQL = SQL&" FROM "&TableName
	SQL = SQL&" WHERE  "&UniqueField&" NOT IN ( " 
	SQL = SQL&"		SELECT TOP "&SelSize&"  "&UniqueField
	SQL = SQL&"		FROM "&TableName&"  WHERE "&WhereClause
	SQL = SQL&"		ORDER BY "&OrderBy
	SQL = SQL&" ) AND "&WhereClause
	SQL = SQL&" ORDER BY "&OrderBy 

	If Debug = true And DebugMode = 2 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = DbConn.Execute(SQL)

End Sub

Sub ProcCommentRecordSQL()

	SQL = "SELECT COUNT(*) rowCnt FROM " & TableName & " WHERE (" & WhereClause & ")"
	
	If Debug = true And DebugMode = 1 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = Conn.Execute(SQL)
	TotalRecordCount = Rs("rowCnt")

	TotalPageCount = CLng((CLng(TotalRecordCount)-1)/CLng(pgSize))+1
	RecordNumber = CLng(TotalRecordCount)-(CLng(cpg-1)*CLng(pgSize))
	SelSize = (CLng(cpg-1)*CLng(pgSize))
	
	SQL = ""
	Rs.Close

	SQL = "SELECT TOP "&pgSize&" "& SelectField
	SQL = SQL&" FROM "&TableName
	SQL = SQL&" WHERE  "&UniqueField&" NOT IN ( " 
	SQL = SQL&"		SELECT TOP "&SelSize&"  "&UniqueField
	SQL = SQL&"		FROM "&TableName&"  WHERE "&WhereClause
	SQL = SQL&"		ORDER BY "&OrderBy
	SQL = SQL&" ) AND "&WhereClause
	SQL = SQL&" ORDER BY "&OrderBy 

	If Debug = true And DebugMode = 2 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = Conn.Execute(SQL)

End Sub

' ---------------------------------------------------------------------------
' 동일한 값이 있는지 체크
' ---------------------------------------------------------------------------
Function ChkExist(oriS,comS)
	Dim splitVal,reSplit,splitI
	splitVal = split(oriS,"^@@^")
	
	resplit = "-1"
	for splitI = 0 to Ubound(splitVal)
		if (splitVal(splitI) = trim(comS)) then
			reSplit = splitI
		end if
	next
	
	ChkExist = reSplit
End Function

' ---------------------------------------------------------------------------
' 2014/09/11 New 페이징 함수
' 한국민속촌 온라인 쿠폰 페이징 적용
' ---------------------------------------------------------------------------
Sub GoToPageDirectlyFrontTrans(filename, totalpage, blockpg, pg, param)
	
    intTotalPage = totalpage '전체 페이지 수
    intNowPage = pg '현재 페이지 번호
    'intPageSize = 10 '한 페이지에 몇개의 게시까지 보이게 할지 수, 리스트 페이지 상단에 설정 pgSize 변수로 대체
    intBlockPage = blockpg '페이지를 몇개씩 구분할 것인지 수

    intTemp = Int((intNowPage - 1) / intBlockPage) * intBlockPage + 1

    '이전 10개 기능 적용
    If intTemp = 1 Then
		Response.Write " <span class=""first_page""><img src=""/images/about/first_page.gif"" alt=""이전"& intBlockPage &"페이지"" /></span> "        
    Else
		Response.Write "<span class=""first_page""><a href='" & filename & "?pg=" & intTemp - intBlockPage  & "&param=" & param & "'><img src=""/images/about/first_page.gif"" alt=""이전"& intBlockPage &"페이지"" /></a></span>"
    End If
    

    '이전 페이지로 가기 기능 적용
    if int(right(intNowPage,1)) = 1 then
		Response.Write " <span class=""prev_page""><img src=""/images/about/prev_page.gif"" alt=""이전페이지"" /></span> " 
    else
        Response.Write " <span class=""prev_page""><a href='" & filename & "?pg=" & intNowPage - 1 & "&param=" & param & "' class=""paging_p""><img src=""/images/about/prev_page.gif"" alt=""이전페이지"" /></a></span> " 
    end if
    
	intLoop = 1
   
	Do Until intLoop > intBlockPage Or intTemp > intTotalPage
		If intTemp = CInt(intNowPage) Then
			Response.Write "<span class=""page_num current_num"">" & intTemp & "</span>"
		Else
			Response.Write "<span class=""page_num""><a href='" & filename & "?pg=" & intTemp & "&param=" & param & "'>" & intTemp & "</a></span>" 
		End If
		intTemp = intTemp + 1
		intLoop = intLoop + 1
	Loop	

    
    '다음 페이지로 가기 기능 적용
    if int(intNowPage) = intTotalPage then
		Response.Write " <span class=""next_page""><img src=""/images/about/next_page.gif"" alt=""다음페이지"" /></span> " 
    else
        Response.Write " <span class=""next_page""><a href='" & filename & "?pg=" & intNowPage + 1 & "&param=" & param & "' class=""paging_n""><img src=""/images/about/next_page.gif"" alt=""다음페이지"" /></a></span> " 
    end if
    
    '다음 10개 기능 적용
    If intTemp > intTotalPage Then
        Response.Write "<span class=""last_page""><img src=""/images/about/last_page.gif"" alt=""다음"& intBlockPage &"페이지"" /></span>" 		
    else
		Response.write " <span class=""last_page""><a href='" & filename & "?pg=" &  intTemp & "&param=" & param & "'><img src=""/images/about/last_page.gif"" alt=""다음"& intBlockPage &"페이지"" /></a></span> "
    End If
    
End Sub

' ---------------------------------------------------------------------------
' 2008/11/21 New 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToPageDirectly(filename, totalpage, blockpg, pg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(pg, 1)
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (pg Mod blockpg) = 0 Then
        myBlodkEnd = pg
    Else
        myBlodkEnd = (Int(pg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 10개 기능 적용
    If Int(myBlodkEnd) > blockpg Then
        Response.Write "<a href='" & filename & "?pg=" & myBlodkEnd-19 & "&param=" & param & "'><img src='/images/b_10minus_blue.gif' align=absmiddle border=0></a>"
    Else
		Response.Write " <img src=""/images/b_10minus_gray.gif"" align=absmiddle border=0> "
    End If
    

    '이전 페이지로 가기 기능 적용
    if int(right(pg,1)) = 1 then
		Response.Write " <img src=/images/b_back_silver.gif border=0 align=absmiddle>&nbsp; " 
    else
        Response.Write " <a href='" & filename & "?pg=" & pg - 1 & "&param=" & param & "'><img src=/images/b_back_blue.gif border=0 align=absmiddle></a> &nbsp;" 
    end if
    
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(pg) then 
			Response.Write "<font style='color:#FF6600'><b>" & i & "</b></font>"
		else
			Response.Write " <a href='" & filename & "?pg=" & i & "&param=" & param & "'>" & i & "</a> " 
		end if
    Next
    
    '다음 페이지로 가기 기능 적용
    if int(pg) = endNumOfLoop then
		Response.Write " &nbsp;<img src=/images/b_next_silver.gif border=0 align=absmiddle> " 
    else
        Response.Write " &nbsp;<a href='" & filename & "?pg=" & pg + 1 & "&param=" & param & "'><img src=/images/b_next_blue.gif border=0 align=absmiddle></a> " 
    end if
    
    '다음 10개 기능 적용
    If Int(totalpage) > Int(myBlodkEnd) Then
        Response.write " <a href='" & filename & "?pg=" &  myBlodkEnd+1 & "&param=" & param & "'><img src=""/images/b_10plus_blue.gif"" align=absmiddle border=0></a>"
    else
		Response.Write " <img src=""/images/b_10plus_gray.gif"" align=absmiddle border=0> " 
    End If
    
End Sub


' ---------------------------------------------------------------------------
' 2010/07/27 New 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToPageDirectly_new(filename, totalpage, blockpg, pg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(pg, 1)
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (pg Mod blockpg) = 0 Then
        myBlodkEnd = pg
    Else
        myBlodkEnd = (Int(pg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 페이지로 가기 기능 적용
    if int(right(pg,1)) = 1 then
	Response.Write "<li><img src=""../images/common/btn/btn_pageing_prev.gif"" align=""absmiddle"" alt=""이전페이지"" /></li>" 
    else
        Response.Write "<li><a href='" & filename & "?pg=" & pg - 1 & "&param=" & param & "'><img src=""../images/common/btn/btn_pageing_prev.gif"" align=""absmiddle"" alt=""이전페이지"" /></a></li>" 
    end if
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(pg) then 
			Response.Write "<li><a href=""#"" title=""" & i & """ class=""active"" onclick=""return false;"" style=""color:#636357;"">" & i & "</a></li>"
		else
			Response.Write "<li><a href=""" & filename & "?pg=" & i & "&param=" & param & """ title=""" & i & """>" & i & "</a></li>" 
		end if
    Next

    '다음 페이지로 가기 기능 적용
    if int(pg) = endNumOfLoop then
	Response.Write "<li><img src=""../images/common/btn/btn_pageing_next.gif"" align=""absmiddle"" alt=""다음페이지"" /></li>" 
    else
        Response.Write "<li><a href='" & filename & "?pg=" & pg + 1 & "&param=" & param & "'><img src=""../images/common/btn/btn_pageing_next.gif"" align=""absmiddle"" alt=""다음10페이지"" /></a></li>" 
    end if   
    
End Sub


' ---------------------------------------------------------------------------
' 2010/07/27 New 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToPageDirectly_new_comment(filename, totalpage, blockpg, cpg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(cpg, 1)
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (pg Mod blockpg) = 0 Then
        myBlodkEnd = cpg
    Else
        myBlodkEnd = (Int(cpg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 페이지로 가기 기능 적용
    if int(right(cpg,1)) = 1 then
	Response.Write "<li><img src=""../images/common/btn/btn_pageing_prev.gif"" align=""absmiddle"" alt=""이전페이지"" /></li>" 
    else
        Response.Write "<li><a href='" & filename & "?cpg=" & cpg - 1 & "&param=" & param & "'><img src=""../images/common/btn/btn_pageing_prev.gif"" align=""absmiddle"" alt=""이전페이지"" /></a></li>" 
    end if
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(cpg) then 
			Response.Write "<li><a href=""#"" title=""" & i & """ class=""active"" onclick=""return false;"" style=""color:#636357;"">" & i & "</a></li>"
		else
			Response.Write "<li><a href=""" & filename & "?cpg=" & i & "&param=" & param & """ title=""" & i & """>" & i & "</a></li>" 
		end if
    Next

    '다음 페이지로 가기 기능 적용
    if int(cpg) = endNumOfLoop then
	Response.Write "<li><img src=""../images/common/btn/btn_pageing_next.gif"" align=""absmiddle"" alt=""다음페이지"" /></li>" 
    else
        Response.Write "<li><a href='" & filename & "?cpg=" & cpg + 1 & "&param=" & param & "'><img src=""../images/common/btn/btn_pageing_next.gif"" align=""absmiddle"" alt=""다음10페이지"" /></a></li>" 
    end if   
    
End Sub



' ---------------------------------------------------------------------------
' 2012/09/14 New 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToPageDirectlyFront(filename, totalpage, blockpg, pg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(pg, 1)
    'Dim blockPage : blockPage = Int((pg-1)/10)*10+1

    'response.write blockPage
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (pg Mod blockpg) = 0 Then
        myBlodkEnd = pg
    Else
        myBlodkEnd = (Int(pg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 10개 기능 적용
    If Int(myBlodkEnd) > blockpg Then
        Response.Write "<a href='" & filename & "?pg=" & myBlodkEnd-19 & "&param=" & param & "'><img src='/images/common/btn_leftpage_on_01.gif' width='10' height='7' alt='이전10페이지' style='padding-right:3px;' /></a>"
    Else
	Response.Write " <img src='/images/common/btn_leftpage_off_01.gif' width='10' height='7' alt='이전10페이지' style='padding-right:3px;' /> "
    End If
    

    '이전 페이지로 가기 기능 적용
    if int(right(pg,1)) = 1 then
	Response.Write " <img src='/images/common/btn_leftpage_off_02.gif' width='9' height='7' alt='이전페이지' />&nbsp; " 
    else
        Response.Write " <a href='" & filename & "?pg=" & pg - 1 & "&param=" & param & "'><img src='/images/common/btn_leftpage_on_02.gif' width='9' height='7' alt='이전페이지' /></a>&nbsp;" 
    end if
    
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(pg) then 
			Response.Write " <span class='board_page_num_select'>" & i & "</span> "
		else
			Response.Write " <a href='" & filename & "?pg=" & i & "&param=" & param & "'>" & i & "</a> " 
		end if
    Next
    
    '다음 페이지로 가기 기능 적용
    if int(pg) = endNumOfLoop then
	Response.Write " &nbsp;<img src='/images/common/btn_rightpage_off_02.gif' width='9' height='7' alt='다음페이지'/> " 
    else
        Response.Write " &nbsp;<a href='" & filename & "?pg=" & pg + 1 & "&param=" & param & "'><img src='/images/common/btn_rightpage_on_02.gif' width='9' height='7' alt='다음페이지'/></a> " 
    end if
    
    '다음 10개 기능 적용
    If Int(totalpage) > Int(myBlodkEnd) Then
        Response.write " <a href='" & filename & "?pg=" &  myBlodkEnd+1 & "&param=" & param & "'><img src='/images/common/btn_rightpage_on_01.gif' width='10' height='7' alt='다음10페이지' style='padding-left:3px;'/></a>"
    else
	Response.Write " <img src='/images/common/btn_rightpage_off_01.gif' width='10' height='7' alt='다음10페이지' style='padding-left:3px;'/> " 
    End If
    
End Sub


' ---------------------------------------------------------------------------
' 2012/09/14 New 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToPageDirectlyBack(filename, totalpage, blockpg, pg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(pg, 1)
    'Dim blockPage : blockPage = Int((pg-1)/10)*10+1

    'response.write blockPage
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (pg Mod blockpg) = 0 Then
        myBlodkEnd = pg
    Else
        myBlodkEnd = (Int(pg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 10개 기능 적용
    If Int(myBlodkEnd) > blockpg Then
        Response.Write "<a href='" & filename & "?pg=" & myBlodkEnd-19 & "&param=" & param & "'><img src='/backend/images/arrow/arrow_left_on_01.gif' width='10' height='7' alt='이전10페이지' style='padding-right:3px;' /></a>"
    Else
	Response.Write " <img src='/backend/images/arrow/arrow_left_off_01.gif' width='10' height='7' alt='이전10페이지' style='padding-right:3px;' /> "
    End If
    

    '이전 페이지로 가기 기능 적용
    if int(right(pg,1)) = 1 then
	Response.Write " <img src='/backend/images/arrow/arrow_left_off_02.gif' width='9' height='7' alt='이전페이지' />&nbsp; " 
    else
        Response.Write " <a href='" & filename & "?pg=" & pg - 1 & "&param=" & param & "'><img src='/backend/images/arrow/arrow_left_on_02.gif' width='9' height='7' alt='이전페이지' /></a>&nbsp;" 
    end if
    
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(pg) then 
			Response.Write " <span class='board_page_num_select'>" & i & "</span> "
		else
			Response.Write " <a href='" & filename & "?pg=" & i & "&param=" & param & "'>" & i & "</a> " 
		end if
    Next
    
    '다음 페이지로 가기 기능 적용
    if int(pg) = endNumOfLoop then
	Response.Write " &nbsp;<img src='/backend/images/arrow/arrow_right_off_02.gif' width='9' height='7' alt='다음페이지'/> " 
    else
        Response.Write " &nbsp;<a href='" & filename & "?pg=" & pg + 1 & "&param=" & param & "'><img src='/backend/images/arrow/arrow_right_on_02.gif' width='9' height='7' alt='다음페이지'/></a> " 
    end if
    
    '다음 10개 기능 적용
    If Int(totalpage) > Int(myBlodkEnd) Then
        Response.write " <a href='" & filename & "?pg=" &  myBlodkEnd+1 & "&param=" & param & "'><img src='/backend/images/arrow/arrow_right_on_01.gif' width='10' height='7' alt='다음10페이지' style='padding-left:3px;'/></a>"
    else
	Response.Write " <img src='/backend/images/arrow/arrow_right_off_01.gif' width='10' height='7' alt='다음10페이지' style='padding-left:3px;'/> " 
    End If
    
End Sub


' ---------------------------------------------------------------------------
' 2013/11/13 New 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToPageDirectlyFrontNewOld(filename, totalpage, blockpg, pg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(pg, 1)
    'Dim blockPage : blockPage = Int((pg-1)/10)*10+1

    'response.write blockPage
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (pg Mod blockpg) = 0 Then
        myBlodkEnd = pg
    Else
        myBlodkEnd = (Int(pg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 10개 기능 적용
    If Int(myBlodkEnd) > blockpg Then
        Response.Write "<span class=""first_page""><a href='" & filename & "?pg=" & myBlodkEnd-19 & "&param=" & param & "'>&lt;&lt;</a></span>"
    Else
		Response.Write " <span class=""first_page"">&lt;&lt;</span> "
    End If
    

    '이전 페이지로 가기 기능 적용
    if int(right(pg,1)) = 1 then
		Response.Write " <span class=""prev_page"">&lt;</span> " 
    else
        Response.Write " <span class=""prev_page""><a href='" & filename & "?pg=" & pg - 1 & "&param=" & param & "' class=""paging_p"">&lt;</a></span> " 
    end if
    
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(pg) then 
			Response.Write "<span class=""page_num current_num"">" & i & "</span>"
		else
			Response.Write "<span class=""page_num""><a href='" & filename & "?pg=" & i & "&param=" & param & "'>" & i & "</a></span>" 
		end if
    Next
    
    '다음 페이지로 가기 기능 적용
    if int(pg) = endNumOfLoop then
		Response.Write " <span class=""next_page"">&gt;</span> " 
    else
        Response.Write " <span class=""next_page""><a href='" & filename & "?pg=" & pg + 1 & "&param=" & param & "' class=""paging_n"">&gt;</a></span> " 
    end if
    
    '다음 10개 기능 적용
    If Int(totalpage) > Int(myBlodkEnd) Then
        Response.write " <span class=""last_page""><a href='" & filename & "?pg=" &  myBlodkEnd+1 & "&param=" & param & "'>&gt;&gt;</a></span> "
    else
		Response.Write "<span class=""last_page"">&gt;&gt;</span>" 
    End If
    
End Sub

' ---------------------------------------------------------------------------
' 2013/11/26 New 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToPageDirectlyFrontNew(filename, totalpage, blockpg, pg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(pg, 1)
    'Dim blockPage : blockPage = Int((pg-1)/10)*10+1

    'response.write blockPage
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (pg Mod blockpg) = 0 Then
        myBlodkEnd = pg
    Else
        myBlodkEnd = (Int(pg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 10개 기능 적용
    If Int(myBlodkEnd) > blockpg Then
        Response.Write "<span class=""first_page""><a href='" & filename & "?pg=" & myBlodkEnd-19 & "&param=" & param & "'><img src=""/images/about/first_page.gif"" alt=""이전10페이지"" /></a></span>"
    Else
		Response.Write " <span class=""first_page""><img src=""/images/about/first_page.gif"" alt=""이전10페이지"" /></span> "
    End If
    

    '이전 페이지로 가기 기능 적용
    if int(right(pg,1)) = 1 then
		Response.Write " <span class=""prev_page""><img src=""/images/about/prev_page.gif"" alt=""이전페이지"" /></span> " 
    else
        Response.Write " <span class=""prev_page""><a href='" & filename & "?pg=" & pg - 1 & "&param=" & param & "' class=""paging_p""><img src=""/images/about/prev_page.gif"" alt=""이전페이지"" /></a></span> " 
    end if
    
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(pg) then 
			Response.Write "<span class=""page_num current_num"">" & i & "</span>"
		else
			Response.Write "<span class=""page_num""><a href='" & filename & "?pg=" & i & "&param=" & param & "'>" & i & "</a></span>" 
		end if
    Next
    
    '다음 페이지로 가기 기능 적용
    if int(pg) = endNumOfLoop then
		Response.Write " <span class=""next_page""><img src=""/images/about/next_page.gif"" alt=""다음페이지"" /></span> " 
    else
        Response.Write " <span class=""next_page""><a href='" & filename & "?pg=" & pg + 1 & "&param=" & param & "' class=""paging_n""><img src=""/images/about/next_page.gif"" alt=""다음페이지"" /></a></span> " 
    end if
    
    '다음 10개 기능 적용
    If Int(totalpage) > Int(myBlodkEnd) Then
        Response.write " <span class=""last_page""><a href='" & filename & "?pg=" &  myBlodkEnd+1 & "&param=" & param & "'><img src=""/images/about/last_page.gif"" alt=""다음10페이지"" /></a></span> "
    else
		Response.Write "<span class=""last_page""><img src=""/images/about/last_page.gif"" alt=""다음10페이지"" /></span>" 
    End If
    
End Sub


' ---------------------------------------------------------------------------
' 2013/09/16 한국민속촌 관리지 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToPageDirectlyBackNew(filename, totalpage, blockpg, pg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(pg, 1)
    'Dim blockPage : blockPage = Int((pg-1)/10)*10+1

    'response.write blockPage
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (pg Mod blockpg) = 0 Then
        myBlodkEnd = pg
    Else
        myBlodkEnd = (Int(pg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 10개 기능 적용
    If Int(myBlodkEnd) > blockpg Then
        Response.Write "<a href='" & filename & "?pg=" & myBlodkEnd-19 & "&param=" & param & "'><img src=""/backend/images/btn_arrow_first.gif"" alt=""이전 10페이지"" /></a>"
    Else
	Response.Write " <img src=""/backend/images/btn_arrow_first.gif"" class=""paging_nolink"" alt=""이전 10페이지"" /> "
    End If
    

    '이전 페이지로 가기 기능 적용
    'if int(right(pg,1)) = 1 then
    if int(pg) = 1 then
	Response.Write " <img src=""/backend/images/btn_arrow_prev.gif"" class=""paging_nolink paging_p"" alt=""이전 페이지"" /></span> " 
    else
        Response.Write " <a href='" & filename & "?pg=" & pg - 1 & "&param=" & param & "' class=""paging_p""><img src=""/backend/images/btn_arrow_prev.gif"" alt=""이전 페이지"" /></a> " 
    end if
    
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(pg) then 
			Response.Write "<strong class=""paging_nolink"">" & i & "</strong>"
		else
			Response.Write "<a href='" & filename & "?pg=" & i & "&param=" & param & "'>" & i & "</a>" 
		end if
    Next
    
    '다음 페이지로 가기 기능 적용
    if int(pg) = endNumOfLoop then
		Response.Write " <img src=""/backend/images/btn_arrow_next.gif"" class=""paging_nolink paging_n"" alt=""다음 페이지"" /> " 
    else
        Response.Write " <a href='" & filename & "?pg=" & pg + 1 & "&param=" & param & "' class=""paging_n""><img src=""/backend/images/btn_arrow_next.gif"" alt=""다음 페이지"" /></a> " 
    end if
    
    '다음 10개 기능 적용
    If Int(totalpage) > Int(myBlodkEnd) Then
        Response.write " <a href='" & filename & "?pg=" &  myBlodkEnd+1 & "&param=" & param & "'><img src=""/backend/images/btn_arrow_last.gif"" alt=""다음 10페이지"" /></a> "
    else
		Response.Write "<img src=""/backend/images/btn_arrow_last.gif"" class=""paging_nolink"" alt=""다음 10페이지"" />" 
    End If
    
End Sub


' ---------------------------------------------------------------------------
' 2009/02/13 New 댓글 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToCommentPageDirectlyFront(filename, totalpage, blockpg, cpg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(cpg, 1)
    'Dim blockPage : blockPage = Int((cpg-1)/10)*10+1

    'response.write blockPage
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (cpg Mod blockpg) = 0 Then
        myBlodkEnd = cpg
    Else
        myBlodkEnd = (Int(cpg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 10개 기능 적용
    If Int(myBlodkEnd) > blockpg Then
        Response.Write "<a href='" & filename & "?cpg=" & myBlodkEnd-19 & "&param=" & param & "' class='num'><img src='/img/common/btn_pre2.gif' align=absmiddle border=0></a>"
    Else
	Response.Write " <img src=""/img/common/btn_pre2.gif"" align=absmiddle border=0> "
    End If
    

    '이전 페이지로 가기 기능 적용
    if int(right(cpg,1)) = 1 then
		Response.Write " <img src=/img/common/btn_pre.gif border=0 align=absmiddle>&nbsp; " 
    else
        Response.Write " <a href='" & filename & "?cpg=" & cpg - 1 & "&param=" & param & "' class='num'><img src=/img/common/btn_pre.gif border=0 align=absmiddle></a> &nbsp;" 
    end if
    
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(cpg) then 
			Response.Write "<font style='color:#0072bc'><b>" & i & "</b></font>"
			'if (blockPage >= totalPage)  OR (i = 10) then
			if (i >= totalPage) then
				Response.Write ""
			else
				Response.Write "<img src=/img/common/num_line.gif border=0 align=absmiddle>"
			end if 
			
		else
			Response.Write " <a href='" & filename & "?cpg=" & i & "&param=" & param & "'>" & i & "</a> " 
			'if (blockPage >= totalPage)  OR (i = 10) then
			if (i >= totalPage) then
				Response.Write ""
			else
				Response.Write "<img src=/img/common/num_line.gif border=0 align=absmiddle>"
			end if 
		end if
    Next
    
    '다음 페이지로 가기 기능 적용
    if int(cpg) = endNumOfLoop then
		Response.Write " &nbsp;<img src=/img/common/btn_next.gif border=0 align=absmiddle> " 
    else
        Response.Write " &nbsp;<a href='" & filename & "?cpg=" & cpg + 1 & "&param=" & param & "' class='num'><img src=/img/common/btn_next.gif border=0 align=absmiddle></a> " 
    end if
    
    '다음 10개 기능 적용
    If Int(totalpage) > Int(myBlodkEnd) Then
        Response.write " <a href='" & filename & "?cpg=" &  myBlodkEnd+1 & "&param=" & param & "' class='num'><img src=""/img/common/btn_next2.gif"" align=absmiddle border=0></a>"
    else
		Response.Write " <img src=""/img/common/btn_next2.gif"" align=absmiddle border=0> " 
    End If
    
End Sub


' ---------------------------------------------------------------------------
' 2009/02/25 New 댓글 페이징 함수
' ---------------------------------------------------------------------------
Sub GoToCommentPageDirectlyFrontOrange(filename, totalpage, blockpg, cpg, param)
	
	'myBlodkEnd는 현재 자신의 페이지가 위치하는 블럭의 마지막 값이다.
	'즉, 현재 페이지가 3이라면 myBlodkEnd는 10이 되고..
	'현재 페이지가 10 이어도 myBlodkEnd 는 10이 된다.
	'만일, 현재 페이지가 11이라면 myBlodkEnd 는 20이 되고...
	'현재 페이지가 20 이라면 20이 된다.
	
    Dim myBlodkEnd 
    Dim endNum : endNum = Right(cpg, 1)
    'Dim blockPage : blockPage = Int((cpg-1)/10)*10+1

    'response.write blockPage
    
    '현재 자신의 페이지 블럭에서 마지막 페이지 구하기.
    If (cpg Mod blockpg) = 0 Then
        myBlodkEnd = cpg
    Else
        myBlodkEnd = (Int(cpg) + blockpg) - Int(endNum)   '13 + 10 - 3  / 23 + 10 -3
    End If

    '이전 10개 기능 적용
    If Int(myBlodkEnd) > blockpg Then
        Response.Write "<a href='" & filename & "?cpg=" & myBlodkEnd-19 & "&param=" & param & "' class='num'><img src='/img/common/btn_pre2.gif' align=absmiddle border=0></a>"
    Else
	Response.Write " <img src=""/img/common/btn_pre2.gif"" align=absmiddle border=0> "
    End If
    

    '이전 페이지로 가기 기능 적용
    if int(right(cpg,1)) = 1 then
		Response.Write " <img src=/img/common/btn_pre.gif border=0 align=absmiddle>&nbsp; " 
    else
        Response.Write " <a href='" & filename & "?cpg=" & cpg - 1 & "&param=" & param & "' class='num'><img src=/img/common/btn_pre.gif border=0 align=absmiddle></a> &nbsp;" 
    end if
    
    
    Dim i, endNumOfLoop
    If Int(totalpage) > Int(myBlodkEnd) Then
		endNumOfLoop = myBlodkEnd
	else
		endNumOfLoop = Int(totalpage)
	end if
	
    For i = myBlodkEnd - 9 To endNumOfLoop
		if i = int(cpg) then 
			Response.Write "<font style='color:#f78000'><b>" & i & "</b></font>"
			'if (blockPage >= totalPage)  OR (i = 10) then
			if (i >= totalPage) then
				Response.Write ""
			else
				Response.Write "<img src=/img/common/num_line.gif border=0 align=absmiddle>"
			end if 
			
		else
			Response.Write " <a href='" & filename & "?cpg=" & i & "&param=" & param & "'>" & i & "</a> " 
			'if (blockPage >= totalPage)  OR (i = 10) then
			if (i >= totalPage) then
				Response.Write ""
			else
				Response.Write "<img src=/img/common/num_line.gif border=0 align=absmiddle>"
			end if 
		end if
    Next
    
    '다음 페이지로 가기 기능 적용
    if int(cpg) = endNumOfLoop then
		Response.Write " &nbsp;<img src=/img/common/btn_next.gif border=0 align=absmiddle> " 
    else
        Response.Write " &nbsp;<a href='" & filename & "?cpg=" & cpg + 1 & "&param=" & param & "' class='num'><img src=/img/common/btn_next.gif border=0 align=absmiddle></a> " 
    end if
    
    '다음 10개 기능 적용
    If Int(totalpage) > Int(myBlodkEnd) Then
        Response.write " <a href='" & filename & "?cpg=" &  myBlodkEnd+1 & "&param=" & param & "' class='num'><img src=""/img/common/btn_next2.gif"" align=absmiddle border=0></a>"
    else
		Response.Write " <img src=""/img/common/btn_next2.gif"" align=absmiddle border=0> " 
    End If
    
End Sub


'==================================================
'박희찬 추가
'직급코드 리스트
'==================================================
Sub PositionRecordSQL()

	SQL = "SELECT " & SelectField & " FROM " & TableName & " where " & WhereClause & " ORDER BY " & OrderBy

	If Debug = true And DebugMode = 2 Then
		Response.write SQL
		Response.End
	End If

	Set Rs = Conn.Execute(SQL)

End Sub

'==================================================
'박주현 추가
'매체코드 리스트
'==================================================
Sub GetMideaCodeName()
	SQL = "SELECT CODE_TYPE, CODE_NAME FROM TBL_MIDEA_CODES WHERE USEYN = 'Y' ORDER BY CODE_NAME ASC"
	Set Rs = Conn.Execute(SQL)
End Sub

'==================================================
'박주현 추가
'매체코드 이름 가져오기
'==================================================
Sub GetMideaCodeDetailName()
	SQL = "SELECT CODE_NAME FROM TBL_MIDEA_CODES WHERE USEYN = 'Y' and CODE_TYPE = '"& code_type &"'"
	'Response.write SQL
	Set Rs1 = Conn.Execute(SQL)
	
	If(Not Rs1.EOF or Not Rs1.BOF) Then
		code_name = Rs1("CODE_NAME")
	else 
		code_name = ""
	end if
	'response.write code_name
	Rs1.close
End Sub

'==================================================
'박주현 추가
'지원부서코드 리스트
'==================================================
Sub GetDeptCodeName()
	SQL = "SELECT CODE_TYPE, CODE_NAME FROM TBL_DEPT_CODES WHERE USEYN = 'Y' ORDER BY CODE_NAME ASC"
	Set Rs = Conn.Execute(SQL)
End Sub

'==================================================
'박주현 추가
'지원부서코드 이름 가져오기
'==================================================
Sub GetDeptCodeDetailName()
	SQL = "SELECT CODE_NAME FROM TBL_DEPT_CODES WHERE USEYN = 'Y' and CODE_TYPE = '"& code_type &"'"
	'Response.write SQL
	Set Rs1 = Conn.Execute(SQL)
	
	If(Not Rs1.EOF or Not Rs1.BOF) Then
		code_name = Rs1("CODE_NAME")
	else 
		code_name = ""
	end if
	'response.write code_name
	Rs1.close
End Sub

'==================================================
'박주현 추가
'채용제목코드 리스트
'==================================================
Sub GetRecruitCodeTitle()
	SQL = "SELECT CODE_TYPE, CODE_TITLE FROM TBL_RECRUIT_TITLE WHERE USEYN = 'Y' ORDER BY CODE_TITLE ASC"
	Set Rs = Conn.Execute(SQL)
End Sub

'==================================================
'박주현 추가
'채용제목코드 이름 가져오기
'==================================================
Sub GetRecruitCodeDetailTitle()
	SQL = "SELECT CODE_TITLE FROM TBL_RECRUIT_TITLE WHERE USEYN = 'Y' and CODE_TYPE = '"& code_type &"'"
	'Response.write SQL
	Set Rs1 = Conn.Execute(SQL)
	
	If(Not Rs1.EOF or Not Rs1.BOF) Then
		code_title = Rs1("CODE_TITLE")
	else 
		code_title = ""
	end if
	'response.write code_title
	Rs1.close
End Sub

'==================================================
'박주현 추가
'공통코드 리스트
'==================================================
Sub GetCodeName()
	SQL = "SELECT CODE_TYPE, CODE_NAME FROM TBL_CODES WHERE CODE_GUBUN = '" & gubun & "' and USEYN = 'Y' "
	Set Rs = Conn.Execute(SQL)
End Sub

'==================================================
'박주현 추가
'공통코드 이름 가져오기
'==================================================
Sub GetCodeDetailName()
	SQL = "SELECT CODE_NAME FROM TBL_CODES WHERE CODE_GUBUN = '" & gubun & "' and USEYN = 'Y' and CODE_TYPE = '"& code_type &"'"
	'Response.write SQL
	Set Rs1 = Conn.Execute(SQL)
	
	If(Not Rs1.EOF or Not Rs1.BOF) Then
		code_name = Rs1("CODE_NAME")
	else 
		code_name = ""
	end if
	'response.write code_name
	Rs1.close
End Sub

'==================================================
'박주현 추가
'상담/예약 희망프로그램 코드 이름 가져오기
'==================================================
Sub GetHopeCodeDetailName()
	SQL = "SELECT CODE_NAME FROM TBL_CODES WHERE CODE_GUBUN = '" & gubun & "' and USEYN = 'Y' and CODE_TYPE = '"& code_type &"'"
	'Response.write SQL
	Set Rs2 = Conn.Execute(SQL)
	
	If(Not Rs2.EOF or Not Rs2.BOF) Then
		hopecode_name = Rs2("CODE_NAME")
	else 
		hopecode_name = ""
	end if
	'response.write hopecode_name
	Rs2.close
End Sub

'==================================================
'박주현 추가
'전통식품 대분류 코드 리스트
'==================================================
Sub GetFoodBigCodeName()
	SQL = "SELECT CODE_TYPE, CODE_NAME FROM TBL_FOOD_BIG_CODE WHERE USEYN = 'Y' "
	Set Rs = Conn.Execute(SQL)
End Sub

'==================================================
'박주현 추가
'전통식품 대분류 코드 이름 가져오기
'==================================================
Sub GetFoodBigCodeDetailName()
	SQL = "SELECT CODE_NAME FROM TBL_FOOD_BIG_CODE WHERE USEYN = 'Y' and CODE_TYPE = '"& code_type &"'"
	'Response.write SQL
	Set Rs1 = Conn.Execute(SQL)
	
	If(Not Rs1.EOF or Not Rs1.BOF) Then
		code_name = Rs1("CODE_NAME")
	else 
		code_name = ""
	end if
	'response.write code_name
	Rs1.close
End Sub

'==================================================
'박주현 추가
'전통식품 중분류 코드 이름 가져오기
'==================================================
Sub GetFoodMiddleCodeDetailName()
	SQL = "SELECT CODE_NAME FROM TBL_FOOD_MIDDLE_CODE WHERE BCODE = '" & code_type & "' and USEYN = 'Y' and CODE_TYPE = '"& product_code &"'"
	'Response.write SQL
	Set Rs1 = Conn.Execute(SQL)
	
	If(Not Rs1.EOF or Not Rs1.BOF) Then
		productcode_name = Rs1("CODE_NAME")
	else 
		productcode_name = ""
	end if
	'response.write productcode_name
	Rs1.close
End Sub

'2012 리뉴얼 추가 SUB Function - han
'--------------------------------------------------------------------
' ' 파일을 삭제하는 함수
'--------------------------------------------------------------------
Sub DeleteFile(filePath, fileName) 
	Set objDextUpload = Server.CreateObject("DEXT.FileUpload")
	
	del_path = filePath & "\" & fileName
	objDextUpload.DeleteFile del_path
	
	Set objDextUpload = Nothing
End Sub

Sub GetCodeList()
	SQL = "SELECT SEQ, CODE_GUBUN, CODE_TYPE, CODE_NAME, ISNULL(CODE_ORDER, '0') CODE_ORDER FROM NEW_CODE WHERE CODE_GUBUN = '" & gubun & "' and USEYN = 'Y' "
	Set Rs = Conn.Execute(SQL)
End Sub
%>