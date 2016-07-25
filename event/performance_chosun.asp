<%

Function FirstDayOfWeekN( weekN )
    FirstDayOfYear		= DateSerial( Year(Date()), 1, 1 )
    FirstDayOfFirstWeek	= FirstDayOfYear - Weekday( FirstDayOfYear ) + 2
    FirstDayOfWeekN		= DateAdd( "ww", weekN-1, FirstDayOfFirstWeek )
End Function

'Response.Write FirstDayOfWeekN(DatePart("ww", Date())) & "<br>"

Dim sFirstDay, sLastDay

sFirstDay	= FirstDayOfWeekN(DatePart("ww", Date()))
'sLastDay	= FirstDayOfWeekN(DatePart("ww", Date() + 6))
sLastDay	= DateAdd("d", 6, sFirstDay)

'Response.Write "sFirstDay : " & sFirstDay & "<br>"
'Response.Write "sLastDay : " & DateAdd("d", 6, sFirstDay) & "<br>"
%>

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
                $('.single-item').slick({
                    dots: true
                });
            });
        </script>
</head>
<body>
<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap perfo-chosun">
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
                <h3>조선캐릭터</h3>
                <div class="text-box">
                    <span class="text">좌충우돌 개성만점 조선캐릭터</span>
                </div>
            </div>
            <div class="detail-content chosun">
                <div class="character_date_box">
                    <span class="date_text">
                        <span class="text">금주의 활동 캐릭터  ( <%=sFirstDay%> ~ <%=sLastDay%> )</span>
                    </span>
                    <p class="text_box">
                        <span class="sub-title">평일</span>
                        <span class="text">나쁜사또, 이방, 거지, 장사꾼, 포졸, 화공</span>
                    </p>
                    <p class="text_box">
                        <span class="sub-title">주말</span>
                        <span class="text">나쁜사또, 이방, 거지, 장사꾼, 포졸, 화공, 광년이, 중매쟁이 손재주꾼, 주모, 등등등등</span>
                    </p>
                </div>
                <div class="cont_body">
                    <span class="text03">
                        <span class="text">운영계획은 주간 단위로 업데이트 되며, 캐릭터 개인사정 및 현장상황에 따라 예고없이 변경될 수 있습니다.</span>
                    </span>

                    <div class="pre-infor-tab pre-infor-tab2">
                        <div class="title">
                            <h3>알림사항을 꼭 읽어주세요</h3>
                            <span class="icon"></span>
                        </div>
                        <div class="content">
                            <ul>
                                <li>
                                    <p>
                                        <span class="icon"></span>
                                        <span>캐릭터는 주로 주말에 활동하며, 평일에는 축소 운영합니다.</span>
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <span class="icon"></span>
                                        <span>캐릭터는 각 시기에 진행되는 행사의 컨셉에 따라 지속적으로 변경됩니다. 예) 추억의 그때그놀이(이놈아저씨), 사극드라마축제(구미호) 등</span>
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <span class="icon"></span>
                                        <span>한국민속촌 내에서 캐릭터 촬영 시, 관람객 여러분이 촬영 대상이 되는 경우가 있으며 이를 보도, 광고, 프로모션, 판매 상품 등에 사용할 수 있습니다.</span>
                                    </p>
                                </li>
                                <li>
                                    <p>
                                        <span class="icon"></span>
                                        <span>캐릭터 연기자에게 위해 행위 및 성희롱을 가하는 사례가 간혹 발생합니다. 이와 같은 경우, 강제 퇴장조치를 받을 수 있으니 협조 부탁드립니다.</span>
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="img_box">
                        <em>“조용한 조선마을에 수상한 사람들이 나타났다”</em>
                        <p class="text">더 이상 한국민속촌은 초가집만 가득한 야외박물관이 아닙니 다. 살아있는 조선캐릭터가 시끌벅적한 조선마을 이야기 속으로 여러분을 초대합니다.</p>
                        <img src="/mobile/images/event/chosun_img_01.jpg" alt="" />
                    </div>
                    <div class="img_box">
                        <em>어서와. 살아있는 조선은 처음이지?</em>
                        <p class="text">민속촌 곳곳에서 활동하는 조선캐릭터는 돌발적인 퍼포먼스와 이색공연을 펼치며 관람객 여러분을 리얼 100% 조선시대로 안내합니다.</p>
                        <img src="/mobile/images/event/chosun_img_02.jpg" alt="" />
                    </div>
                    <div class="img_box">
                        <em>“조선캐릭터 만나러 한국민속촌 간다”</em>
                        <p class="text">국내 최고의 꿀알바 ‘거지’, 아씨부채의 주인공 ‘장사꾼’ 등 SNS 스타 조선캐릭터를 만나보세요. 어디에서도 경험할 수 없었던 아주 특별한 추억을 선물합니다.</p>
                        <img src="/mobile/images/event/chosun_img_03.jpg" alt="" />
                    </div>
                    <div class="img_box">
                        <em>조선캐릭터만 있는 건 아니다.<br/>
                            이놈아저씨, 구미호도 있다!
                        </em>
                        <p class="text">
                            한국민속촌에서 진행되는 행사의 컨셉에 따라 조선캐릭터뿐 아니라 이놈아저씨, 구미호와 같은 이색 캐릭터가 활동합니다.
                            이색 캐릭터는 1년 내내 활동하는 것은 아니니 금주의 활동캐릭터에서 확인해보세요.
                        </p>
                        <img src="/mobile/images/event/chosun_img_04.jpg" alt="" />
                    </div>

                    <div class="preview-slide-wrap">
                        <h4>조선캐릭터 미리보기</h4>
                        <div class="preview-slide slider single-item">
                            <div><img src="/mobile/images/event/chosun_slide01.jpg" alt="" /></div>
                            <div><img src="/mobile/images/event/chosun_slide02.jpg" alt="" /></div>
                        </div>
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

</body>
</html>