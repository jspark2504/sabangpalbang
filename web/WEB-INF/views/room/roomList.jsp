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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                    <script src="/findMyRoom/resources/js/map.js"></script>
                </figure>
            </article> <!-- 지도 영역 end -->

            <!-- 검색 필터 영역 -->
            <form class="search" action="">
            	<button type="button">검색 조건을 설정해주세요.</button>
            	<input type="text" />
            	<button type="submit"></button>
            	<button type="reset">모두 초기화</button>
            </form><!-- 검색 필터 영역 end -->

            <!-- 매물 목록 영역 -->
            <article class="room-list col-sm-4">
                <h4 class="room-list-heading">지역 목록 163개</h4>
                <hr>
                <ul>
                	<c:forEach var="room" items="${ requestScope.roomList }">
                        <a href="#" onclick="showDetail();"> <!--  return false; -->>
                            <li class="room">
                                <figure class="img"><img src="image/city1.PNG" alt=""></figure>
                                <div class="info">
                                	<input type="hidden" id="roomNo" name="roomNo" value="${ room.no }" />

    	                            <fmt:parseNumber var="price1" value="${ room.price / 100000000 }" integerOnly="true"/>
                              	    <fmt:formatNumber var="price2" value="${ room.price % 100000000 / 10000 }" groupingUsed="true"/>
                                	<c:if test="${ price1 > 0 && (room.price % 100000000) > 0 }">
    	                                <span class="price"><c:out value="전세 ${ price1 }억 ${ price2 }"/></span>
                                	</c:if>
                                	<c:if test="${ price1 > 0 && (room.price % 100000000) == 0 }">
    	                                <span class="price"><c:out value="전세 ${ price1 }억"/></span>
                                	</c:if>
    								<c:if test="${ price1 == 0 }">
    	                                <span class="price"><c:out value="전세 ${ price2 }"/></span>
    								</c:if>

                                    <fmt:formatNumber var="area" value="${ room.area }" pattern="#"/>
                                    <c:set var="floor" value="${ fn:substring(room.floor, 0, fn:indexOf(room.floor, '/')) }"/>
                                    <span class="area floor"><c:out value="${ area }m<sup>2</sup> ∙ ${ floor }" escapeXml="false"/></span>

                                	<c:set var="address" value="${ fn:substring(room.address, 0, fn:indexOf(room.address, '동 ')+1) }"/>
                                    <span class="address"><c:out value="${ address }"/></span>

                                    <span class="explanation"><c:out value="${ room.explanation }"/></span>
                                </div>
                            </li>
                        </a>
                	</c:forEach>
                </ul>

            </article> <!-- 매물 목록 영역 end -->
        </section>
    </main>

    <!-- 이벤트 처리 -->
    <script src="/findMyRoom/resources/js/room.js"></script>
</body>

</html>