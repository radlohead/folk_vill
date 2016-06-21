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
            <h2>회원가입</h2>
        </div>
    </div>

    <div class="contents">
        <div class="detail-login">
            <div class="detail-head">
                <h3>회원가입</h3>
            </div>
            <h4></h4>
            <div class="tab agree-tab">
                <div class="title">
                    <h5>이용약관</h5>
                    <span class="icon on"></span>
                </div>
                <div class="content" style="display: block;">
                    ddd
                </div>
            </div>
            <div class="check_box_wrap">
                <input type="checkbox" id="id_save" class="id_save" name="id_save" value="id_save" />
                <label for="id_save"></label>
                <span class="text">이용약관에 동의합니다</span>
            </div>

            <div class="tab agree-tab02">
                <div class="title">
                    <h5>개인정보보호정책</h5>
                    <span class="icon on"></span>
                </div>
                <div class="content" style="display: block;">
                    dd
                </div>
            </div>
            <div class="check_box_wrap">
                <input type="checkbox" id="id_save" class="id_save" name="id_save" value="id_save" />
                <label for="id_save"></label>
                <span class="text">개인정보보호정책에 동의합니다</span>
            </div>

            <div class="agree_box">
                <p class="text">한국민속촌 이용약관 및 개인보호정책에 동의하십니까?</p>
                <a href="#none" class="agree_btn">동의합니다</a>
                <a href="#none" class="no-agree_btn">동의하지 않습니다</a>
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
                initialSlide: 2
            });
        });
    </script>

</body>
</html>