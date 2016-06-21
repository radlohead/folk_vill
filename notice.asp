<%
	'공지사항 정보 가져오기
	Call OpenDbConnection() '데이터베이스 열기

	'#######################################################
	'# TBL_NOTICE TABLE SELECT START
	'#######################################################
	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_MAIN_NOTICE_SELECT_M"
		.CommandType = adCmdStoredProc

		Set Rs = .Execute
	End With
	Set objcmd = Nothing
	'#######################################################
	'# TBL_NOTICE TABLE SELECT END
	'#######################################################
%>

		<div class="notice">
			<div class="main-top">
				<h3><img src="/mobile/images/index/notice_title.png" alt="공지사항 머리말" /></h3>
				<a href="/mobile/information/notice_list.asp" class="more_btn"><span class="hidden">더보기</span></a>
			</div>
			<ul>
<%
	If Not(Rs.BOF And Rs.EOF) Then
		DO While Not Rs.eof

		seq		= Rs("SEQ")
		code	= Rs("CODE")
		title	= Rs("TITLE")
%>
				<!--
				웹 메인 공지사항 참고 소스
				<li>
					<a href="/about/notice_view.asp?seq=<%=seq%>&pg=1">
					<p class="notice_icon"><img src="/images/index/<%=NoticeCategoryIcon(code)%>.jpg" alt="<%=NoticeCategoryText(code)%>분류아이콘" title="<%=NoticeCategoryText(code)%>분류아이콘" /></p>
					<p class="notice_title"><%=title%></p>
					</a>
				</li>
				-->
				<li>
					<span class="icon guide_icon"></span>
					<a href="/mobile/information/notice_view.asp?seq=<%=seq%>" class="text orange"><%=title%></a>
				</li>
<%
		Rs.movenext
		Loop
	End If

	Rs.Close
	Set Rs = Nothing
%>
				<!--
				<li>
					<span class="icon guide_icon"></span>
					<a href="#none" class="text">아시안 푸드 레스토랑 '테라스그린' 오픈 안내</a>
				</li>
				<li>
					<span class="icon discount_icon"></span>
					<a href="#none" class="text">해피포인트 제휴 할인 이벤트</a>
				</li>
				-->
			</ul>
		</div>
<%
	Call CloseDbConnection() '데이터베이스 클로즈
%>