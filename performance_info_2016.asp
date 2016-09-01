<%

yearDate	= year(date)		' 년도
monthDate	= month(date)		' 월
dayDate		= day(date)			' 오늘날자
todayDate	= date()			' 년월일
nowDate		= now()				' 오늘날자 전체

'---------------- 오늘의 요일 ----------------
weekDate = weekDay(now())

Select Case weekDate

	Case "1" weekDate = "일요일"
	Case "2" weekDate = "월요일"
	Case "3" weekDate = "화요일"
	Case "4" weekDate = "수요일"
	Case "5" weekDate = "목요일"
	Case "6" weekDate = "금요일"
	Case "7" weekDate = "토요일"

End Select
'//--- 2.0 부터 추가된 weekDayName 함수를 이용한 방법
'//--- 오늘의 요일은
weekDate2 = weekDayName(weekDay(now))

'Response.Write "올해의 년도:" & yearDate & "<br>"
'Response.Write "이번달의 월:" & monthDate & "<br>"
'Response.Write "오늘의 날짜:" & dayDate & "<br>"
'Response.Write "년월오늘날짜:" & todayDate & "<br>"
'Response.Write "오늘날짜 전체" & nowDate & "<br>"
'Response.Write "오늘의 요일:" & weekDate & "<br>"
'Response.Write "weekDayName 함수를 이용한 오늘의 요일은:" & weekDate2 & "<br>"

Bboy_show = "N"
'-------------------------------------------------------
' 국악비보이 공연 주말 및 공휴일에만 노출 (20160623 > 지병민요청)
'-------------------------------------------------------
' 6월 27일(월)부터 10월 2일(일)까지 국악비보이 공연 주말 및 공휴일에만 노출되도록 설정
'-------------------------------------------------------

start_chk	= cint(datediff("d", "2016-06-23" , date()))		' 20160627
end_chk		= cint(datediff("d", "2016-10-02" , date()))		' 20161002

'Response.Write "start_chk:" & start_chk & "<br>"
'Response.Write "end_chk:" & end_chk & "<br>"

'------------------- 기간 설정 (해당기간만 적용) ------------------------
IF start_chk >= 0 AND end_chk <= 0 Then

	' 토요일 노출
	IF weekDay(now()) = "7" Then
		Bboy_show = "Y"
	End If

	' 일요일 노출
	IF weekDay(now()) = "1" Then
		Bboy_show = "Y"
	End If

	' 공휴일 노출 ( 8/15, 9/14, 9/15, 9/16)
	If cint(datediff("d", "2016-08-15" , date())) = 0 Then
		Bboy_show = "Y"
	End If
	If cint(datediff("d", "2016-09-14" , date())) = 0 Then
		Bboy_show = "Y"
	End If
	If cint(datediff("d", "2016-09-15" , date())) = 0 Then
		Bboy_show = "Y"
	End If
	If cint(datediff("d", "2016-09-16" , date())) = 0 Then
		Bboy_show = "Y"
	End If
Else
	Bboy_show = "Y"
End If
'----------------------------------------------------------------
%>

			<div class="main-top">
				<h3><img src="/mobile/images/index/today_title.png" alt="한국민속촌 정기공연 머리말" /></h3>
				<a href="/mobile/event/performance_nongak.asp" class="more_btn"><span class="hidden">더보기</span></a>
			</div>
			<div class="today-slide swiper-container">
				<div class="text-btn_box">
                    <section class="text_box"></section>
					<!-- Add Arrows -->
					<div class="btns">
						<div class="swiper-button-prev"><img src="/mobile/images/index/today-prev_btn.png" alt="" /></div>
						<!--<div class="plus_btn"><a href="http://localhost/folk_vill/m/event/event_now.html"><img src="/mobile/images/index/today-plus_btn.png" alt="클릭시 링크 이동" /></a></div>-->
						<div class="swiper-button-next"><img src="/mobile/images/index/today-next_btn.png" alt="" /></div>
					</div>
				</div>

				<%
					'공연 정보 가져오기
					Call OpenDbConnection() '데이터베이스 오픈

					todate = Date()
					weekdays = Weekday(todate) '1:일, 2:월, 3:화, 4:수, 5:목, 6:금, 7:토					

					'#######################################################
					'# TBL_EVENTTIME TABLE SELECT START
					'#######################################################
					Set objcmd = Server.CreateObject("ADODB.Command")
					With objcmd
						.ActiveConnection = Conn
						.CommandText = "SP_HUGO7_MAIN_EVENTTIME_SELECT"
						.CommandType = adCmdStoredProc

						.Parameters.Append .CreateParameter("@TODATE", adVarChar, adParamInput, 10, todate)

						Set Rs = .Execute
					End With
					Set objcmd = Nothing
					'#######################################################
					'# TBL_EVENTTIME TABLE SELECT END
					'#######################################################
					
					If Not(Rs.BOF And Rs.EOF) Then
						ntime1 = Rs("NTIME1")
						ntime2 = Rs("NTIME2")
						ltime1 = Rs("LTIME1")
						ltime2 = Rs("LTIME2")
						htime1 = Rs("HTIME1")
						htime2 = Rs("HTIME2")
						wtime1 = Rs("WTIME1")
						wtime2 = Rs("WTIME2")
					Else
						ntime1 = "10:30"
						ntime2 = "14:00"
						ltime1 = "11:00"
						ltime2 = "14:30"
						htime1 = "11:30"
						htime2 = "15:00"
						wtime1 = "12:00"
						wtime2	 = "16:00"	
					End If

					Rs.Close
					Set Rs = Nothing
					Call CloseDbConnection() '데이터베이스 클로즈
				%>

				<div class="swiper-wrapper">
					<div class="swiper-slide img01">
					    <div class="text-btn_box">
                            <section class="text_box">
                                <h4>농악놀이</h4>
                                <span class="text"><b>1회공연</b> <%=ntime1%></span>
                                <span class="text"><b>2회공연</b> <%=ntime2%></span>
                                <span class="text"><b>장소</b> 농악공연장</span>
                            </section>
                            <!--<div class="btns">-->
                                <!--<div class="plus_btn"><a href="http://localhost/folk_vill/m/event/event_now.html"><img src="/mobile/images/index/plus_btn_bg.png" alt="클릭시 링크 이동" /></a></div>-->
                            <!--</div>-->
                        </div>
					    <a href="/mobile/event/performance_nongak.asp"><img src="/mobile/images/index/today_img01.jpg" alt="한국민속촌 정기공연 농악놀이" /></a>
					</div>
				<%
					If weekdays <> 12 Then '줄타기 공연 월요일 미노출
				%>
					<div class="swiper-slide img02">
					    <div class="text-btn_box">
                            <section class="text_box">
                                <h4>마상무예</h4>
                                <span class="text"><b>1회공연</b> <%=ltime1%></span>
                                <span class="text"><b>2회공연</b> <%=ltime2%></span>
                                <span class="text"><b>장소</b> 마상무예공연장</span>
                            </section>
                        </div>
					    <a href="/mobile/event/performance_horse.asp"><img src="/mobile/images/index/today_img02.jpg" alt="한국민속촌 정기공연 마상무예" />
                        </a>
                    </div>

					<%
					End If

					If Bboy_show = "Y" Then
				%>

					<div class="swiper-slide img03">
					    <div class="text-btn_box">
                            <section class="text_box">
                                <h4>국악비보이</h4>
                                <span class="text"><b>1회공연</b> <%=htime1%></span>
                                <span class="text"><b>2회공연</b> <%=htime2%></span>
                                <span class="text"><b>장소</b> 농악공연장</span>
                            </section>
                        </div>
					    <a href="/mobile/event/performance_bboy.asp"><img src="/mobile/images/index/today_img03.jpg" alt="한국민속촌 정기공연 국악비보이" />
                        </a>
                    </div>
				<%
					End If
					If (Month(todate) <> 12 And Month(todate) <> 1 And Month(todate) <> 2) Then '전통혼례 12~2월 미노출
				%>
					<div class="swiper-slide img04">
					    <div class="text-btn_box">
                            <section class="text_box">
                                <h4>전통혼례</h4>
                                <span class="text"><b>1회공연</b> <%=wtime1%></span>
                                <span class="text"><b>2회공연</b> <%=wtime2%></span>
                                <span class="text"><b>장소</b> 22호 양반가</span>
                            </section>
                        </div>
					    <a href="/mobile/event/performance_wedding.asp"><img src="/mobile/images/index/today_img04.jpg" alt="한국민속촌 정기공연 전통혼례" />
                        </a>
                    </div>
				<%
					End If
				%>
				</div>
			</div>