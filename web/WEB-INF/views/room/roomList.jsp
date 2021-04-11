<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    <title>구해줘! 내 방</title>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<!-- css -->
    <link rel="stylesheet" href="/findMyRoom/resources/css/roomList.css">
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
    <main class="container-fluid">
        <section class="row">
            <!-- 지도 영역 -->
            <article class="map col-sm-8">
                <figure id="map" style="width: 100%; height: 100%;">
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24e099130b03e272c1eb2889137042a1&libraries=services,clusterer,drawing"></script>
                    <script>
                        var container = document.getElementById('map');
                        var options = {
                            center: new kakao.maps.LatLng(37.478409, 126.951704),
                            level: 6
                        };

                        var map = new kakao.maps.Map(container, options);
                    </script>
                </figure>
            </article> <!-- 지도 영역 end -->
            <!-- 매물 목록 영역 -->
            <article class="room-list col-sm-4">
                <h4 class="room-list-heading">지역 목록 163개</h4>
                <hr>
                <ul>
                    <a href="">
                        <li class="room">
                            <div class="img"><img src="image/city1.PNG" alt=""></div>
                            <div class="info">
                                <span class="price">1억 1,000</span>
                                <span class="area floor">9평, 7층</span>
                                <span class="address">관악구 신림동</span>
                                <span class="explanation">신림역 3분, 실평 9이상, 신축급</span>
                            </div>
                        </li>
                    </a>
                    <a href="">
                        <li class="room">
                            <div class="img"><img src="image/city1.PNG" alt=""></div>
                            <div class="info">
                                <span class="price">1억 1,000</span>
                                <span class="area floor">9평, 7층</span>
                                <span class="address">관악구 신림동</span>
                                <span class="explanation">신림역 3분, 실평 9이상, 신축급</span>
                            </div>
                        </li>
                    </a>
                    <a href="">
                        <li class="room">
                            <div class="img"><img src="image/city1.PNG" alt=""></div>
                            <div class="info">
                                <span class="price">1억 1,000</span>
                                <span class="area floor">9평, 7층</span>
                                <span class="address">관악구 신림동</span>
                                <span class="explanation">신림역 3분, 실평 9이상, 신축급</span>
                            </div>
                        </li>
                    </a>
                    <a href="">
                        <li class="room">
                            <div class="img"><img src="image/city1.PNG" alt=""></div>
                            <div class="info">
                                <span class="price">1억 1,000</span>
                                <span class="area floor">9평, 7층</span>
                                <span class="address">관악구 신림동</span>
                                <span class="explanation">신림역 3분, 실평 9이상, 신축급</span>
                            </div>
                        </li>
                    </a>
                    <a href="">
                        <li class="room">
                            <div class="img"><img src="image/city1.PNG" alt=""></div>
                            <div class="info">
                                <span class="price">1억 1,000</span>
                                <span class="area floor">9평, 7층</span>
                                <span class="address">관악구 신림동</span>
                                <span class="explanation">신림역 3분, 실평 9이상, 신축급</span>
                            </div>
                        </li>
                    </a>


                </ul>

            </article> <!-- 매물 목록 영역 end -->
        </section>
    </main>
</body>

</html>