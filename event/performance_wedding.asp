<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
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
            <h2>행사·공연</h2>
        </div>

<!--#include virtual="/mobile/event/inc/event_topmenu.asp" -->
    </div>

    <div class="contents">
        <div class="detail-show">
            <div class="detail-head">
                <h3>전통혼례</h3>
                <div class="text-box">
                    <span class="text">정결하고 운치있는 백년가약<br/>
                                       (百年佳約)</span>
                </div>
            </div>
            <div class="detail-content wedding">
                <div class="wedding_wrap">
                    <div class="show-time">
                        <span class="text">
                          1회공연 <span class="time">12:00</span>  2회공연 <span class="time">16:00</span>
                        </span>
                        <span class="text02">
                          장소 <span class="time">양반가</span>
                        </span>
                    </div>
                    <a href="#none" class="map-btn wedding">지도보기</a>
                </div>
                <div class="cont_body">
                    <span class="text03">동절기(12월~2월) 휴연</span>
                    <p class="text">마을 최고의 재력가만 살 수 있던 99칸 양반가에서 치러지는 전통혼례식은 내외국인 모두에게 사랑받는 인기 공연입니다.</p>
                    <div class="img_box">
                        <img src="/mobile/images/event/wedding_img_01.jpg" alt="" />
                        <em>두 사람이 함께 부부의 예를 올리는 ‘혼례’(婚禮)</em>
                        <p class="text">혼례는 두 사람이 결합하여 부부가 되었음을 사회적으로 인정 하는 의례로, 인간이 태어나서 일생을 통해 거쳐야만 하는 통과 의례 중의 하나입니다.</p>
                    </div>
                    <div class="img_box">
                        <img src="/mobile/images/event/wedding_img_02.jpg" alt="" />
                        <em>간결하면서 정중한 전통혼례의식</em>
                        <p class="text">한국민속촌에서는 혼례의 절차 중 신랑이 처갓집에가서 치르 는 전안례(奠雁禮)와 대례(大禮), 신랑과 신부가 말과 가마를 타고 시댁으로 오는 행렬인 우귀례(于歸禮)를 재현합니다.</p>
                    </div>

                    <div class="pre-infor-tab pre-infor-tab2">
                        <div class="title">
                            <h3>한국민속촌 실제 전통혼례식 안내</h3>
                            <span class="icon"></span>
                        </div>
                        <div class="content">
                            <p>한국민속촌에서는 최근 우리 전통문화 속 혼례예식을 선호하는 경향이 늘어남에 따라 공연 뿐만 아니라 실제 혼례식을 대행하고 있습니다.</p>
                            <section class="text_wrap">
                                <h4>일시</h4>
                                <p>
                                    <span class="icon"></span>
                                    <span>3월 ~ 11월</span>
                                </p>
                                <p>
                                    <span class="icon"></span>
                                    <span>양반가(기본형) : 12시, 16시</span>
                                </p>
                                <p>
                                    <span class="icon"></span>
                                    <span>서원(고급형) : 11시, 15시</span>
                                </p>
                            </section>
                            <section class="text_wrap">
                                <h4>문의</h4>
                                <p>
                                    <span class="icon"></span>
                                    <span>판촉팀 양은정 주임</span>
                                </p>
                                <p>
                                    <span class="icon"></span>
                                    <span>전화 : 031-288-1705</span>
                                </p>
                                <p>
                                    <span class="icon"></span>
                                    <span>이메일 : chachaej@ikfv.co.kr</span>
                                </p>
                            </section>
                            <div class="text_wrap2">
                                <p class="text_box02">
                                    <span class="icon"></span>
                                    <span>피로연은 민속촌 내 한국관(양반가 기본형 혼례 시), 푸드빌리지(서원 고급형 혼례 시)로 지정</span>
                                </p>
                                <p class="text_box02">
                                    <span class="icon"></span>
                                    <span>주말이나 휴일 예약은 하객수가 100명 이상일 경우에만 예약 가능</span>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="preview-slide-wrap">
                    <h4>공연 미리보기</h4>
                    <div class="preview-slide slider single-item">
                        <div><img src="/mobile/images/event/wedding_slide01.jpg" alt="" /></div>
                        <div><img src="/mobile/images/event/wedding_slide01.jpg" alt="" /></div>
                        <div><img src="/mobile/images/event/wedding_slide01.jpg" alt="" /></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->
</div>
<article class="popup_wrap">
    <div class="dim-bg"></div>
    <div class="pop">
        <img src="" alt="" />
        <a href="#none" class="popup_close-btn">지도 닫기버튼</a>
    </div>
</article>
<!--#include virtual="/mobile/common/inc/script.asp" -->
    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                initialSlide: 4
            });
            $('.single-item').slick({
                dots: true
            });
        });
    </script>

</body>
</html>