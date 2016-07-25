<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim code_name, seq, pg, hopecode_name
	Dim ss_id

	seq		= SQLInjectionFilter(Request("seq"))
	pg		= SQLInjectionFilter(Request("pg"))
	ss_id	= session("id")

	If IsNumeric(seq) = False Then f_AlertBack("정상적 접근이 아닙니다.")
	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	Call OpenDbConnection() '데이터베이스 열기

	'######################################################
	'# TBL_DISCOUNT_M TABLE SELECT START
	'######################################################

	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_VOICE_SELECT_M"
		.CommandType = adCmdStoredProc
		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, seq)
		.Parameters.Append .CreateParameter("@id", adVarchar, adParamInput, 20, ss_id)
		Set Rs = .Execute
	End With
	Set objcmd = Nothing

	'######################################################
	'# TBL_DISCOUNT_M TABLE SELECT END
	'######################################################

	If(Not Rs.EOF or Not Rs.BOF) Then

		seq			= Rs("SEQ")
		code		= Rs("CODE")
		uid			= Rs("UID")
		name		= Rs("NAME")
		title		= Rs("TITLE")
		contents	= Rs("CONTENTS")
		contents 	= Replace(contents,"&amp;","&")
		contents 	= Replace(contents,"<br>",vblf)
		contents 	= Replace(contents,"''","'")
		'contents	= Replace(Trim(contents),chr(13)&chr(10),"<br>")
		If answer <> "" Or answer <> Null Then
			answer		= Rs("ANSWER")
			answer 		= Replace(answer,"&amp;","&")
			answer 		= Replace(answer,"<br>",vblf)
			answer 		= Replace(answer,"''","'")
		End If
		answer_yn	= Rs("ANSWER_YN")
		status		= Rs("STATUS")
		readcount	= Rs("READCNT")
		regdate		= Rs("REGDATE")
		answerdate	= Rs("ANSWERDATE")

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
		.CommandText = "SP_HUGO7_TBL_VOICE_PREV_SELECT_M"
		.CommandType = adCmdStoredProc
		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, seq)
		.Parameters.Append .CreateParameter("@id", adVarchar, adParamInput, 20, ss_id)

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
		.CommandText = "SP_HUGO7_TBL_VOICE_NEXT_SELECT_M"
		.CommandType = adCmdStoredProc
		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, seq)
		.Parameters.Append .CreateParameter("@id", adVarchar, adParamInput, 20, ss_id)

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
    <title>한국 민속촌 모바일 사이트</title>
	<!--#include virtual="/mobile/common/inc/css.asp" -->
	<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/common/js/common.js"></script>
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script language="javascript">
	<!--
	function Del(seq,pg,uid) {
		var bool = confirm("선택하신 내용을 정말로 삭제하시겠습니까?\n\n확인 하시고 삭제 하시기 바랍니다.");
		if (bool){
			location.href = "voice_del_proc.asp?seq=" + seq + "&pg=" + pg + "&uid=" + uid;
		}
	}

	function Write() {
		location.href = "/mobile/customer/voice_form.asp";
	}
	//-->
	</script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap">
	<!-- 상단헤더 -->
	<!--#include virtual="/mobile/common/inc/header.asp" -->
    <div class="header_title_slide">
        <div class="title">
            <h2>마이페이지</h2>
        </div>
		<!--#include virtual="/mobile/mypage/inc/mypage_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-mypage">
            <div class="detail-head">
                <h3>칭찬/신고/제안</h3>
                <span class="text">고객님의 1:1 상담문의 내역을 확인하실 수 있습니다.</span>
            </div>
            <div class="content qna-view">
                <article>
                    <h4><%=title%></h4>
                    <span class="date-wrap">
                        <span class="writer">작성자</span>
                        <span class="name"><%=name%></span>
                        <span class="title">작성일</span>
                        <span class="date"><%=regdate%></span>
                    </span>
                    <div class="question-comment"><%=contents%></div>
					<%If answer_yn = "Y" Then%>
                    <p class="answer_date">
                        <span class="text">답변일</span>
                        <span class="date"><%=answerdate%></span>
                    </p>
			
                    <div class="answer-comment>
                       <span class="text"><%=answer%></span>
                    </div>
					<%Else%>
                    <p class="answer_date">
                        <span class="text">답변일</span>
                        <span class="date"></span>
                    </p>
			
                    <div class="answer-comment preparing">
                       <span class="text">답변 준비중입니다</span>
                    </div>
					<%End If%>
                </article>
                 <span class="btns">


					<%If prev_seq <> "" Then%>
                    <a href="/mobile/mypage/voice_view.asp?seq=<%=prev_seq%>&pg=<%=pg%>" class="btn prev-btn">이전 글 보기</a>
					<%End If%>
					<%If next_seq <> "" Then%>
                    <a href="/mobile/mypage/voice_view.asp?seq=<%=next_seq%>&pg=<%=pg%>" class="btn next-btn">다음 글 보기</a>
					<%End If%>
                     <span class="rg_btn">
                         <a href="#none" onclick="Del('<%=seq%>','<%=pg%>','<%=ss_id%>');" class="btn del-btn">삭제</a>
						<a href="/mobile/mypage/voice_list.asp?pg=<%=pg%>" class="btn qna-list-btn list-btn">목록</a>
                     </span>
                 </span>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->
    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 1,
                initialSlide: 1
            });
        });
    </script>

</body>
</html>