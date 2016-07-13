<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " location.href='/member/login.asp?RtnURL=http://www.koreanfolk.co.kr/mypage/coupon_list.asp';"
		Response.write "</script>"
		Response.End
	End If

	Dim filename : filename = "coupon_list.asp"

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
	FileURL		= "/upload/coupon/"
	today = Date()

	If IsNumeric(pg) = False Then f_AlertBack("정상적 접근이 아닙니다.")	

	' 페이징 처리 부분 
	pgSize		= 5
	UniqueField	= "A.SEQ" ' 시퀀스필드
	TableName	= "TBL_COUPON_HISTORY AS A INNER JOIN TBL_COUPON B ON A.CSEQ = B.SEQ" ' 테이블명
	SelectField = "B.SEQ,A.UID,B.TITLE,B.SDATE,B.EDATE,B.FILES1,B.FILES2,B.ALT1,B.ALT2,B.CONTENTS1,B.CONTENTS2,A.REGDATE"

	'검색
	'WhereClause = "1=1"	
	WhereClause = "A.UID = '"& session("id") &"' AND A.STATUS = 'Y'"

	If keyword <> "" then
		If keyfield <> "" Then
			WhereClause = WhereClause & " AND " & keyfield & " LIKE '%" & keyword & "%'" ' 검색조건
		End If
	End If

	'OrderBy = "ANSWER_YN ASC, REGDATE DESC" ' 정렬방식
	OrderBy = " A.REGDATE DESC" ' 정렬방식

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
	<script type="text/javascript">
	<!--
	function Del(seq,pg,uid) {
		if (uid != '<%=session("id")%>') {
			alert("본인의 쿠폰만 삭제할 수 있습니다.");
			return;
		}

		var bool = confirm("선택하신 내용을 정말로 삭제하시겠습니까?\n\n확인 하시고 삭제 하시기 바랍니다.");
		if (bool){
			location.href = "coupon_del_proc.asp?seq=" + seq + "&pg=" + pg + "&uid=" + uid;
		}
	}

	function View(seq, pg) {
		location.href = "/mobile/mypage/coupon_view.asp?seq=" + seq + "&pg=" + pg;
	}

	function dimLayerView(obj, view){

		if(obj == "this"){
			$(view).parents(".popupSec").addClass("popupSecOff");
			if($(".popupSec").size() == $(".popupSecOff").size()){
				$("#dimLayer").hide();
			}
			$("#dimLayer").hide();
		} else {
			if(view == "show"){
				$(".popupSec").hide();
				if($(obj).hasClass("popupSecOff")){
					$(obj).removeClass("popupSecOff");
				}
				var top = (($(window).height() - $(obj).height()) / 2 < 0)?0:($(window).height() - $(obj).height()) / 2;
				$(obj).css("top", top);
				$(obj).fadeIn();
				$("#dimLayer").height($(document).height());
				if(!$("#dimLayer").show())
				$("#dimLayer").show();
			} else if(view == "none") {
				if($(obj).hasClass("popupSecOff")){
					$(obj).removeClass("popupSecOff");
				}
				var top = (($(window).height() - $(obj).height()) / 2 < 0)?0:($(window).height() - $(obj).height()) / 2;
				$(obj).css("top", top);
				$(obj).fadeIn();
			} else {
				$(obj).fadeOut();
				$("#dimLayer").hide();
			}
		}
	}

	/* v1.4 */
	/* https://github.com/farinspace/jquery.imgpreload */
	if("undefined"!=typeof jQuery){(function(a){a.imgpreload=function(b,c){c=a.extend({},a.fn.imgpreload.defaults,c instanceof Function?{all:c}:c);if("string"==typeof b){b=new Array(b)}var d=new Array;a.each(b,function(e,f){var g=new Image;var h=f;var i=g;if("string"!=typeof f){h=a(f).attr("src");i=f}a(g).bind("load error",function(e){d.push(i);a.data(i,"loaded","error"==e.type?false:true);if(c.each instanceof Function){c.each.call(i)}if(d.length>=b.length&&c.all instanceof Function){c.all.call(d)}a(this).unbind("load error")});g.src=h})};a.fn.imgpreload=function(b){a.imgpreload(this,b);return this};a.fn.imgpreload.defaults={each:null,all:null}})(jQuery)}
	//-->
	</script>

	<script type="text/javascript">
		function showPrint(idx) {
			$(".couponSample").load("coupon_print.asp?seq=" + idx, function(){
				$('#couponLayer img').imgpreload(function(){
					$("#couponLayer").find(".dummyBackGround").width($("#couponLayer .wrapSec").outerWidth() - 16)
					$("#couponLayer").find(".dummyBackGround").height($("#couponLayer .wrapSec").outerHeight() + 10)
					dimLayerView('#couponLayer', 'show'); 
				});
				return false;
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
            <h2>마이페이지</h2>
        </div>

		<!--#include virtual="/mobile/mypage/inc/mypage_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-mypage">
            <div class="detail-head">
                <h3>My 쿠폰</h3>
                <span class="text">고객님께서 발급받으신 쿠폰을 확인하실 수 있습니다.</span>
            </div>
            <div class="content">
                <table>
                    <caption>My 쿠폰 리스트</caption>
                    <colgroup>
                        <col style="width:22.4%">
                        <col style="width:60.1%">
                        <col style="width:17.3% ">
                    </colgroup>
				<%
				If NOT(IsNull(rValue) Or IsEmpty(rValue)) Then
				
					For i = Lbound(rValue,2) To UBound(rValue,2)

						rownum = (TotalRecordCount - (pgSize * (pg-1))) -  i

						'B.SEQ,A.UID,B.TITLE,B.SDATE,B.EDATE,B.FILES1,B.FILES2,B.ALT1,B.ALT2,B.CONTENTS1,B.CONTENTS2,A.REGDATE

						seq				= rValue(0,i)
						uid				= rValue(1,i)
						title			= rValue(2,i)
						sdate			= rValue(3,i)
						edate			= rValue(4,i)
						files1			= rValue(5,i)
						files2			= rValue(6,i)
						alt1			= rValue(7,i)
						alt2			= rValue(8,i)
						contents1		= rValue(9,i)
						contents1		= Replace(contents1,vblf,"<br />") '에디터 사용하지 않을때 변환
						contents2		= rValue(10,i)
						regdate			= rValue(11,i)
				%>
                    <tr>
                        <td colspan="2">
                            <div class="board-list-title"><img src="<%=FileURL%><%=files1%>" alt="<%=alt1%>" /></div>
                        </td>
                        <td>
                            <a href="javascript:View('<%=seq%>', '<%=pg%>')" class="icon icon_more">자세히보기</a>
                        </td>
                    </tr>
				<%
					Next
				Else
				%>
                    <tr>
                        <td colspan="3">발급된 쿠폰이 없습니다.</td>
                    </tr>
				<%
					End If
					Call RsClose()
					Call CloseDbConnection()
				%>
                </table>
                <a href="#none" class="more_btn">
                    <span class="text_icon_box">
                        <span class="text">더보기</span>
                        <span class="icon_img"><img src="/mobile/images/common/plus_icon.png" alt="" /></span>
                    </span>
                </a>
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
                initialSlide: 2
            });
        });
    </script>

</body>
</html>