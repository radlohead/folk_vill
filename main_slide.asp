
<%
	'메인배너 정보 가져오기
	Call OpenDbConnection() '데이터베이스 오픈

	MainFileURL = "/upload/banner/"

	'#######################################################
	'# TBL_MAIN_BANNER_NEW TABLE SELECT START
	'#######################################################
	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_MAIN_BANNER_SELECT_M"
		.CommandType = adCmdStoredProc

		Set Rs = .Execute
	End With
	Set objcmd = Nothing
	'#######################################################
	'# TBL_MAIN_BANNER_NEW TABLE SELECT END
	'#######################################################

	If Not(Rs.BOF And Rs.EOF) Then
%>

		<div class="main-slide swiper-container">
			<div class="swiper-wrapper">

		<%
				DO While Not Rs.eof

				title		= Rs("TITLE")
				contents	= Rs("CONTENTS")
		%>
			<!--<div><%=contents%></div>-->
			<div class="swiper-slide"><%=contents%><!--<img src="/mobile/images/index/main_slide01.jpg" alt="웰컴투 조선 2016년 4월9일 부터 6월12일까지" />--></div>
		<%
				Rs.movenext
				Loop
		%>

			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination">

			</div>
			<!-- Add Arrows -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>

<%
	End If

	Rs.Close
	Set Rs = Nothing
	Call CloseDbConnection() '데이터베이스 클로즈
%>