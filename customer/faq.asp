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
            <h2>고객의 말씀</h2>
        </div>

        <div class="slider single-items">
            <a href="/mobile/customer/faq.asp">자주묻는 질문</a>
            <a href="/mobile/customer/qna_form.asp">1:1 상담문의</a>
            <a href="/mobile/customer/voice_form.asp">칭찬/신고/제안</a>
        </div>
    </div>

    <div class="contents">
        <div class="detail-customer">
            <div class="detail-head">
                <h3>자주묻는 질문</h3>
                <span class="text">한국민속촌을 이용하시는 고객님들께서 자주 문의하시는 질문과 답변들을 정리하였습니다.</span>
            </div>
            <div class="content customer">
                <form>
                    <div class="select_box category">
                        <select name="category" class="category">
                            <option value="선택">선택</option>
                            <option value="제목">제목</option>
                            <option value="제목+내용">제목+내용</option>
                            <option value="내용">내용</option>
                        </select>
                    </div>
                    <div class="cate_search">
                        <input type="text" name="cate_search_text" id="cate_search_text" class="cate_search_text" />
                        <a href="#none" class="search_btn"></a>
                    </div>
                </form>
                <p class="faq_title_text">
                   궁금하신 점을 FAQ에서 찾아보세요.<br/>
                   궁금하신 점을 바로 확인하실 수 있습니다.
                </p>
               <div class="main-tab faq-tab">
                    <ul class="tabMenu">
                        <li class="menu1 on" rel="tabMenu1">
                            <!--전체-->
                            <h3><a href="#tab1">1</a></h3>
                        </li>
                        <li class="menu2" rel="tabMenu2">
                            <!--이용안내-->
                            <h3><a href="#tab2">2</a></h3>
                        </li>
                        <li class="menu3" rel="tabMenu3">
                            <!--할인이벤트-->
                            <h3><a href="#tab3">2</a></h3>
                        </li>
                        <li class="menu4" rel="tabMenu4">
                            <!--기타-->
                            <h3><a href="#tab4">2</a></h3>
                        </li>
                    </ul>
                    <!-- #tab1 전체-->
                    <div class="tab-content tabMenu1">
                        11
                    </div>
                    <!-- #tab2 이용안내-->
                    <div class="tab-content tabMenu2">
                        22
                    </div>
                    <!-- #tab3 할인이벤트-->
                    <div class="tab-content tabMenu3">
                        22
                    </div>
                    <!-- #tab4 기타-->
                    <div class="tab-content tabMenu4">
                        22
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
            $('.single-items').slick({
                slidesToShow: 3,
                initialSlide: 0
            });
        });
    </script>

</body>
</html>