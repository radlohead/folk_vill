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
                case "?02" :
                menuClick('/mobile/event/page/nongakPage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu2").addClass("slick-click");
                break;

                case "?03" :
                menuClick('/mobile/event/page/bboyPage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu3").addClass("slick-click");
                break;

                case "?04" :
                menuClick('/mobile/event/page/horsePage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu4").addClass("slick-click");
                break;

                case "?05" :
                menuClick('/mobile/event/page/weddingPage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu6").addClass("slick-click");
                break;

                case "?06" :
                menuClick('/mobile/event/page/chosunPage.asp');
                $(".multiple-items a").removeClass("slick-click");
                $(".multiple-items .menu6").addClass("slick-click");
                break;
            }

            $(".menu2").click(function(){
                menuClick('/mobile/event/page/nongakPage.asp');
            });
            $(".menu3").click(function(){
                menuClick('/mobile/event/page/bboyPage.asp');
            });
            $(".menu4").click(function(){
                menuClick('/mobile/event/page/horsePage.asp');
            });
            $(".menu5").click(function(){
                menuClick('/mobile/event/page/weddingPage.asp');
            });
            $(".menu6").click(function(){
                menuClick('/mobile/event/page/chosunPage.asp');
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
            <h2>행사·공연</h2>
        </div>
<!--#include virtual="/mobile/event/inc/event_topmenu.asp" -->
    </div>

    <div class="contents">
        <!--화면전화부분-->
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>