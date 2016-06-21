<%
	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, pg, code

	Debug = false ' SQL 디버그 설정(true : 사용, false : 사용안함)
	DebugMode = 2 ' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))
	FileURL		= "/upload/discount/"
	'today		= Date()
	today		= Trim(Request("today"))

	If today = "" Then
		today = Date()
	Else
		today = today
	End If

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	' 페이징 처리 부분
	pgSize		= 9
	UniqueField	= "SEQ"				' 시퀀스필드
	TableName	= "TBL_DISCOUNT_M"	' 테이블명
	SelectField	= "SEQ,TITLE,SDATE,EDATE,FILES1,FILES2,ALT1,ALT2,CONTENTS,WRITER,STATUS,REGDATE"
	WhereClause = "STATUS = 'Y'"
	'WhereClause = "SDATE <= '"& today &"' AND EDATE >= '"& today &"'"
	OrderBy		= "SORT ASC, REGDATE DESC"		' 정렬방식

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
%>
			<div class="tab-content tabMenu1">
				<div class="swiper-wrapper">
<%
				If NOT(IsNull(rValue) Or IsEmpty(rValue)) then

					For i = Lbound(rValue,2) To UBound(rValue,2)

						rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

						seq				= rValue(0,i)
						title			= rValue(1,i)
						sdate			= rValue(2,i)
						edate			= rValue(3,i)
						files1			= rValue(4,i)
						files2			= rValue(5,i)
						alt1			= rValue(6,i)
						alt2			= rValue(7,i)
						contents		= rValue(8,i)
						writer			= rValue(9,i)
						status			= rValue(10,i)
						regdate			= rValue(11,i)
						'regdate		= rValue(12,i)

						If (sdate <> "" And edate <> "") Then
							If Left(sdate,4) = Left(edate,4) Then
								eventdate = sdate& " ~ " &edate
							Else
								eventdate = sdate& " ~ " &edate
							End If
						ElseIf (sdate <> "" And edate = "") Then
							eventdate = sdate& " ~ "
						ElseIf (sdate = "" And edate <> "") Then
							eventdate = " ~ " &edate
						Else
							eventdate = ""
						End If

						PromALT = title & " " & eventdate
						PromIMG = FileURL & "" & files1

%>
					<div class="swiper-slide"><a href='/mobile/information/promotion_list.asp'><img src="<%=PromIMG%>" alt="<%=PromALT%>" /></a></div>
<%
					Next

				End If
%>
				</div>
				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
<%
	Call RsClose()
	Call CloseDbConnection()
%>