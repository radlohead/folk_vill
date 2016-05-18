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
            <h2>민속마을</h2>
            <aside>
                <h2>민속마을
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->
            </aside>
        </div>

        <div class="slider single-items">
            <a href="/mobile/folkvillage/folk_chosun.asp">조선시대마을</a>
            <a href="/mobile/folkvillage/display_traditional.asp">전시마당</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-folk">
            <div class="detail-head">
                <h3>조선시대로 떠나는 시간여행</h3>
                <span class="text">민속촌은 각 지방에 남아있는 조선시대 가옥들을 옮겨와 조성한 조선시대 마을입니다.
                                   지리적 환경부터 마을의 기능까지 고려하여 옹기종기 모여 앉은 마을의 이야기를 들어보세요.
                </span>
            </div>
            <div class="detail-content folk">
                <span class="photo-img"><img src="/mobile/images/folkvillage/folk/chosun_img01.jpg" alt="조선시대사진1" /></span>
                <span class="text01">
                    30여만 평의 넓은 부지, 배산임수 천혜의 풍수지리적 위치에 자리한 한국민속촌은 각 지방의 실물가옥을 이건해 조성한 조선시대의 촌락입니다.
                    오랜 시간 동안 각 지방의 남아있는 가옥을 조사하고 전문가의 깊은 고증을 거쳐 복원되었을 뿐 아니라, 꼼꼼하게 수집한 생활민속문화가 사계절의 변화에 따라 펼쳐지는 ‘진짜’ 조선시대 마을입니다.
                </span>
                <span class="photo-img"><img src="/mobile/images/folkvillage/folk/chosun_img02.jpg" alt="조선시대사진2" /></span>
                <span class="text01">
                    한국민속촌은 남부, 중부, 북부 및 도서 지방에 이르기까지 지방별로 서민가옥과 양반가옥을 이건 또는 복원해 마을을 조성하였습니다.
                    옛 지방 행정기관이었던 관아를 비롯해 교육기관인 서원과 서당, 의료기관이었던 한약방, 종교적인 건물인 사찰과 서낭당, 점술집에 이르기까지 조선시대의 삶을 경험할 수 있도록 옛 생활상 그대로 담겨있습니다.
                </span>
                <span class="photo-img"><img src="/mobile/images/folkvillage/folk/chosun_img03.jpg" alt="조선시대사진3" /></span>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.html" -->

</div>
<!--#include virtual="/mobile/common/inc/script.html" -->
    <script>
        $(document).ready(function(){
            $('.single-items').slick({
                infinite: true,
                slidesToShow: 2,
                slidesToScroll: 0
            });
        });
    </script>

</body>
</html>