<%	
	yymmdd = now
	yy= year(yymmdd)
	mm = right("0" & month(yymmdd),2)
	dd = right("0" & day(yymmdd),2)
	yymmdd = yy & "-" & mm & "-" & dd
	week = left(WeekdayName(Weekday(yymmdd)),1)


	select case week
			case "일"
				week = "<font color=red>일</font>"
			case "토"
				week = "<font color=blue>토</font>"
			case "월"
				week = "<font color=black>월</font>"
			case "화"
				week = "<font color=black>화</font>"
			case "수"
				week = "<font color=black>수</font>"
			case "목"
				week = "<font color=black>목</font>"
			case "금"
				week = "<font color=black>금</font>"
	end select



function ReplaceTag2Text(str)
	Dim text
	text = replace(str, "&", "&amp;")
	text = replace(text, "<", "&lt;")
	text = replace(text, ">" ,"&gt;")
	ReplaceTag2Text = text
End function

'-----------------------------------------------------
'  이미지 가로 길이 구하기
'-----------------------------------------------------
Function ImagesSize_width(filename)

	Dim Image_i, image_width, image_height

	Set Image_i = Server.CreateObject("pakImage.ImageSize")   '이미지 사이즈 컴포넌트를 로딩한다.
	Image_i.ImageSIze filename
	image_width =  Image_i.width 
	Set Image_i = Nothing '객체 해제
	
	ImagesSize_width = image_width

End Function


'-----------------------------------------------------
'  이미지 세로 길이 구하기
'-----------------------------------------------------
Function ImagesSize_height(filename)

	Dim Image_i, image_height

	Set Image_i = Server.CreateObject("pakImage.ImageSize")   '이미지 사이즈 컴포넌트를 로딩한다.
	Image_i.ImageSIze filename
	image_height =  Image_i.height 
	Set Image_i = Nothing '객체 해제
	
	ImagesSize_height = image_height

End Function

'****************************************************************** 
'*  # FUNCTION NAME : 페이지별 바로가기
'*  # FUNCTION CONT. : 게시판에서 페이지별 바로가기를 생성해 준다.
'*  # MODIFICATIONS :                                            
'*      1. 2000/02/      진인식    프로그램 처음 작성
'*      2. 2001/05/      김태영    편집
'*      3. 2001/07/      박주현    gen_board2.0에 적용하기위해 사용
'*  # 참고사항 : 흑기사님이 제공해주신 소스를 정리한 함수임
'******************************************************************
Function f_navigator(FILENAME,PAGE,TOTALPAGE)

	'*************** 이전 10 개구문 시작 ****************
	Dim BlockPage, i
	BlockPage = Int((page-1)/10) * 10 + 1
	
	IF BlockPage = 1 Then
    	Response.Write "&nbsp;&nbsp;<font color='gray'>|◀&nbsp;"
	Else
%>
		&nbsp;&nbsp;<a href="<%=filename%>?page=<%=BlockPage-10%>"><font color="#009999">|◀</font></a>&nbsp;
<%
	End If
	'************* 이전 10 개 구문 끝******************    

	If page <> 1 Then 
%>
		<a href='<%=filename%>?page=<%=page-1%>'><font color="#009999">◀</font></a>
<% 
	Else
		Response.Write "<font color='gray'>◀</font>&nbsp;"
	End IF
        
  	i=1
   	Do Until i > 10 or BlockPage > TotalPage
     	IF BlockPage = int(page) Then
%> 
        	<font color=gray><%=BlockPage%>&nbsp;</font>
<%Else%> 
    	<a href="<%=filename%>?page=<%=BlockPage%>"><%=BlockPage%>&nbsp;</a>
<%
    	End If
         
    	BlockPage = BlockPage + 1
    	i = i + 1
    	Loop

	If Cint(page) <> Cint(totalpage) Then

%>
	<a href='<%=filename%>?page=<%=page+1%>'><font color="#009999">▶</font></a> 
<%
	Else
		Response.Write "&nbsp;<font color='gray'>▶</font>"
	End If

	'************* 다음 10 개 구문 시작********************* 
	IF BlockPage > TotalPage Then
   	Response.Write "&nbsp;<font color='gray'>▶|</font>&nbsp;&nbsp;"
	Else
%> 
	<a href="<%=filename%>?page=<%=blockPage%>"><font color="#009999">▶|</font></a>&nbsp;&nbsp;
<%
	End If
	'***************** 다음 10 개 구문 끝***************************         
End Function


'****************************************************************** 
'*  # FUNCTION NAME : 검색 결과에서 페이지별 바로가기
'*  # FUNCTION CONT. : 검색 결과에서 페이지별 바로가기를 생성해 준다.
'*  # MODIFICATIONS :                                            
'*      1. 2000/02/      진인식    프로그램 처음 작성
'*      2. 2001/05/      김태영    편집
'*      3. 2001/07/      박주현    gen_board2.0에 적용하기위해 사용
'*  # 참고사항 : 흑기사님이 제공해주신 소스를 정리한 함수임
'******************************************************************
Function f_navigator_search(FILENAME,PAGE,TotalPage,sWhere,sKeyword)

	'*************** 이전 10 개구문 시작 ****************
	Dim BlockPage, i
	BlockPage = Int((page-1)/10) * 10 + 1
	
	IF BlockPage = 1 Then
    	Response.Write "&nbsp;&nbsp;<font color='gray'>|◀&nbsp;"
	Else
%>
		&nbsp;&nbsp;<a href='<%=FILENAME%>?page=<%=BlockPage-10%>&where=<%=sWhere%>&keyword=<%=sKeyword%>'><font color="#009999">|◀</font></a>&nbsp;
<%
	End If
	'************* 이전 10 개 구문 끝******************    

	If page <> 1 Then 
%>
		<a href='<%=FILENAME%>?page=<%=page-1%>&where=<%=sWhere%>&keyword=<%=sKeyword%>'><font color="#009999">◀</font></a>
<% 
	Else
		Response.Write "<font color='gray'>◀</font>&nbsp;"
	End IF
        
  	i=1
   	Do Until i > 10 or BlockPage > TotalPage
     	IF BlockPage = int(page) Then
%> 
        	<font color=gray><%=BlockPage%>&nbsp;</font>
<%Else%> 
    	<a href="<%=FILENAME%>?page=<%=BlockPage%>&where=<%=sWhere%>&keyword=<%=sKeyword%>"><%=BlockPage%>&nbsp;</a>
<%
    	End If
         
    	BlockPage = BlockPage + 1
    	i = i + 1
    	Loop

	If Cint(page) <> Cint(totalpage) Then

%>
	<a href='<%=FILENAME%>?page=<%=page+1%>&where=<%=sWhere%>&keyword=<%=sKeyword%>'><font color="#009999">▶</font></a> 
<%
	Else
		Response.Write "&nbsp;<font color='gray'>▶</font>"
	End If

	'************* 다음 10 개 구문 시작********************* 
	IF BlockPage > TotalPage Then
   	Response.Write "&nbsp;<font color='gray'>▶|</font>&nbsp;&nbsp;"
	Else
%> 
	<a href="<%=FILENAME%>?page=<%=blockPage%>&where=<%=sWhere%>&keyword=<%=sKeyword%>"><font color="#009999">▶|</font></a>&nbsp;&nbsp;
<%
	End If
	'***************** 다음 10 개 구문 끝***************************         
End Function


'****************************************************************** 
'*  # FUNCTION NAME : SCEK EVENT 상태별 페이지 바로가기
'*  # MODIFICATIONS :                                            
'*  # 수정일 : 2003/12/19   
'******************************************************************
Function e_navigator(FILENAME,SGUBUN,PAGE,TOTALPAGE)

	'*************** 이전 10 개구문 시작 ****************
	Dim BlockPage, i
	BlockPage = Int((page-1)/10) * 10 + 1
	
	IF BlockPage = 1 Then
    	Response.Write "&nbsp;&nbsp;<font color='gray'>|◀&nbsp;"
	Else
%>
		&nbsp;&nbsp;<a href="<%=FILENAME%>?sgubun=<%=SGUBUN%>&page=<%=BlockPage-10%>"><font color="#009999">|◀</font></a>&nbsp;
<%
	End If
	'************* 이전 10 개 구문 끝******************    

	If page <> 1 Then 
%>
		<a href='<%=FILENAME%>?sgubun=<%=SGUBUN%>&page=<%=page-1%>'><font color="#009999">◀</font></a>
<% 
	Else
		Response.Write "<font color='gray'>◀</font>&nbsp;"
	End IF
        
  	i=1
   	Do Until i > 10 or BlockPage > TotalPage
     	IF BlockPage = int(page) Then
%> 
        	<font color=gray><%=BlockPage%>&nbsp;</font>
<%Else%> 
    	<a href="<%=FILENAME%>?sgubun=<%=SGUBUN%>&page=<%=BlockPage%>"><%=BlockPage%>&nbsp;</a>
<%
    	End If
         
    	BlockPage = BlockPage + 1
    	i = i + 1
    	Loop

	If Cint(page) <> Cint(totalpage) Then

%>
	<a href='<%=filename%>?sgubun=<%=SGUBUN%>&page=<%=page+1%>'><font color="#009999">▶</font></a> 
<%
	Else
		Response.Write "&nbsp;<font color='gray'>▶</font>"
	End If

	'************* 다음 10 개 구문 시작********************* 
	IF BlockPage > TotalPage Then
   	Response.Write "&nbsp;<font color='gray'>▶|</font>&nbsp;&nbsp;"
	Else
%> 
	<a href="<%=filename%>?sgubun=<%=SGUBUN%>&page=<%=blockPage%>"><font color="#009999">▶|</font></a>&nbsp;&nbsp;
<%
	End If
	'***************** 다음 10 개 구문 끝***************************         
End Function
%>
