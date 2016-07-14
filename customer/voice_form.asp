<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " location.href='/mobile/member/login.asp?RtnURL=/mobile/customer/voice_form.asp';"
		Response.write "</script>"
		Response.End
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
                $('.single-items').slick({
                    slidesToShow: 3,
                    initialSlide: 2
                });
            });
        </script>
	<!--<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>-->
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script language="javascript">
	<!--
	function FormInquiryCheck() {	
		var form = document.frm;
		//var v_normal = /[^가-힝]/g; //본래는 '히+ㅎ'까지 체크해야 하나 euc-kr은 '힝'까지만 가능
		var v_normal = /[^가-힣]/g;

		if($.trim($("[name=code]").val())==""){
			alert("유형을 선택해 주세요.");
			$("#code").focus(); 
			return;
		}
		
		if($.trim($("[name=title]").val())==""){
			alert("제목을 입력해 주세요.");
			$("#title").focus(); 
			return;
		}

		if($.trim($("[name=content]").val())==""){
			alert("내용을 입력해 주세요.");
			$("#content").focus(); 
			return;
		}
									
		form.target="blank_frame";
		//form.encoding = "multipart/form-data";
		form.action="voice_form_proc.asp";
		form.submit();
	}
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
            <h2>고객의 말씀</h2>
        </div>

        <div class="slider single-items">
            <a href="/mobile/customer/faq.asp">자주묻는 질문</a>
            <a href="/mobile/customer/qna_form.asp">1:1 상담문의</a>
            <a href="/mobile/customer/voice_form.asp">칭찬/신고/제안</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-customer">
            <div class="detail-head">
                <h3>칭찬/신고/제안</h3>
                <span class="text">
                   칭찬/신고/제안사항에 대한 고객님의 소중한 의견을 받습니다.
                   게시글은 비공개 형식으로 작성되며, 담당자의 답변은
                   평균 2일 ~ 3일 소요됩니다.
                </span>
            </div>
            <div class="content customer">
				<form method="post" name="frm" id="frm" class="write-page">
                <form >
                    <div class="title_box">
                        <label for="title">유형</label>
                        <div class="select_box voice-category">
                            <select name="code" id="code">
								<option value="">선택</option>
								<%
								Call OpenDbConnection() '데이터베이스 열기

								gubun = "VOI"
								'Response.write "VOI"
								Call GetCodeName()
								'Response.write TotalRecordCount
								If Rs.Eof  Then
									Response.write "<option value=''>------</option>"
								Else 
									Do Until Rs.Eof 
										Response.write "<option value='"&Trim(Rs("CODE_TYPE"))&"'>"&Rs("CODE_NAME")&"</option>"
									Rs.moveNext
									Loop
								End If

								Call RsClose()
								Call CloseDbConnection()
								%>
							</select>
                        </div>
                    </div>
                    <div class="title_box">
                        <label for="title">제목</label>
                        <input type="text" name="title" id="title" class="title" />
                    </div>
                    <textarea name="content" id="content" placeholder="내용"></textarea>
                </form>
                <span class="cert_btn_box">
                    <a href="javascript:FormInquiryCheck();" class="btn join_child_btn ok_btn">등록하기</a>
                    <a href="/mobile/customer/faq.asp" class="btn cancel_btn">취소하기</a>
                </span>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" title="칭찬/신고/제안폼아이프레임"></iframe>