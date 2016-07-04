<!--#include virtual="/common/lib/encoding.asp"-->
<%
		'세션삭제
		session("id")		= ""
		session("name")		= ""

		'세션 클리어
		session.abandon
		
		Response.write ("<script language=javascript>")
		Response.write ("location.href ='http://www.koreanfolk.co.kr/mobile/';")
		Response.write ("</script>")
%>

