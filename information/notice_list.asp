<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim filename : filename = "notice_list.asp"

	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, param, pg, keyfield, keyword, code
	Dim code_name
	Dim Df_Psize

	Debug		= false		' SQL 디버그 설정(true : 사용, false : 사용안함)
	DebugMode	= 2			' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)
	Df_Psize	= 4			' 페이징사이즈

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))
	keyfield	= SQLInjectionFilter(Nvl(Request("keyfield"),"1"))
	keyword		= SQLInjectionFilter(Nvl(Request("keyword"),""))
	code		= SQLInjectionFilter(Nvl(Request("code"),""))
	param		= "&keyfield="&keyfield&"&keyword="&Server.URLEncode(keyword)&"&code="&code
	today		= Date()

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")

	' 페이징 처리 부분
	pgSize		= Df_Psize
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
	<script language="javascript">
	<!--
	var pg			= "<%=pg%>";
	var keyfield	= "<%=keyfield%>";
	var keyword		= "<%=keyword%>";
	var code		= "<%=code%>";

	function requestAdd(){

		var send_data = {
			pg:			pg,
			keyfield:	keyfield,
			keyword:	keyword,
			code:		code
		};

		$.ajax({
			type:	"POST",
			url:	"srv_notice_contents.asp",
			data:	send_data,
			success: function(result_data){

				var flag	= $(result_data).find("item").find("flag").first().text();

				if (flag == "error") {
					alert("Error");
					return false;
				}else if (flag == "nodata") {
					return false;
				}else if (flag == "success") {

					//$('#box > tbody:last > tr:last').remove();
					$(result_data).find("item").each(function() {

						var media_add;
						var seq			= $(this).find("seq").text();
						var code		= $.trim($(this).find("code").text());
						var title		= $.trim($(this).find("title").text());
						var files		= $.trim($(this).find("files").text());
						var contents	= $.trim($(this).find("contents").text());
						var writer		= $.trim($(this).find("writer").text());
						var status		= $.trim($(this).find("status").text());
						var readcount	= $.trim($(this).find("readcount").text());
						var regdate		= $.trim($(this).find("regdate").text());
						var notice_icon	= $.trim($(this).find("notice_icon").text());

						var param		= "?pg=" + pg + "&seq=" + seq;

						media_add = "<tr style='display: table-row;'>";
						media_add += "	<td><span class='icon " + notice_icon + "'></span></td>";
						media_add += "	<td>";
						media_add += "		<div><a href='notice_view.asp" + param + "'><h4 style='color:#f08200;'>" + title + "</h4><span class='date'>" + regdate + "</span></a></div>";
						media_add += "	</td>";
						media_add += "</tr>";

						$("#box").append(media_add);
					});
				}
			},
			error: function(xhr, ajaxOptions, throuwnError) {
				if (xhr.status == "0"){
					return;
				}else{
					alert("ggContentsBody Error=" + xhr.status + " text=" + xhr.responseText);
				}
			}
		});
	}

	$(document).ready(function() {
		// 페이지버튼
		$("#btnAdd").click(function() {
			var tot_page = "<%=totalpage%>";
			//alert(pg);
			//alert(tot_page);
			if(pg == tot_page){
				alert("더이상 내용이 없습니다.");
			}else{
				if (pg >= tot_page)
					return false;
				pg = parseInt(pg) + 1;

				requestAdd();
			}
		});

		//var img_h = $(".board-list:last-of-type .board-list-left img").height();
		//var img_w = $(".board-list:last-of-type .board-list-left img").width();
		//$(".board-list .board-list-left img").css({"height":img_h, "width":img_w});
	});
	//-->
	</script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->
	<div class="wrap">
	<!--#include virtual="/mobile/common/inc/header_wrap.asp" --><!-- 상단헤더 -->
	<div class="header_title_slide">
		<div class="title">
			<h2>이용안내</h2>
		</div>
<div class="slider multiple-items">
    <a href="index.asp?01" class="menu1">시간/요금</a>
    <a href="index.asp?02" class="menu2">연간회원안내</a>
    <a href="index.asp?03" class="menu3">교통정보</a>
    <a href="index.asp?04" class="menu4">편의시설</a>
    <!--<a href="index.asp?05" class="menu5">공지사항</a>-->
    <a href="/mobile/information/notice_list.asp">공지사항</a>
    <a href="index.asp?06" class="menu6">가이드맵</a>
</div>
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
                                    <a href='notice_view.asp<%=cparam%>'><h4><%=title%></h4>
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
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>