<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " parent.location.href='/mobile/member/login.asp?RtnURL=http://www.koreanfolk.co.kr/mobile/mypage/coupon_list.asp';"
		Response.write "</script>"
		Response.End
	End If	

	'#######################################################
	'# HTML FORM값 가져오기 START
	'#######################################################	
	
	Dim seq		: seq			= RP(Request("seq"))
	Dim pg		: pg			= RP(Request("pg"))
	Dim uid		: uid			= RP(Request("uid"))

	If IsNumeric(seq) = False Then f_AlertBack("정상적 접근이 아닙니다.")
	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	If uid <> session("id") Then
		Response.write "<script language='javascript'>"
		Response.write " alert('본인의 쿠폰만 삭제할 수 있습니다.');"
		Response.write " history.back(-1);"
		Response.write "</script>"
		Response.End	
	End If

	'#######################################################
	'# HTML FORM값 가져오기 END
	'#######################################################	

	Call OpenDbConnection() '데이터베이스 오픈
	Conn.BeginTrans
	
	'#######################################################	
	'# TBL_COUPON_HISTORY TABLE Delete START
	'#######################################################

	Dim objCmd
	Set objCmd = Server.CreateObject("ADODB.Command")
	With objCmd
		.ActiveConnection = Conn
		.CommandText = "SP_HUGO7_TBL_COUPON_HISTORY_MEMBER_DELETE_M"
		.CommandType = adCmdStoredProc

		.Parameters.Append .CreateParameter("@SEQ",adInteger,adParamInput,0,seq)
		.Parameters.Append .Createparameter("@UID",adVarChar,adparamInput,20,session("id"))
		
		On Error Resume Next	
		.Execute ,,adExecuteNoRecords
	End With

	'#######################################################	
	'# TBL_COUPON_HISTORY TABLE Delete END
	'#######################################################

	If Conn.Errors.Count <> 0 Then	
		Conn.RollbackTrans
		Call CloseDbConnection()
		Response.Write ("<script language='javascript'>")
		Response.Write ("alert('정보를 삭제하는 동안 에러가 발생했습니다.');")
		Response.Write ("</script>")
		Response.End
	Else
		Conn.CommitTrans
		Call CloseDbConnection()
		Response.Write ("<script language='javascript'>")
		Response.Write ("location.href='/mobile/mypage/coupon_list.asp';")
		Response.Write ("</script>")
		Response.End
	End If	
%>