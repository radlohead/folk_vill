<%

'** ---------------------------------------------------------------------------
' 함 수 명 : echo(str)
' 인    자 : 출력 문자열
' 목    적 : 문자열 출력
'** ---------------------------------------------------------------------------
Function Echo(str)
		response.write str
End Function
Function EchoBr(str)
		response.write str &"<br>"
End Function

' ---------------------------------------------------------------------------
' null 값인지를 체크해서
' oriS:원래의 문자열,replS:null일때 셋팅할..문자열
' ---------------------------------------------------------------------------
Function Nvl(oriS,replS)
	If Trim(oriS) = "" or Isnull(oriS) = true Then
		oriS = replS
	End If

	Nvl = Trim(oriS)
End Function

'------------------------------------------------------------------
'	문자열 끊기 (이상의 길이일때는 tail 로 표시)
'------------------------------------------------------------------
Function CutStr(str, num, tail)
	if Len(str) > Cint(num) then
		str = left(str,Cint(num)) + tail
	end if
	CutStr = str
End function

'------------------------------------------------------------------
'	특수문자에 \를 추가하기
'------------------------------------------------------------------
Function AddSlashes(strSrc)
	AddSlashes = Replace(strSrc, " ' ", "\'")
End Function

'------------------------------------------------------------------
'	\를 삭제하기
'------------------------------------------------------------------
Function StripSlashes(strSrc)							' Strip Slashes
	StripSlashes = Replace(strSrc, "\'", "'")
End Function


'--------------------------------------------------------------------
' DataBase Insert시 '," 문자를 '', ""로 바꾸기
'--------------------------------------------------------------------
Function ToDB(str)
	str = Replace(str, chr(34), "&quot;")
	str = Replace(str, "'", "''")
	ToDB = str
End function

'--------------------------------------------------------------------
' DataBase Insert시 " 문자만 ""로 바꾸기
'--------------------------------------------------------------------
Function ToDB_PROC(str)
	str = Replace(str, chr(34), "&quot;")
	ToDB_PROC = str
End function



'--------------------------------------------------------------------
' ' 문자나 " 문자를 공백으로 바꾸기
'--------------------------------------------------------------------
Function DelQuote(str)
	str = Replace(str, "'", "")
	str = Replace(str, """",  "" )
	DelQuote = str
End function


'** ---------------------------------------------------------------------------
' ' 10보다 작은 수 앞에 0 붙이기
'** ---------------------------------------------------------------------------
function IntToStr(i)
	if i="" then
		k=""
	else
		if cint(i)<10 then
			k = "0" & cint(i)
		else
			k = cstr(i)
		end if
	end if
	inttostr = k
end function


' ---------------------------------------------------------------------------
'	소수점 버리기
'	input	: string (DB value , <br>)
' ---------------------------------------------------------------------------

Function TrimNum(num_str)

	Result = Split(num_str,".")

	If UBound(Result) > 0 Then
		trimNum = Result(0)
	Else
		trimNum = num_str
	End If
End Function


' ---------------------------------------------------------------------------
' lpad 함수적용
' oriStr:원래의 문자열,num:자리수,preStr:자리수가 부족할때 채워줄 문자열
' ---------------------------------------------------------------------------
Function Lpad(oriStr,num,preStr)
		tmpSt = ""
		if Len(oriStr) < Cint(num) then
			For i=1 to (Cint(num)-Len(oriStr))
				tmpStr = preStr&tmpStr
			Next
			oriStr = tmpStr&oriStr
		end if

		LPAD = oriStr
End function

' ---------------------------------------------------------------------------
' lpad 함수적용
' oriStr:원래의 문자열,num:자리수,preStr:자리수가 부족할때 채워줄 문자열
' ---------------------------------------------------------------------------
sub RW(str)
		Response.write (str)
end sub

sub RE()
		Response.end
end sub

'#############################################
'# HTML 태그변환 I
'#############################################
Function ReplaceTag2Text(str)
	str = replace(str, "&", "&amp;")
	str = replace(str, "<", "&lt;")
	str = replace(str, ">", "&gt;")
	str = replace(str, "&amp;quot;", chr(34))
	ReplaceTag2Text = str
End Function

'#############################################
'# HTML 태그변환 II
'#############################################
Function ReplaceBR(str)
	str = Replace(str, "\n", "<BR>")
	ReplaceBR = str
End Function

'#############################################
'# 대소문자 구별없이 원하는 문자열을 바꾼후, 원문을 돌려줌.
'# SQL Injection 공격시 대소문자를 혼용해서 공격할 경우 대소문자 구문하지 않고 처리
'#############################################
Function RegExp_Replace(text, findchr, replacestr)
'text:전체문장 'findchr:찾을문자열(소문자로 보내면 됨)
'replace:변환할 문자열(바꾸고 싶은 문자열)
'반환은, 보내진 text 문장에서 문자열을 바꾼후 다시 반환.
'on error resume next
Dim eregObj:
Set eregObj = New RegExp:
eregObj.Pattern = findchr: '//패턴 설정
eregObj.IgnoreCase = True: '//대소문자 구분 여부
eregObj.Global = True: '//전체 문서에서 검색
RegExp_Replace = eregObj.Replace(text, replacestr):
'//Replace String
'if err then
'Response.Write err.Description
'end if
End Function
'Response.write RegExp_Replace("AbSoluteEET","absolute","")

'#############################################
'# SQL Injection 관련 Request 값 필터링 함수
'#############################################
Function NEW_SIMPLE_SQLINJECTION_FILTER(str)
	str = trim(str)
	if str <> "" then
	str = RegExp_Replace(str, "'", "''")
	str = RegExp_Replace(str,";", "")
	str = RegExp_Replace(str,"--", "")
	str = RegExp_Replace(str, chr(34),"&quot;")
	str = RegExp_Replace(str,"%20","")
	str = RegExp_Replace(str,"xp_","")
	str = RegExp_Replace(str,"sp_","")
	str = RegExp_Replace(str,"1=1","")
	str = RegExp_Replace(str,"@variable","")
	str = RegExp_Replace(str,"@@variable","")
	str = RegExp_Replace(str,"sysobject","")
	'str = RegExp_Replace(str,"80040e14","")
	end if
	NEW_SIMPLE_SQLINJECTION_FILTER = str
End Function

'#############################################
'# SQL Injection 관련 Request 값 필터링 함수
'#############################################
Function NEW_FULL_SQLINJECTION_FILTER(str)
	str = trim(str)
	if str <> "" then
	str = RegExp_Replace(str, "'", "''")
	str = RegExp_Replace(str,";", "")
	str = RegExp_Replace(str,"--", "")
	str = RegExp_Replace(str, chr(34),"&quot;")
	str = RegExp_Replace(str,"create","")
	str = RegExp_Replace(str,"alter","")
	str = RegExp_Replace(str,"drop","")
	str = RegExp_Replace(str,"truncate","")
	str = RegExp_Replace(str,"table","")
	str = RegExp_Replace(str,"declare","")
	str = RegExp_Replace(str,"exec","")
	str = RegExp_Replace(str,"%20","")
	str = RegExp_Replace(str,"select","")
	str = RegExp_Replace(str,"update","")
	str = RegExp_Replace(str,"delete","")
	str = RegExp_Replace(str,"insert","")
	str = RegExp_Replace(str,"union","")
	str = RegExp_Replace(str,"cast","")
	str = RegExp_Replace(str,"varchar","")
	str = RegExp_Replace(str,"nvarchar","")
	str = RegExp_Replace(str,"xp_","")
	str = RegExp_Replace(str,"sp_","")
	str = RegExp_Replace(str,"and","")
	str = RegExp_Replace(str,"or","")
	str = RegExp_Replace(str,"1=1","")
	str = RegExp_Replace(str,"@variable","")
	str = RegExp_Replace(str,"@@variable","")
	str = RegExp_Replace(str,"sysobject","")
	'str = RegExp_Replace(str,"80040e14","")
	end if
	NEW_FULL_SQLINJECTION_FILTER = str
End Function

'#############################################
'# 대소문자 구별없이 원하는 문자열을 바꾼후, 원문을 돌려줌.
'# SQL Injection 공격시 대소문자를 혼용해서 공격할 경우 대소문자 구문하지 않고 처리
'#############################################
Function eregi_replace(text, findchr, replace)
'text:전체문장 'findchr:찾을문자열(소문자로 보내면 됨)
'replace:변환할 문자열(바꾸고 싶은 문자열)
'반환은, 보내진 text 문장에서 문자열을 바꾼후 다시 반환.
'on error resume next
Dim eregObj:
Set eregObj = New RegExp:
eregObj.Pattern = findchr: '//패턴 설정
eregObj.IgnoreCase = True: '//대소문자 구분 여부
eregObj.Global = True: '//전체 문서에서 검색
eregi_replace = eregObj.Replace(text, replace):
'//Replace String
'if err then
'Response.Write err.Description
'end if
End Function
'Response.write eregi_replace("AbSoluteEET","absolute","")

'#############################################
'# SQL Injection 관련 Request 값 필터링 함수
'#############################################
Function RP(str)
	str = trim(str)
	if str <> "" then
	str = eregi_replace(str, "'", "''")
	str = eregi_replace(str, "'", "''")
	str = eregi_replace(str,";", "")
	str = eregi_replace(str,"--", "")
	end if
	RP = str
End function

'#############################################
'# SQL Injection 관련 Request 값 필터링 함수
'#############################################
Function RP1(str)
	str = trim(str)
	if str <> "" then
	str = eregi_replace(str, "'", "''")
	str = eregi_replace(str,";", "")
	str = eregi_replace(str,"--", "")
	str = eregi_replace(str,"create","")
	str = eregi_replace(str,"alter","")
	str = eregi_replace(str,"drop","")
	str = eregi_replace(str,"truncate","")
	str = eregi_replace(str,"table","")
	str = eregi_replace(str,"declare","")
	str = eregi_replace(str,"exec","")
	str = eregi_replace(str,"%20","")
	str = eregi_replace(str,"select","")
	str = eregi_replace(str,"update","")
	str = eregi_replace(str,"delete","")
	str = eregi_replace(str,"insert","")
	str = eregi_replace(str,"union","")
	str = eregi_replace(str,"xp_","")
	str = eregi_replace(str,"sp_","")
	str = eregi_replace(str,"and","")
	str = eregi_replace(str,"or","")
	str = eregi_replace(str,"1=1","")
	str = eregi_replace(str,"@variable","")
	str = eregi_replace(str,"@@variable","")
	str = eregi_replace(str,"sysobject","")
	end if
	RP1 = str
End function

'#############################################
'# SQL Injection 관련 Request 값 필터링 함수
'#############################################
Function SIMPLE_INJECTION_FILTER(str)
	str = trim(str)
	if str <> "" then
	str = eregi_replace(str, "'", "''")
	str = eregi_replace(str,";", "")
	str = eregi_replace(str,"--", "")
	str = eregi_replace(str, chr(34),"&quot;")
	end if
	SIMPLE_INJECTION_FILTER = str
End function

'#############################################
'# SQL Injection 관련 Request 값 필터링 함수
'#############################################
Function COMPLEX_INJECTION_FILTER(str)
	str = trim(str)
	if str <> "" then
	str = eregi_replace(str, "'", "''")
	str = eregi_replace(str,";", "")
	str = eregi_replace(str,"--", "")
	str = eregi_replace(str, chr(34),"&quot;")
	str = eregi_replace(str,"create","")
	str = eregi_replace(str,"alter","")
	str = eregi_replace(str,"drop","")
	str = eregi_replace(str,"truncate","")
	str = eregi_replace(str,"table","")
	str = eregi_replace(str,"declare","")
	str = eregi_replace(str,"exec","")
	str = eregi_replace(str,"%20","")
	str = eregi_replace(str,"select","")
	str = eregi_replace(str,"update","")
	str = eregi_replace(str,"delete","")
	str = eregi_replace(str,"insert","")
	str = eregi_replace(str,"union","")
	str = eregi_replace(str,"xp_","")
	str = eregi_replace(str,"sp_","")
	str = eregi_replace(str,"and","")
	str = eregi_replace(str,"or","")
	str = eregi_replace(str,"1=1","")
	str = eregi_replace(str,"@variable","")
	str = eregi_replace(str,"@@variable","")
	str = eregi_replace(str,"sysobject","")
	end if
	COMPLEX_INJECTION_FILTER = str
End function




'#############################################
'# SQL Injection 관련 Request 값 필터링 함수
'#############################################
Function COMPLEX_INJECTION_FILTER2(str)
	str = trim(str)
	if str <> "" then
	str = eregi_replace(str, "'", "''")
	str = eregi_replace(str,";", "")
	str = eregi_replace(str,"--", "")
	str = eregi_replace(str, chr(34),"&quot;")
	str = eregi_replace(str,"create","")
	str = eregi_replace(str,"alter","")
	str = eregi_replace(str,"drop","")
	str = eregi_replace(str,"truncate","")
	str = eregi_replace(str,"table","")
	str = eregi_replace(str,"declare","")
	str = eregi_replace(str,"exec","")
	str = eregi_replace(str,"%20","")
	str = eregi_replace(str,"select","")
	str = eregi_replace(str,"update","")
	str = eregi_replace(str,"delete","")
	str = eregi_replace(str,"insert","")
	str = eregi_replace(str,"union","")
	str = eregi_replace(str,"xp_","")
	str = eregi_replace(str,"sp_","")
	str = eregi_replace(str,"1=1","")
	str = eregi_replace(str,"@variable","")
	str = eregi_replace(str,"@@variable","")
	str = eregi_replace(str,"sysobject","")
	end if
	COMPLEX_INJECTION_FILTER2 = str
End function

'#############################################
'# HTML 태그 제거  함수
'#############################################
Function RemoveHTML( strText )
       dim contTmp
	set tagfree = New Regexp
	tagfree.Pattern= "<[^>]+>"
	tagfree.Global=true
	strText=tagfree.Replace(strText,"")
	RemoveHTML= strText
End Function

'#############################################
'# 금주의 촬영 분류 이미지 체인지 함수
'#############################################
Function FimlCategoryIcon(byref code)
	Select Case code
		Case "F1001" '드라마
			filmcateimg = "shooting_icon_drama"
		Case "F1002" '영화
			filmcateimg = "shooting_icon_movie"
		Case "F1003" '교양
			filmcateimg = "shooting_icon_culture"
		Case "F1004" '오락
			filmcateimg = "shooting_icon_ent"
	End Select

	FimlCategoryIcon = filmcateimg
End Function

'#############################################
'# 금주의 촬영 분류 텍스트 체인지 함수
'#############################################
Function FimlCategoryText(byref code)
	Select Case code
		Case "F1001" '드라마
			filmcatetxt = "드라마"
		Case "F1002" '영화
			filmcatetxt = "영화"
		Case "F1003" '교양
			filmcatetxt = "교양"
		Case "F1004" '오락
			filmcatetxt = "오락"
	End Select

	FimlCategoryText = filmcatetxt
End Function

'#############################################
'# 공지사항 분류 이미지 체인지 함수
'#############################################
Function NoticeCategoryIcon(byref code)
	Select Case code
		Case "N1001" '행사
			noticateimg = "notice_part_event"
		Case "N1002" '공연
			noticateimg = "notice_part_perform"
		Case "N1003" '할인
			noticateimg = "notice_part_discount"
		Case "N1004" '안내
			noticateimg = "notice_part_info"
		Case "N1005" '공지
			noticateimg = "notice_part_notify"
		Case "N1006" '체험
			noticateimg = "notice_part_experience"
		Case "N1007" '기타
			noticateimg = "notice_part_etc"
	End Select

	NoticeCategoryIcon = noticateimg
End Function

'#############################################
'# 공지사항 분류 텍스트 체인지 함수
'#############################################
Function NoticeCategoryText(byref code)
	Select Case code
		Case "N1001" '행사
			noticatetxt = "행사"
		Case "N1002" '공연
			noticatetxt = "공연"
		Case "N1003" '할인
			noticatetxt = "할인"
		Case "N1004" '안내
			noticatetxt = "안내"
		Case "N1005" '공지
			noticatetxt = "공지"
		Case "N1006" '체험
			noticatetxt = "체험"
		Case "N1007" '기타
			noticatetxt = "기타"
	End Select

	NoticeCategoryText = noticatetxt
End Function

'#############################################
'# 상담/예약 희망프로그램 공통코드 체인지 함수
'#############################################
Function getConsultHopeChange(code)
	Select Case code
		Case "C1001"
			codeType = "CONEX"
		Case "C1002"
			codeType = "CONCO"
		Case "C1003"
			codeType = "CONYO"
		Case "C1004"
			codeType = "CONHE"
	End Select

	getConsultHopeChange = codeType
End Function

'#############################################
'# 공지사항 분류 텍스트 체인지 함수
'#############################################
Function getNoticeChange(code)
	Select Case code
		Case "N1001"
			CodeText = "행사"
		Case "N1002"
			CodeText = "공연"
		Case "N1003"
			CodeText = "할인"
		Case "N1004"
			CodeText = "안내"
		Case "N1005"
			CodeText = "공지"
		Case "N1006"
			CodeText = "체험"
		Case "N1007"
			CodeText = "기타"
	End Select

	getNoticeChange = CodeText
End Function

'#############################################
'# 제휴카드할인 텍스트 체인지 함수
'#############################################
Function getPartnerShipCardChange(code)
	Select Case code
		Case "C1001"
			CodeText = "BC카드"
		Case "C1002"
			CodeText = "NH채움카드"
		Case "C1003"
			CodeText = "현대카드"
		Case "C1004"
			CodeText = "씨티카드"
	End Select

	getPartnerShipCardChange = CodeText
End Function

'#############################################
'# 금주의촬영 텍스트 체인지 함수
'#############################################
Function getWeekFilmingChange(code)
	Select Case code
		Case "F1001"
			CodeText = "드라마"
		Case "F1002"
			CodeText = "영화"
		Case "F1003"
			CodeText = "교양"
		Case "F1004"
			CodeText = "오락"
	End Select

	getWeekFilmingChange = CodeText
End Function

'#############################################
'# 채용 부서 텍스트 체인지 함수
'#############################################
Function getRecruitDeptChange(code)
	Select Case code
		Case "R1001"
			CodeText = "경영관리팀"
		Case "R1002"
			CodeText = "마케팅팀"
		Case "R1003"
			CodeText = "시설관리팀"
		Case "R1004"
			CodeText = "영업팀"
		Case "R1005"
			CodeText = "판촉팀"
		Case "R1006"
			CodeText = "대졸공채"
	End Select

	getRecruitDeptChange = CodeText
End Function

'#############################################
'# 상담/예약 텍스트 체인지 함수
'#############################################
Function get_Consult_Change(byref consultLineText)
	Select Case consultLineText
		Case "C1001"
			consultLineText = "일일체험학습"
		Case "C1002"
			consultLineText = "기업&외국인단체"
		Case "C1003"
			consultLineText = "유스호스텔"
		Case "C1004"
			consultLineText = "전통혼례"
	End Select

	get_Consult_Change = consultLineText
End Function

'#############################################
'# 전통식품 텍스트 체인지 함수
'#############################################
Function get_CustomFood_Change(byref foodLineText)
	Select Case foodLineText
		Case "F1001"
			foodLineText = "장류"
		Case "F1002"
			foodLineText = "기름류"
		Case "F1003"
			foodLineText = "전통주류"
		Case "F1004"
			foodLineText = "옛날 찹쌀엿"
	End Select

	get_CustomFood_Change = foodLineText
End Function

'#############################################
'# 다국어 민속촌NOW 분류 텍스트 체인지 함수
'#############################################
Function getMultiNowChange(code)
	Select Case code
		Case "N1001"
			CodeText = "Event"
		Case "N1002"
			CodeText = "News"
		Case "N1003"
			CodeText = "Notice"
		Case "N1004"
			CodeText = "Etc"
	End Select

	getMultiNowChange = CodeText
End Function

'#############################################
'# 2014/03/24
'# 다국어 민속촌NOW 분류 텍스트 체인지 함수
'#############################################
Function getMultiNowChangeNew(byref code, byref gubun)
	Select Case code
		Case "N1001"
			if gubun = "E" then
				CodeText = "Event"
			elseif gubun = "C" then
				CodeText = "事件"
			elseif gubun = "J" then
				CodeText = "イベント"
			end if
		Case "N1002"
			if gubun = "E" then
				CodeText = "News"
			elseif gubun = "C" then
				CodeText = "新聞"
			elseif gubun = "J" then
				CodeText = "ニュース"
			end if
		Case "N1003"
			if gubun = "E" then
				CodeText = "Notice"
			elseif gubun = "C" then
				CodeText = "通知"
			elseif gubun = "J" then
				CodeText = "予告"
			end if
		Case "N1004"
			if gubun = "E" then
				CodeText = "Etc"
			elseif gubun = "C" then
				CodeText = "等等"
			elseif gubun = "J" then
				CodeText = "エトセトラ"
			end if
	End Select

	getMultiNowChangeNew = CodeText
End Function

'#############################################
'# 다국어 민속촌NOW 분류 이미지 체인지 함수
'#############################################
Function NowMultiCategoryIcon(byref code)
	Select Case code
		Case "N1001" 'Event
			nowcateimg = "now_part_event"
		Case "N1002" 'News
			nowcateimg = "now_part_news"
		Case "N1003" 'Notice
			nowcateimg = "now_part_notice"
		Case "N1004" 'Etc
			nowcateimg = "now_part_etc"
	End Select

	NowMultiCategoryIcon = nowcateimg
End Function

'#############################################
'# 다국어 민속촌NOW 분류 텍스트 체인지 함수
'#############################################
Function NowMultiCategoryText(byref code)
	Select Case code
		Case "N1001" 'Event
			nowcatetxt = "Event"
		Case "N1002" 'News
			nowcatetxt = "News"
		Case "N1003" 'Notice
			nowcatetxt = "Notice"
		Case "N1004" 'Etc
			nowcatetxt = "Etc"
	End Select

	NowMultiCategoryText = nowcatetxt
End Function

'#############################################
'# 2014/03/24
'# 다국어 민속촌NOW 분류 텍스트 체인지 함수
'#############################################
Function NowMultiCategoryTextNew(byref code, byref gubun)
	Select Case code
		Case "N1001"
			if gubun = "E" then
				nowcatetxt = "Event"
			elseif gubun = "C" then
				nowcatetxt = "事件"
			elseif gubun = "J" then
				nowcatetxt = "イベント"
			end if
		Case "N1002"
			if gubun = "E" then
				nowcatetxt = "News"
			elseif gubun = "C" then
				nowcatetxt = "新聞"
			elseif gubun = "J" then
				nowcatetxt = "ニュース"
			end if
		Case "N1003"
			if gubun = "E" then
				nowcatetxt = "Notice"
			elseif gubun = "C" then
				nowcatetxt = "通知"
			elseif gubun = "J" then
				nowcatetxt = "予告"
			end if
		Case "N1004"
			if gubun = "E" then
				nowcatetxt = "Etc"
			elseif gubun = "C" then
				nowcatetxt = "等等"
			elseif gubun = "J" then
				nowcatetxt = "エトセトラ"
			end if
	End Select

	NowMultiCategoryTextNew = nowcatetxt
End Function

'#############################################
'# 첨부파일 이미지 체인지 함수
'#############################################
Function get_file_change(byref fileimg)
	select case fileimg
		case "bmp"
			fileimg = "bmp.gif"
		case "exe"
			fileimg = "exe.gif"
		case "doc"
			fileimg = "doc.gif"
		case "gif"
			fileimg = "gif.gif"
		case "htm"
			fileimg = "htm.gif"
		case "html"
			fileimg = "htm.gif"
		case "hwp"
			fileimg = "hwp.gif"
		case "jpg"
			fileimg = "jpg.gif"
		case "jpeg"
			fileimg = "jpg.gif"
		case "js"
			fileimg = "js.gif"
		case "mid"
			fileimg = "mid.gif"
		case "mp3"
			fileimg = "mp3.gif"
		case "mpeg"
			fileimg = "mpeg.gif"
		case "pdf"
			fileimg = "pdf.gif"
		case "ppt"
			fileimg = "ppt.gif"
		case "psd"
			fileimg = "psd.gif"
		case "rar"
			fileimg = "rar.gif"
		case "swf"
			fileimg = "swf.gif"
		case "text"
			fileimg = "txt.gif"
		case "txt"
			fileimg = "txt.gif"
		case "xls"
			fileimg = "xls.gif"
		case "xlsx"
			fileimg = "xls.gif"
		case "zip"
			fileimg = "zip.gif"
		case else
			fileimg = "zip.gif"
	end select

	get_file_change = fileimg
End Function

' 요일 변환하기
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

' 한글/영문 바이트로 일정하게 자르기1
Function cutStrNew(str, cutLen)
   Dim strLen, strByte, strCut, strRes, char, i
   strLen = 0
   strByte = 0
   strLen = Len(str)
   for i = 1 to strLen
	   char = ""

	   strCut = Mid(str, i, 1)   '일단 1만큼 잘라서 strRes에 저장한다.
	   char = Asc(strCut)      '아스키 코드값 읽어오기
	   char = Left(char, 1)
	   if char = "-" then         '"-"이면 2바이트 문자임
		   strByte = strByte + 2
	   else
		   strByte = strByte + 1
	   end if

	   if cutLen < strByte then
		   strRes = strRes & "..."
		   exit for
	   else
		   strRes = strRes & strCut
	   end if
   next
   cutStrNew = strRes
End Function

' 한글/영문 바이트로 일정하게 자르기2
Function cutStrNew2(str, strlen)
   dim rValue
   dim nLength

   nLength = 0.00
   rValue = ""

   for f = 1 to len(str)
	   tmpStr = MID(str,f,1)
	   tmpLen = ASC(tmpStr)
	   if  (tmpLen < 0) then
		   '한글
		   nLength = nLength + 1.4 '한글일때 길이값 설정
		   rValue = rValue & tmpStr
	   elseif (tmpLen >= 97 and tmpLen <= 122) then
		   '영문 소문자
		   nLength = nLength + 0.75 '영문소문자 길이값 설정
		   rValue = rValue & tmpStr
	   elseif (tmpLen >= 65 and tmpLen <= 90) then
		   '영문 대문자
		   nLength = nLength + 1 '영문대문자 길이값 설정
		   rValue = rValue & tmpStr
	   else
		   '그외 키값
		   nLength = nLength + 0.6 '특수문자 기호값...
		   rValue = rValue & tmpStr
	   end if

	   If (nLength > strlen) then
		   rValue = rValue & "..."
		   exit for
	   end if
   next
   cutStrNew2 = rValue
End Function

' 한글/영문 바이트로 일정하게 자르기3(정규식 이용)
Function subString(char, ln, sc)
   dim curlen,slen,i,tmp
   curlen = len(eregi_replace( char, "[ㄱ-힝]", "**"))

   if curlen>ln then
	   slen=0
	   for i=1 to len(trim(char))
		   if slen>=ln then exit for

		   if len(eregi_replace( mid(trim(char),i,1), "[ㄱ-힝]", "**" ))=2 then
			   slen=slen + 2
		   else
			   slen=slen + 1
		   end if

		   tmp = left(trim(char),i)
	   next
	   tmp = tmp & sc
   else
	   tmp = trim(char)
   end if
   subString = tmp
End Function

' 한글/영문 바이트로 일정하게 자르기4(2014/11/06)
Function LeftCut(strString, intCut)
	dim intPos, chrTemp, strCut, intLength
	'문자열 길이 초기화
	intLength = 0
	intPos = 1

	'문자열 길이만큼 돈다
	do while ( intPos <= Len( strString ))

	   '문자열을 한문자씩 비교한다
		chrTemp = ASC(Mid( strString, intPos, 1))

		if chrTemp < 0 then '음수값(-)이 나오면 한글임
		  strCut = strCut & Mid( strString, intPos, 1 )
		  intLength = intLength + 2  '한글일 경우 문자열 길이를 2를 더한다
		else
		  strCut = strCut & Mid( strString, intPos, 1 )
		  intLength = intLength + 1  '한글이 아닌경우 문자열 길이를 1을 더한다
		end If

		if intLength >= intCut  Then
			strCut = strCut & "..."
		   exit do
		end if

		intPos = intPos + 1

	Loop

	'리턴값
	LeftCut = strCut
 End Function


'유니크한 파일경로및 파일이름을 얻어내는 함수
Function GetUniqueName(byref strFileName, DirectoryPath)

	Dim strName, strExt
	strName = Mid(strFileName, 1, InstrRev(strFileName, ".") - 1)	' 확장자를 제외한 파일명을 얻는다.
	strExt = Mid(strFileName, InstrRev(strFileName, ".") + 1)		'확장자를 얻는다

	if Right(DirectoryPath ,1) <> "\" then DirectoryPath = DirectoryPath & "\"

	Dim fso
	Set fso = Server.CreateObject("Scripting.FileSystemObject")

	Dim bExist : bExist = True
	'우선 같은이름의 파일이 존재한다고 가정
	Dim strFileWholePath : strFileWholePath = DirectoryPath & strName & "." & strExt
	'저장할 파일의 완전한 이름(완전한 물리적인 경로) 구성
	Dim countFileName : countFileName  = 0
	'파일이 존재할 경우, 이름 뒤에 붙일 숫자를 세팅함.

	Do While bExist ' 우선 있다고 생각함.
		If (fso.FileExists(strFileWholePath)) Then	' 같은 이름의 파일이 있을 때
			countFileName = countFileName  + 1	'파일명에 숫자를 붙인 새로운 파일 이름 생성
			strFileName = strName & "(" & countFileName & ")." & strExt
			strFileWholePath = DirectoryPath & strFileName
		Else
			bExist = False
		End If
	Loop
	GetUniqueName = strFileWholePath
End Function

' 파일이름 재조합 함수
' 작성자 : 박주현
' 용도 : 파일명 재조합
Function MakeNewFileName()

	'랜덤 함수
	Randomize
	'1 ~ 9999 까지의 임의수 가져오기
	RandamNum = Int((9999 - 1 + 1) * Rnd + 1)

	'날짜 조합
	Years= year(date)
	Months = month(date)
	IF int(Months) < 10 THEN
	Months = "0" & Months
	END IF
	Days = day(date)
	IF int(Days) < 10 THEN
	Days = "0" & Days
	END IF
	Hours = hour(time)
	IF int(Hours) < 10 THEN
	Hours = "0" & Hours
	END IF
	Minutes = minute(time)
	IF int(Minutes) < 10 THEN
	Minutes = "0" & Minutes
	END If
	Seconds = Second(time)
	IF int(Seconds) < 10 THEN
	Seconds = "0" & Seconds
	END If

	MakeNewFileName = Years & Months & Days & Hours & Minutes & Seconds & RandamNum

End Function

' 전통식품 주문번호 생성
' 작성자 : 박주현
' 용도 : 전통식품 주문번호 생성
Function MakeOrderNumber()

	'랜덤 함수
	Randomize
	'1 ~ 9999 까지의 임의수 가져오기
	RandamNum = Int((9999 - 1 + 1) * Rnd + 1)

	'날짜 조합
	Years= year(date)
	Months = month(date)
	IF int(Months) < 10 THEN
	Months = "0" & Months
	END IF
	Days = day(date)
	IF int(Days) < 10 THEN
	Days = "0" & Days
	END IF
	Hours = hour(time)
	IF int(Hours) < 10 THEN
	Hours = "0" & Hours
	END IF
	Minutes = minute(time)
	IF int(Minutes) < 10 THEN
	Minutes = "0" & Minutes
	END If
	Seconds = Second(time)
	IF int(Seconds) < 10 THEN
	Seconds = "0" & Seconds
	END If

	MakeOrderNumber = Years & Months & Days & Hours & Minutes & Seconds & RandamNum

End Function

'2003서버 CDO메일 객체를 이용한 메일발송
Function SendMail(SendName, SendEmail, ReceiveName, ReceiveEmail, Subject, HtmlContents, FlagName)

	Dim iMsg
	Dim iConf
	Dim Flds
	Dim strHTML

	Const cdoSendUsingPort = 1 '1:로컬, 2:외부 smtp
	set iMsg = CreateObject("CDO.Message")
	set iConf = CreateObject("CDO.Configuration")
	Set Flds = iConf.Fields
		Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = cdoSendUsingPort
		Flds.item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25  '포트번호

		'웹나이트가 설치된 2003서버에서 문자가 깨져나오는 현상때문에 추가
		Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverpickupdirectory") = "C:\Inetpub\mailroot\Pickup"

		Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
		Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10

		Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") =  "" 'ID
		Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") =  "" '암호


		Flds.Update
		Set iMsg.Configuration = iConf

			iMsg.To = ReceiveName&"<"&ReceiveEmail&">" 'ToDo: Enter a valid email address. 받는 사람 이메일
			iMsg.From = SendName&"<"&SendEmail&">" 'ToDo: Enter a valid email address. 보내는 사람 이메일
			iMsg.Subject = Subject

			'iMsg..TextBody = strHTMLMsg '// 텍스트
			iMsg.HTMLBody = HtmlContents  '// HTML 제목 깨짐 발생..

			iMsg.BodyPart.Charset="euc-kr"
			iMsg.HTMLBodyPart.Charset="euc-kr"
			iMsg.Send
			'End With
		Set iMsg = Nothing
		Set iConf = Nothing
		Set Flds = Nothing

'		response.write HtmlContents
'		response.end

End Function

'File Templete 파일을 읽어서 문자로 반환
Function read_file_temp(filepath)
	Dim rStr, f
	set fso = Server.CreateObject("Scripting.FileSystemObject")

	if fso.FileExists(filepath) then
		set f = fso.OpenTextFile (filepath, 1)
		rStr = f.ReadAll
		set f = nothing
	end if

	set fso = nothing
	read_file_temp = rStr
End Function

'////////// 정규식을 이용하여 문자열을 검색하는 함수(대소문자 구분 없음)
Function eregi(ptrn, str)
	Dim eregEx, retVal
	Set eregEx = New RegExp
	eregEx.Pattern = ptrn
	eregEx.IgnoreCase = True

	retVal = eregEx.Test(str)

	If retVal Then
		eregi = True
	Else
		eregi = False
	End If
End Function

'////////// 파일확장명에 따른 아이콘 이미지 출력 함수
Function FileTypeIcon(ByVal fileName)
	Dim fileType, img_ico
	Dim path

	'//파일의 확장자 추출
	fileType = LCase(Mid(fileName, InstrRev(fileName, ".") + 1))
	path = "/images/filetype/"
	img_ico = "<img src=""" & path

	'//파일 확장자 확인
	If eregi("(asf|avi|bmp|doc|exe|gif|hnc|htm|html|hwp|jpg|jpeg|js|mid|mp3|mpeg|mpg|pdf|ppt|ra|ram|rar|swf|txt|wav|wma|wmv|xls|zip)", fileType) Then
		img_ico = img_ico & fileType
	Else
		img_ico = img_ico & "unknown"
	End If

	img_ico = img_ico & ".gif"" alt=""첨부파일"" align=""absmiddle"" onerror=""this.style.display='none';"" />"

	If fileName="" Then img_ico = "<img src=""" & path & "default.gif"" alt=""문서"" />"

	FileTypeIcon = img_ico
End Function

'////////// 메일발송용 파일확장명에 따른 아이콘 이미지 출력 함수
Function FileTypeIconMail(ByVal fileName)
	Dim fileType, img_ico
	Dim path

	'//파일의 확장자 추출
	fileType = LCase(Mid(fileName, InstrRev(fileName, ".") + 1))
	path = "/img/filetype/"
	img_ico = "<img src=""http://upload.viralblog.co.kr" & path

	'//파일 확장자 확인
	If eregi("(asf|avi|bmp|doc|exe|gif|hnc|htm|html|hwp|jpg|js|mid|mp3|mpeg|mpg|pdf|ppt|ra|ram|rar|swf|txt|wav|wma|wmv|xls|zip)", fileType) Then
		img_ico = img_ico & fileType
	Else
		img_ico = img_ico & "unknown"
	End If

	img_ico = img_ico & ".gif"" alt=""첨부파일"" align=""absmiddle"" onerror=""this.style.display='none';"" />"

	If fileName="" Then img_ico = "<img src=""" & path & "default.gif"" alt=""문서"" />"

	FileTypeIconMail = img_ico
End Function

function ul_replaceText(allText, findText, replaceText)
	dim regObj
	set regObj = new regexp
	regObj.pattern = findText
	regObj.ignoreCase = true
	regObj.global = true

	ul_replaceText = regObj.replace(allText, replaceText)
end function


' 닫기(*)
function f_AlertClose(msg)
	with Response

		.write "<script language='javascript'>"
		.write "alert('"&msg&"');"
		.write "window.close();"
		.write "</script>"
		.end
	end with
end Function

' 닫고 로그인페이지로이동(*)
function f_AlertLogin(msg, rtn_url)
		with Response

		.write "<form method='post' name='form_move' action='/membership/login.asp'>"
		.write "<input type='hidden' name='ref' value='"&rtn_url&"'>"
		.write "</form>"
		.write "<script language='javascript'>"
		.write "alert('"&msg&"');"
		.write "document.form_move.submit();"
		.write "</script>"
	end with
end Function

' 닫고 ADMIN 로그인페이지로이동(*)
function f_AlertAdminLogin(msg)
		with Response

			.write "<form method=post name=""form_move"" action=""/admin/login.asp"" target='_top'>"
			.write "</form>"
			.write "<script language='javascript'>"
			.write "alert('"&msg&"');"
			.write "document.form_move.submit();"
			.write "</script>"
			.end
		end with
end Function

' 닫고 ADMIN2 로그인페이지로이동(*)
function f_AlertAdminLogin2(msg)
		with Response

			.write "<form method=post name=""form_move"" action=""/salesadmin/login.asp"" target='_top'>"
			.write "</form>"
			.write "<script language='javascript'>"
			.write "alert('"&msg&"');"
			.write "document.form_move.submit();"
			.write "</script>"
			.end
		end with
end Function

' 닫고 부모창 ADMIN 로그인페이지로이동(*)
function f_AlertAdminLogin_pop(msg)
		with Response

			.write "<script language='javascript'>"
'			.write "alert('"&msg&"');"
			.write "opener.location.href=""/admin/login.asp"";"
			.write "self.close();"
			.write "</script>"
			.end
		end with
end Function

' 닫고 부모창 ADMIN 로그인페이지로이동(*)
function f_AlertLogin_pop(msg)
		with Response

			.write "<script language='javascript'>"
			.write "alert('"&msg&"');"
			.write "opener.location.href=""/login.asp"";"
			.write "self.close();"
			.write "</script>"
			.end
		end with
end Function

' 메시지 출력후 이동(*)
function f_AlertUrl(msg, url)
	with Response

		.write "<script language=javascript>"
		.write "alert('"& msg &"');"
		.write "location.href='"& url &"';"
		.write "</script>"
		.end
	end with
end Function

' 메시지 출력후 parent 이동(*)
function f_AlertParentUrl(msg, url)
	with Response

		.write "<script language=javascript>"
		.write "alert('"& msg &"');"
		.write "parent.location.href='"& url &"';"
		.write "</script>"
		.end
	end with
end Function

' 에러페이지 이동
function f_AlertError(msg,pagetype)
	with Response

		.write "<form name=""f"" action=""/common/page_error.asp"" method=""post"">"
		.write "  <input type=""hidden"" name=""msg"" value="""&msg&""">"
		.write "  <input type=""hidden"" name=""pagetype"" value="""&pagetype&""">"
		.write "</form>"
		.write "<script language='javascript'>"
		.write "document.f.submit();"
		.write "</script>"
		.end
	end with
end Function

' 메시지없이 페이지이동
function f_DirectGo(url)
	with Response

		.write "<script language=javascript>"
		.write "location.href='"& url &"';"
		.write "</script>"
		.end
	end with
end Function

' 메시지뿌려주고 뒤로가기(*)
function f_AlertBack(msg)
	with Response

		.write "<script language='javascript'>"
		.write "alert('"&msg&"');"
		.write "history.back();"
		.write "</script>"
		.end
	end with
end Function


' 경고창후 리프레쉬
function f_AlertRefrash(msg)
	with Response

		.write "<script language='javascript'>"
		.write "alert('"&msg&"');"
		.write "history.go(0);"
		.write "</script>"
		.end
	end with
end Function

' 메시지출력 END
function f_AlertEnd(msg)
	with Response

		.write "<script language='javascript'>"
		.write "alert('"&msg&"');"
		.write "</script>"
		.end
	end with
end Function

' 메시지출력 END - 중복 submit 방지
function f_AlertisSubmitEnd(msg)
	with Response

		.write "<script language='javascript'>"
		.write "alert('"&msg&"');"
		.write "parent.isSubmitted = false;"
		.write "</script>"
		.end
	end with
end Function

' 메시지출력 NOT END
function f_Alert(msg)
	with Response

		.write "<script language='javascript'>"
		.write "alert('"&msg&"');"
		.write "</script>"
	end with
end Function


'경고창을 띠운후 부모창을 리프레쉬한후 본창을 닫는다
function f_AlertAndClose(msg)
	with Response

		.write "<script language='javascript'>"
		.write "alert( '"&msg&"');"
		.write "opener.history.go(0);"
		.write "self.close();"
		.write "</script>"
		.end
	end with
end function


'경고창을 띠운후 부모,부모창을 리프레쉬한후 본창을 닫는다
function f_AlertAndClose2(msg)
	with Response

		.write "<script language='javascript'>"
		.write "alert( '"&msg&"');"
		.write "opener.opener.history.go(0);"
		.write "opener.close();"
		.write "self.close();"
		.write "</script>"
		.end
	end with
end function


'본창을 닫고 부모창을 정해진페이지로
function f_CloseAndGo(url)
	with Response

		.write "<script language='javascript'>"
		.write "opener.location.href='"& url &"';"
		.write "self.close();"
		.write "</script>"
		.end
	end with
end function

'경고창을 띄운후 팝업창 닫기
function f_ClosePopupEnd(msg)
	with Response

		.write "<script language='javascript'>"
		.write "alert( '"&msg&"');"
		.write "self.close();"
		.write "</script>"
		.end
	end with
end function

function f_AlertCUrl(msg, url)
	with Response

		.write "<script language='javascript'>"
		.write "alert( '"&msg&"');"
		.write "opener.history.go(0);"
		.write "location.href='"& url &"';"
		.write "</script>"
		.end
	end with
end function

function f_AlertUrl_UTF(msg, url)
	with Response

		.write "<form method=post name=""form_move"" action='"& url &"' target='_top'>"
		.write "</form>"
		.write "<script language='javascript'>"
		.write "alert('"&msg&"');"
		.write "document.form_move.submit();"
		.write "</script>"
		.end
	end with
end Function

'2012/09/13
'한글 처리
Function Unescape(str)
    dim rtnStr
    rtnStr = ""
    dim i, t
    for i=1 to len(str)
        t = mid(str, i, 1)
        if t="%" then
            if mid(str, i+1, 1)="u" then
                rtnStr = rtnStr & chrB("&H"&mid(str, i+4, 2)) & chrB("&H"&mid(str, i+2, 2))
                i = i+5
            else
                rtnStr = rtnStr & chrB("&H"&mid(str, i+1, 2))
                i = i+2
            end if
        else
            rtnStr = rtnStr&t
        end if
    next
    Unescape = rtnStr
End Function

'2012/06/12
'SQL Injection Filter 함수
'Function SQLInjectionFilter(getValues,mode)
'	'SQL Injection Protected
'	Dim sql_pattern, item, array_counter, item_position1, item_position2
'
'	sql_pattern = Array("//","--",";", "/*", "*/", "@@", "@", "char", "nchar", "varchar", "nvarchar", "alter", "begin", "cast", "create", "cursor", "declare", "delete", "drop", "end", "exec","execute", "fetch", "insert", "kill", "open","select", "sys", "sysobjects", "syscolumns","table", "update", "<script", "</script>", "<", ">", "vbscript", "user%2Bchar(124)", "%20and%20", "user+char(124)",".\", "..\", "'")
'
'	For array_counter = LBound(sql_pattern) To UBound(sql_pattern)
'		item_position = InStr(LCase(getValues), sql_pattern(array_counter))
'		If item_position > 0 Then
'			if mode = "S" then
'				Response.Write("<script language='javascript'>")
'				Response.Write("alert('파일명에 악의적인 문자열이 포함되어 있습니다.');")
'				Response.Write("history.back();")
'				Response.Write("</script>")
'				Response.End()
'			else
'				Response.Write("악의적인 문자열이 포함되어 있습니다.")
'				Response.End()
'			end if
'		Else
'			SQLInjectionFilter = getValues
'		End If
'	Next
'End Function
'
'Function f_AlertBack(msg)
'	with Response
'		.write "<script language='javascript'>"
'		.write "alert('"&msg&"');"
'		.write "history.back();"
'		.write "</script>"
'		.End
'	End with
'End Function

'2013/08/27
'정규식 패턴을 이용한 화이트리스트 체크 함수
Function Word_check(str,patrn)
	Dim regEx, match, matches

	SET regEx = New RegExp
	regEx.Pattern = patrn            ' 패턴을 설정합니다.
	regEx.IgnoreCase = True            ' 대/소문자를 구분하지 않도록 합니다.
	regEx.Global = True         ' 전체 문자열을 검색하도록 설정합니다.
	SET Matches = regEx.Execute(str)

	if 0 < Matches.count then
		Word_check = false
	Else
		Word_check = true
	end if
End Function

pattern0 = "[^가-힣]"  '한글만
pattern1 = "[^-0-9 ]"  '숫자만
pattern2 = "[^-a-zA-Z]"  '영어만
pattern3 = "[^-가-힣a-zA-Z0-9/ ]" '숫자와 영어 한글만
pattern4 = "<[^>]*>"   '태그만
pattern5 = "[^-a-zA-Z0-9/ ]"    '영어 숫자만
pattern6 = "[^-가-힣a-zA-Z/ ]" '영어 한글만

'2013/08/27
'SQL Injection/XSS Injection Filter 함수 => 문자열에 금지 단어가 있으면 무조건 실행
Function SQLInjectionFilter(getValues)
	'SQL Injection Protected
	Dim sql_pattern, item, array_counter, item_position1, item_position2

	sql_pattern = Array("--",";", "/*", "*/", "@@", "@", "char", "nchar", "varchar", "nvarchar", "alter", "begin", "cast", "create", "cursor", "declare", "delete", "drop", "end", "or", "and", "exec","execute", "fetch", "insert", "kill", "open","select", "sys", "sysobjects", "syscolumns","table", "update", "<script", "</script>", "'", "<", ">", "!", "#", "$", "%", "^", "&", "*", "<xmp", "javascript", "script", "iframe", "document", "vbscript", "applet", "embed", "object", "frame", "alert", "onblur", "onchange", "onclick", "ondblclick", "enerror", "onfocus", "onload", "onmouse", "onscroll", "onsubmit", "onunload")

	For array_counter = LBound(sql_pattern) To UBound(sql_pattern)
		item_position = InStr(LCase(getValues), sql_pattern(array_counter))
		If item_position > 0 Then
			'Response.Write("악의적인 문자열이 포함되어 있습니다.")
			'Response.End()
			Response.Write("<script language='javascript'>")
			'Response.Write("alert('"&getValues&"');")
			Response.Write("alert('잘못된 입력값으로 인해 접근이 차단 되었습니다.');")
			Response.Write("history.back();")
			Response.Write("</script>")
			Response.End()
		Else
			SQLInjectionFilter = getValues
		End If
	Next
End Function

'2014/04/02
'SQL Injection/XSS Injection Filter 함수 => 문자열에 금지 단어가 있으면 무조건 실행 => 스마트에디터 이미지 첨부시 에러메세지 변경
Function SQLInjectionFilterSmartEditer(getValues)
	'SQL Injection Protected
	Dim sql_pattern, item, array_counter, item_position1, item_position2

	sql_pattern = Array("--",";", "/*", "*/", "@@", "@", "char", "nchar", "varchar", "nvarchar", "alter", "begin", "cast", "create", "cursor", "declare", "delete", "drop", "end", "or", "and", "exec","execute", "fetch", "insert", "kill", "open","select", "sys", "sysobjects", "syscolumns","table", "update", "<script", "</script>", "'", "<", ">", "!", "#", "$", "%", "^", "&", "*", "<xmp", "javascript", "script", "iframe", "document", "vbscript", "applet", "embed", "object", "frame", "alert", "onblur", "onchange", "onclick", "ondblclick", "enerror", "onfocus", "onload", "onmouse", "onscroll", "onsubmit", "onunload")

	For array_counter = LBound(sql_pattern) To UBound(sql_pattern)
		item_position = InStr(LCase(getValues), sql_pattern(array_counter))
		If item_position > 0 Then
			'Response.Write("악의적인 문자열이 포함되어 있습니다.")
			'Response.End()
			Response.Write("<script language='javascript'>")
			'Response.Write("alert('"&getValues&"');")
			Response.Write("alert('이미지 파일명에 금지된 문자가 존재 합니다.\n\n이미지 파일명을 변경하신후 다시 시도해 주세요.');")
			Response.Write("history.back();")
			Response.Write("</script>")
			Response.End()
		Else
			SQLInjectionFilterSmartEditer = getValues
		End If
	Next
End Function

'2013/08/27
'문자열 비교 Filter 함수 => 문자열에 금지 단어가 있어도 사용 가능 => 문장을 만들었을때 체크하지 못하는 오류 발생
Function SQLInjectionXSSComparisonFilter(getValues)
	Dim arrList, arrItem, i

	arrList = "--,;,/*,*/,@@,@,char,nchar,varchar,nvarchar,alter,begin,cast,create,cursor,declare,delete,drop,end,exec,execute,fetch,insert,kill,or,and,open,select,sys,sysobjects,syscolumns,table,update,<script,</script>,',<,>,!,#,$,%,^,&,*, <xmp,javascript,script,iframe,document,vbscript,applet,embed,object,frame,alert,onblur,onchange,onclick,ondblclick,enerror,onfocus,onload,onmouse,onscroll,onsubmit,onunload"
	arrItem = Split(arrList,",")

	For i = 0 To UBound(arrItem)
		If Trim(arrItem(i)) = getValues Then
			'Response.Write("잘못된 입력값으로 인해 접근이 차단 되었습니다.")
			'Response.End()
			Response.Write("<script language='javascript'>")
			Response.Write("alert('잘못된 입력값으로 인해 접근이 차단 되었습니다.');")
			'Response.Write("history.back(-1);")
			Response.Write("</script>")
			Response.End()
			Exit For
		Else
			SQLInjectionXSSComparisonFilter = getValues
		End If
	Next
End Function

'2013/12/12
'SQL Injection/XSS Injection Filter 함수 => 문자열에 금지 단어가 있으면 무조건 실행 => 한국민속촌 1:1문의 및 제안 등록시 기본적인 특수문자 허용
Function SimpleSQLInjectionXSSFilter(getValues)
	'SQL Injection Protected
	Dim sql_pattern, item, array_counter, item_position1, item_position2

	sql_pattern = Array("/*", "*/", "char", "nchar", "varchar", "nvarchar", "alter", "begin", "cast", "create", "cursor", "declare", "delete", "drop", "end", "or", "and", "exec","execute", "fetch", "insert", "kill", "open","select", "sys", "sysobjects", "syscolumns","table", "update", "<script", "</script>", "<xmp", "javascript", "script", "iframe", "document", "vbscript", "applet", "embed", "object", "frame", "alert", "onblur", "onchange", "onclick", "ondblclick", "enerror", "onfocus", "onload", "onmouse", "onscroll", "onsubmit", "onunload")

	For array_counter = LBound(sql_pattern) To UBound(sql_pattern)
		item_position = InStr(LCase(getValues), sql_pattern(array_counter))
		If item_position > 0 Then
			'Response.Write("악의적인 문자열이 포함되어 있습니다.")
			'Response.End()
			Response.Write("<script language='javascript'>")
			'Response.Write("alert('"&getValues&"');")
			Response.Write("alert('잘못된 입력값으로 인해 접근이 차단 되었습니다.');")
			'Response.Write("history.back();")
			Response.Write("</script>")
			Response.End()
		Else
			SimpleSQLInjectionXSSFilter = getValues
		End If
	Next
End Function

'2013/09/10
'페이지 권한 체크 함수
Function CheckPageAuth(getValues)
	Dim item_position

	'세션정보 사용
	item_position = InStr(session("admin_auth"),getValues)

	'쿠키정보 사용
	'item_position = InStr(Request.Cookies("admin_auth"),getValues)

	'response.write item_position

	If item_position = 0  Then
		Response.Write "<script language=javascript>"
		Response.Write " alert('페이지 접근권한이 없습니다.');"
		Response.Write " history.back();"
		Response.Write "</script>"
		Response.End
	End If

End Function

'2013/09/17
' 파일이름 랜덤 재조합 함수
' 작성자 : 박주현
' 용도 : 파일명 재조합
Function MakeNewRandomFileName(intleng)

  Dim str, strlen, r, i, ds, serialCode '변수 선언
  str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" '랜덤으로 선택된 문자or 숫자
   strlen = intleng		'출력될 값의 자릿수 ex)해당 구문에서 10자리의 랜덤 값 출력
   Randomize			'랜덤 초기화
   For i = 1 To strlen
	r = Int((62 - 1 + 1) * Rnd + 1) ' 62은 str의 문자갯수
	serialCode = serialCode + Mid(str,r,1)
   Next

	MakeNewRandomFileName = serialCode

End Function

'2013/10/25
' 정규식 패턴을 이용한 파일확장자 체크 함수
' 작성자 : 박주현
' 용도 : 업로드 파일 확장자 체크
Function FileTypeValidate(fileExt, patrn)

	Dim eregEx
	Dim fileType
	Dim RtnValue

	'파일의 확장자
	fileType = fileExt

	Set regEx = New RegExp				'RegExp 객체를 생성합니다.

	regEx.Pattern		= patrn
	regEx.IgnoreCase	= True			'대소문자 구분을 하지 않도록 합니다.
	regEx.Global		= True			'전체 문자열을 검색합니다.

	RtnValue			= regEx.Test(fileType)

	If RtnValue Then
		RtnValue = True
	Else
		RtnValue = False
	End If

	FileTypeValidate = RtnValue

End Function

FileTypepattern0 = "^(gif|jpg|bmp|png|zip|hwp|doc|docx|xls|xlsx|ppt|pptx|pdf)$" '허용 파일타입의 정규표현식1
FileTypepattern1 = "^(gif|jpg|bmp|png)$" '허용 파일타입의 정규표현식2
FileTypepattern2 = "^(xls)$" '엑셀 파일타입의 정규표현식3
%>