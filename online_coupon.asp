<%

	Debug = false ' SQL 디버그 설정(true : 사용, false : 사용안함)
	DebugMode = 2 ' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))
	FileURL		= "/upload/coupon/"
	today		= Date()
	'today		= Trim(Request("today"))

	'If today = "" Then
	'	today = Date()
	'Else
	'	today = today
	'End If

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	' 페이징 처리 부분
	pgSize			= 10
	UniqueField		= "SEQ"					' 시퀀스필드
	TableName		= "TBL_COUPON_M"		' 테이블명
	SelectField		= "SEQ,TITLE,SDATE,EDATE,FILES1,FILES2,ALT1,ALT2,CONTENTS1,CONTENTS2,STATUS,REGDATE,FILES3,ALT3"
	WhereClause		= "'"& today &"' BETWEEN SHOWSDATE AND SHOWEDATE"
	OrderBy			= "REGDATE DESC"		' 정렬방식

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

			<div class="tab-content tabMenu2">
				<div class="swiper-wrapper">
				<%
					If NOT(IsNull(rValue) Or IsEmpty(rValue)) then

						For i = Lbound(rValue,2) To UBound(rValue,2)

							rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

							'SEQ,TITLE,SDATE,EDATE,FILES1,FILES2,ALT1,ALT2,CONTENTS1,CONTENTS2,STATUS,REGDATE

							seq				= rValue(0,i)
							title			= rValue(1,i)
							sdate			= rValue(2,i)
							edate			= rValue(3,i)
							files1			= rValue(4,i)
							files2			= rValue(5,i)
							alt1			= rValue(6,i)
							alt2			= rValue(7,i)
							contents1		= rValue(8,i)
							contents1		= Replace(contents1,vblf,"<br />") '에디터 사용하지 않을때 변환
							contents2		= rValue(9,i)
							status			= rValue(10,i)
							regdate			= rValue(11,i)
							files3			= rValue(12,i)
							alt3			= rValue(13,i)

							If status = "Y" Then
								strstatus = "<font color='#ff4500'>Y</font>"
							Else
								strstatus = "N"
							End If

							strSQL = ""
							strSQL = "SELECT COUNT(UID) FROM TBL_COUPON_HISTORY WHERE CSEQ = " & seq &""
							Set cRs = Conn.Execute(strSQL)

							cnt = cRs(0)

							cRs.Close
							Set cRs = Nothing

				%>
					<div class="swiper-slide"><a href='/mobile/information/coupon_list.asp'><img src="<%=FileURL%><%=files1%>" alt="<%=alt1%>" style="width:95%;" /></a><img src="/mobile/images/index/main-tab2_img01.jpg" alt="" /></div>
					<!--<div class="swiper-slide"><a href="/mobile/information/coupon_gate.asp?couponSEQ=<%=seq%>"><img src="<%=FileURL%><%=files1%>" alt="<%=alt1%>" style="width:95%;" /></a><img src="/mobile/images/index/main-tab2_img01.jpg" alt="" /></div>-->
				<%
						Next
					Else
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