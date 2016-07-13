<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<!--#include virtual="/common/lib/utilManager.asp"-->
<!--#include virtual="/common/inc/forceSSL.inc"-->
<%	
	If session("id") = "" Then
		Response.write "<script language='javascript'>"
		Response.write " alert('로그인후 이용해 주세요.');"
		Response.write " location.href='/mobile/member/login.asp?RtnURL=/mobile/mypage/member_leave.asp';"
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
	<script type="text/javascript" src="/common/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/common/js/common.js"></script>
	<script type="text/javascript" src="/common/js/Validate.js"></script>
	<script type="text/javascript">		
	function FormLeaveCheck() {	
		var form = document.frm;

		if($.trim($("[name=id]").val())==""){
			alert('아이디를 입력해 주세요.');
			$("#id").val("");
			$("#id").focus(); 
			return;
		}			
		
		if($.trim($("[name=password]").val())==""){
			alert('비밀번호를 입력해 주세요.');
			$("#password").val("");
			$("#password").focus(); 
			return;
		}
		
		/*
		if(!$(':input:radio[name=reason]:checked').val()) {
			alert("탈퇴 사유를 선택해 주세요.");
			//$(':input:radio[name=mailling]:first-child').focus();
			return;
		}

		if($(':input:radio[name=reason]:checked').val()=="R1007") {
			if($.trim($("[name=reason_text]").val())==""){
				alert('기타 탈퇴사유를 입력해 주세요.');
				$("#reason_text").val("");
				$("#reason_text").focus(); 
				return;
			}					
		}
		*/

		if(confirm("정말로 회원탈퇴를 하시겠습니까?")){				
			form.target="blank_frame";
			form.action="/mobile/mypage/member_leave_proc.asp";
			form.submit();
		}
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
                <h3>회원탈퇴</h3>
                <span class="text">
                    한국민속촌 서비스 이용에 불편함이 많으셨나요?<br/>
                    회원탈퇴 전에 아래 사항을 확인해 주시기 바랍니다.
                </span>
            </div>
            <div class="content member">
                <div class="member_modify">
                    <ol>
                        <li>
                            <span class="icon"><img src="/mobile/images/mypage/icon_1.png" alt="" /></span>
                            <span class="text">회원탈퇴를 신청하시면 해당 아이디는 즉시 탈퇴처리 됩니다.</span>
                        </li>
                        <li>
                            <span class="icon"><img src="/mobile/images/mypage/icon_2.png" alt="" /></span>
                            <span class="text">회원탈퇴 전 회원님이 작성하신 글(의견 , 온라인상담 등) 은 먼저 삭제를 하신 후 탈퇴를 신청하시기 바랍니다.</span>
                        </li>
                        <li>
                            <span class="icon"><img src="/mobile/images/mypage/icon_3.png" alt="" /></span>
                            <span class="text">회원탈퇴시 아이디/비밀번호를 정확히 입력하셔야 회원탈퇴를 하실 수 있습니다.</span>
                        </li>
                    </ol>
                </div>
				<form method="post" name="frm" id="frm" class="member_leave">
                    <h5>본인확인</h5>
                    <label for="id" class="hidden">아이디</label>
                    <input type="text" id="id" class="id" name="id" maxlength="14" Readonly value="<%=session("id")%>" />
                    <label for="pw" class="hidden">비밀번호</label>
                    <input type="password" id="password" class="pw" name="password" placeholder="비밀번호" maxlength="14" />
                    <span class="cert_btn_box">
                        <a href="javascript:FormLeaveCheck();" class="btn member_leave_btn ok_btn">확인</a>
                        <a href="http://www.koreanfolk.co.kr/mobile/" class="btn cancel_btn">취소</a>
                    </span>
                </form>
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
                initialSlide: 5
            });

            $(".member_leave_btn").on("click", function(){
                var mv_form = document.member_leave_form;

                if(mv_form.id.value == false){
                    alert("아이디를 입력해 주세요");
                }
                else if(mv_form.pw.value == false){
                    alert("현재 사용중인 비밀번호를 입력해 주세요");
                }else if(mv_form.pw.value.length < 6 || mv_form.pw.value.length > 14){
                    alert("비밀번호는 6~14자 이하로 입력해 주세요");
                }else if(confirm("정말로 회원탈퇴를 하시겠습니까?")){
                    if(true){
                        alert("회원탈퇴 처리가 되었습니다.");
                    }
                }
            });
        });
    </script>

</body>
</html>
<iframe name="blank_frame" src="about:blank" width="0" height="0" frameborder="0" marginheight="0" marginwidth="0" scrolling="no" hspace="0" vspace="0" title="회원탈퇴폼아이프레임"></iframe>