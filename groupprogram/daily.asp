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
            <h2>이용안내</h2>
            <aside>
                <h2>이용안내
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->
            </aside>
        </div>
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>교통정보</h3>
                <div class="text-box">
                    <span class="text">서울에서 30분이면<br/> 조선시대 마을이 눈 앞에!</span>
                </div>
            </div>
            <div class="detail-content">
                <!-- 2단탭배너 -->
                <div class="main-tab daily">
                    <ul class="tabMenu">
                        <li class="menu1 on" rel="tabMenu1">
                        <!--일일체험학습-->
                            <h3><a href="#tab1"></a></h3>
                        </li>
                        <li class="menu2" rel="tabMenu2">
                        <!--기업&amp;외국인단체-->
                            <h3><a href="#tab2"></a></h3>
                        </li>
                    </ul>
                    <!-- #tab1 대중교통-->
                    <div class="tab-content tabMenu1">

                    </div>
                    <!-- #tab2 자가용-->
                    <div class="tab-content tabMenu2">

                    </div>
                </div>

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