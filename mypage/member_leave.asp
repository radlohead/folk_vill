<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
<!--#include virtual="/mobile/common/inc/css.html" -->
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.html" -->

<div class="wrap">
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.html" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>마이페이지</h2>
        </div>

<!--#include virtual="/mobile/mypage/inc/mypage_topmenu.html" -->
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
                <form name="member_leave_form" action="" method="post" class="member_leave">
                    <h5>본인확인</h5>
                    <label for="id" class="hidden">아이디</label>
                    <input type="text" id="id" class="id" name="id" placeholder="아이디" />
                    <label for="pw" class="hidden">비밀번호</label>
                    <input type="text" id="pw" class="pw" name="pw" placeholder="비밀번호" />
                    <span class="cert_btn_box">
                        <a href="#none" class="btn member_leave_btn ok_btn">확인</a>
                        <a href="#none" class="btn cancel_btn">취소</a>
                    </span>
                </form>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>
<!--#include virtual="/mobile/common/inc/script.html" -->
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