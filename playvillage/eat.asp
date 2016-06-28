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
            <h2>먹거리·살거리</h2>
            <aside>
                <h2>먹거리·살거리
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->
            </aside>
        </div>

        <div class="slider single-items">
            <a href="/mobile/playvillage/eat.asp">먹거리</a>
            <a href="/mobile/playvillage/buy.asp">살거리</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>먹거리</h3>
                <div class="text-box">
                    <span class="text">
                        정성이 가득 담긴 토속음식과<br/>
                        테라스에서 즐기는 글로벌푸드까지!
                    </span>
                </div>
            </div>
            <div class="detail-content attraction">
                <div class="pre-infor-tab">
                    <div class="title">
                        <h3>어트랙션 주의사항</h3>
                        <span class="icon"></span>
                    </div>
                    <div class="content">
                        <p>
                            <span class="icon"></span>
                            <span class="text">기상악화(폭우, 강풍, 기온저하 등), 안전점검, 고장 등에 따라 예고없이 어트랙션 운행이 추가 중단될 수 있습니다.</span>
                        </p>
                        <p>
                            <span class="icon"></span>
                            <span class="text">탑승 대기 고객이 많을 경우 조기에 입장이 마감될 수 있습니다.</span>
                        </p>
                        <p>
                            <span class="icon"></span>
                            <span class="text">어트랙션에 따라 연령 제한이 있을 수 있습니다.</span>
                        </p>
                    </div>
                </div>
                <section class="detail">
                    <a href="/mobile/playvillage/ghost.asp" class="img"><img src="/mobile/images/play_village/attraction_1.png" alt="귀신전 사진" /></a>
                    <h4>귀신전</h4>
                    <span class="text01">정상운영</span>
                    <div class="text-box01">
                        <span class="text">140cm 이상<br/>
                                       110~140cm 보호자 동반
                        </span>
                    </div>
                </section>
                <section class="detail end">
                    <a href="/mobile/playvillage/junseol_gohyang.asp" class="img"><img src="/mobile/images/play_village/attraction_2.png" alt="전설의 고향 사진" /></a>
                    <h4>전설의 고향</h4>
                    <span class="text01">정상운영</span>
                    <div class="text-box01">
                        <span class="text">140cm 이상<br/>
                                       110~140cm 보호자 동반
                        </span>
                    </div>
                </section>
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
                slidesToShow: 2,
                initialSlide: 0
            });
        });
    </script>
</body>
</html>