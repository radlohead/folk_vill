<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim filename : filename = "notice_list.asp"

	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, param, pg, keyfield, keyword, code
	Dim code_name

	Debug		= false ' SQL 디버그 설정(true : 사용, false : 사용안함)
	DebugMode	= 2 ' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))
	keyfield	= SQLInjectionFilter(Nvl(Request("keyfield"),"1"))
	keyword		= SQLInjectionFilter(Nvl(Request("keyword"),""))
	code		= SQLInjectionFilter(Nvl(Request("code"),""))
	param		= "&keyfield="&keyfield&"&keyword="&Server.URLEncode(keyword)&"&code="&code
	today		= Date()

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")	

	' 페이징 처리 부분 
	pgSize		= 4
	UniqueField	= "SEQ" ' 시퀀스필드
	TableName	= "TBL_NOTICE_M" ' 테이블명
	SelectField	= "SEQ,CODE,TITLE,FILES,CONTENTS,WRITER,STATUS,READCNT,REGDATE" ' select할 필드
	WhereClause = "STATUS = 'Y'"
	OrderBy		= "REGDATE DESC" ' 정렬방식

	Call OpenDbConnection() '데이터베이스 열기
	Call ProcRecordSQL() ' 페이징 처리 서브 호출

	If Not(Rs.BOF OR Rs.EOF) Then
		rValue = Rs.GetRows
	Else
		rValue = Null
	End If

	totalpage = int(TotalRecordCount / pgSize)

	Nam = TotalRecordCount Mod pgSize
	If Nam > 0 Then
	   totalpage = totalpage + 1
	End If
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
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
		<!--#include virtual="/mobile/information/inc/infor_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>공지사항</h3>
                <div class="text-box">
                    <span class="text">한국민속촌에서 전하는 소식</span>
                </div>
            </div>
            <div class="detail-content board-list">
                <table class="list">
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
					%>

                        <tr>
                            <td><span class="icon <%=notice_icon%>"></span></td>
                            <td>
                                <div>
                                    <h4 style="color:#f08200;"><%=title%></h4>
                                    <span class="date"><%=regdate%></span>
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
                <a class="list_more_btn" href="#none">더보기</a>
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
                initialSlide: 4
            });
        });
    </script>

</body>
</html>