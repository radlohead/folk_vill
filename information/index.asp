
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
<!--#include virtual="/mobile/common/inc/css.asp" -->
<!--#include virtual="/mobile/common/inc/script.asp" -->

    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4
            });

            $(".multiple-items a").on("click", function(){
                $(".multiple-items a").removeClass("slick-click");
                $(this).addClass("slick-click");
            });

            //ajax로 페이지 이동 새로고침없앨때
            function menuClick(url){
                if(url == '/'){
                    location.reload(true);
                    return;
                }

                $.ajax({
                    type: 'POST',
                    url: url,
                    async:false,
                    data: "",
                    contentType:"application/x-www-form-urlencoded; charset=UTF-8",
                    success: function(data) {
                        $('.contents').html(data);
                        //if(isMenuHide) menuOff();
                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });
            };

            var search = location.search;
            switch(search){
                case "?01" :
                menuClick('/mobile/information/page/guidePage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu1").addClass("slick-click");
                break;

                case "?02" :
                menuClick('/mobile/information/page/membershipPage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu2").addClass("slick-click");
                break;

                case "?03" :
                menuClick('/mobile/information/page/trafficPage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu3").addClass("slick-click");
                break;

                case "?04" :
                menuClick('/mobile/information/page/conveniencePage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu4").addClass("slick-click");
                break;

                case "?06" :
                menuClick('/mobile/information/page/mapPage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu6").addClass("slick-click");
                break;
            }

            $(".menu1").click(function(){
                menuClick('/mobile/information/page/guidePage.asp');
            });
            $(".menu2").click(function(){
                menuClick('/mobile/information/page/membershipPage.asp');
            });
            $(".menu3").click(function(){
                menuClick('/mobile/information/page/trafficPage.asp');
            });
            $(".menu4").click(function(){
                menuClick('/mobile/information/page/conveniencePage.asp');
            });
            $(".menu5").click(function(){
                menuClick('/mobile/information/page/notice_listPage.asp');
            });
            $(".menu6").click(function(){
                menuClick('/mobile/information/page/mapPage.asp');
            });


        });
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
            <h2>이용안내</h2>
        </div>
<!--#include virtual="/mobile/information/inc/infor_topmenu.asp" -->
    </div>

    <div class="contents">
        <!--화면전화부분-->
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>