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
                <h3>비밀번호 변경</h3>
            </div>
            <div class="content member">
                <form action="" method="post" class="member_info_form">
                    <label for="now_pw">현재 비밀번호</label>
                    <input type="text" id="now_pw" class="now_pw" name="now_pw" placeholder="현재 사용중인 비밀번호를 입력해주십시오" />

                    <label for="new_pw">새로운 비밀번호</label>
                    <input type="text" id="new_pw" class="new_pw" name="new_pw" placeholder="6~14자의 영문,영문+숫자만 사용합니다" />

                    <label for="pw_chk">비밀번호 재확인</label>
                    <input type="text" id="pw_chk" class="pw_chk" name="pw_chk" placeholder="비밀번호를 한번 더 입력해주십시오" />

                    <ul class="caution">
                        <li>
                            <span class="icon">*</span>
                            <span>6~14자의 영문,영문+숫자만 사용하실 수 있습니다.</span>
                        </li>
                        <li>
                            <span class="icon">*</span>
                            <span>생년월일, 전화번호 등 개인정보와 관련된 숫자, 연속된
                                      숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수
                                      있으니 사용을 자제해 주세요.
                            </span>
                        </li>
                    </ul>

                    <span class="cert_btn_box">
                        <a href="#none" class="btn ok_btn">확인</a>
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
                initialSlide: 4
            });
        });
    </script>

</body>
</html>