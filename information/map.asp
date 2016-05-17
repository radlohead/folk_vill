<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no, email=no" />
    <title>한국 민속촌 모바일 사이트</title>
    <!--#include virtual="/mobile/common/inc/css.html" -->
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

<!--#include virtual="/mobile/information/inc/infor_topmenu.html" -->
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>가이드맵</h3>
                <div class="text-box">
                    <span class="text">조선시대로 떠나는 시간여행</span>
                </div>
            </div>
            <div class="detail-content">
                <div class="content-head">
                    <a href="#none" class="pdf-down"><img src="/mobile/images/common/pdf-down.gif" alt="민속촌 지도 pdf파일 다운받기 버튼" /></a>
                    <div class="map"><img src="/mobile/images/information/map.png" alt="한국민속촌 가이드맵" /></div>
                </div>
                <!-- 2단탭배너 -->
                <div class="main-tab map">
                    <ul class="tabMenu">
                        <li class="menu1 on" rel="tabMenu1">
                            <h3><a href="#tab1"><img src="/mobile/images/common/tabMenu_blank_bg2.png" alt="상가마을" /></a></h3>
                        </li>
                        <li class="menu2" rel="tabMenu2">
                            <h3><a href="#tab2"><img src="/mobile/images/common/tabMenu_blank_bg2.png" alt="민속마을" /></a></h3>
                        </li>
                        <li class="menu3" rel="tabMenu3">
                            <h3><a href="#tab2"><img src="/mobile/images/common/tabMenu_blank_bg2.png" alt="놀이마을" /></a></h3>
                        </li>
                        <li class="menu4" rel="tabMenu4">
                            <h3><a href="#tab2"><img src="/mobile/images/common/tabMenu_blank_bg2.png" alt="장터" /></a></h3>
                        </li>
                    </ul>
                    <!-- #tab1 -->
                    <div class="tab-content tabMenu1">
                        <article>
                            <p class="caption">
                                상가마을에서는 고향처럼 편안하고 여유로운 풍경속에서 토속음식의 특별함을 맛볼 수 있습니다.
                                또한, 농촌특산품매장, 기념품 매장 등에는 한국민속촌만의 특색 있는 기념품이 가득합니다.
                            </p>
                            <img src="/mobile/images/information/map/shop_vill_map.png" alt="상가마을 지도" />
                            <section>
                                <img src="/mobile/images/information/map/shop_vill_img01.jpg" alt="한국관" />
                                <h4>한국관</h4>
                                <p>팔자로 뻗은 기와 지붕이 멋스러운 한국관은 정성이 듬뿍 담긴 고급스러운 한정식을 맛볼 수 있는 곳입니다.</p>
                            </section>
                            <section>
                                <img src="/mobile/images/information/map/shop_vill_img02.jpg" alt="길목집" />
                                <h4>길목집</h4>
                                <p>450명을 수용할 수 있는 넓은 홀과 함께 경산 쇠고기 국밥, 목포 낙지 비빔밥, 안동 산채 비빔밥, 동래 해물파전 등 다양한 식사류와 안주류를 즐길 수 있습니다.</p>
                            </section>
                            <section>
                                <img src="/mobile/images/information/map/shop_vill_img03.jpg" alt="전통찻집" />
                                <h4>전통찻집</h4>
                                <p>전통찻집은 팔작 기와 지붕에 아늑함이 돋보이는 명소로 은은한 차 한잔의 여유를 느낄 수 있는 곳입니다.</p>
                            </section>
                            <section>
                                <img src="/mobile/images/information/map/shop_vill_img04.jpg" alt="의무실" />
                                <h4>의무실</h4>
                                <p>응급상황 시 간단한 치료가 가능합니다. 또한,  유모차, 휠체어, 오디오 가이드를 대여해 드리고 있습니다.</p>
                            </section>
                        </article>
                    </div>
                    <!-- #tab2 -->
                    <div class="tab-content tabMenu2">
                        <article>
                            <p class="caption">
                                한국민속촌은 각 지방에 남아있는 조선시대 가옥들을 옮겨와 조성
                                한 마을입니다. 지리적 환경부터 마을의 기능까지 고려하여 옹기종
                                기 모여 앉은 마을의 이야기를 들어보세요.
                            </p>
                            <img src="/mobile/images/information/map/folk_vill_map.png" alt="민속마을 지도" />
                            <section>
                                <img src="/mobile/images/information/map/folk_vill_img01.jpg" alt="관아" />
                                <h4>관아</h4>
                                <p>지방행정을 담당하던 관원들이 모여 공무를 보던 관공서로 용인지방의 옛 행정구역이던 용구현의 관아를 복원했습니다.</p>
                            </section>
                            <section>
                                <img src="/mobile/images/information/map/folk_vill_img02.jpg" alt="양반가" />
                                <h4>양반가</h4>
                                <p>양반가는 경기도 수원 화성 내에 있었던 1867년 세워진 아흔 아홉칸 양반 가를 이건한 가옥이며, 전통혼례 공연이 진행되는 장소이기도 합니다.</p>
                            </section>
                            <section>
                                <img src="/mobile/images/information/map/folk_vill_img03.jpg" alt="정기공연장" />
                                <h4>정기공연장</h4>
                                <p>한국민속촌에서는 시원한 야외공연장에서 매일 농악놀이, 마상무예, 국악비 보이 공연이 펼쳐집니다.</p>
                            </section>
                            <section>
                                <img src="/mobile/images/information/map/folk_vill_img04.jpg" alt="전통민속관" />
                                <h4>전통민속관</h4>
                                <p>조선시대 후기 경기도 용인에서 농사를 지으며 살았던 4대 가족의 연중생활을 엿볼 수 있습니다. 사계절, 24절기를 중심으로 태어나서 죽을 때까지의 일생의례를 생동감있게 연출했습니다.</p>
                            </section>
                        </article>
                    </div>
                    <!-- #tab3 -->
                    <div class="tab-content tabMenu3">
                        <article>
                            <p class="caption">
                                15종의 어트랙션이 기다리는 아이들의 꿈동산!
                                신나는 어트랙션과 다양한 먹거리, 살거리로 즐거움이 넘치는 놀이마을에
                                여러분을 초대합니다.
                            </p>
                            <img src="/mobile/images/information/map/play_vill_map.png" alt="놀이마을 지도" />
                            <section>
                                <img src="/mobile/images/information/map/play_vill_img01.jpg" alt="귀신전" />
                                <h4>귀신전</h4>
                                <p>한국의 설화와 전설 속 귀신을 총망라한 신개념 귀신 체험 전시관. 최첨단 기술로 재현한 15종의 우리나라 토종 귀신을 만날 수 있습니다.</p>
                            </section>
                            <section>
                                <img src="/mobile/images/information/map/play_vill_img02.jpg" alt="전설의고향" />
                                <h4>전설의고향</h4>
                                <p>한국적인 공포를 느낄 수 있는 체험형 어트랙션. 총 11관문으로 이뤄진 저주 받은 마을을 지나는 공포열차를 타고 짜릿한 경험을 할 수 있습니다.</p>
                            </section>
                            <section>
                                <img src="/mobile/images/information/map/play_vill_img03.jpg" alt="테라스그린" />
                                <h4>테라스그린</h4>
                                <p>인도 전통 요리를 한국식으로 풀어 거부감 없이 즐길 수 있는 한국식 인도 요리 전문점입니다.
                                   한국민속촌의 고즈넉한 분위기와 여유가 깃든 테라스가 핵심포인트!</p>
                            </section>
                            <section>
                                <img src="/mobile/images/information/map/play_vill_img04.jpg" alt="전통민속관" />
                                <h4>전통민속관</h4>
                                <p>판타지 동화나라 속으로 여러분을 초대합니다. 장난감 천국 토이빌리지에서 아이들의 상상력과 창의력을 쑥쑥 키워줄 다양 한 장난감 친구들을 만나보세요.</p>
                            </section>
                        </article>
                    </div>
                    <!-- #tab4 -->
                    <div class="tab-content tabMenu4">
                        <article>
                            <p class="caption">
                                장터에서는 각 지방에서 전해 내려오는 토속음식 20여 가지와 냉면, 묵, 비빔밥, 손만둣국 등 입맛을 돋우는 계절음식을 맛볼 수 있습니다.
                                모든 음식은 화학조미료나 가공식품을 일체 배제하며, 천연조미료만 사용해 옛날 전통의 맛을 그대로 담아냅니다.
                            </p>
                            <img src="/mobile/images/information/map/market_place_map.png" alt="장터지도" />
                            <h4>주요메뉴</h4>
                            <ul class="market-menu">
                                <li>
                                    <img src="/mobile/images/information/map/market_place_img01.jpg" alt="불고기비빔밥 사진" />
                                    <p class="caption">
                                        <span>신선한 야채와 불고기의 만남</span>
                                        <em>불고기비빔밥</em>
                                    </p>
                                </li>
                                <li>
                                    <img src="/mobile/images/information/map/market_place_img02.jpg" alt="두부·전통순두부 사진" />
                                    <p class="caption">
                                        <span>매일 아침 우리 콩을 직접 갈아 만든</span>
                                        <em>두부·전통순두부</em>
                                    </p>
                                </li>
                                <li>
                                    <img src="/mobile/images/information/map/market_place_img03.jpg" alt="전통순대 사진" />
                                    <p class="caption">
                                        <span>민속촌에서만 맛볼 수 있는</span>
                                        <em>전통순대</em>
                                    </p>
                                </li>
                                <li>
                                    <img src="/mobile/images/information/map/market_place_img04.jpg" alt="꼬치구이 사진" />
                                    <p class="caption">
                                        <span>남녀노소 누구나 좋아하는</span>
                                        <em>꼬치구이</em>
                                    </p>
                                </li>
                                <li>
                                    <img src="/mobile/images/information/map/market_place_img05.jpg" alt="해물파전 사진" />
                                    <p class="caption">
                                        <span>각종 해산물이 듬뿍</span>
                                        <em>해물파전</em>
                                    </p>
                                </li>
                                <li>
                                    <img src="/mobile/images/information/map/market_place_img06.jpg" alt="생막걸리·동동주 사진" />
                                    <p class="caption">
                                        <span>40년 양조 노하우가 담긴</span>
                                        <em>생막걸리·동동주</em>
                                    </p>
                                </li>
                            </ul>
                        </article>
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
                initialSlide: 5
            });
        });
    </script>

</body>
</html>