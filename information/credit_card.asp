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
                    slidesToShow: 3,
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
            <h2>할인정보</h2>
        </div>

        <div class="slider single-items">
            <a href="/mobile/information/promotion_list.asp">할인프로모션</a>
            <a href="/mobile/information/credit_card.asp">제휴카드할인</a>
            <a href="/mobile/information/coupon_list.asp">쿠폰할인</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-discount">
            <div class="detail-head">
                <h3>제휴카드할인</h3>
                <div class="text-box">
                    <span class="text">제휴카드 할인혜택 꼼꼼하게 찾아보기</span>
                </div>
            </div>
            <div class="detail-content credit_card">
                <span class="card_company">
                    <label for="card_com" class="hidden">카드사</label>
                    <select id="card_com" name="card_com" class="card_com">
                        <option selected>카드사</option>
                        <option>비씨카드</option>
                    </select>
                </span>
                <span class="card_name">
                    <label for="card_na" class="hidden">카드이름</label>
                    <select id="card_na" name="card_na" class="card_na">
                        <option selected>카드이름</option>
                        <option>용인시민카드</option>
                    </select>
                </span>
                <h4>용인시민카드(IBK기업은행_신용)</h4>
                <img src="/mobile/images/information/discount/card_img01.jpg" alt="용인시민카드" />
                <table>
                    <caption>제휴카드 할인혜택에 대한 설명</caption>
                    <colgroup>
                        <col style="width:25%">
                        <col style="width:62.5%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>할인혜택</th>
                            <td>성인자유이용권 24,000원 중 60% 할인</td>
                        </tr>
                        <tr>
                            <th>할인 대상 실적</th>
                            <td>
                                전월 실적 30만원 이상 (전 업종) 시 서비스 제공
                                (월 1회/연 8회 사용가능)
                                * 카드종류에 따라 기준이 다르므로 자세한 사항은
                                카드사에 문의하시기 바랍니다.
                            </td>
                        </tr>
                        <tr>
                            <th>할인 혜택 제한</th>
                            <td>
                                가족카드, 한도 초과, 도난 분실, 거래 정지, 마그네
                                틱 손상 등 카드는 할인 대상에서 제외됩니다.
                                제휴카드 할인은 타 할인혜택과 중복 적용되지 않
                                습니다.
                            </td>
                        </tr>
                        <tr>
                            <th>할인 방식</th>
                            <td>
                                할인 결제는 무 전표 결제 방식으로 별도의 카드 영
                                수증을 발행하지 않습니다. 현장 할인 방식으로
                                9,600원만 결제됩니다.
                            </td>
                        </tr>
                        <tr>
                            <th>기타사항</th>
                            <td>
                                할인 대상 카드의 종류와 할인 조건은 카드사 사정
                                에 따라 변경 될 수 있습니다. 농협, 하나은행 일부
                                상품의 기존 캐쉬백 할인과는 중복 적용되지 않습
                                니다.
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>