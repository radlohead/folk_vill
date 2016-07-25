<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " location.href='/mobile/member/login.asp?RtnURL=http://www.koreanfolk.co.kr/mobile/mypage/qna_list.asp';"
		Response.write "</script>"
		Response.End
	End If

	Dim filename : filename = "qna_list.asp"

	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, param, pg, keyfield, keyword, code
	Dim code_name

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
	TableName	= "TBL_INQUIRY" ' 테이블명
	SelectField	= "SEQ,CODE,UID,NAME,TITLE,CONTENTS,ANSWER,ANSWER_YN,STATUS,READCNT,REGDATE,ANSWERDATE"

	WhereClause = "UID = '" & session("id") & "'"

	If keyword <> "" then
		If keyfield <> "" Then
			WhereClause = WhereClause & " AND " & keyfield & " LIKE '%" & keyword & "%'" ' 검색조건
		End If
	End If

	'OrderBy = "ANSWER_YN ASC, REGDATE DESC" ' 정렬방식
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
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
	<!--#include virtual="/mobile/common/inc/css.asp" -->
	<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/common/js/common.js"></script>
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script language="javascript">
	<!--
	function Del(seq,pg,uid) {
		var bool = confirm("선택하신 내용을 정말로 삭제하시겠습니까?\n\n확인 하시고 삭제 하시기 바랍니다.");
		if (bool){
			location.href = "qna_del_proc.asp?seq=" + seq + "&pg=" + pg + "&uid=" + uid;
		}
	}

	function Write() {
		location.href = "https://www.koreanfolk.co.kr/customer/qna_form.asp";
	}
	//-->
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
			url:	"srv_qna_contents.asp",
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
						var name		= $.trim($(this).find("name").text());
						var title		= $.trim($(this).find("title").text());
						var answer		= $.trim($(this).find("answer").text());
						//var contents	= $.trim($(this).find("contents").text());
						var answer_yn	= $.trim($(this).find("answer_yn").text());
						var status		= $.trim($(this).find("status").text());
						var readcount	= $.trim($(this).find("readcount").text());
						var regdate		= $.trim($(this).find("regdate").text());
						var answerdate	= $.trim($(this).find("answerdate").text());

						var param		= "?pg=" + pg + "&seq=" + seq;

						media_add = "<tr>";
						media_add += "	<td>";
						media_add += "		<div class='board-list-title'>";
						media_add += "			<h4>" + title + "</h4>";
						media_add += "			<div class='text_icon_box'>";
						media_add += "				<span class='text_date'>" + regdate + "</span>";
						if(answer_yn == 'Y'){
							media_add += "			<span class='icon complete'></span>";
						}else{
							media_add += "			<span class='icon prepare'></span>";
						}
						media_add += "			</div>";
						media_add += "		</div>";
						media_add += "	</td>";
						media_add += "	<td>";
						media_add += "		<a href='qna_view.asp?seq=" + seq + "&pg=" + pg + "' class='icon icon_more'>자세히보기</a>";
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
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.asp" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>마이페이지</h2>
        </div>

	<!--#include virtual="/mobile/mypage/inc/mypage_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-mypage">
            <div class="detail-head">
                <h3>1:1 상담문의</h3>
                <span class="text">고객님의 1:1 상담문의 내역을 확인하실 수 있습니다.</span>
            </div>
            <div class="content">
                <table id="box">
                    <caption>1:1 상담문의 리스트</caption>
                    <colgroup>
                        <col style="width:82.5%">
                        <col style="width:17.5% ">
                    </colgroup>

					<%
					If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then

						For i = Lbound(rValue,2) To UBound(rValue,2)

							rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

							'SEQ,CODE,UID,NAME,TITLE,CONTENTS,ANSWER,ANSWER_YN,STATUS,READCNT,REGDATE,ANSWERDATE

							seq				= rValue(0,i)
							code			= rValue(1,i)
							uid				= rValue(2,i)
							name			= rValue(3,i)
							title			= rValue(4,i)
							contents		= rValue(5,i)
							contents		= Replace(Trim(contents),vblf,"<br>") '에디터 사용하지 않을때 변환
							answer			= Nvl(rValue(6,i),"")
							answer			= Replace(Trim(answer),chr(13)&chr(10),"<br>") '에디터 사용시 변환
							answer_yn		= rValue(7,i)
							status			= rValue(8,i)
							readcount		= rValue(9,i)
							regdate			= rValue(10,i)
							answerdate		= rValue(11,i)
					%>

                    <tr>
                        <td>
                            <div class="board-list-title">
                                <h4><%=cutStrNew(title, 34)%></h4>
                                <div class="text_icon_box">
                                    <span class="text_date"><%=DateYMDFormat(regdate)%></span>
								<%If answer_yn = "N" Then%>
                                    <span class="icon prepare"></span>
								<%Else%>
                                    <span class="icon complete"></span>
								<%End If%>
                                </div>
                            </div>
                        </td>
                        <td>
                            <a href="qna_view.asp?seq=<%=seq%>&pg=<%=pg%>" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
					<%
						Next
					Else
					%>
					<tr>
						<%If keyword = "" Then%>
						<td colspan="2">등록된 데이터가 없습니다.</td>
						<%Else%>
						<td colspan="2" class="no_result">검색 내용이 없습니다.</td>
						<%End If%>
					</tr>
					<%
					End If
					Call RsClose()
					Call CloseDbConnection()
					%>
					<!--
                    <tr>
                        <td>
                            <div class="board-list-title">
                                <h4>장터 이용 시 줄을 어떻게 서야</h4>
                                <div class="text_icon_box">
                                    <span class="text_date">2016. 08. 08</span>
                                    <span class="icon complete"></span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="board-list-title">
                                <h4>장터 이용 시 줄을 어떻게 서야</h4>
                                <div class="text_icon_box">
                                    <span class="text_date">2016. 08. 08</span>
                                    <span class="icon complete"></span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <a href="#none" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
					-->
                </table>
                <a href="#none" class="more_btn" id="btnAdd">
                    <span class="text_icon_box">
                        <span class="text">더보기</span>
                        <span class="icon_img"><img src="/mobile/images/common/plus_icon.png" alt="" /></span>
                    </span>
                </a>
                <a href="/mobile/customer/qna_form.asp" class="btn inquiry_btn">1:1상담문의</a>
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
                slidesToScroll: 1,
                initialSlide: 0
            });
        });
    </script>

</body>
</html>