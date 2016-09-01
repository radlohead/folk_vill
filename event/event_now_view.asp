<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim code_name, seq, pg, hopecode_name
	seq		= SQLInjectionFilter(Request("seq"))
	FileURL	= "/upload/coupon/"

	If IsNumeric(seq) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	Call OpenDbConnection() '데이터베이스 열기

	'######################################################
	'# TBL_COUPON TABLE SELECT START
	'######################################################

	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd

		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_NOW_SELECT_M"
		.CommandType = adCmdStoredProc

		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, seq)

		Set Rs = .Execute

	End With
	Set objcmd = Nothing

	'######################################################
	'# TBL_COUPON TABLE SELECT END
	'######################################################

	If(Not Rs.EOF or Not Rs.BOF) Then

		'SEQ,TITLE,SDATE,EDATE,FILES1,FILES2,ALT1,ALT2,WRITER,STATUS,REGDATE
		title		= Rs("TITLE")
		sdate		= Rs("SDATE")
		edate		= Rs("EDATE")
		files1		= Rs("FILES1")
		files2		= Rs("FILES2")
		alt1		= Rs("ALT1")
		alt2		= Rs("ALT2")
		contents	= Rs("CONTENTS")
		writer		= Rs("WRITER")
		status		= Rs("STATUS")
		regdate		= Rs("REGDATE")

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

		.CommandText = "SP_HUGO7_TBL_NOW_PREV_SELECT_M" 
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
		.CommandText = "SP_HUGO7_TBL_NOW_NEXT_SELECT_M"
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
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap perfo-now">
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.asp" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>행사·공연</h2>
        </div>

    <!--#include virtual="/mobile/event/inc/event_topmenu.asp" -->

    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>민속촌NOW</h3>
                <div class="text-box">
                    <span class="text">살아있는 ‘진짜’ 전통을<br/>경험하는 즐거움</span>
                </div>
            </div>
            <div class="detail-content board_now-view">
                <article>
                    <h4><%=title%></h4>
                    <span class="date-wrap">
                        <span class="title">행사기간</span>
                        <span class="date"><%=sdate%> ~ <%=edate%></span>
                    </span>
                    <div class="content"><%=contents%></div>
                </article>
                <span class="btns">
					<%If prev_seq <> "" Then%>
                    <a href="/mobile/event/event_now_view.asp?seq=<%=prev_seq%>" class="btn prev-btn">이전 글 보기</a>
					<%End If%>
					<%If next_seq <> "" Then%>
                    <a href="/mobile/event/event_now_view.asp?seq=<%=next_seq%>" class="btn next-btn">다음 글 보기</a>
					<%End If%>
                    <a href="/mobile/event/event_now.asp" class="btn list-btn">목록</a>
                </span>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>