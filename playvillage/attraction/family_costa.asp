<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.asp" -->
    <!--#include virtual="/mobile/common/inc/script.asp" -->
        <script>
            $(document).ready(function(){
                $('.single-items').slick({
                    slidesToShow: 4,
                    initialSlide: 0
                });
    			var mySwiper_a = new Swiper('.attr-slide', {
    				pagination:'.attr-slide .swiper-pagination',
    				paginationClickable: true,
    				nextButton: '.attr-slide .swiper-button-next',
    				prevButton: '.attr-slide .swiper-button-prev',
    				autoplay: 2500,
    				loop:false
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
            <h2>놀이마을</h2>
        </div>
<!--#include virtual="/mobile/playvillage/inc/play_topmenu.asp" -->
    </div>
    <div class="contents">
        <div class="detail-attraction">
            <h3>패밀리코스타</h3>
<!-- 슬라이드 -->
            <div class="attr-slide swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="/mobile/images/play_village/family_costa/family_costa_slide01.jpg" alt="" /></div>
                    <div class="swiper-slide"><img src="/mobile/images/play_village/family_costa/family_costa_slide02.jpg" alt="" /></div>
                    <div class="swiper-slide"><img src="/mobile/images/play_village/family_costa/family_costa_slide03.jpg" alt="" /></div>
                </div>
                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>
                <!-- Add Arrows -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
            <span class="explain_text">숲 사이로 급선회하는 롤러코스터!<br/>
                                       자연 속을 내달리는 쾌적한 속도감과 시원함을 느낄 수 있습니다
            </span>
            <dl class="infor">
                <dt>이용요금</dt>
                <dd>
                    <table>
                        <caption>이용요금에 대한 안내</caption>
                        <colgroup>
                            <col width="21.1%">
                            <col width="41.4%">
                        </colgroup>
                        <thead>
                            <th>대상</th>
                            <th>요금</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>성인</td>
                                <td>3,000원</td>
                            </tr>
                            <tr>
                                <td>청소년</td>
                                <td>2,500원</td>
                            </tr>
                            <tr>
                                <td>아동</td>
                                <td>2,000원</td>
                            </tr>
                        </tbody>
                    </table>
                </dd>
                <dt>제한사항</dt>
                <dd>
                    <span class="icon"><img src="/mobile/images/play_village/picto.png" alt="개금지, 음주금지, 임산부주의, 노약자주의 심장질환주의, 허리디스크주의, 음식물금지, 촬영금지, 휠체어출입제한"/></span>
                    <div class="text-box02">
                        <span class="text">신장 110cm 이상</span>
                    </div>
                </dd>
            </dl>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->
</div>

</body>
</html>