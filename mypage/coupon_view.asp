<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " location.href='/mobile/member/login.asp?RtnURL=http://www.koreanfolk.co.kr/mobile/mypage/coupon_list.asp';"
		Response.write "</script>"
		Response.End
	End If

	Dim couponSEQ
	
	seq	= SQLInjectionFilter(Request("seq"))
	pg	= SQLInjectionFilter(Request("pg"))
	FileURL = "/upload/coupon/"

	If IsNumeric(seq) = False Then f_AlertBack("정상적 접근이 아닙니다.")
	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	Call OpenDbConnection() '데이터베이스 열기

	'쿠폰내역 체크
	strSQL = ""
	strSQL = "SELECT COUNT(CSEQ) FROM TBL_COUPON_HISTORY_M"
	strSQL = strSQL & " WHERE CSEQ IN ("& seq &") and UID = '"& session("id") &"'"
	Set cRs = Conn.Execute(strSQL)

	chkcnt = cRs(0)

	cRs.Close
	Set cRs = Nothing

	If chkcnt < 1 Then
		Response.Write ("<script language='javascript'>")
		Response.Write (" alert('존재하지 쿠폰내역 입니다.');")
		Response.Write (" history.back();")
		Response.Write ("</script>")
		Response.End	
	End If 
		
	'######################################################
	'# TBL_COUPON TABLE SELECT START
	'######################################################

	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_COUPON_SELECT_M"
		.CommandType = adCmdStoredProc

		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, seq)

		Set Rs = .Execute
	End With
	Set objcmd = Nothing

	'######################################################
	'# TBL_COUPON TABLE SELECT END
	'######################################################

	If(Not Rs.EOF or Not Rs.BOF) Then
		title			= Rs("TITLE")
		sdate			= Rs("SDATE")
		edate			= Rs("EDATE")		
		files1			= Rs("FILES1")
		files2			= Rs("FILES2")
		alt1			= Rs("ALT1")
		alt2			= Rs("ALT2")
		contents1		= Rs("CONTENTS1")
		contents1		= Replace(contents1,vblf,"<br />") '에디터 사용하지 않을때 변환
		contents2		= Rs("CONTENTS2")
		status			= Rs("STATUS")
		regdate			= Rs("REGDATE")
		
		'쿠폰 내역에서 아이디 가져오기
		strSQL = ""
		strSQL = "SELECT UID FROM TBL_COUPON_HISTORY_M"
		strSQL = strSQL & " WHERE CSEQ = "& seq &""
		Set hRs = Conn.Execute(strSQL)

		If Not(hRs.bof OR hRs.eof) Then
			uid = hRs(0)
		End If 

		hRs.Close
		Set hRs = Nothing

		'회원정보 가져오기
		strSQL = ""
		strSQL = "SELECT BIRTHYEAR,BIRTHMONTH,BIRTHDAY,MOBILE1,MOBILE2,MOBILE3 FROM TBL_MEMBER"
		strSQL = strSQL & " WHERE UID = '"& session("id") &"'"
		Set cRs = Conn.Execute(strSQL)

		If Not(cRs.bof OR cRs.eof) Then
			birthyear	= cRs(0)
			birthmonth	= cRs(1)
			birthday	= cRs(2)			
			mobile1		= cRs(3)
			mobile2		= cRs(4)
			mobile3		= cRs(5)
		End If 

		cRs.Close
		Set cRs = Nothing
	End If

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
	<!--#include virtual="/mobile/common/inc/css.asp" -->
	<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/common/js/common.js"></script>
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script language="javascript">
	<!--
	function Del(seq,pg,uid) {
		if (uid != '<%=session("id")%>') {
			alert("본인의 쿠폰만 삭제할 수 있습니다.");
			return;
		}

		var bool = confirm("선택하신 내용을 정말로 삭제하시겠습니까?\n\n확인 하시고 삭제 하시기 바랍니다.");
		if (bool){
			location.href = "coupon_del_proc.asp?seq=" + seq + "&pg=" + pg + "&uid=" + uid;
		}
	}

	function View(seq) {
		location.href = "/mobile/mypage/coupon_view.asp?seq=" + seq;
	}
	//-->
	</script>
	<script type="text/javascript">
	var initBody
	function beforePrint() {
		initBody = document.body.innerHTML;
		document.body.innerHTML = idPrint.innerHTML;
	}

	function afterPrint(){
		document.body.innerHTML = initBody;
	}

	function printArea1() {
		window.print();
	}
	window.onbeforeprint = beforePrint;
	window.onafterprint = afterPrint;
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
                <h3>My 쿠폰</h3>
                <span class="text">고객님께서 발급받으신 쿠폰을 확인하실 수 있습니다.</span>
            </div>
            <div class="detail-content coupon-view">
                <p class="coupon-title">
                    <em>COUPON</em>
                    <span class="text"><%=title%></span>
                </p>
                <article>
                    <span class="coupon"><img src="<%=FileURL%><%=files1%>" alt="<%=alt1%>" /></span>
                    <span class="coupon_bottom_bg"></span>
                    <dl>
                        <dt>이름</dt>
                        <dd><%=session("name")%></dd>
                        <dt>휴대폰</dt>
                        <dd><%=mobile1%>-<%=mobile2%>-<%=mobile3%></dd>
                        <dt>생년월일</dt>
                        <dd><%=birthyear%>-<%=birthmonth%>-<%=birthday%></dd>
                        <dt>사용기간</dt>
                        <dd><%=sdate%> ~ <%=edate%></dd>
                    </dl>
                </article>
                <h4>우대혜택</h4>
                <span class="benefit_img"><img src="<%=FileURL%><%=files2%>" alt="<%=alt2%>"/></span>
                <a href="#none" class="del-btn">삭제</a>
                <h4>이용안내</h4>
                <ul>
					<%=contents2%>
					<!--
                    <li><span class="text">마이페이지 > MY 쿠폰페이지에서 확인 가능</span></li>
                    <li><span class="text">본인에 한해 적용되며, 중복할인 제외</span></li>
                    <li><span class="text">쿠폰과 함께 본인 확인이 가능한 신분증을 매표소에 제출</span></li>
                    <li><span class="text">신분증은 이름과 생년월일이 확인되는 신분증으로 제시 (주민등록증, 의료보험증, 등본, 학생증, 여권, 기타 자격증 등)</span></li>
                    <li><span class="text">쿠폰과 신분증의 생년월일이 다를 경우 할인혜택 적용 불가</span></li>
					-->
                </ul>
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
                initialSlide: 2
            });
        });
    </script>

</body>
</html>