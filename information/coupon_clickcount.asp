<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Response.AddHeader "Pragma","no-cache"
	Response.AddHeader "cache-control", "no-staff"	
	Response.Expires  = -1

	Dim uid : uid		= RP(Request("uid"))
	Dim seq : seq		= RP(Request("seq"))

	If (uid <> "" And seq <> "") Then 
	
		Call OpenDbConnection() '데이터베이스 오픈

		'######################################################
		'# 쿠폰출력 내역 조회 START
		'######################################################

		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "SP_HUGO7_TBL_COUPON_HISTORY_CHECK_M"
			.CommandType = adCmdStoredProc

			.Parameters.Append .CreateParameter("@SEQ",adInteger,adParamInput,0,seq)
			.Parameters.Append .CreateParameter("@UID",adVarChar,adParamInput,20,uid)

			Set Rs = .Execute
		End With
		Set objCmd = Nothing

		chkcnt = Rs(0)

		'######################################################
		'# 쿠폰출력 내역 조회 END
		'######################################################

		If chkcnt = 0 Then '쿠폰출력 내역이 없을 경우

			'#######################################################
			'# TBL_COUPON_HISTORY TABLE Insert START
			'#######################################################

			Set objCmd = Server.CreateObject("ADODB.Command")
			With objCmd
				.ActiveConnection = Conn
				.CommandText = "SP_HUGO7_TBL_COUPON_HISTORY_INSERT_M"
				.CommandType = adCmdStoredProc

				'기본정보
				.Parameters.Append .CreateParameter("@SEQ",adInteger,adParamInput,0,seq)
				.Parameters.Append .Createparameter("@UID",adVarchar,adparamInput,20,uid)
				
				.Execute ,,adExecuteNoRecords
			End With
			Set objCmd = Nothing

			'#######################################################
			'# TBL_COUPON_HISTORY TABLE Insert END
			'#######################################################

		Else '쿠폰출력 내역이 있을 경우
		
			'#######################################################
			'# TBL_COUPON_HISTORY TABLE Update START
			'# 삭제여부 필드(STATUS) 업데이트 처리
			'#######################################################

			Set objCmd = Server.CreateObject("ADODB.Command")
			With objCmd
				.ActiveConnection = Conn
				.CommandText = "SP_HUGO7_TBL_COUPON_HISTORY_UPDATE_M"
				.CommandType = adCmdStoredProc

				'기본정보
				.Parameters.Append .CreateParameter("@SEQ",adInteger,adParamInput,0,seq)
				.Parameters.Append .Createparameter("@UID",adVarchar,adparamInput,20,uid)
				
				.Execute ,,adExecuteNoRecords
			End With
			Set objCmd = Nothing

			'#######################################################
			'# TBL_COUPON_HISTORY TABLE Update END
			'#######################################################
			
		End If

		Rs.Close
		Set Rs = Nothing
		Call CloseDbConnection() '데이터베이스 클로즈

	End If
%>