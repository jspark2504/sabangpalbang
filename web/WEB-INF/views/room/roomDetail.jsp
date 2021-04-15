<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <!-- jQuery -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/findMyRoom/resources/js/roomDetail.js"></script>
	<!-- css -->
    <link rel="stylesheet" href="/findMyRoom/resources/css/roomDetail.css">
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
            <!-- room-detail-all -->
            <section class="room-detail col-sm-4">
              <article class="room-detail-heading">
                <div class="room-detail-title">
                  <span class="glyphicon glyphicon-menu-left" aria-hidden="true">
                  </span>
                  <h4>
                    동작구 사당동
                  </h4>
                </div>
                  <span class="glyphicon glyphicon glyphicon-heart empty" aria-hidden="true">
                  </span>
                  <!-- <span class="glyphicon glyphicon glyphicon-heart" aria-hidden="true">
                  </span> -->
              </article>
              <hr>
              <!-- room-img -->
              <article class="room-img-list">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                  </ol>

                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">
                    <div class="item active">
                      <img src="/findMyRoom/resources/image/room1.png" alt="...">
                    </div>
                    <div class="item">
                      <img src="/findMyRoom/resources/image/room2.png" alt="...">
                    </div>
                  </div>

                  <!-- Controls -->
                  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </article>

            </section> <!-- 매물 목록 영역 end -->
        </section>
    </main>
</body>

</html>