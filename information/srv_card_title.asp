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
	DebugMode	= 1			' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)
	Df_Psize	= 100

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	code		= SQLInjectionFilter(Nvl(Request("code"),""))
	param		= "&code="&code
	today		= Date()

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	' 페이징 처리 부분
	pgSize		= Df_Psize
	UniqueField	= "SEQ" ' 시퀀스필드
	TableName	= "TBL_PARTNERSHIP" ' 테이블명
	'SEQ,CODE,TITLE,STATUS,FILES,ALT,SUMMARY,DISCOUNT,WEBSITE,CONTENTS1,
	'CONTENTS2,CONTENTS3,CONTENTS4,CONTENTS5,WRITER,REGDATE
	SelectField	= "SEQ, TITLE"
	WhereClause = "STATUS = 'Y' AND CODE = '" & code & "'"
	OrderBy		= "REGDATE DESC"	' 정렬방식

	Call OpenDbConnection()			' 데이터베이스 열기
	Call ProcRecordSQL()			' 페이징 처리 서브 호출

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
		TableName	= "TBL_PARTNERSHIP" ' 테이블명
		SelectField	= "SEQ, TITLE"
		WhereClause = "STATUS = 'Y' AND CODE = '" & code & "'"
		OrderBy		= "REGDATE DESC"	' 정렬방식


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

		'SEQ,CODE,TITLE,STATUS,FILES,ALT,SUMMARY,DISCOUNT,WEBSITE,CONTENTS1,
		'CONTENTS2,CONTENTS3,CONTENTS4,CONTENTS5,WRITER,REGDATE

				seq			= rValue(0,i)
				title		= rValue(1,i)

				Response.Write "<item>" & vbCrLf
				Response.Write "<flag>success</flag>" & vbCrLf
				Response.Write "<seq>" & seq & "</seq>" & vbCrLf
				Response.Write "<title><![CDATA[" & title & "]]></title>" & vbCrLf
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