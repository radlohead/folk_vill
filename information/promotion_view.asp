<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim code_name, seq, pg, hopecode_name
	seq	= SQLInjectionFilter(Request("seq"))
	pg	= SQLInjectionFilter(Request("pg"))

	If IsNumeric(seq) = False Then f_AlertBack("정상적 접근이 아닙니다.")
	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	Call OpenDbConnection() '데이터베이스 열기

	'######################################################
	'# TBL_DISCOUNT_M TABLE SELECT START
	'######################################################

	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_DISCOUNT_SELECT_M"
		.CommandType = adCmdStoredProc
		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, seq)
		Set Rs = .Execute
	End With
	Set objcmd = Nothing

	'######################################################
	'# TBL_DISCOUNT_M TABLE SELECT END
	'######################################################

	If(Not Rs.EOF or Not Rs.BOF) Then
		title		= Rs("TITLE")
		sdate		= Rs("SDATE")
		edate		= Rs("EDATE")
		files1		= Rs("FILES1")
		files2		= Rs("FILES2")
		alt1		= Rs("ALT1")
		alt2		= Rs("ALT2")
		contents	= Rs("CONTENTS")
		contents 	= Replace(contents,"&amp;","&")
		contents 	= Replace(contents,"<br>",vblf)
		contents 	= Replace(contents,"''","'")
		'contents	= Replace(Trim(contents),chr(13)&chr(10),"<br>")
		writer		= Rs("WRITER")
		status		= Rs("STATUS")
		regdate		= Rs("REGDATE")
		sort		= Rs("SORT")
	Else
		Response.Write ("<script language='javascript'>")
		Response.Write (" alert('현재 글은 존재하지 않습니다.');")
		Response.Write (" history.back();")
		Response.Write ("</script>")
		Response.End
	End If

	'#########################################################
	'# 이전글의 seq 값을 구하는 부분 start
	'#########################################################

	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_DISCOUNT_PREV_SELECT_M"
		.CommandType = adCmdStoredProc
		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, seq)

		Set objRs = .Execute
	End With
	Set objcmd = Nothing

	If Not(objRs.EOF) Then
			prev_seq	= objRs(0)
			prev_title	= ReplaceTag2Text(objRs(1))
	End If
	objRs.Close
	Set objRs = Nothing

	'#########################################################
	'# 이전글의 seq 값을 구하는 부분 end
	'#########################################################

	'#########################################################
	'# 다음글의 seq 값을 구하는 부분 start
	'#########################################################

	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_DISCOUNT_NEXT_SELECT_M"
		.CommandType = adCmdStoredProc
		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, seq)

		Set objRs = .Execute
	End With
	Set objcmd = Nothing

	If Not(objRs.EOF) Then
			next_seq = objRs(0)
			next_title = ReplaceTag2Text(objRs(1))
		End If
	objrs.Close
	Set objRs = Nothing

	'#########################################################
	'# 다음글의 seq 값을 구하는 부분 end
	'#########################################################

	Call RsClose()
	Call CloseDbConnection()

	'##################################################################################
	'# 이벤트 종료 처리 start
	'##################################################################################
	Years	= year(date)
	Months	= month(date)
	Days	= day(date)
	Hours	= hour(time)
	Minutes	= minute(time)

	IF int(Months) < 10 THEN	Months = "0" & Months
	IF int(Days) < 10 THEN		Days = "0" & Days
	IF int(Hours) < 10 THEN		Hours = "0" & Hours
	IF int(Minutes) < 10 THEN	Minutes = "0" & Minutes

	todays	= Trim(Years&Months&Days&Hours&Minutes)
	eventenddays = "201405030000"
	'##################################################################################
	'# 이벤트 종료 처리 end
	'##################################################################################
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
        <script>
            $(document).ready(function(){
                $('.single-items').slick({
                    slidesToShow: 3,
                    initialSlide: 0
                });
            });
        </script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->
	<div class="wrap">
	<!--#include virtual="/mobile/common/inc/header_wrap.asp" --><!-- 상단헤더 -->

    <div class="header_title_slide">
        <div class="title">
            <h2>할인정보</h2>
        </div>
        <div class="slider single-items">
            <a href="/mobile/information/promotion_list.asp">할인프로모션</a>
            <a href="/mobile/information/credit_card.asp">제휴카드할인</a>
            <a href="/mobile/information/coupon_list.asp">쿠폰할인</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-discount">
            <div class="detail-head">
                <h3>할인프로모션</h3>
                <span class="text">알뜰하게 챙기고, <br>여유롭게 즐기는 방법</span>
            </div>
            <div class="detail-content board-view">
                 <article>
                     <h4><%=title%></h4>
                     <span class="date-wrap">
                         <span class="title">이벤트기간</span>
                         <span class="date"><%=sdate%> ~ <%=edate%></span>
                     </span>
                     <div class="content">
						<%=contents%>
						<!--<img src="/mobile/images/information/discount/promotion_img.jpg" alt="낭만을 잊은 그대를 위한 대학(원)생을 위한 자유이용권 특별 할인" />-->
                     </div>
                 </article>
                 <span class="btns">
                     <%If prev_seq <> "" Then%><a href="/mobile/information/promotion_view.asp?seq=<%=prev_seq%>&pg=<%=pg%>" class="btn prev-btn">이전 글 보기</a><%End If%>
                     <%If next_seq <> "" Then%><a href="/mobile/information/promotion_view.asp?seq=<%=next_seq%>&pg=<%=pg%>" class="btn next-btn">다음 글 보기</a><%End If%>
                     <a href="/mobile/information/promotion_list.asp?pg=<%=pg%>" class="btn list-btn">목록</a>
                 </span>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>