<!--#include virtual="/common/lib/encoding.asp"-->
<!--#include virtual="/common/inc/common.inc"-->
<%
	Dim gubun : gubun = RP(Request("gubun"))

	If (gubun <> "G" And gubun <> "C" And gubun <> "F") Then		
		sRtnMsg = "비 정상 접속 시도 입니다. 다시 확인해 주세요."
		CAll f_AlertURL(sRtnMsg, "join.asp")
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
	<script type="text/javascript">
	$(function () {

        $(".agree_btn").on("click", function(){
            var terms_agree = $(".terms_agreeLa").css("background-position");
            var policy_agree = $(".policy_agreeLa").css("background-position");
            var no_chk  = "-36px 0px";

            if(terms_agree == no_chk){
                alert("이용약관 동의에 체크해주세요");
            }else if(policy_agree == no_chk){
                alert("개인정보보호정책에 체크해주세요");
            }else{
                location.href = "/mobile/member/join_auth_select.asp?gubun=<%=gubun%>";
            }
        });
		
		/*
		var checkAll = document.getElementById('check_all');
		var check01 = document.getElementById('form_agree_01');
		var check02 = document.getElementById('form_agree_02');
		var agree = document.getElementById('agree');
		$(checkAll).click(function () {
			if( checkAll.checked) {
				check01.checked = true;
				check02.checked = true;
				agree.focus();
			} else {
				check01.checked = false;
				check02.checked = false;
			}
		});

		$(check01).click(function () {
			if(check01.checked){ check02.focus(); }
		});
		$(check02).click(function () {
			if(check02.checked){ agree.focus(); }
		});
		*/
		/*
		function checkAll() {
			if(document.getElementById('check_all').checked) {
				document.getElementById('form_agree_01').checked = true;
				document.getElementById('form_agree_02').checked = true;
				document.getElementById('agree').focus();
			} else {
				document.getElementById('form_agree_01').checked = false;
				document.getElementById('form_agree_02').checked = false;
			}
		}
		*/
	});

	function ChkMemAuth(gb) {
		var frm = document.frm;

		if($(':checkbox[name=agree1]:checked').length == 0) {
			alert("이용약관과 개인정보 수집 및 이용에 대한 안내를 모두 동의해 주세요.");
			getFocus();
			return;
		} else if($(':checkbox[name=agree2]:checked').length == 0) {
			alert("이용약관과 개인정보 수집 및 이용에 대한 안내를 모두 동의해 주세요.");
			getFocus();
			return;
		}

		frm.action="join_auth_select.asp";
		frm.submit();
	}

	function getFocus() {
		ch1 = document.getElementById('form_agree_01');
		ch2 = document.getElementById('form_agree_02');

		if( !ch1.checked ) { ch1.focus(); return; }
		if( !ch2.checked ) { ch2.focus(); return; }
		document.getElementById('click').focus();
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
            <h2>회원가입</h2>
        </div>
    </div>

    <div class="contents">
        <div class="detail-login">
            <div class="detail-head">
                <h3>회원가입</h3>
            </div>
            <h4>약관동의</h4>
            <div class="tab agree-tab">
                <div class="title">
                    <h4>이용약관</h4>
                    <span class="icon on"></span>
                </div>
                <div class="content">
                    <!-- 이용약관 -->
                    <!--#include virtual="/mobile/member/inc/agreement.html" -->
                </div>
            </div>
            <div class="check_box_wrap">
                <input type="checkbox" id="terms_agree" class="terms_agree" name="terms_agree" value="terms_agree" />
                <label for="terms_agree" class="terms_agreeLa"></label>
                <span class="text">이용약관에 동의합니다</span>
            </div>

            <div class="tab agree-tab02">
                <div class="title">
                    <h4>개인정보보호정책</h4>
                    <span class="icon on"></span>
                </div>
                <div class="content">
                    <!-- 개인정보보호정책 -->
                    <!--#include virtual="/mobile/member/inc/ind_infor.html" -->
                </div>
            </div>
            <div class="check_box_wrap">
                <input type="checkbox" id="policy_agree" class="policy_agree" name="policy_agree" value="policy_agree" />
                <label for="policy_agree" class="policy_agreeLa"></label>
                <span class="text">개인정보보호정책에 동의합니다</span>
            </div>

            <div class="agree_box">
                <p class="text">한국민속촌 이용약관 및 개인보호정책에 동의하십니까?</p>
                <a href="#none" class="btn agree_btn">동의합니다</a>
                <a href="#none" class="btn no-agree_btn">동의하지 않습니다</a>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->

</body>
</html>