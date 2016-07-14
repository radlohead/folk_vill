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
                $('.single-items').slick({
                    slidesToShow: 2,
                    initialSlide: 1
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
            <h2>민속마을</h2>
        </div>

        <div class="slider single-items">
            <a href="/mobile/folkvillage/folk_chosun.asp">조선시대마을</a>
            <a href="/mobile/folkvillage/display_traditional.asp">전시마당</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-folk folk-tab">
            <ul class="tabMenu">
                <li class="menu1 on" rel="tabMenu1">
                    <h3><a href="#tab1"><img src="/mobile/images/common/tabMenu_blank_bg3.png" alt="전통민속관" /></a></h3>
                </li>
                <li class="menu2" rel="tabMenu2">
                    <h3><a href="#tab2"><img src="/mobile/images/common/tabMenu_blank_bg3.png" alt="세계민속관" /></a></h3>
                </li>
                <li class="menu3" rel="tabMenu3">
                    <h3><a href="#tab3"><img src="/mobile/images/common/tabMenu_blank_bg3.png" alt="탈춤전시관" /></a></h3>
                </li>
                <li class="menu4" rel="tabMenu4">
                    <h3><a href="#tab4"><img src="/mobile/images/common/tabMenu_blank_bg3.png" alt="옹기전시관" /></a></h3>
                </li>
            </ul>
<!--전통민속관 내용-->
            <div class="tab-content tabMenu1">
                <div class="detail-head">
                    <h3>전통민속관</h3>
                    <div class="text-box">
                        <span class="text">세시풍속과 전통생활문화를 한 눈에</span>
                    </div>
                </div>
                <span class="photo-img map">
                    <a href="#none" class="map-btn">지도보기</a>
                    <img src="/mobile/images/folkvillage/display/traditional_img01.jpg" alt="조선시대 사진1" />
                </span>
                <span class="text01">
                    전통민속관에서는 조선시대 후기 경기도 용인 땅에서 농사를 지으며 살았던 4대 가족의 연중생활을 사계절, 24절기 중심으로 태어나서
                    죽을 때까지의 일생의례를 생동감 있게 연출하여 전시하고 있습니다. 전통민속관은 우리의 전통문화를 보다 쉽게 배우고 체험할 수 있는 전시관으로 관람객들에게 사랑 받고 있습니다.
                </span>
                <span class="photo-img"><img src="/mobile/images/folkvillage/display/traditional_img02.jpg" alt="조선시대 사진2" /></span>
                <span class="text01">
                    전통민속관은 전통 민속박물관의 준말로 야외에서 재현하고 전시하기 어려웠던 세시풍속과 관혼상제, 의식주생활, 민속놀이 등을
                    디오라마 (축소모형), 움직이는 인형과 모형, 재미있는 만화와 옛 그림, 옛 사진, 유물전시를 통해서 보여주고 있습니다.
                    생업도구와 같은 유형의 물질자료, 농요와 같은 구비전승자료, 놀이와 같은 행위전승 자료를 적재적소에 배치하여
                    그 의미와 기능을 온전하게 해석하고 총체적으로 재현·전시한 점이 특징입니다.
                </span>
                <span class="photo-img"><img src="/mobile/images/folkvillage/display/traditional_img03.jpg" alt="조선시대 사진3" /></span>
            </div>
<!--세계민속관 내용-->
            <div class="tab-content tabMenu2">
                <div class="detail-head">
                    <h3>세계민속관</h3>
                    <div class="text-box">
                        <span class="text">세계 각국의 생활문화를 전시한 이색 전시관</span>
                    </div>
                </div>
                <span class="photo-img map">
                    <a href="#none" class="map-btn">지도보기</a>
                    <img src="/mobile/images/folkvillage/display/world_img01.jpg" alt="세계민속관 사진1" />
                </span>
                <span class="text01">
                    한국민속촌 세계민속관은 2001년 9월 22일 처음 개관해 9개동의 상설전시 공간으로 구성되어있습니다.
                    5대양 6대주에서 수집한 3,000여 점의 문화유산을 보유하고 있으며, 각 문화권마다 마련된 전시관을 통해
                    각 국의 의식주 생활과 생업기술, 문화예술을 쉽게 만나볼 수 있습니다.
                </span>
                <h4>전시실</h4>
                <table>
                    <caption>전시실 각층 안내</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:74%; padding-left:3%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>1관</th>
                            <td>동서양 문화의 접경지역 터키, 이슬람 문화권의 아프가니스탄, 파키스탄</td>
                        </tr>
                        <tr>
                            <th>2관</th>
                            <td>동북아시아 한자 문화권의 몽골, 중국</td>
                        </tr>
                        <tr>
                            <th>3관</th>
                            <td>일본</td>
                        </tr>
                        <tr>
                            <th>4관</th>
                            <td>동남아시아 해양 문화권의 말레이시아, 인도네시아</td>
                        </tr>
                        <tr>
                            <th>5관</th>
                            <td>대양주 해양문화권의 파푸아뉴기니, 호주</td>
                        </tr>
                        <tr>
                            <th>6관</th>
                            <td>북아메리카의 미국, 중앙아메리카의 멕시코</td>
                        </tr>
                        <tr>
                            <th>7관</th>
                            <td>남아메리카의 페루, 브라질</td>
                        </tr>
                        <tr>
                            <th>8관</th>
                            <td>남아프리카, 서아프리카, 동아프리카, 북아프리카</td>
                        </tr>
                        <tr>
                            <th>9관</th>
                            <td>이란</td>
                        </tr>
                    </tbody>
                </table>
                <span class="photo-img"><img src="/mobile/images/folkvillage/display/world_img02.jpg" alt="세계민속관 사진2" /></span>
            </div>
<!--탈춤전시관 내용-->
            <div class="tab-content tabMenu3">
                <div class="detail-head">
                    <h3>탈춤전시관</h3>
                    <div class="text-box">
                        <span class="text">웃음과 해학이 담긴 예술세계</span>
                    </div>
                </div>
                <span class="photo-img map">
                    <a href="#none" class="map-btn">지도보기</a>
                    <img src="/mobile/images/folkvillage/display/tal_img01.jpg" alt="탈춤전시관 사진1" />
                </span>
                <span class="text01">
                    탈춤은 파계승, 몰락한 양반, 무당, 사당, 거사, 하인 등 다양한 계층의 인물들을 통해 조선시대 서민문화의 특성을 대변하며,
                    흥겨운 놀이이자 당시 사회지도층에 대한 날카로운 풍자를 담고 있어 관람객들에게 재미는 물론 조선시대의 생활상을 엿볼 수 있는 기회를 선사합니다.
                    평소에 알지 못했던 탈춤에 대한 설명과 함께 봉산탈춤과 북청 사자놀음 등 다양한 탈춤의 모습을 디오라마(축소모형)로
                    하나하나 제작해 실감나게 보여주고 있습니다. 또한 전시관 입구에서는 각종 탈을 만드는 장인의 모습을 직접 볼 수 있습니다.
                </span>
                <span class="photo-img"><img src="/mobile/images/folkvillage/display/tal_img02.jpg" alt="탈춤전시관 사진2" /></span>
            </div>
<!--옹기전시관 내용-->
            <div class="tab-content tabMenu4">
                <div class="detail-head">
                    <h3>옹기전시관</h3>
                    <div class="text-box">
                        <span class="text">살아있는 그릇, 옹기 이야기</span>
                    </div>
                </div>
                <span class="photo-img map">
                    <a href="#none" class="map-btn">지도보기</a>
                    <img src="/mobile/images/folkvillage/display/tal_img01.jpg" alt="탈춤전시관 사진1" />
                </span>
                <span class="text01">
                    한국민속촌 옹기전시관에서는 조상들의 지혜를 엿볼 수 있는 옹기들을 한 자리에서 볼 수 있습니다.
                    삼국시대부터 만들어온 옹기는 우리 조상들의 전통생활과 밀접하게 연관되어 다양하게 사용되었으며,
                    민화와 문양 등 예술미까지 느낄 수 있는 작품으로도 손색이 없습니다. 자연 그대로의 여유와 풍요로움을
                    담은 옹기를 직접 만들어 볼 수 있는 옹기체험관도 있어 가족 및 단체, 외국인 관람객들이 좋아하는 장소입니다.
                </span>
                <section>
                    <h4>옹기만들기 체험</h4>
                    <p>물레체험(꽃병, 필통, 컵, 밥공기, 국 대접, 투가리, 떡시루 등) 직접 물레로 만든 후 글이나 그림을 새길 수 있으며, 가마에 구워 택배로 보내드립니다.</p>
                    <span class="text02">체험비 : 12,000원, 택배비 : 3,000원</span>
                </section>
            </div>

        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<article class="popup_wrap">
    <div class="dim-bg"></div>
    <div class="pop">
        <img src="" alt="전통민속관 지도" />
        <a href="#none" class="popup_close-btn">지도 닫기버튼</a>
    </div>
</article>

</body>
</html>