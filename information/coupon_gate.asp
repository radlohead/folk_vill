<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim couponSEQ : couponSEQ	= SQLInjectionFilter(Request("couponSEQ"))

	If session("id") = "" Then		
		Response.Write "<form name='form1' method='post' action='https://www.koreanfolk.co.kr/mobile/member/login.asp'>"
		Response.Write "<input type='hidden' name='RtnURL' value='/mobile/information/coupon_gate.asp'>"
		'Response.Write "<input type='hidden' name='RtnURL' value='/mobile/information/coupon_list.asp'>"
		Response.Write "<input type='hidden' name='event' value='coupon'>"
		Response.Write "<input type='hidden' name='couponSEQ' value="& couponSEQ &">"
		Response.Write "</form>"
		Response.Write "<script language='javascript'>"
		Response.Write "alert('로그인후 이용해 주세요.');"
		Response.Write "document.form1.submit();"
		Response.Write "</script>"
		Response.End
	Else
		Response.Write "<form name='form1' method='post' action='/mobile/information/coupon_view.asp'>"
		Response.Write "<input type='hidden' name='event' value='coupon'>"
		Response.Write "<input type='hidden' name='couponSEQ' value="& couponSEQ &">"
		Response.Write "</form>"
		Response.Write "<script language='javascript'>"
		Response.Write "document.form1.submit();"
		Response.Write "</script>"
		Response.End		
	End If
%>