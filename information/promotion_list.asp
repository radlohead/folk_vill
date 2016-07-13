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
	FileURL		= "/upload/discount/"
	today = Date()

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	' 페이징 처리 부분
	'pgSize		= 15
	pgSize		= 5
	UniqueField = "SEQ" ' 시퀀스필드
	TableName	= "TBL_DISCOUNT_M" ' 테이블명
	SelectField	= "SEQ,TITLE,SDATE,EDATE,FILES1,FILES2,ALT1,ALT2,CONTENTS,WRITER,STATUS,READCNT,REGDATE"
	WhereClause = "STATUS = 'Y'"
	OrderBy		= "SORT ASC, REGDATE DESC" ' 정렬방식

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
                <h3>할인프로모션</h3>
                <span class="text">알뜰하게 챙기고, 여유롭게 즐기는 방법</span>
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

							'SEQ,TITLE,SDATE,EDATE,FILES1,FILES2,ALT1,ALT2,CONTENTS,WRITER,STATUS,READCNT,REGDATE

							seq				= rValue(0,i)
							title			= rValue(1,i)
							sdate			= rValue(2,i)
							edate			= rValue(3,i)
							files1			= rValue(4,i)
							files2			= rValue(5,i)
							alt1			= rValue(6,i)
							alt2			= rValue(7,i)
							contents		= rValue(8,i)
							writer			= rValue(9,i)
							status			= rValue(10,i)
							readcount		= rValue(11,i)
							regdate			= rValue(12,i)

							'2015/04/13 시작일/종료일 프로그램 수정 => 날짜 변환 함수 사용
							If (sdate <> "" And edate <> "") Then
								If Left(sdate,4) = Left(edate,4) Then
									eventdate = sdate& " ~ " &edate
								Else
									eventdate = sdate& " ~ " &edate
								End If
							ElseIf (sdate <> "" And edate = "") Then
								eventdate = sdate& " ~ "
							ElseIf (sdate = "" And edate <> "") Then
								eventdate = " ~ " &edate
							Else
								eventdate = ""
							End If
				%>

                    <tr>
                        <td colspan="2">
                            <div class="board-list-title"><img src="<%=FileURL%><%=files2%>" alt="<%=alt2%>" /></div>
                        </td>
                        <td>
                            <a href="/mobile/information/promotion_view.asp?seq=<%=seq%>&pg=<%=pg%>" class="icon icon_more">자세히보기</a>
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
                initialSlide: 0
            });
        });
    </script>

</body>
</html>