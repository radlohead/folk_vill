<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>한국 민속촌 모바일 사이트</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../css/swiper.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/slick.css" />
    <link rel="stylesheet" type="text/css" href="../css/index.css" />
    <link rel="stylesheet" type="text/css" href="../css/media_q.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/swiper.min.js"></script>
    <script src="../js/slick.min.js"></script>
    <script src="../js/common.js"></script>
    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 1
            });
            $('.single-item').slick({
                dots: true
            });
        });
    </script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/inc/gnb.html" -->

<div class="wrap">
    <!-- 상단헤더 -->
    <div class="header_wrap">
        <header>
            <h1 class="logo">
                <a href="/mobile/index.asp">
                    <img src="../images/logo.png" alt="" />
                </a>
            </h1>
            <a href="#" class="gnb_btn"></a>
        </header>
    </div>
    <div class="header_title_slide">
        <h2>행사·공연</h2>
        <div class="slider multiple-items">
            <a>농악놀이</a>
            <a>줄타기</a>
            <a>마상무예</a>
            <a>전통혼례</a>
            <a>전통혼례</a>
        </div>
    </div>

    <div class="contents">
        <div class="nongak"><img src="../images/nongak_bg.jpg" alt="" /></div>
        <div class="preview-slide-wrap">
            <div class="preview-slide slider single-item">
                <div><img src="../images/preview_slide01.jpg" alt="농악놀이" /></div>
                <div><img src="../images/preview_slide01.jpg" alt="농악놀이" /></div>
                <div><img src="../images/preview_slide01.jpg" alt="농악놀이" /></div>
            </div>
        </div>
    </div>

    <!-- 하단푸터 -->
    <div class="footer_wrap">
        <ul class="sns_link">
            <li class="facebook"><a href="#none">페이스북 링크</a></li>
            <li class="twitter"><a href="#none">트위터 링크</a></li>
            <li class="blog"><a href="#none">한국민속촌 블로그 링크</a></li>
            <li class="kakaostory"><a href="#none">카카오스토리 링크</a></li>
        </ul>
        <footer>
            <ul class="footer_link">
                <li class="pc"><a href="#none">PC버전</a></li>
                <li class="login"><a href="#none">로그인</a></li>
                <li class="group"><a href="#none">단체프로그램</a></li>
            </ul>
            <ul class="footer_link2">
                <li class="infor"><a href="#none">개인정보 취급방침</a> |</li>
                <li class="terms"><a href="#none">이용약관</a></li>
            </ul>
            <div class="address-wrap">
                <address>
                    <p>주소 : 경기도 용인시 기흥구 민속촌로 90</p>
                    <p>문의전화 : 031.288.0000</p>
                </address>
                <p>Copyright@KFV All Rights Reserved.</p>
            </div>
            <span class="foot-logo">한국민속촌 하단로고</span>
        </footer>
    </div>
</div>

</body>
</html>