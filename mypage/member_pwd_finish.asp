<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국민속촌 모바일 사이트</title>
<!--#include virtual="/mobile/common/inc/css.asp" -->
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
                <h3>비밀번호 변경완료</h3>
            </div>
            <div class="content member">
                <div class="member_modify">
                    <h4>새로운 비밀번호로 변경이 완료되었습니다.</h4>
                    <p>
                        보다 안전한 개인정보 보호를 위해<br/>
                        비밀번호를 정기적으로 변경해 주세요.
                    </p>
                </div>
                <span class="cert_btn_box">
                    <a href="http://www.koreanfolk.co.kr/mobile/" class="btn ok_btn">메인으로</a>
                    <a href="/mobile/mypage/member_pwd_edit.asp" class="btn cancel_btn">다시입력</a>
                </span>
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
                initialSlide: 4
            });
        });
    </script>

</body>
</html>