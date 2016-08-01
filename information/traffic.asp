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

function initMap() {
  var chicago = new google.maps.LatLng(37.261134, 127.120726);

  var map = new google.maps.Map(document.getElementById('map'), {
    center: chicago,
    zoom: 13
  });

  var coordInfoWindow = new google.maps.InfoWindow();
  coordInfoWindow.setContent(createInfoWindowContent(chicago, map.getZoom()));
  coordInfoWindow.setPosition(chicago);
  coordInfoWindow.open(map);

  map.addListener('zoom_changed', function() {
    coordInfoWindow.setContent(createInfoWindowContent(chicago, map.getZoom()));
    coordInfoWindow.open(map);
  });
}

var TILE_SIZE = 256;

function createInfoWindowContent(latLng, zoom) {
  var scale = 5 << zoom;

  var worldCoordinate = project(latLng);

  var pixelCoordinate = new google.maps.Point(
      Math.floor(worldCoordinate.x * scale),
      Math.floor(worldCoordinate.y * scale));

  var tileCoordinate = new google.maps.Point(
      Math.floor(worldCoordinate.x * scale / TILE_SIZE),
      Math.floor(worldCoordinate.y * scale / TILE_SIZE));

  return [
    '한국민속촌'
  ].join('<br>');
}

// The mapping between latitude, longitude and pixels is defined by the web
// mercator projection.
function project(latLng) {
  var siny = Math.sin(latLng.lat() * Math.PI / 180);

  // Truncating to 0.9999 effectively limits latitude to 89.189. This is
  // about a third of a tile past the edge of the world tile.
  siny = Math.min(Math.max(siny, -0.9999), 0.9999);

  return new google.maps.Point(
      TILE_SIZE * (0.5 + latLng.lng() / 360),
      TILE_SIZE * (0.5 - Math.log((1 + siny) / (1 - siny)) / (4 * Math.PI)));
}

    $(window).load(function(){
        $(".tabMenu .menu1 a").trigger("click");
    });
        </script>
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKwMgxrOrsHcHCiYswlo1k2t47sxAlJes&callback=initMap"
          async defer></script>
</head>
<body>

<!-- 메뉴 -->
<!--#include virtual="/mobile/common/inc/gnb.asp" -->

<div class="wrap traffic">
<!-- 상단헤더 -->
<!--#include virtual="/mobile/common/inc/header.asp" -->

    <div class="header_title_slide">
        <div class="title">
            <h2>이용안내</h2>
        </div>

<!--#include virtual="/mobile/information/inc/infor_topmenu.asp" -->

    </div>

    <div class="contents">
        <div class="detail-member">
            <div class="detail-head">
                <h3>교통정보</h3>
                <div class="text-box">
                    <span class="text">서울에서 30분이면<br/> 조선시대 마을이 눈 앞에!</span>
                </div>
            </div>
            <div class="detail-content">
                <!-- 2단탭배너 -->
                <div class="main-tab traffic">
                    <ul class="tabMenu">
                        <li class="menu1 on" rel="tabMenu1">
                            <!--대중교통-->
                            <h3><a href="#tab1"></a></h3>
                        </li>
                        <li class="menu2" rel="tabMenu2">
                            <!--자가용-->
                            <h3><a href="#tab2"></a></h3>
                        </li>
                    </ul>
                    <!-- #tab1 대중교통-->
                    <div class="tab-content tabMenu1">
                        <h4>지하철 이용</h4>
                        <p>1호선 수원역, 분당선 상갈역까지 오셔서 셔틀버스로 한국민속촌까지 이동</p>
                        <img src="/mobile/images/information/traffic_public.jpg" alt="대중교통" />
                        <table class="bus-time">
                            <caption>한국민속촌 지하철 이용에 대한 안내</caption>
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>경로</th>
                                    <th>운행시간</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td rowspan="2">
                                        <b class="fs-14">셔틀버스1</b><br />
                                        한국민속촌-수원역
                                    </td>
                                    <td>수원역<span class="tri_icon"></span>민속촌</td>
                                    <td>
                                        <b>일 3회</b><br />
                                        10:30, 12:30, 14:30
                                    </td>
                                </tr>
                                <tr>
                                    <td>민속촌<span class="tri_icon"></span>수원역</td>
                                    <td>
                                        <b>일 3회</b><br />
                                        14:00, 15:30, 16:30
                                     </td>
                                </tr>
                                <tr>
                                    <td rowspan="2">
                                        <b class="fs-14">셔틀버스2</b><br />
                                        한국민속촌-상갈역
                                    </td>
                                    <td>상갈역<span class="tri_icon"></span>민속촌</td>
                                    <td>
                                        <b>일 7회</b><br />
                                        10:40, 11:10, 12:10<br />
                                        13:40, 15:10, 16:10, 16:40
                                    </td>
                                </tr>
                                <tr>
                                    <td>민속촌<span class="tri_icon"></span>상갈역</td>
                                    <td>
                                        <b>일 8회</b><br />
                                        10:30, 11:00, 12:00, 13:30<br />
                                        15:00, 16:00, 16:30, 17:30
                                     </td>
                                </tr>
                            </tbody>
                        </table>
                        <ul class="bus-time-list">
                            <li>
                                <p>
                                    <span class="icon02"></span>
                                    <span>이용요금 무료</span>
                                </p>
                            </li>
                            <li>
                                <p>
                                    <span class="icon02"></span>
                                    <span>수원역 4번 출구 민속촌 셔틀버스 승강장, 상갈역 2번 출구에서 승하차</span>
                                </p>
                            </li>
                            <li>
                                 <p>
                                     <span class="icon02"></span>
                                     <span>선착순 탑승, 단체관람객 제한 가능</span>
                                 </p>
                            </li>
                            <li>
                                 <p>
                                     <span class="icon02"></span>
                                     <span>문의 : 031-288-0000</span>
                                 </p>
                            </li>
                            <li>
                                 <p>
                                     <span class="icon02"></span>
                                     <span>동절기 셔틀버스2 노선 마지막 회차 운휴</span>
                                 </p>
                            </li>
                        </ul>
                        <h4>버스 이용</h4>
                        <table class="bus-use">
                            <caption>한국 민속촌 버스 이용에 대한 안내</caption>
                            <colgroup>
                                <col width="31.8%">
                                <col width="68.2%">
                            </colgroup>
                            <tr>
                                <td>
                                    <strong class="text01">인천공항</strong>
                                    <span class="icon bus_icon01"></span>
                                </td>
                                <td>
                                    <div class="bus-use-list">
                                        <em class="bus-num">A8877</em> <span class="fs-12">(공항버스)</span>
                                        <ul>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>위치 : 인천공항</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>노선 : 인천공항<span class="tri_icon"></span>광교중앙역<span class="tri_icon"></span>한국민속촌 앞</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong class="text01">신논현역</strong>
                                    <span class="icon bus_icon02"></span>
                                </td>
                                <td>
                                    <div class="bus-use-list">
                                        <em class="bus-num">5001-1</em> <span class="fs-12">(직행좌석)</span>
                                        <ul>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>위치 : 신논현역 6번 출구</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>노선 : 신논현역<span class="tri_icon"></span>강남역<span class="tri_icon"></span>신갈<span class="tri_icon"></span>민속촌</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong class="text01">강남역</strong>
                                    <span class="icon bus_icon02"></span>
                                </td>
                                <td>
                                    <div class="bus-use-list">
                                        <em class="bus-num">1560</em> <span class="fs-12">(직행좌석)</span>
                                        <ul>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>위치 : 강남역 7번 출구</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>노선 : 강남역<span class="tri_icon"></span>신갈<span class="tri_icon"></span>민속촌 삼거리(삼성아파트)</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                 </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong class="text01">종각역</strong>
                                    <span class="icon bus_icon02"></span>
                                </td>
                                <td>
                                    <div class="bus-use-list">
                                        <em class="bus-num">5500-1</em> <span class="fs-12">(직행좌석)</span>
                                        <ul>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>위치 : 종각역 3번 출구</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>노선 : 종각역<span class="tri_icon"></span>미금역<span class="tri_icon"></span>민속촌 삼거리(삼성아파트)</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong class="text02">수원역</strong>
                                    <span class="icon bus_icon03"></span>
                                </td>
                                <td>
                                    <div class="bus-use-list">
                                        <em class="bus-num">37</em>
                                        <ul>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>위치 : 수원역 5번출구 50m 전방</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>노선 : 수원역앞<span class="tri_icon"></span>신갈오거리<span class="tri_icon"></span>한국민속촌</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong class="text02">수원역</strong>
                                    <span class="icon bus_icon03"></span>
                                </td>
                                <td>
                                    <div class="bus-use-list">
                                        <em class="bus-num">10-5</em>
                                        <ul>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>위치 : 수원역 5번출구 50m 전방</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>노선 : 수원역앞<span class="tri_icon"></span>아주대삼거리<span class="tri_icon"></span>나곡마을</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong class="text02">상길역</strong>
                                    <span class="icon bus_icon03"></span>
                                </td>
                                <td>
                                    <div class="bus-use-list">
                                        <em class="bus-num">37</em>
                                        <ul>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>위치 : 상갈역 3번출구</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>노선 : 상갈역<span class="tri_icon"></span>삼정선비마을<span class="tri_icon"></span>민속촌</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong class="text02">상길역</strong>
                                    <span class="icon bus_icon03"></span>
                                </td>
                                <td>
                                    <div class="bus-use-list">
                                        <em class="bus-num">10-5</em>
                                        <ul>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>위치 : 수원역 5번출구 50m 전방</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>노선 : 상갈역<span class="tri_icon"></span>한보라마을입구<span class="tri_icon"></span>나곡마을</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong class="text02">죽전역</strong>
                                    <span class="icon bus_icon04"></span>
                                </td>
                                <td>
                                    <div class="bus-use-list">
                                        <em class="bus-num">30</em> <span>(마을버스)</span>
                                        <ul>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>위치 : 죽전역 신세계백화점 앞</span>
                                                </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <span class="icon02"></span>
                                                    <span>노선 : 죽전역<span class="tri_icon"></span>신갈오거리<span class="tri_icon"></span>나곡마을</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- #tab2 자가용-->
                    <div class="tab-content tabMenu2">
                        <div class="map" id="map">

                        </div>
                        <section>
                            <h4>경부고속도로 이용</h4>
                            <p>
                                수원IC 우측 진출(신갈, 민속촌 방향) <span class="icon_tri"></span>상갈교사거리(민속촌방향 좌회전)
                                <span class="icon_tri"></span>민속촌 입구 삼거리(좌회전) <span class="icon_tri"></span>한국민속촌
                            </p>
                        </section>
                        <section>
                            <h4>용인-서울 고속도로 이용</h4>
                            <p>
                                헌릉IC(용인 방면) <span class="icon_tri"></span>서수지IC(용인 방면)
                                <span class="icon_tri"></span>청명IC 우측 진출(기흥구청, 한국민속촌 방향)
                                <span class="icon_tri"></span>23번 지방도 우측 진출(한국민속촌 방향) <span class="icon_tri"></span>민속촌입구 삼거리(우회전)
                                <span class="icon_tri"></span>한국민속촌
                            </p>
                        </section>
                        <section>
                            <h4>국도 이용</h4>
                            <section>
                                <h5>수원방면</h5>
                                <p>
                                    42번 국도(용인 방면으로 주행) <span class="icon_tri"></span>신갈오거리 좌회전(한국민속촌 방향)
                                    <span class="icon_tri"></span>민속촌 입구 삼거리(좌회전) <span class="icon_tri"></span>한국민속촌
                                </p>
                            </section>
                            <section>
                                <h5>성남·분당 방면</h5>
                                <p>
                                    분당수서간 도시고속화도로(용인 방면)<span class="icon_tri"></span>용구대로(고가 도로 용인 방면)
                                    <span class="icon_tri"></span>민속촌 입구 삼거리(좌회전) <span class="icon_tri"></span>한국민속촌
                                </p>
                            </section>
                            <section>
                                <h5>동탄·오산 방면</h5>
                                <p>
                                    영천교차로<span class="icon_tri"></span>(구)기흥IC, 신갈 방면(좌회전) <span class="icon_tri"></span>지방도 317번
                                    <span class="icon_tri"></span>민속촌 입구 삼거리(좌회전) <span class="icon_tri"></span>한국민속촌
                                </p>
                            </section>
                            <span class="road-sign">
                                수원IC, 청명IC, 신갈 오거리 및 오산 방향에서 민속촌까지 쉽게 찾아 오실 수 있도록 민속촌 안내 도로표지판이 설치되어 있습니다.
                            </span>
                        </section>
                        <div class="parking">
                            <span class="icon_p"></span>
                            <section>
                                <h4>주차요금안내</h4>
                                <ul>
                                    <li>주차요금 : 대형 3,000원  |  소형 2,000원</li>
                                    <li>주차장 입장 시 1회 청구, 추가요금 없음</li>
                                </ul>
                            </section>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

<!-- 하단푸터 -->
<!--#include virtual="/mobile/common/inc/footer.asp" -->

</div>

</body>
</html>