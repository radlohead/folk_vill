<%
    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getTodayFormat1
    'Author         + Ueom Kwang Yong
    'Parameter      +
    'Description    + 오늘 날짜를 반환한다. (yyyyMMdd)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getTodayFormat1()
        getTodayFormat1 = year(now) & getAddZero(month(now)) & getAddZero(day(now))
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getTodayFormat2
    'Author         + Ueom Kwang Yong
    'Parameter      +
    'Description    + 오늘 날짜를 반환한다. (yyyyMMddHHmmss)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getTodayFormat2()
        getTodayFormat2 = year(now) & getAddZero(month(now)) & getAddZero(day(now)) & getAddZero(Hour(now)) & getAddZero(Minute(now)) & getAddZero(second(now))
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getTodayFormat3
    'Author         + Ueom Kwang Yong
    'Parameter      +
    'Description    + 오늘 날짜를 반환한다. (yyyy-MM-dd)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getTodayFormat3()
        getTodayFormat3 = date
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getTodayFormat4
    'Author         + Ueom Kwang Yong
    'Parameter      +
    'Description    + 오늘 날짜를 반환한다. (yyyy-MM-dd HH:mm:ss)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getTodayFormat4()
        getTodayFormat4 = date & " " & getAddZero(Hour(now)) & ":" & getAddZero(Minute(now)) & ":" & getAddZero(second(now))
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getDateFormat1
    'Author         + Ueom Kwang Yong
    'Parameter      + str, param
    'Description    + 날짜 형식으로 반환한다. (yyyy-MM-dd)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getDateFormat1(str, param)
        If param = "1" Or param = "2" Then
            getDateFormat1 = Mid(str, 1, 4) & "-" & Mid(str, 5, 2) & "-" & Mid(str, 7, 2)
        Else
            getDateFormat1 = Left(str, 10)
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getDateFormat2
    'Author         + Ueom Kwang Yong
    'Parameter      + str, param
    'Description    + 날짜 형식으로 반환한다. (yyyy-MM-dd HH:mm)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getDateFormat2(str, param)
        If param = "1" Then
            getDateFormat2 = Mid(str, 1, 4) & "-" & Mid(str, 5, 2) & "-" & Mid(str, 7, 2) & " 00:00"
        ElseIf param = "2" Then
            getDateFormat2 = Mid(str, 1, 4) & "-" & Mid(str, 5, 2) & "-" & Mid(str, 7, 2) & " " & Mid(str, 9, 2) & ":" & Mid(str, 11, 2)
        ElseIf param = "3" Then
            getDateFormat2 = Left(str, 10) & " 00:00"
        Else
            getDateFormat2 = Left(str, 16)
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getDateFormat3
    'Author         + Ueom Kwang Yong
    'Parameter      + str, param
    'Description    + 날짜 형식으로 반환한다. (yyyy-MM-dd HH:mm:ss)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getDateFormat3(str, param)
        If param = "1" Then
            getDateFormat3 = Mid(str, 1, 4) & "-" & Mid(str, 5, 2) & "-" & Mid(str, 7, 2) & " 00:00:00"
        ElseIf param = "2" Then
            getDateFormat3 = Mid(str, 1, 4) & "-" & Mid(str, 5, 2) & "-" & Mid(str, 7, 2) & " " & Mid(str, 9, 2) & ":" & Mid(str, 11, 2) & ":" & Mid(str, 13, 2)
        ElseIf param = "3" Then
            getDateFormat3 = Left(str, 10) & " 00:00:00"
        Else
            getDateFormat3 = Left(str, 19)
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getDateFormat4
    'Author         + Ueom Kwang Yong
    'Parameter      + str, param
    'Description    + 날짜 형식으로 반환한다. (yyyy년 MM월 dd일)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getDateFormat4(str, param)
        If param = "1" Or param = "2" Then
            getDateFormat4 = Mid(str, 1, 4) & "년 " & Mid(str, 5, 2) & "월 " & Mid(str, 7, 2) & "일"
        Else
            getDateFormat4 = Mid(str, 1, 4) & "년 " & Mid(str, 6, 2) & "월 " & Mid(str, 9, 2) & "일"
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getDateFormat5
    'Author         + Ueom Kwang Yong
    'Parameter      + str, param
    'Description    + 날짜 형식으로 반환한다. (yyyy년 MM월 dd일 HH시 mm분)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getDateFormat5(str, param)
        If param = "1" Then
            getDateFormat5 = Mid(str, 1, 4) & "년 " & Mid(str, 5, 2) & "월 " & Mid(str, 7, 2) & "일 00시 00분"
        ElseIf param = "2" Then
            getDateFormat5 = Mid(str, 1, 4) & "년 " & Mid(str, 5, 2) & "월 " & Mid(str, 7, 2) & "일 " & Mid(str, 9, 2) & "시 " & Mid(str, 11, 2) & "분"
        ElseIf param = "3" Then
            getDateFormat5 = Mid(str, 1, 4) & "년 " & Mid(str, 6, 2) & "월 " & Mid(str, 9, 2) & "일 00시 00분"
        Else
            getDateFormat5 = Mid(str, 1, 4) & "년 " & Mid(str, 6, 2) & "월 " & Mid(str, 9, 2) & "일 " & Mid(str, 12, 2) & "시 " & Mid(str, 15, 2) & "분"
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getDateFormat6
    'Author         + Ueom Kwang Yong
    'Parameter      + str, param
    'Description    + 날짜 형식으로 반환한다. (yyyy년 MM월 dd일 HH시 mm분 ss초)
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getDateFormat6(str, param)
        If param = "1" Then
            getDateFormat6 = Mid(str, 1, 4) & "년 " & Mid(str, 5, 2) & "월 " & Mid(str, 7, 2) & "일 00시 00분 00초"
        ElseIf param = "2" Then
            getDateFormat6 = Mid(str, 1, 4) & "년 " & Mid(str, 5, 2) & "월 " & Mid(str, 7, 2) & "일 " & Mid(str, 9, 2) & "시 " & Mid(str, 11, 2) & "분 " & Mid(str, 13, 2) & "초"
        ElseIf param = "3" Then
            getDateFormat6 = Mid(str, 1, 4) & "년 " & Mid(str, 6, 2) & "월 " & Mid(str, 9, 2) & "일 00시 00분 00초"
        Else
            getDateFormat6 = Mid(str, 1, 4) & "년 " & Mid(str, 6, 2) & "월 " & Mid(str, 9, 2) & "일 " & Mid(str, 12, 2) & "시 " & Mid(str, 15, 2) & "분 " & Mid(str, 18, 2) & "초"
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getSQ2DQ
    'Author         + Ueom Kwang Yong
    'Parameter      + str
    'Description    + Single Quotation 을 Double Quotation 으로 변환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getSQ2DQ(str)
        getSQ2DQ = Replace(str, "'", "''")
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getChangeDQ
    'Author         + Ueom Kwang Yong
    'Parameter      + str
    'Description    + Double Quotation 을 특수 문자로 변환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getChangeDQ(str)
        getChangeDQ = Replace(str, """", "&quot;")
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getHtml2Text
    'Author         + Ueom Kwang Yong
    'Parameter      + str
    'Description    + Html Tag 및 ASCII 코드를 특수 문자로 변환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getHtml2Text(str)
        str = Replace(str, "<", "&lt;")
        str = Replace(str, ">", "&gt;")
        str = Replace(str, chr(13) & chr(10), "<br>")
        str = Replace(str, " ", "&nbsp;")
        str = Replace(str, "'", "''")
        str = Replace(str, """", "&quot;")

        getHtml2Text = str
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getNL2BR
    'Author         + Ueom Kwang Yong
    'Parameter      + str
    'Description    + Carriage Return 을 "<br>" Tag 로 변환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getNL2BR(str)
        getNL2BR = Replace(str, chr(13) & chr(10), "<br>")
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getCutString
    'Author         + Ueom Kwang Yong
    'Parameter      + str, maxlen
    'Description    + str 문자열의 길이가 maxlen 보다 큰경우 maxlen 길이만큼 잘른 후 "..." 을 붙여 반환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getCutString(str, maxlen)
        If Len(str) > maxlen Then
            getCutString = Left(str, maxlen) & "..."
        Else
            getCutString = str
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getFixString
    'Author         + Ueom Kwang Yong
    'Parameter      + str, maxlen
    'Description    + str 문자열의 길이가 maxlen 보다 큰경우 maxlen 길이만큼 잘른 후 반환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getFixString(str, maxlen)
        If Len(str) > maxlen Then
            getFixString = Left(str, maxlen)
        Else
            getFixString = str
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getSelected
    'Author         + Ueom Kwang Yong
    'Parameter      + param1, param2
    'Description    + 두 값을 비교해서 같으면 "Selected" 를 반환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getSelected(param1, param2)
        If param1 = param2 Then
            getSelected = "Selected"
        Else
            getSelected = ""
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getChecked
    'Author         + Ueom Kwang Yong
    'Parameter      + param1, param2
    'Description    + 두 값을 비교해서 같으면 "Checked" 를 반환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getChecked(param1, param2)
        If param1 = param2 Then
            getChecked = "Checked"
        Else
            getChecked = ""
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getAddZero
    'Author         + Ueom Kwang Yong
    'Parameter      + str
    'Description    + 1자리 숫자의 경우 앞에 "0" 을 추가한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getAddZero(str)
        If Cint(str) < 10 Then
            getAddZero = "0" & Cstr(str)
        Else
            getAddZero = Cstr(str)
        End If
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getRow
    'Author         + Ueom Kwang Yong
    'Parameter      + pageSize, pageNo
    'Description    + 리스트의 첫번째 값을 반환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getRow(pageSize, pageNo)
        getRow = ((pageNo - 1) * pageSize) + 1
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getReverseRow
    'Author         + Ueom Kwang Yong
    'Parameter      + pageSize, pageNo, rsCount
    'Description    + 리스트의 첫번째 역순값을 반환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getReverseRow(pageSize, pageNo, rsCount)
        getReverseRow = rsCount - ((pageNo - 1) * pageSize)
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getPageCount
    'Author         + Ueom Kwang Yong
    'Parameter      + pageSize, rsCount
    'Description    + 페이지 수를 반환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getPageCount(pageSize, rsCount)
        getPageCount = ((rsCount - 1) \ pageSize) + 1
    End Function


    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getUserPrintPage
    'Author         + Ueom Kwang Yong
    'Parameter      + blockSize, pageSize, pageNo, rsCount
    'Description    + 사용자 페이지의 리스트 페이징을 반환한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getUserPrintPage(blockSize, pageSize, pageNo, rsCount)
        Dim tmp, pageCount, startPage, endPage, curPage

        pageCount = ((rsCount - 1) \ pageSize) + 1
        startPage = (((pageNo - 1) \ blockSize) * blockSize) + 1
        endPage = startPage + blockSize - 1
        curPage = startPage

        If pageCount <= endPage Then
            endPage = pageCount
        End If

        tmp =       "<td width=""26"" height=""26"" align=""right"">" & vbCrLf

        If startPage = 1 Then
        tmp = tmp & "<img src=""images/img-12.jpg"" width=""26"" height=""26"" border=""0"">" & vbCrLf
        Else
        tmp = tmp & "<a href=""javascript:goPage(" & (startPage - blockSize) & ");""><img src=""images/img-12.jpg"" width=""26"" height=""26"" border=""0""></a>" & vbCrLf
        End If

        tmp = tmp & "</td>" & vbCrLf
        tmp = tmp & "<td width=""212"" align=""center""><span class=""style1"">" & vbCrLf

        Dim pipeCount : pipeCount = 1
        Do While curPage <= endPage
            If pipeCount <> 1 Then
        tmp = tmp & " | "
            End If

            If curPage = pageNo Then
        tmp = tmp & "<strong>" & curPage & "</strong>" & vbCrLf
            Else
        tmp = tmp & "<strong><a href=""javascript:goPage(" & curPage & ");"">" & curPage & "</a></strong>" & vbCrLf
            End If
            curPage = curPage + 1
            pipeCount = pipeCount + 1
        Loop

        tmp = tmp & "</span></td>" & vbCrLf
        tmp = tmp & "<td width=""29"" align=""left"">" & vbCrLf

        If endPage = pageCount Then
        tmp = tmp & "<img src=""images/img-13.jpg"" width=""26"" height=""26"" border=""0"">" & vbCrLf
        Else
        tmp = tmp & "<a href=""javascript:goPage(" & (startPage + blockSize) & ");""><img src=""images/img-13.jpg"" width=""26"" height=""26"" border=""0""></a>" & vbCrLf
        End If

        tmp = tmp & "</td>"

        getUserPrintPage = tmp
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getFileContent
    'Author         + Ueom Kwang Yong
    'Parameter      + path, file
    'Description    + 파일의 내용을 불러온다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getFileContent(path, file)
        Dim Fso, objStream

        Set Fso = Server.CreateObject("Scripting.FileSystemObject")

        If Fso.FileExists(path & file) Then
            Set objStream = Fso.OpenTextFile(path & file, 1)
            getFileContent = objStream.ReadAll()
            objStream.Close
        End If

        Set objStream = Nothing
        Set Fso = Nothing
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getUniqueFileName
    'Author         + Ueom Kwang Yong
    'Parameter      + path, file
    'Description    + 파일 업로드시 유니크한 파일 이름을 추출한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Function getUniqueFileName(path, file)
        Dim Fso, fileName, i

        Set Fso = Server.CreateObject("Scripting.FileSystemObject")
        fileName = file
        i = 0

        Do While True
            If Fso.FileExists(path & fileName) Then
                If Instr(fileName, ".") > 0 Then
                    fileName = Replace(file, ".", "(" & i & ").")
                Else
                    fileName = file & "(" & i & ")"
                End If
            Else
                Exit Do
            End If
            i = i + 1
        Loop

        Set Fso = Nothing

        getUniqueFileName = fileName
    End Function

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + doCreateFolder
    'Author         + Ueom Kwang Yong
    'Parameter      + path
    'Description    + 폴더를 생성한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Sub doCreateFolder(path)
        Dim Fso

        Set Fso = Server.CreateObject("Scripting.FileSystemObject")

        If Not Fso.FolderExists(path) Then
            ON ERROR RESUME NEXT

            Call Fso.CreateFolder(path)
        End If

        Set Fso = Nothing
    End Sub

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + doDeleteFolder
    'Author         + Ueom Kwang Yong
    'Parameter      + path
    'Description    + 폴더를 삭제한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Sub doDeleteFolder(path)
        Dim Fso

        Set Fso = Server.CreateObject("Scripting.FileSystemObject")

        If Fso.FolderExists(path) Then
            ON ERROR RESUME NEXT

            Call Fso.DeleteFolder(path, true)
        End If

        Set Fso = Nothing
    End Sub

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + doDeleteFile
    'Author         + Ueom Kwang Yong
    'Parameter      + path, file
    'Description    + 파일을 삭제한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Sub doDeleteFile(path, file)
        Dim Fso

        Set Fso = Server.CreateObject("Scripting.FileSystemObject")

        If Fso.FileExists(path & file) Then
            ON ERROR RESUME NEXT

            Call Fso.DeleteFile(path & file, true)
        End If

        Set Fso = Nothing
    End Sub

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + goBackPage
    'Author         + Ueom Kwang Yong
    'Parameter      + msg
    'Description    + 메시지 출력 후 이전 페이지로 이동한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Sub goBackPage(msg)
        Response.Write "<script language=""javascript"">" & vbcrlf

        If Not (isNull(msg) Or msg = "") Then
            Response.Write "    alert(""" & msg & """);" & vbcrlf
        End If

        Response.Write "   history.back();" & vbcrlf
        Response.Write "</script>"
    End Sub

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + goUrlPage
    'Author         + Ueom Kwang Yong
    'Parameter      + msg, url
    'Description    + 메시지 출력 후 url 페이지로 이동한다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Sub goUrlPage(msg, url)
        Response.Write "<script language=""javascript"">" & vbcrlf

        If Not (isNull(msg) Or msg = "") Then
            Response.Write "    alert(""" & msg & """);" & vbcrlf
        End If

        Response.Write "   window.location.href=""" & url & """;" & vbcrlf
        Response.Write "</script>"
    End Sub

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + doClosePage
    'Author         + Ueom Kwang Yong
    'Parameter      + msg
    'Description    + 메시지 출력 후 팝업창을 닫는다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Sub doClosePage(msg)
        Response.Write "<script language=""javascript"">" & vbcrlf

        If Not (isNull(msg) Or msg = "") Then
            Response.Write "    alert(""" & msg & """);" & vbcrlf
        End If

        Response.Write "   window.self.close();" & vbcrlf
        Response.Write "</script>"
    End Sub

    '/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + doIframeClosePage
    'Author         + Ueom Kwang Yong
    'Parameter      + msg
    'Description    + 메시지 출력 후 iframe 팝업창을 닫는다.
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
    Sub doIframeClosePage(msg)
        Response.Write "<script language=""javascript"">" & vbcrlf

        If Not (isNull(msg) Or msg = "") Then
            Response.Write "    alert(""" & msg & """);" & vbcrlf
        End If

        Response.Write "   window.parent.self.close();" & vbcrlf
        Response.Write "</script>"
    End Sub

	
	'/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    'Function       + getStrRandom
    'Author         + 한승태 2012 09 20 추가
    'Parameter      + 
    'Description    + 파라미터 길이만큼의 랜덤 문자열을 만든다 
    '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	Function getStrRandom(intleng)
	  Dim str, strlen, r, i, ds, serialCode '변수 선언
	  str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" '랜덤으로 선택된 문자or 숫자
	   strlen = intleng		'출력될 값의 자릿수 ex)해당 구문에서 10자리의 랜덤 값 출력
	   Randomize			'랜덤 초기화
	   For i = 1 To strlen
		r = Int((62 - 1 + 1) * Rnd + 1) ' 62은 str의 문자갯수
		serialCode = serialCode + Mid(str,r,1)
	   Next 
	   getStrRandom = serialCode
	 End Function
%>