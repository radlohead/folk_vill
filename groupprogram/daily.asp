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
            <h2>단체프로그램</h2>
            <aside>
                <h2>단체프로그램
                    <span class="icon"></span>
                </h2>
<!--#include virtual="/mobile/common/inc/rg_menu.asp" -->
            </aside>
        </div>
    </div>

    <div class="contents">
        <div class="detail-discount">
            <div class="detail-head">
                <h3>단체프로그램</h3>
                    <span class="text">선조들의 생활과 문화를 경험하는 특별한<br/>
                                       전통문화체험 프로그램
                    </span>
            </div>
            <div class="detail-content daily">
                <!-- 2단탭배너 -->
                <div class="main-tab daily-tab">
                    <ul class="tabMenu">
                        <li class="menu1 on" rel="tabMenu1">
                        <!--일일체험학습-->
                            <h3><a href="#tab1"></a></h3>
                        </li>
                        <li class="menu2" rel="tabMenu2">
                        <!--기업&amp;외국인단체-->
                            <h3><a href="#tab2"></a></h3>
                        </li>
                    </ul>
                    <!-- #tab1 대중교통-->
                    <div class="tab-content tabMenu1">
                        <p>
                            <span class="icon">*</span>
                            <span>대상 : 유아, 초·중·고등학생 단체에 한함 (기업&외국인단체 별도 문의)</span>
                        </p>
                        <p>
                            <span class="icon">*</span>
                            <span>예약문의 : 031-288-4000~1, 4004~5</span>
                        </p>
                    </div>
                    <!-- #tab2 자가용-->
                    <div class="tab-content tabMenu2">

                    </div>
                </div>
                <div class="program_course">
                    <section>
                        <span class="pic"><img src="/mobile/images/groupprogram/daily_pic_01.jpg" alt="" /></span>
                        <div class="text_box">
                            <h4>일반코스</h4>
                            <span class="text">아름다운 조선시대 민속마을에서 학습과 재미를 함께 느낄 수 있는 프로그램</span>
                        </div>
                        <span class="more_btn">
                            <a class="more" href="/mobile/groupprogram/general_course.asp">일반코스 더보기</a>
                        </span>
                    </section>
                    <section>
                        <span class="pic"><img src="/mobile/images/groupprogram/daily_pic_02.jpg" alt="" /></span>
                        <div class="text_box">
                            <h4>전통문화체험코스</h4>
                            <span class="text">선조들의 지혜와 생활모습을 이해 하고, 문화예술을 학습할 수 있는 프로그램</span>
                        </div>
                        <span class="more_btn">
                            <a class="more" href="/mobile/groupprogram/tradition_course.asp">전통문화체험코스 더보기</a>
                        </span>
                    </section>
                    <section>
                        <span class="pic"><img src="/mobile/images/groupprogram/daily_pic_03.jpg" alt="" /></span>
                        <div class="text_box">
                            <h4>키즈데이패키지</h4>
                            <span class="text">아이들의 눈높이에 맞춰 다양하게 구성된 맞춤 체험프로그램 (매주 월요일)</span>
                        </div>
                        <span class="more_btn">
                            <a class="more" href="/mobile/groupprogram/kids_day.asp">키즈데이패키지 더보기</a>
                        </span>
                    </section>
                    <section>
                        <span class="pic"><img src="/mobile/images/groupprogram/daily_pic_04.jpg" alt="" /></span>
                        <div class="text_box">
                            <h4>선비문화체험코스</h4>
                            <span class="text">전통예절과 공예체험 등 선비문화를 체험할 수 있는 특별 프로그램</span>
                        </div>
                        <span class="more_btn">
                            <a class="more" href="/mobile/groupprogram/seonbi_course.asp">선비문화체험코스 더보기</a>
                        </span>
                    </section>
                    <section>
                        <span class="pic"><img src="/mobile/images/groupprogram/daily_pic_05.jpg" alt="" /></span>
                        <div class="text_box">
                            <h4>인증프로그램</h4>
                            <span class="text">안전하고 신뢰할 수 있는 청소년 수련활동 인증 프로그램</span>
                        </div>
                        <span class="more_btn">
                            <a class="more" href="/mobile/groupprogram/cert_program.asp">인증프로그램 더보기</a>
                        </span>
                    </section>
                </div>

            </div>
        </div>

    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>
<!--#include virtual="/mobile/common/inc/script.asp" -->
    <script>
        $(document).ready(function(){
            $('.multiple-items').slick({
                infinite: true,
                slidesToShow: 4,
                initialSlide: 2
            });
        });
    </script>

</body>
</html>