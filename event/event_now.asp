<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>한국 민속촌 모바일 사이트</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <link rel="stylesheet" type="text/css" href="../common/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../common/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="../common/css/index.css" />
    <link rel="stylesheet" type="text/css" href="../common/css/media_q.css" />
    <script src="../common/js/jquery-1.9.1.min.js"></script>
    <script src="../common/js/slick.min.js"></script>
    <script src="../common/js/common.js"></script>
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
<!--#include virtual="/mobile/common/inc/gnb.html" -->

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
            <a href="#none">농악놀이</a>
            <a href="#none">줄타기</a>
            <a href="#none">마상무예</a>
            <a href="#none">전통혼례</a>
            <a href="#none">전통혼례</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-show">
            <div class="detail-head">
                <h3>농악놀이</h3>
                <div class="text-box">
                    <span class="text">민족의 얼과 흥을 느낄 수 있는 <br/> 한국민속촌 대표 공연</span>
                    <span class="show-time">1회공연 <span class="time">10:30</span>  <span class="line"></span>  2회공연 <span class="time">14:00</span></span>
                </div>
            </div>
            <div class="detail-content">
                <img src="../images/nongak_img.jpg" alt="한국농악의 중심 명인 정인삼 선생" />
            </div>
        </div>
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