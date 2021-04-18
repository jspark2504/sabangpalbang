<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- favicon -->
  <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
  <title>구해줘! 내 방</title>

  <!-- 부트스트랩 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <!-- 아이콘 -->
  <script src="https://kit.fontawesome.com/11694e3acf.js"></script>
  <!-- CSS -->
  <link rel="stylesheet" href="/findMyRoom/resources/css/roomInsertForm.css">

</head>

<body>
  <!-- header -->
  <jsp:include page="../common/header.jsp" />

  <!-- main -->
  <main class="container">
    <h3>매물 정보 수정</h3>
    <hr />
    <!-- 매물등록 양식 outer 영역 -->
    <form class="insert-form form-horizontal" action="${ pageContext.servletContext.contextPath }/room/update" method="post" encType="multipart/form-data">
      <input type="hidden" name="no" value="${ requestScope.room.no }" />
      <!-- 사진 등록 영역 -->
      <section class="form-group file">
        <label for="price" class="control-label">사진 등록 (최대 10장)</label>
        <figure class="imgs">
          <div class="add-img-btn" id="addImgBtn">
            <span>+</span>
          </div>
          <c:forEach var="file" items="${ requestScope.room.fileList }">
            <div>
              <img name="file" src="${ pageContext.servletContext.contextPath }${ file.thumbnailPath }">
              <span class='remove-btn' onclick='removeFile(this);'>
                <img src='data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMi4wMDAwMXB0IiB2aWV3Qm94PSIwIDAgNTEyLjAwMDAxIDUxMi4wMDAwMSIgd2lkdGg9IjUxMi4wMDAwMXB0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Im04MCAxNmgzNTJjMzUuMzQ3NjU2IDAgNjQgMjguNjUyMzQ0IDY0IDY0djM1MmMwIDM1LjM0NzY1Ni0yOC42NTIzNDQgNjQtNjQgNjRoLTM1MmMtMzUuMzQ3NjU2IDAtNjQtMjguNjUyMzQ0LTY0LTY0di0zNTJjMC0zNS4zNDc2NTYgMjguNjUyMzQ0LTY0IDY0LTY0em0wIDAiIGZpbGw9IiNmZmM0NzciLz48ZyBmaWxsPSIjM2UzZDQyIj48cGF0aCBkPSJtNDMyIDBoLTM1MmMtNDQuMTYwMTU2LjA1NDY4NzUtNzkuOTQ1MzEyNSAzNS44Mzk4NDQtODAgODB2MzUyYy4wNTQ2ODc1IDQ0LjE2MDE1NiAzNS44Mzk4NDQgNzkuOTQ1MzEyIDgwIDgwaDM1MmM0NC4xNjAxNTYtLjA1NDY4OCA3OS45NDUzMTItMzUuODM5ODQ0IDgwLTgwdi0zNTJjLS4wNTQ2ODgtNDQuMTYwMTU2LTM1LjgzOTg0NC03OS45NDUzMTI1LTgwLTgwem00OCA0MzJjMCAyNi41MDc4MTItMjEuNDkyMTg4IDQ4LTQ4IDQ4aC0zNTJjLTI2LjUxMTcxOSAwLTQ4LTIxLjQ4ODI4MS00OC00OHYtMzUyYzAtMjYuNTA3ODEyIDIxLjQ4ODI4MS00OCA0OC00OGgzNTJjMjYuNTA3ODEyIDAgNDggMjEuNDg4MjgxIDQ4IDQ4em0wIDAiLz48cGF0aCBkPSJtMzgwLjQ0OTIxOSAxMDguOTI5Njg4LTEyNC40NDkyMTkgMTI0LjQ0NTMxMi0xMjQuNDQ5MjE5LTEyNC40NDUzMTItMjIuNjIxMDkzIDIyLjYyMTA5MyAxMjQuNDQ1MzEyIDEyNC40NDkyMTktMTI0LjQ0NTMxMiAxMjQuNDQ5MjE5IDIyLjYyMTA5MyAyMi42MjEwOTMgMTI0LjQ0OTIxOS0xMjQuNDQ1MzEyIDEyNC40NDkyMTkgMTI0LjQ0NTMxMiAyMi42MjEwOTMtMjIuNjIxMDkzLTEyNC40NDUzMTItMTI0LjQ0OTIxOSAxMjQuNDQ1MzEyLTEyNC40NDkyMTl6bTAgMCIvPjwvZz48L3N2Zz4=' />
              </span>
            </div>
            <div class="file-area" style="display: none;">
              <input type="file" name="file" value="${ pageContext.servletContext.contextPath }${ file.thumbnailPath }">
            </div>
          </c:forEach>
        </figure>
        <div class="file-area">
          <input type="file" name="file1" onchange="loadImg(this)">
          <input type="file" name="file2" onchange="loadImg(this)">
          <input type="file" name="file3" onchange="loadImg(this)">
          <input type="file" name="file4" onchange="loadImg(this)">
          <input type="file" name="file5" onchange="loadImg(this)">
          <input type="file" name="file6" onchange="loadImg(this)">
          <input type="file" name="file7" onchange="loadImg(this)">
          <input type="file" name="file8" onchange="loadImg(this)">
          <input type="file" name="file9" onchange="loadImg(this)">
          <input type="file" name="file10" onchange="loadImg(this)">
        </div>
      </section><!-- 사진 등록 영역 end -->

      <!-- 두 줄짜리 영역 -->
      <section class="row">
        <!-- 왼쪽 입력 폼 -->
        <article class="col-sm-6">
          <!-- 가격 -->
          <div class="form-group">
            <label for="price" class="col-lg-2 control-label">가격</label>
            <div class="col-lg-10">
              <div class="col-xs-10">
                <input type="number" class="form-control" name="price" placeholder="Ex. 1억 5천만 원 → 15000" value="${ requestScope.room.price }">
              </div>
              <div class="col-xs-2 unit">
                만 원
              </div>
            </div>
          </div>
          <!-- 전용면적 -->
          <div class="form-group">
            <label for="area" class="col-lg-2 control-label">전용면적</label>
            <div class="col-lg-10">
              <div class="col-xs-10">
                <input type="number" class="form-control" name="area" placeholder="Ex. 22.6" step="0.01" value="${ requestScope.room.area }">
              </div>
              <div class="col-xs-2 unit">
                m<sup>2</sup>
              </div>
            </div>
          </div>
          <!-- 주소 -->
          <div class="form-group">
            <label class="col-lg-2 control-label">주소</label>
            <div class="col-lg-10">
              <div class="col-xs-10">
                <input type="text" id="address" class="form-control" name="address" value="${ requestScope.room.address }">
              </div>
              <div class="col-xs-2 unit">
                <button type="button" class="btn searchBtn" onclick="search();">검색</button>
              </div>
            </div>
          </div>
          <!-- 다음 지도 API -->
          <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
          <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24e099130b03e272c1eb2889137042a1&libraries=services"></script>
          <!-- 지도 -->
          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
              <div id="map" class="map"></div>
            </div>
          </div>
          <!-- 구조 -->
          <div class="form-group">
            <label for="category" class="col-lg-2 control-label">구조</label>
            <div class="col-lg-10">
              <div class="col-xs-12">
                <select class="form-control" name="category">
                  <c:if test="${ requestScope.room.category.no eq 1}">
                    <option value="1" selected>원룸</option>
                    <option value="2">1.5룸</option>
                    <option value="3">투룸</option>
                    <option value="4">쓰리룸</option>
                  </c:if>
                  <c:if test="${ requestScope.room.category.no eq 2}">
                    <option value="1">원룸</option>
                    <option value="2" selected>1.5룸</option>
                    <option value="3">투룸</option>
                    <option value="4">쓰리룸</option>
                  </c:if>
                  <c:if test="${ requestScope.room.category.no eq 3}">
                    <option value="1">원룸</option>
                    <option value="2">1.5룸</option>
                    <option value="3" selected>투룸</option>
                    <option value="4">쓰리룸</option>
                  </c:if>
                  <c:if test="${ requestScope.room.category.no eq 4}">
                    <option value="1">원룸</option>
                    <option value="2">1.5룸</option>
                    <option value="3">투룸</option>
                    <option value="4" selected>쓰리룸</option>
                  </c:if>
                </select>
              </div>
            </div>
          </div>
        </article><!-- 왼쪽 입력 폼 end -->
        <!-- 오른쪽 입력 폼 -->
        <article class="col-sm-6">
          <!-- 층 정보 -->
          <div class="form-group">
            <label for="roomFloor" class="col-lg-2 control-label">층 정보</label>
            <div class="col-lg-10">
              <span class="col-xs-4">
                <c:set var="roomFloor" value="${ fn:substring(room.floor, 0, fn:indexOf(room.floor, '층')) }"/>
                <input type="number" class="form-control" name="roomFloor" placeholder="해당층" value="${ roomFloor }">
              </span>
              <span class="col-xs-1 unit">
                층
              </span>
              <span class="col-xs-2 slash">
                /
              </span>
              <span class="col-xs-4">
                <c:set var="buildingFloor" value="${ fn:substring(room.floor, fn:indexOf(room.floor, '/')+1, fn:length(room.floor)-1 ) }"/>
                <input type="number" class="form-control" name="buildingFloor" placeholder="전체층" value="${ buildingFloor }">
              </span>
              <span class="col-xs-1 unit">
                층
              </span>
            </div>
          </div>
          <!-- 방향 -->
          <div class="form-group">
            <label for="direction" class="col-lg-2 control-label">방향</label>
            <div class="col-lg-10">
              <div class="col-xs-12">
                <input type="text" class="form-control" name="direction" placeholder="Ex. 남향" value="${ requestScope.room.direction }">
              </div>
            </div>
          </div>
          <!-- 관리비 -->
          <div class="form-group">
            <label for="monthCost" class="col-lg-2 control-label">관리비</label>
            <div class="col-lg-10">
              <div class="col-xs-10">
                <input type="number" class="form-control" name="monthCost" placeholder="Ex. 5만 원 → 5" value="${ requestScope.room.monthCost }">
              </div>
              <div class="col-xs-2 unit">
                만 원
              </div>
            </div>
          </div>
          <!-- 관리비 포함 항목 -->
          <div class="form-group check costInclude">
            <label for="costInclude" class="col-lg-2 control-label">포함 항목</label>
            <div class="col-lg-10">
              <div class="col-xs-12 list">
                <span>
                  <c:if test="${ not empty requestScope.room.electricity }">
                    <input type="checkbox" id="electricity" value="Y" name="electricity" checked>
                  </c:if>
                  <c:if test="${ empty requestScope.room.electricity }">
                    <input type="checkbox" id="electricity" value="Y" name="electricity">
                  </c:if>
                  <label for="electricity">전기</label>
                </span>
                <span>
                  <c:if test="${ not empty requestScope.room.gas }">
                    <input type="checkbox" id="gas" value="Y" name="gas" checked>
                  </c:if>
                  <c:if test="${ empty requestScope.room.gas }">
                    <input type="checkbox" id="gas" value="Y" name="gas">
                  </c:if>
                  <label for="gas">가스</label>
                </span>
                <span>
                  <c:if test="${ not empty requestScope.room.water }">
                    <input type="checkbox" id="water" value="Y" name="water" checked>
                  </c:if>
                  <c:if test="${ empty requestScope.room.water }">
                    <input type="checkbox" id="water" value="Y" name="water">
                  </c:if>
                  <label for="water">수도</label>
                </span>
                <span>
                  <c:if test="${ not empty requestScope.room.internet }">
                    <input type="checkbox" id="internet" value="Y" name="internet" checked>
                  </c:if>
                  <c:if test="${ empty requestScope.room.internet }">
                    <input type="checkbox" id="internet" value="Y" name="internet">
                  </c:if>
                  <label for="internet">인터넷</label>
                </span>
                <span>
                  <c:if test="${ not empty requestScope.room.tv }">
                    <input type="checkbox" id="tv" value="Y" name="tv" checked>
                  </c:if>
                  <c:if test="${ empty requestScope.room.tv }">
                    <input type="checkbox" id="tv" value="Y" name="tv">
                  </c:if>
                  <label for="tv">티비</label>
                </span>
              </div>
            </div>
          </div>
          <!-- 준공날짜 -->
          <div class="form-group">
            <label for="constructionDate" class="col-lg-2 control-label">준공날짜</label>
            <div class="col-lg-10">
              <div class="col-xs-12">
                <input type="date" class="form-control" name="constructionDate"  value="${ requestScope.room.constructionDate }">
              </div>
            </div>
          </div>
          <!-- 입주 가능일 -->
          <div class="form-group">
            <label for="availableDate" class="col-lg-2 control-label">입주가능일</label>
            <div class="col-lg-10">
              <div class="col-xs-12">
                <input type="text" class="form-control" name="availableDate" placeholder="Ex. 즉시 입주" value="${ requestScope.room.availableDate }">
              </div>
            </div>
          </div>
          <!-- 교통 정보 -->
          <div class="form-group">
            <label for="transportationInfo" class="col-lg-2 control-label">교통 정보</label>
            <div class="col-lg-10">
              <div class="col-xs-12">
                <input type="text" class="form-control" name="transportationInfo" placeholder="Ex. 2호선 신림역 도보 5분, 인근 버스정류장 도보 3분" value="${ requestScope.room.transportationInfo }">
              </div>
            </div>
          </div>
        </article>
      </section><!-- 두 줄짜리 영역 end -->

      <section><!-- 한 줄짜리 영역 -->
        <!-- 옵션 정보 -->
        <article class="form-group check">
          <label for="" class="col-lg-1 control-label title">옵션 정보</label>
          <div class="col-lg-11">
            <div class="col-xs-12 list">
              <span>
                <c:if test="${ not empty requestScope.room.washingMachine }">
                  <input type="checkbox" id="washingMachine" value="Y" name="washingMachine" checked>
                </c:if>
                <c:if test="${ empty requestScope.room.washingMachine }">
                  <input type="checkbox" id="washingMachine" value="Y" name="washingMachine">
                </c:if>
                <label for="washingMachine">세탁기</label>
              </span>
              <span>
                <c:if test="${ not empty requestScope.room.refrigerator }">
                  <input type="checkbox" id="refrigerator" value="Y" name="refrigerator" checked>
                </c:if>
                <c:if test="${ empty requestScope.room.refrigerator }">
                  <input type="checkbox" id="refrigerator" value="Y" name="refrigerator">
                </c:if>
                <label for="refrigerator">냉장고</label>
              </span>
              <span>
                <c:if test="${ not empty requestScope.room.airConditioner }">
                  <input type="checkbox" id="airConditioner" value="Y" name="airConditioner" checked>
                </c:if>
                <c:if test="${ empty requestScope.room.airConditioner }">
                  <input type="checkbox" id="airConditioner" value="Y" name="airConditioner">
                </c:if>
                <label for="airConditioner">에어컨</label>
              </span>
              <span>
                <c:if test="${ not empty requestScope.room.gasStove }">
                  <input type="checkbox" id="gasStove" value="Y" name="gasStove" checked>
                </c:if>
                <c:if test="${ empty requestScope.room.gasStove }">
                  <input type="checkbox" id="gasStove" value="Y" name="gasStove">
                </c:if>
                <label for="gasStove">인덕션/가스레인지</label>
              </span>
              <span>
                <c:if test="${ not empty requestScope.room.elevator }">
                  <input type="checkbox" id="elevator" value="Y" name="elevator" checked>
                </c:if>
                <c:if test="${ empty requestScope.room.elevator }">
                  <input type="checkbox" id="elevator" value="Y" name="elevator">
                </c:if>
                <label for="elevator">엘리베이터</label>
              </span>
              <span>
                <c:if test="${ not empty requestScope.room.pet }">
                  <input type="checkbox" id="pet" value="Y" name="pet" checked>
                </c:if>
                <c:if test="${ empty requestScope.room.pet }">
                  <input type="checkbox" id="pet" value="Y" name="pet">
                </c:if>
                <label for="pet">반려동물 가능</label>
              </span>
              <span>
                <c:if test="${ not empty requestScope.room.parking }">
                  <input type="checkbox" id="parking" value="Y" name="parking" checked>
                </c:if>
                <c:if test="${ empty requestScope.room.parking }">
                  <input type="checkbox" id="parking" value="Y" name="parking">
                </c:if>
                <label for="parking">주차 가능</label>
              </span>
            </div>
          </div>
        </article>
        <!-- 한 줄 소개 -->
        <article class="form-group">
          <label for="" class="col-lg-1 control-label title">한 줄 소개</label>
          <div class="col-lg-11">
            <div class="col-xs-12">
              <input name="title" class="form-control" placeholder="간략한 설명을 적어주세요." value="${ requestScope.room.title }">
            </div>
          </div>
        </article>
        <!-- 상세 설명 -->
        <article class="form-group">
          <label for="" class="col-lg-1 control-label title">상세 설명</label>
          <div class="col-lg-11">
            <div class="col-xs-12">
              <textarea name="explanation" class="form-control" rows="5" placeholder="소개하고 싶은 내용을 자유롭게 적어주세요.">${ requestScope.room.explanation }</textarea>
            </div>
          </div>
        </article>

      </section><!-- 한 줄짜리 영역 end -->

      <!-- 등록 버튼 -->
      <button class="btn btn-lg btn-block okbtn" type="submit">수정하기</button>

    </form><!-- 매물등록 양식 outer 영역 end -->
  </main><!-- /container -->

  <!-- footer -->
  <jsp:include page="../common/footer.jsp" />

  <!-- script -->
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="/findMyRoom/resources/js/roomUpdateForm.js"></script>
</body>

</html>