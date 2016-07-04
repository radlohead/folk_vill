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
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

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
                <h3>편의시설</h3>
                <div class="text-box">
                    <span class="text">나들이에 즐거움을 더하는 서비스</span>
                </div>
            </div>
            <div class="detail-content">
                <table class="conven-infor">
                    <caption>한국민속촌 편의시설 정보</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="76.5%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td><span class="icon icon-01"></span></td>
                            <td>
                                <div>
                                    <h4>유아휴게실</h4>
                                    <ul>
                                        <li>정문(대관문) 입장 후 좌측</li>
                                        <li>모유수유실, 기저귀교환대, 전자레인지 구비</li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="icon icon-02"></span></td>
                            <td>
                                <div>
                                    <h4>의무실</h4>
                                    <ul>
                                        <li>정문(대관문) 입장 후 왼쪽</li>
                                        <li>놀이마을 전설의고향 맞은편</li>
                                        <li>응급치료 약품 및 자동 제세동기(AED) 구비</li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="icon icon-03"></span></td>
                            <td>
                                <div>
                                    <h4>유모차 및 휠체어 대여</h4>
                                    <ul>
                                        <li>의무실 안내데스크에서 대여 가능(선착순)</li>
                                        <li>장애인 관람객 우선 대여</li>
                                        <li>휠체어(무료), 유모차(2,000원, 보증금 1,000원)</li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="icon icon-04"></span></td>
                            <td>
                                <div>
                                    <h4>방송실</h4>
                                    <ul>
                                        <li>의무실 안내데스크에서 안내</li>
                                        <li>분실 물품 접수, 미아 사고 안내방송</li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="icon icon-05"></span></td>
                            <td>
                                <div>
                                    <h4>관광안내소</h4>
                                    <ul>
                                        <li>정문(대관문) 입장 전 좌측</li>
                                        <li>내외국인 관람객 홍보자료 제공</li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="icon icon-06"></span></td>
                            <td>
                                <div>
                                    <h4>물품보관함</h4>
                                    <ul>
                                        <li>유아휴게실 외부</li>
                                        <li>놀이마을 미니바이킹 주변</li>
                                        <li>대(3,000원), 중(2,000원), 소(1,000원)</li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
                initialSlide: 3
            });
        });
    </script>

</body>
</html>