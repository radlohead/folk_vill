<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim SQL, UniqueField, TableName, SelectField, WhereClause, OrderBy
	Dim TotalRecordCount, TotalPageCount, RecordNumber
	Dim Debug, DebugMode
	Dim pgSize, param, pg, keyfield, keyword, code

	Debug		= false			' SQL 디버그 설정(true : 사용, false : 사용안함)
	DebugMode	= 2				' SQL 디버그 모드(1 : COUNT 쿼리문 출력, 2 : LIST 쿼리문 출력)

	pg			= SQLInjectionFilter(Nvl(Request("pg"),"1"))
	keyfield	= SQLInjectionFilter(Nvl(Request("keyfield"),"1"))
	keyword		= SQLInjectionFilter(Nvl(Request("keyword"),""))
	code		= SQLInjectionFilter(Nvl(Request("code"),"C1001"))
	param		= "&keyfield=" & keyfield & "&keyword=" & Server.URLEncode(keyword)
	FileURL		= "/upload/partnership/"
	today		= Date()

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")	

	' 페이징 처리 부분 
	pgSize		= 1
	UniqueField = "SEQ"				' 시퀀스필드
	TableName	= "TBL_PARTNERSHIP"	' 테이블명
	SelectField = "SEQ,CODE,TITLE,STATUS,FILES,ALT,SUMMARY,DISCOUNT,WEBSITE,CONTENTS1,CONTENTS2,CONTENTS3,CONTENTS4,CONTENTS5,WRITER,REGDATE"

	'검색
	WhereClause = "STATUS = 'Y' AND CODE = '" & code & "'"

	OrderBy = "REGDATE DESC"		' 정렬방식

	Call OpenDbConnection()			' 데이터베이스 열기
	Call ProcRecordSQL()			' 페이징 처리 서브 호출

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
    <title>한국민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
	<script>
	$(document).ready(function(){
		var default_code = '<%=code%>';
		$('.single-items').slick({
			slidesToShow: 3,
			initialSlide: 1
		});

		getCardSelected(default_code);
	});

	function changeCard(val){
		//alert(val.value);
		getCardSelected(val.value);
	}

	function getCardSelected(code){
		//alert(code);
		var send_data = {
			code:		code
		};

		$.ajax({
			type:	"POST",
			url:	"srv_card_title.asp",
			data:	send_data,
			success: function(result_data){

				var flag	= $(result_data).find("item").find("flag").first().text();

				if (flag == "error") {
					alert("Error");
					return false;
				}else if (flag == "nodata") {
					return false;
				}else if (flag == "success") {
					
					$("#card_na").empty();
					card_cnt = 1;
					//$('#box > tbody:last > tr:last').remove();
					$("#card_na").append("<option value='' selected>카드선택</option>");
					$(result_data).find("item").each(function() {

						var media_add;
						var seq			= $(this).find("seq").text();
						var title		= $.trim($(this).find("title").text());

						media_add = "<option value='" + seq + "'>"+ title +"</option>";

						$("#card_na").append(media_add);
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

	function getCardView(card_seq){
		//alert(card_seq.value);
		var send_data = {
			card_seq:	card_seq.value
		};

		$.ajax({
			type:	"POST",
			url:	"srv_card_content.asp",
			data:	send_data,
			success: function(result_data){

				var flag	= $(result_data).find("item").find("flag").first().text();

				if (flag == "error") {
					alert("Error");
					return false;
				}else if (flag == "nodata") {
					return false;
				}else if (flag == "success") {
					
					$("#box").empty();

					var item_add;
					var seq			= $(result_data).find("item").find("seq").text();
					var code		= $(result_data).find("item").find("code").text();
					var title		= $(result_data).find("item").find("title").text();
					var status		= $(result_data).find("item").find("status").text();
					var files		= $(result_data).find("item").find("files").text();
					var alt			= $(result_data).find("item").find("alt").text();
					var summary		= $(result_data).find("item").find("summary").text();
					var discount	= $(result_data).find("item").find("discount").text();
					var website		= $(result_data).find("item").find("website").text();
					var contents1	= $(result_data).find("item").find("contents1").text();
					var contents2	= $(result_data).find("item").find("contents2").text();
					var contents3	= $(result_data).find("item").find("contents3").text();
					var contents4	= $(result_data).find("item").find("contents4").text();
					var contents5	= $(result_data).find("item").find("contents5").text();

					item_add = "<h4>" + title + "</h4>";
					item_add += "<img src='<%=FileURL%>" + files + "' alt='" + alt + "' />";
					item_add += "<table>";
					item_add += "    <caption>제휴카드 할인혜택에 대한 설명</caption>";
					item_add += "    <colgroup>";
					item_add += "        <col style='width:25%'>";
					item_add += "        <col style='width:62.5%'>";
					item_add += "    </colgroup>";
					item_add += "    <tbody>";
					item_add += "        <tr>";
					item_add += "            <th>할인혜택</th>";
					item_add += "            <td>" + contents1 + "</td>";
					item_add += "        </tr>";
					item_add += "        <tr>";
					item_add += "            <th>할인 대상 실적</th>";
					item_add += "            <td>" + contents2 + "</td>";
					item_add += "        </tr>";
					item_add += "        <tr>";
					item_add += "            <th>할인 혜택 제한</th>";
					item_add += "            <td>" + contents3 + "</td>";
					item_add += "        </tr>";
					item_add += "        <tr>";
					item_add += "            <th>할인 방식</th>";
					item_add += "            <td>" + contents4 + "</td>";
					item_add += "        </tr>";
					item_add += "        <tr>";
					item_add += "            <th>기타사항</th>";
					item_add += "            <td>" + contents5 + "</td>";
					item_add += "        </tr>";
					item_add += "    </tbody>";
					item_add += "</table>";

					$("#box").append(item_add);
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
                <h3>제휴카드할인</h3>
                <div class="text-box">
                    <span class="text">제휴카드 할인혜택 <br>꼼꼼하게 찾아보고 즐기기</span>
                </div>
            </div>
            <div class="detail-content credit_card">
                <span class="card_company">
                    <label for="card_com" class="hidden">카드사</label>
					<select name="code" id="code" title="구분 선택" class="card_com" onchange="changeCard(this);">
						<option value="C1001">BC카드</option>
						<option value="C1002">NH채움카드</option>
						<option value="C1003">현대카드</option>
						<option value="C1004">씨티카드</option>
					</select>
                </span>
                <span class="card_name">
                    <label for="card_na" class="hidden">카드이름</label>
                    <select id="card_na" name="card_na" class="card_na" onchange="getCardView(this)">
                        <option selected>카드선택</option>
                    </select>
                </span>

				<div id="box">
<%
If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then
	k = 1
	For i = Lbound(rValue,2) To UBound(rValue,2)

		seq				= rValue(0,i)
		code			= rValue(1,i)
		title			= rValue(2,i)
		status			= rValue(3,i)
		files			= rValue(4,i)
		alt				= rValue(5,i)							
		summary			= rValue(6,i)
		discount		= rValue(7,i)
		website			= rValue(8,i)
		contents1		= rValue(9,i)
		contents1		= Replace(contents1,vblf,"<br />") '에디터 사용하지 않을때 변환
		contents2		= rValue(10,i)
		contents2		= Replace(contents2,vblf,"<br />") '에디터 사용하지 않을때 변환
		contents3		= rValue(11,i)
		contents3		= Replace(contents3,vblf,"<br />") '에디터 사용하지 않을때 변환
		contents4		= rValue(12,i)
		contents4		= Replace(contents4,vblf,"<br />") '에디터 사용하지 않을때 변환
		contents5		= rValue(13,i)
		contents5		= Replace(contents5,vblf,"<br />") '에디터 사용하지 않을때 변환
%>

                <h4><%=title%></h4>
                <img src="<%=FileURL%><%=files%>" alt="<%=alt%>" />
                <table>
                    <caption>제휴카드 할인혜택에 대한 설명</caption>
                    <colgroup>
                        <col style="width:25%">
                        <col style="width:62.5%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>할인혜택</th>
                            <td style="letter-spacing: -0.02em;"><%=contents1%></td>
                        </tr>
                        <tr>
                            <th>할인대상실적</th>
                            <td><%=contents2%></td>
                        </tr>
                        <tr>
                            <th>할인혜택제한</th>
                            <td><%=contents3%></td>
                        </tr>
                        <tr>
                            <th>할인 방식</th>
                            <td><%=contents4%></td>
                        </tr>
                        <tr>
                            <th>기타사항</th>
                            <td><%=contents5%></td>
                        </tr>
                    </tbody>
                </table>
				
<%
		k = k + 1
		Next
	End If
	Call RsClose()
	Call CloseDbConnection()
%>
				</div>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>