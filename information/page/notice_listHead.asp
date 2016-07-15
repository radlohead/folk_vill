<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim filename : filename = "notice_list.asp"

	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, param, pg, keyfield, keyword, code
	Dim code_name
	Dim Df_Psize

	Debug		= false		' SQL 디버그 설정(true : 사용, false : 사용안함)
	DebugMode	= 2			' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)
	Df_Psize	= 4			' 페이징사이즈

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
	TableName	= "TBL_NOTICE_M" ' 테이블명
	SelectField	= "SEQ,CODE,TITLE,FILES,CONTENTS,WRITER,STATUS,READCNT,REGDATE" ' select할 필드
	WhereClause = "STATUS = 'Y'"
	OrderBy		= "REGDATE DESC" ' 정렬방식

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
%>