<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%

	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, param, pg, keyfield, keyword, code
	Dim code_name
	Dim Df_Psize

	Debug		= false		' SQL 디버그 설정(true : 사용, false : 사용안함)
	DebugMode	= 2			' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)
	Df_Psize	= 4

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))
	keyfield	= SQLInjectionFilter(Nvl(Request("keyfield"),"1"))
	keyword		= SQLInjectionFilter(Nvl(Request("keyword"),""))
	code		= SQLInjectionFilter(Nvl(Request("code"),""))
	param		= "&keyfield="&keyfield&"&keyword="&Server.URLEncode(keyword)&"&code="&code
	today		= Date()

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	' 페이징 처리 부분
	pgSize		= Df_Psize
	UniqueField	= "SEQ" ' 시퀀스필드
	TableName	= "TBL_VOICE" ' 테이블명
	SelectField	= "SEQ,CODE,UID,NAME,TITLE,CONTENTS,ANSWER,ANSWER_YN,STATUS,READCNT,REGDATE,ANSWERDATE"
	WhereClause = "UID = '" & session("id") & "'"
	'WhereClause = "1 = 1"

	If keyword <> "" then
		If keyfield <> "" Then
			WhereClause = WhereClause & " AND " & keyfield & " LIKE '%" & keyword & "%'" ' 검색조건
		End If
	End If

	'OrderBy = "ANSWER_YN ASC, REGDATE DESC" ' 정렬방식
	OrderBy = "REGDATE DESC" ' 정렬방식
	Call OpenDbConnection() '데이터베이스 열기
	Call ProcRecordSQL() ' 페이징 처리 서브 호출

	If Not(Rs.BOF OR Rs.EOF) Then
		rValue = Rs.GetRows
	Else
		rValue = Null
	End If

	totalpage = int(TotalRecordCount / pgSize)

	Nam = TotalRecordCount Mod pgSize

	If Nam > 0 Then
	   totalpage = totalpage + 1
	End If

	Call RsClose()
	Call CloseDbConnection()

	If (TotalRecordCount < 1) Then

		Response.Buffer = True
		Response.ContentType = "text/xml"
		Response.Write "<?xml version=""1.0"" encoding=""utf-8"" ?>" & vbCrLf
'		Response.Write "<?xml:stylesheet type=""text/xsl"" ?>" & vbCrLf
		Response.Write "<result>" & vbCrLf
		Response.Write "<item>" & vbCrLf
		Response.Write "<flag>nodata</flag>" & vbCrLf
		Response.Write "<seq_no></seq_no>" & vbCrLf
		Response.Write "<chkcnt>1</chkcnt>" & vbCrLf
		Response.Write "</item>" & vbCrLf
		Response.Write "</result>" & vbCrLf

	Else

		' 페이징 처리 부분
		pgSize		= Df_Psize
		UniqueField	= "SEQ" ' 시퀀스필드
		TableName	= "TBL_VOICE" ' 테이블명
		SelectField	= "SEQ,CODE,UID,NAME,TITLE,CONTENTS,ANSWER,ANSWER_YN,STATUS,READCNT,REGDATE,ANSWERDATE"

		'WhereClause = "UID = '"& session("id") &"'"
		WhereClause = "1 = 1"

		If keyword <> "" then
			If keyfield <> "" Then
				WhereClause = WhereClause & " AND " & keyfield & " LIKE '%" & keyword & "%'" ' 검색조건
			End If
		End If

		'OrderBy = "ANSWER_YN ASC, REGDATE DESC" ' 정렬방식
		OrderBy = "REGDATE DESC" ' 정렬방식

		Call OpenDbConnection() '데이터베이스 열기
		Call ProcRecordSQL() ' 페이징 처리 서브 호출

		If Not(Rs.BOF OR Rs.EOF) Then
			rValue = Rs.GetRows
		Else
			rValue = Null
		End If

		totalpage = int(TotalRecordCount / pgSize)

		Nam = TotalRecordCount Mod pgSize
		If Nam > 0 Then
		   totalpage = totalpage + 1
		End If

		Response.Buffer = True
		Response.ContentType = "text/xml"
		Response.Write "<?xml version=""1.0"" encoding=""utf-8"" ?>" & vbCrLf
		Response.Write "<result>" & vbCrLf

		j = 1

		If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then

			For i = Lbound(rValue, 2) To UBound(rValue, 2)

				rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

				seq				= rValue(0,i)
				code			= rValue(1,i)
				uid				= rValue(2,i)
				name			= rValue(3,i)
				title			= rValue(4,i)
				contents		= rValue(5,i)
				contents		= Replace(Trim(contents),vblf,"<br>") '에디터 사용하지 않을때 변환
				answer			= Nvl(rValue(6,i),"")
				answer			= Replace(Trim(answer),chr(13)&chr(10),"<br>") '에디터 사용시 변환
				answer_yn		= rValue(7,i)
				status			= rValue(8,i)
				readcount		= rValue(9,i)
				regdate			= rValue(10,i)
				answerdate		= rValue(11,i)

				' 제목 자르기
				title			= cutStrNew(title, 34)
				regdate			= DateYMDFormat(regdate)

				gubun			= "VOI"
				code_type		= code

				GetCodeDetailName()

				Response.Write "<item>" & vbCrLf
				Response.Write "<flag>success</flag>" & vbCrLf
				Response.Write "<seq>" & seq & "</seq>" & vbCrLf
				Response.Write "<code><![CDATA[" & code & "]]></code>" & vbCrLf
				Response.Write "<name><![CDATA[" & name & "]]></name>" & vbCrLf
				Response.Write "<title><![CDATA[" & title & "]]></title>" & vbCrLf
				'Response.Write "<contents><![CDATA[" & contents & "]]></contents>" & vbCrLf
				Response.Write "<answer><![CDATA[" & answer & "]]></answer>" & vbCrLf
				Response.Write "<answer_yn><![CDATA[" & answer_yn & "]]></answer_yn>" & vbCrLf
				Response.Write "<status><![CDATA[" & status & "]]></status>" & vbCrLf
				Response.Write "<readcount>" & readcount & "</readcount>" & vbCrLf
				Response.Write "<regdate><![CDATA[" & regdate & "]]></regdate>" & vbCrLf
				Response.Write "<answerdate><![CDATA[" & answerdate & "]]></answerdate>" & vbCrLf
				Response.Write "<code_name><![CDATA[" & code_name & "]]></code_name>" & vbCrLf
				Response.Write "</item>" & vbCrLf

				j = j + 1
			Next
		End If


		Response.Write "</result>" & vbCrLf
'		Set Rs = Nothing

		Call RsClose()
		Call CloseDbConnection()
	End If

%>