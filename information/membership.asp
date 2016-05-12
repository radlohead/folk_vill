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
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->

        <div class="slider multiple-items">
            <a href="/mobile/information/membership.asp">연간회원안내</a>
            <a href="/mobile/information/traffic.asp">교통정보</a>
            <a href="/mobile/information/convenience.asp">편의시설</a>
            <a href="/mobile/information/notice_list.asp">공지사항</a>
            <a href="/mobile/information/map.asp">가이드맵</a>
            <a href="/mobile/information/guide.asp">시간/요금</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>연간회원</h3>
                <div class="text-box">
                    <span class="text">365일 민속촌을 내 집처럼 누리는<br/> 멤버쉽 제도</span>
                </div>
            </div>
            <div class="detail-content">
                 <section class="mem-benefit">
                    <h4>연간회원 혜택</h4>
                    <img src="/mobile/images/information/mem-benefit.png" alt="연간회원혜택 1년 365일 한국민속촌을 자유롭게 이용, 놀이기구 및 전시관 무료 이용, 다양한 이벤트 정보 및 참여 기회 제공" />
                 </section>
                 <section class="mem-price">
                    <h4>연간회원 요금</h4>
                    <table>
                        <caption>한국민속촌 이용요금에 대한 안내</caption>
                        <thead>
                            <tr>
                                <th>구분</th>
                                <th>성인</th>
                                <th>청소년</th>
                                <th>경로&amp;아동</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>일반 연간회원</td>
                                <td>100,000원</td>
                                <td>80,000원</td>
                                <td>70,000원</td>
                            </tr>
                            <tr>
                                <td>주중 연간회원</td>
                                <td>70,000원</td>
                                <td>60,000원</td>
                                <td>50,000원</td>
                            </tr>
                        </tbody>
                    </table>
                 </section>
                 <section class="join-method">
                    <h5>현장 방문 가입</h5>
                    <ul>
                        <li>정문 단체상담실에서 신청서 작성 후 한국민속촌 이용</li>
                        <li>미리 가입신청서 작성 후 방문 시 빠른 진행 가능</li>
                    </ul>
                    <h5>이메일 접수</h5>
                    <ul>
                        <li>본인 사진, 가입신청서, 이용약관(자필서명) 제출</li>
                        <li>이메일주소 : kfv4000@ikfv.co.kr</li>
                    </ul>
                    <span class="down-link">
                        <a href="#none"><img src="/mobile/images/information/down-link_img01.png" alt="회원가입신청서 다운링크" /></a>
                        <a href="#none"><img src="/mobile/images/information/down-link_img02.png" alt="주중 회원 약관 다운링크" /></a>
                        <a href="#none"><img src="/mobile/images/information/down-link_img03.png" alt="일반 회원 약관 다운링크" /></a>
                    </span>
                 </section>
                 <section class="note">
                    <h4>유의사항</h4>
                    <h5>가입 시</h5>
                    <ul>
                        <li>정면을 보고 있는 최근 사진(모자, 선그라스 착용 금물) 지참</li>
                        <li>별도의 사진촬영 없음</li>
                        <li>본인 방문이 어려우실 경우, 신분증 사본과 사진 지참</li>
                        <li>복지카드 소지 대인은 아동 요금 적용</li>
                    </ul>
                    <h5>이용 시</h5>
                    <ul>
                        <li>한국민속촌 관람 시 회원권 항상 패용</li>
                        <li>부득이한 휴장 시 이용 제한</li>
                        <li>미술관, 전시관은 운영 사정상 휴관 가능</li>
                        <li>회원권 분실 및 미지참시 재발급 수수료 3,000원 부담</li>
                    </ul>
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

</body>
</html>