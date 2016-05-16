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
            <h2>할인정보</h2>
            <aside>
                <h2>이용안내
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.html" -->
            </aside>
        </div>

        <div class="slider multiple-items">
            <a href="/mobile/information/credit_card.asp">제휴카드할인</a>
            <a href="/mobile/information/coupon_list.asp">쿠폰할인</a>
            <a href="/mobile/information/promotion_list.asp">할인프로모션</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-discount">
            <div class="detail-head">
                <h3>제휴카드할인</h3>
                <span class="text">제휴카드 할인혜택 꼼꼼하게 찾아보기</span>
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
                slidesToShow: 3,
                slidesToScroll: 1
            });
            $('.single-item').slick({
                dots: true
            });
        });
    </script>

</body>
</html>