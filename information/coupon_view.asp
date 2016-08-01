<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%		
	Dim couponSEQ
	
	couponSEQ	= SQLInjectionFilter(Request("couponSEQ"))
	FileURL = "/upload/coupon/"

	'If IsNumeric(couponSEQ) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	If session("id") = "" Then
		If couponSEQ = "" Then
			Response.Write "<form name='form1' method='post' action='https://www.koreanfolk.co.kr/mobile/member/login.asp'>"
			Response.Write "<input type='hidden' name='RtnURL' value='/mobile/information/coupon_view.asp'>"
			Response.Write "<input type='hidden' name='event' value='coupon'>"
			Response.Write "</form>"
			Response.Write "<script language='javascript'>"
			Response.Write "alert('로그인후 이용해 주세요.');"
			Response.Write "document.form1.submit();"
			Response.Write "</script>"
			Response.End
		Else
			Response.Write "<form name='form1' method='post' action='https://www.koreanfolk.co.kr/mobile/member/login.asp'>"
			Response.Write "<input type='hidden' name='RtnURL' value='/mobile/information/coupon_view.asp'>"
			Response.Write "<input type='hidden' name='event' value='coupon'>"
			Response.Write "<input type='hidden' name='couponSEQ' value='"&couponSEQ&"'>"
			Response.Write "</form>"
			Response.Write "<script language='javascript'>"
			Response.Write "alert('로그인후 이용해 주세요.');"
			Response.Write "document.form1.submit();"
			Response.Write "</script>"
			Response.End			
		End If 
	Else
		If couponSEQ = "" Then
			Response.Write "<script language='javascript'>"
			Response.Write "location.href='/mobile/information/coupon_list.asp'"
			Response.Write "</script>"
			Response.End
		End If 		
	End If

	Call OpenDbConnection() '데이터베이스 열기
	
	'######################################################
	'# TBL_COUPON TABLE SELECT START
	'######################################################

	Set objcmd = Server.CreateObject("ADODB.Command")
	With objcmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_COUPON_SELECT_M"
		.CommandType = adCmdStoredProc

		.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, couponSEQ)

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
		
		'회원정보 가져오기
		strSQL = ""
		strSQL = "SELECT BIRTHYEAR,BIRTHMONTH,BIRTHDAY,MOBILE1,MOBILE2,MOBILE3 FROM TBL_MEMBER"
		strSQL = strSQL & " WHERE UID = '"& session("id") &"'"
		Set cRs = Conn.Execute(strSQL)

		If Not(cRs.bof OR cRs.eof) Then
			birthyear = cRs(0)
			birthmonth = cRs(1)
			birthday = cRs(2)			
			mobile1 = cRs(3)
			mobile2 = cRs(4)
			mobile3 = cRs(5)
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
	<script type="text/javascript">

	function CouponClickCount(uid,seq){
		var  params = "uid=" + uid + "&seq= " + seq;

		$.ajax({
			type:"POST",
			url: "coupon_clickcount.asp",
			data: params,
			success: function(data) {
				alert("마이페이지 MY쿠폰에서 확인하실수 있습니다. ");
			}
		});
	}
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

        <div class="slider multiple-items">
            <a href="/mobile/information/coupon_list.asp">쿠폰할인</a>
            <a href="/mobile/information/promotion_list.asp">할인프로모션</a>
            <a href="/mobile/information/credit_card.asp">제휴카드할인</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-discount">
            <div class="detail-head">
                <h3>쿠폰할인</h3>
                <div class="text-box">
                    <span class="text">한국민속촌 온라인 회원에게<br> 드리는 특별한 혜택!</span>
                </div>
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
                        <dt>
                            <p>
                                <span class="icon"></span>
                                <strong>이름</strong>
                            </p>
                        </dt>
                        <dd><%=session("name")%></dd>
                        <dt>
                            <p>
                                <span class="icon"></span>
                                <strong>휴대폰</strong>
                            </p>
                        </dt>
                        <dd><%Response.Write mobile1 & "-" & mobile2 & "-" & mobile3%></dd>
                        <dt>
                            <p>
                                <span class="icon"></span>
                                <strong>생년월일</strong>
                            </p>
                        </dt>
                        <dd><%Response.Write birthyear & "-" & birthmonth & "-" & birthday%></dd>
                        <dt>
                            <p>
                                <span class="icon"></span>
                                <strong>사용기간</strong>
                            </p>
                        </dt>
                        <dd><%=sdate%> ~ <%=edate%></dd>
                    </dl>
                </article>
                <h4>우대혜택</h4>
                <span class="benefit_img"><img src="<%=FileURL%><%=files2%>" alt="<%=alt2%>"/></span>
                <span class="coupon_down_wrap">
                    <a href="#" onClick="CouponClickCount('<%=session("id")%>','<%=couponSEQ%>');return false;" class="coupon_down">쿠폰 발급받기</a>
                </span>
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
                slidesToShow: 3,
                slidesToScroll: 1
            });
            $('.single-item').slick({
                dots: true
            });
        });
    </script>

</body>
</html>