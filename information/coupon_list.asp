<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%

	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, param, pg, keyfield, keyword, code

	Debug		= false ' SQL 디버그 설정(true : 사용, false : 사용안함)
	DebugMode	= 2 ' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))
	keyfield	= SQLInjectionFilter(Nvl(Request("keyfield"),"1"))
	keyword		= SQLInjectionFilter(Nvl(Request("keyword"),""))
	param		= "&keyfield=" & keyfield & "&keyword=" & Server.URLEncode(keyword)
	FileURL		= "/upload/coupon/"
	today = Date()

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	' 페이징 처리 부분
	'pgSize		= 15
	pgSize		= 5
	UniqueField = "SEQ" ' 시퀀스필드
	TableName	= "TBL_COUPON_M" ' 테이블명
	SelectField	= "SEQ,TITLE,SDATE,EDATE,FILES1,FILES2,ALT1,ALT2,CONTENTS1,CONTENTS2,STATUS,SHOWSDATE,SHOWEDATE,REGDATE,FILES3,ALT3" ' select할 필드

	WhereClause = "'"& today &"' BETWEEN SHOWSDATE AND SHOWEDATE"

	If keyword <> "" then
		If keyfield <> "" Then
			If keyfield = "1" Then '제목 검색
				WhereClause = WhereClause & " AND TITLE LIKE '%" & keyword & "%'"
			ElseIf keyfield = "2" Then '내용 검색
				WhereClause = WhereClause & " AND CONTENTS1 LIKE '%" & keyword & "%'"
			ElseIf keyfield = "3" Then '제목+내용 검색
				WhereClause = WhereClause & " AND (TITLE LIKE '%" & keyword & "%' OR CONTENTS1 LIKE '%" & keyword & "%')"
			End If
		End If
	End If

	OrderBy = "REGDATE DESC" ' 정렬방식

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

	'좌측메뉴관련 세팅
	'Dim mlnb : mlnb = "lnb4" '메인메뉴
	'Dim slnb : slnb = "lnb41" '서브메뉴
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
            <h2>할인정보</h2>
        </div>

        <div class="slider single-items">
            <a href="/mobile/information/promotion_list.asp">할인프로모션</a>
            <a href="/mobile/information/credit_card.asp">제휴카드할인</a>
            <a href="/mobile/information/coupon_list.asp">쿠폰할인</a>
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
            <div class="detail-content promotion-list">
                <table>
                    <caption>할인프로모션 리스트</caption>
                    <colgroup>
                        <col style="width:22.4%">
                        <col style="width:60.1%">
                        <col style="width:17.3% ">
                    </colgroup>
				<%
					If NOT(IsNull(rValue) Or IsEmpty(rValue)) then

						For i = Lbound(rValue,2) To UBound(rValue,2)

							rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

							seq				= rValue(0,i)
							title			= rValue(1,i)
							sdate			= rValue(2,i)
							edate			= rValue(3,i)
							files1			= rValue(4,i)
							files2			= rValue(5,i)
							alt1			= rValue(6,i)
							alt2			= rValue(7,i)
							contents		= rValue(8,i)
							contents		= Replace(contents,vblf,"<br />") '에디터 사용하지 않을때 변환
							contents		= rValue(9,i)
							status			= rValue(10,i)
							showsdate		= rValue(11,i)
							showedate		= rValue(12,i)
							regdate			= rValue(13,i)
							files3			= rValue(14,i)
							alt3			= rValue(15,i)

							'If status = "Y" Then
							'	strstatus = "<font color='#ff4500'>Y</font>"
							'Else
							'	strstatus = "N"
							'End If

							If CDate(showsdate) > CDate(today) Then
								'strstatus = "<b><font color='#CF2525'>예정</font></b>"
								strstatus = "<img src='/backend/images/icon_due.gif'>"
							ElseIf (CDate(showsdate) <= CDate(today) AND CDate(showedate) >= CDate(today)) Then
								'strstatus = "<b><font color='#09A928'>진행</font></b>"
								strstatus = "<img src='/backend/images/icon_ing.gif'>"
							ElseIf CDate(showedate) < CDate(today) Then
								'strstatus = "<b><font color='#4F4F4F'>종료</font></b>"
								strstatus = "<img src='/backend/images/icon_end.gif'>"
							End If

							strSQL = "SELECT COUNT(UID) FROM TBL_COUPON_HISTORY_M WHERE CSEQ = " & seq & ""
							Set cRs = Conn.Execute(strSQL)
								cnt = cRs(0)
							cRs.Close
							Set cRs = Nothing
				%>
                    <tr>
                        <td colspan="2">
                            <div class="board-list-title">
							<img src="<%=FileURL%><%=files1%>" alt="<%=alt1%>" style="margin:5px;">
							</div>
                        </td>
                        <td>
                            <a href="/mobile/information/coupon_gate.asp?couponSEQ=<%=seq%>" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>

				<%
						Next
					Else
				%>
					<tr>
						<td colspan="3">등록된 데이터가 없습니다.</td>
					</tr>
				<%
					End If
					Call RsClose()
					Call CloseDbConnection()
				%>
                </table>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->
    <script>
        $(document).ready(function(){
            $('.single-items').slick({
                slidesToShow: 3,
                initialSlide: 2
            });
        });
    </script>

</body>
</html>