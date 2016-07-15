
        <div class="detail-member">
            <div class="detail-head">
                <h3>공지사항</h3>
                <div class="text-box">
                    <span class="text">한국민속촌에서 전하는 소식</span>
                </div>
            </div>
            <div class="detail-content board-list">
                <table class="list" id="box">
                    <caption>한국 민속촌 공지사항 게시판</caption>
                    <colgroup>
                        <col width="35">
                    </colgroup>
                    <tbody>
					<%
					If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then

						For i = Lbound(rValue,2) To UBound(rValue,2)

							rownum		= (TotalRecordCount - (pgSize * (pg-1))) -  i
							'SEQ,CODE,TITLE,FILES,CONTENTS,WRITER,STATUS,READCNT,REGDATE
							seq			= rValue(0,i)
							code		= rValue(1,i)
							title		= rValue(2,i)
							files		= rValue(3,i)
							contents	= rValue(4,i)
							writer		= rValue(5,i)
							status		= rValue(6,i)
							readcount	= rValue(7,i)
							regdate		= rValue(8,i)

							Select Case code
								Case "N1001"
									notice_icon = "event_icon"		' 행사
								Case "N1002"
									notice_icon = "perform_icon"	' 공연
								Case "N1003"
									notice_icon = "discount_icon"	' 할인
								Case "N1004"
									notice_icon = "guide_icon"		' 안내
								Case "N1005"
									notice_icon = "notice_icon"		' 공지
								Case "N1006"
									notice_icon = "exper_icon"		' 체험
								Case Else
									notice_icon = "etc_icon"		' 기타
							End Select

							cparam = "?pg=" & pg & "&seq=" & seq
					%>

                        <tr>
                            <td><span class="icon <%=notice_icon%>"></span></td>
                            <td>
                                <div>
                                    <a href='notice_view.asp<%=cparam%>'><h4 style="color:#f08200;"><%=title%></h4>
                                    <span class="date"><%=regdate%></span></a>
                                </div>
                            </td>
                        </tr>
					<%
						Next
					Else
					%>
                        <tr>
                            <td colspan="2">등록된 데이터가 없습니다.</td>
                        </tr>
					<%
					End If
					Call RsClose()
					Call CloseDbConnection()
					%>

                    </tbody>
                </table>
                <a class="list_more_btn" id="btnAdd" href="#none">
                    <p>
                        <span class="text">더보기</span>
                        <span class="icon"></span>
                    </p>
                </a>
            </div>
        </div>