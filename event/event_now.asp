<!-- #include virtual="/common/lib/encoding.asp"-->
<!-- #include virtual="/common/inc/common.inc"-->
<%
	Dim seq, FileURL
	
	seq = SQLInjectionFilter(Request("seq"))
	FileURL = "/upload/now/"
	today = Date()

	Call OpenDbConnection() '데이터베이스 열기

	If seq = "" Then		
		strSQL = "SELECT TOP 1 SEQ,TITLE,SDATE,EDATE,FILES2,ALT2 FROM TBL_NOW_M"	
		strSQL = strSQL & " WHERE STATUS = 'Y'"
		strSQL = strSQL & " ORDER BY REGDATE DESC"
		Set Rs = Conn.Execute(strSQL)

		If Not(Rs.BOF OR Rs.EOF) Then
			vseq = Rs("SEQ")
			vtitle = Rs("TITLE")
			vsdate = Rs("SDATE")
			vedate = Rs("EDATE")
			vfiles2 = Rs("FILES2")
			valt2 = Rs("ALT2")

			'######################################################
			'# TBL_NOW TABLE 조회수 UPDATE start
			'######################################################

			Set objCmd = Server.CreateObject("ADODB.Command")
			With objCmd
				.ActiveConnection = Conn
				.CommandText = "SP_HUGO7_TBL_NOW_ADD_READCOUNT_M"
				.CommandType = adCmdStoredProc

				.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, vseq)

				.Execute ,,adExecuteNoRecords
			End With
			Set objCmd = Nothing

			'######################################################
			'# TBL_NOW TABLE 조회수 UPDATE end
			'######################################################
		Else
			vseq = ""
		End If
	Else
		If IsNumeric(seq) = False Then f_AlertBack("정상적 접근이 아닙니다.")

		strSQL = "SELECT TOP 1 SEQ,TITLE,SDATE,EDATE,FILES2,ALT2 FROM TBL_NOW_M"	
		strSQL = strSQL & " WHERE SEQ = "& seq &" AND STATUS = 'Y' "
		Set Rs = Conn.Execute(strSQL)

		If Not(Rs.BOF OR Rs.EOF) Then
			vseq = Rs("SEQ")
			vtitle = Rs("TITLE")
			vsdate = Rs("SDATE")
			vedate = Rs("EDATE")
			vfiles2 = Rs("FILES2")
			valt2 = Rs("ALT2")

			'######################################################
			'# TBL_NOW TABLE 조회수 UPDATE start
			'######################################################

			Set objCmd = Server.CreateObject("ADODB.Command")
			With objCmd
				.ActiveConnection = Conn
				.CommandText = "SP_HUGO7_TBL_NOW_ADD_READCOUNT_M"
				.CommandType = adCmdStoredProc

				.Parameters.Append .CreateParameter("@SEQ", adInteger, adParamInput, 0, vseq)

				.Execute ,,adExecuteNoRecords
			End With
			Set objCmd = Nothing

			'######################################################
			'# TBL_NOW TABLE 조회수 UPDATE end
			'######################################################
		Else
			vseq = ""
		End If
	End If 

	strSQL = ""
	strSQL = "SELECT SEQ,TITLE,SDATE,EDATE,FILES1,FILES2,ALT1,ALT2,WRITER,STATUS,REGDATE FROM TBL_NOW_M"
	'strSQL = strSQL & " WHERE STATUS = 'Y'"
	'strSQL = strSQL & " ORDER BY SORT ASC"
	strSQL = strSQL & " ORDER BY REGDATE DESC"
	Set Rs = Conn.Execute(strSQL)

	If Not(Rs.BOF OR Rs.EOF) Then
		rValue = Rs.GetRows
	Else
		rValue = Null
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
    <title>한국민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script>
		function View(seq) {
			location.href = "/mobile/event/event_now_view.asp?seq=" + seq;
		}
	</script>
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
            <div class="detail-content board-list">
                <table>
                    <caption>한국 민속촌 민속촌NOW 게시판</caption>
                    <colgroup>
                        <col width="35">
                    </colgroup>
                    <tbody>

					<%
					If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then
						j = 1
						For i = Lbound(rValue,2) To UBound(rValue,2)

							'SEQ,TITLE,SDATE,EDATE,FILES1,FILES2,ALT1,ALT2,WRITER,STATUS,REGDATE

							seq				= rValue(0,i)
							title			= rValue(1,i)
							sdate			= rValue(2,i)
							edate			= rValue(3,i)
							files1			= rValue(4,i)
							files2			= rValue(5,i)
							alt1			= rValue(6,i)
							alt2			= rValue(7,i)
							writer			= rValue(8,i)
							status			= rValue(9,i)
							regdate			= rValue(10,i)

							'2015/04/07 시작일/종료일 프로그램 수정 => 날짜 변환 함수 사용 
							If (sdate <> "" And edate <> "") Then
								If Left(sdate,4) = Left(edate,4) Then
									eventdate = DateYMDHanPointFormat(sdate)& " ~ " &DateMDHanPointFormat(edate)
								Else
									eventdate = DateYMDHanPointFormat(sdate)& " ~ " &DateYMDHanPointFormat(edate)
								End If
							ElseIf (sdate <> "" And edate = "") Then
								eventdate = DateYMDHanPointFormat(sdate)& " ~ "
							ElseIf (sdate = "" And edate <> "") Then
								eventdate = " ~ " &DateYMDHanPointFormat(edate)
							Else					
								eventdate = ""
							End If
					%>

                        <tr>
                            <td><span class="icon guide_icon"></span></td>
                            <td>
                                <div>
									<a href="javascript:void(0);" onclick="View('<%=seq%>');">
                                    <h4 style="color:#f08200;"><%=title%></h4>
                                    <span class="date"><%=eventdate%></span>
									</a>
                                </div>
                            </td>
                        </tr>

					<%
							j = j + 1
							Next
						Else
					%>
                        <tr>
                            <td colspan="2">등록된 내용이 없습니다.</td>
                        </tr>
					<%
						End If
					%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>