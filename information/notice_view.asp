<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim code_name, seq, pg

	seq	= SQLInjectionFilter(Request("seq"))
	pg	= SQLInjectionFilter(Request("pg"))

	If IsNumeric(seq) = False Then f_AlertBack("정상적 접근이 아닙니다.")
	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	Call OpenDbConnection() '데이터베이스 열기

	'######################################################
	'# TBL_NOTICE TABLE SELECT START
	'######################################################

	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_NOTICE_SELECT_M"
		.CommandType = adCmdStoredProc

		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, seq)

		Set Rs = .Execute
	End With
	Set objcmd = Nothing

	'######################################################
	'# TBL_NOTICE TABLE SELECT END
	'######################################################

	If(Not Rs.EOF or Not Rs.BOF) Then

		code			= Rs("CODE")
		title			= Rs("TITLE")
		files			= Rs("FILES")
		contents		= Rs("CONTENTS")
		contents 		= Replace(contents,"&amp;","&")
		contents 		= Replace(contents,"<br>",vblf)
		contents 		= Replace(contents,"''","'")
		'contents		= Replace(Trim(contents),chr(13)&chr(10),"<br>")
		writer			= Rs("WRITER")
		status			= Rs("STATUS")
		regdate			= Rs("REGDATE")

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

		.CommandText = "SP_HUGO7_TBL_NOTICE_PREV_SELECT_M"
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
		.CommandText = "SP_HUGO7_TBL_NOTICE_NEXT_SELECT_M"
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
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.html" -->
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->
	<div class="wrap">
	<!--#include virtual="/mobile/common/inc/header_wrap.asp" --><!-- 상단헤더 -->

    <div class="header_title_slide">
        <div class="title">
            <h2>이용안내</h2>
            <aside>
                <h2>이용안내
                    <span class="icon"></span>
                </h2>
				<!--#include virtual="/mobile/common/inc/rg_menu.asp" -->
            </aside>
        </div>

        <div class="slider multiple-items">
            <a href="/mobile/information/notice_list.asp">공지사항</a>
            <a href="/mobile/information/map.asp">가이드맵</a>
            <a href="/mobile/information/guide.asp">시간/요금</a>
            <a href="/mobile/information/membership.asp">연간회원안내</a>
            <a href="/mobile/information/traffic.asp">교통정보</a>
            <a href="/mobile/information/convenience.asp">편의시설</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>공지사항</h3>
                <div class="text-box">
                    <span class="text">한국민속촌에서 전하는 소식</span>
                </div>
            </div>
            <div class="detail-content board-view">
                <article>
                    <h4><%=title%></h4>
                    <span class="date-wrap">
                        <span class="title">게시일</span>
                        <span class="date"><%=regdate%></span>
                    </span>
                    <div class="content">
					<%=contents%>
					<!--
					<img src="/mobile/images/information/notice_img2.jpg" alt="한국민속촌 정기공연 변경안내 그 동안 많은 분들이 사랑해 주신 줄타기 공연은 '국악 비보이 공연'으로 대체됩니다." />
					-->
                    </div>
                </article>
                <span class="btns">
					<%If prev_seq <> "" Then%>
                    <a href="/mobile/information/notice_view.asp?seq=<%=prev_seq%>&pg=<%=pg%>" class="btn prev-btn">이전 글 보기</a>
					<%End If%>
					<%If next_seq <> "" Then%>
                    <a href="/mobile/information/notice_view.asp?seq=<%=next_seq%>&pg=<%=pg%>" class="btn next-btn">다음 글 보기</a>
					<%End If%>
                    <a href="/mobile/information/notice_list.asp?pg=<%=pg%>" class="btn list-btn">목록</a>
                </span>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>
<!--#include virtual="/mobile/common/inc/script.html" -->
    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                initialSlide: 4
            });
        });
    </script>

</body>
</html>