
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <h3>매물 등록</h3>
    <hr />
    <!-- 매물등록 양식 outer 영역 -->
    <form class="insert-form form-horizontal" action="${ pageContext.servletContext.contextPath }/room/insert" method="post" encType="multipart/form-data">
      <!-- 사진 등록 영역 -->
      <section class="form-group file">
        <label for="price" class="control-label">사진 등록 (최대 10장)</label>
        <figure class="imgs">
          <div class="add-img-btn" id="addImgBtn">
            <span>+</span>
          </div>
        </figure>
        <div class="file-area">

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
                <input type="number" class="form-control" name="price" placeholder="Ex. 1억 5천만 원 → 15000" required>
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
                <input type="number" class="form-control" name="area" placeholder="Ex. 22.6" step="0.01" required>
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
                <input type="text" id="address" class="form-control" name="address" required>
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
                  <option value="1" selected>원룸</option>
                  <option value="2">1.5룸</option>
                  <option value="3">투룸</option>
                  <option value="4">쓰리룸</option>
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
                <input type="number" class="form-control" name="roomFloor" placeholder="해당층" required>
              </span>
              <span class="col-xs-1 unit">
                층
              </span>
              <span class="col-xs-2 slash">
                /
              </span>
              <span class="col-xs-4">
                <input type="number" class="form-control" name="buildingFloor" placeholder="전체층" required>
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
                <input type="text" class="form-control" name="direction" placeholder="Ex. 남향" required>
              </div>
            </div>
          </div>
          <!-- 관리비 -->
          <div class="form-group">
            <label for="monthCost" class="col-lg-2 control-label">관리비</label>
            <div class="col-lg-10">
              <div class="col-xs-10">
                <input type="number" class="form-control" name="monthCost" placeholder="Ex. 5만 원 → 5" required>
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
                  <input type="checkbox" id="electricity" value="Y" name="electricity">
                  <label for="electricity">전기</label>
                </span>
                <span>
                  <input type="checkbox" id="gas" value="Y" name="gas">
                  <label for="gas">가스</label>
                </span>
                <span>
                  <input type="checkbox" id="water" value="Y" name="water">
                  <label for="water">수도</label>
                </span>
                <span>
                  <input type="checkbox" id="internet" value="Y" name="internet">
                  <label for="internet">인터넷</label>
                </span>
                <span>
                  <input type="checkbox" id="tv" value="Y" name="tv">
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
                <input type="date" class="form-control" name="constructionDate" required>
              </div>
            </div>
          </div>
          <!-- 입주 가능일 -->
          <div class="form-group">
            <label for="availableDate" class="col-lg-2 control-label">입주가능일</label>
            <div class="col-lg-10">
              <div class="col-xs-12">
                <input type="text" class="form-control" name="availableDate" placeholder="Ex. 즉시 입주" required>
              </div>
            </div>
          </div>
          <!-- 교통 정보 -->
          <div class="form-group">
            <label for="transportationInfo" class="col-lg-2 control-label">교통 정보</label>
            <div class="col-lg-10">
              <div class="col-xs-12">
                <input type="text" class="form-control" name="transportationInfo" placeholder="Ex. 2호선 신림역 도보 5분, 인근 버스정류장 도보 3분" required>
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
                <input type="checkbox" id="washingMachine" value="Y" name="washingMachine">
                <label for="washingMachine">세탁기</label>
              </span>
              <span>
                <input type="checkbox" id="refrigerator" value="Y" name="refrigerator">
                <label for="refrigerator">냉장고</label>
              </span>
              <span>
                <input type="checkbox" id="airConditioner" value="Y" name="airConditioner">
                <label for="airConditioner">에어컨</label>
              </span>
              <span>
                <input type="checkbox" id="gasStove" value="Y" name="gasStove">
                <label for="gasStove">인덕션/가스레인지</label>
              </span>
              <span>
                <input type="checkbox" id="elevator" value="Y" name="elevator">
                <label for="elevator">엘리베이터</label>
              </span>
              <span>
                <input type="checkbox" id="pet" value="Y" name="pet">
                <label for="pet">반려동물 가능</label>
              </span>
              <span>
                <input type="checkbox" id="parking" value="Y" name="parking">
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
              <input name="title" class="form-control" placeholder="간략한 설명을 적어주세요." required>
            </div>
          </div>
        </article>
        <!-- 상세 설명 -->
        <article class="form-group">
          <label for="" class="col-lg-1 control-label title">상세 설명</label>
          <div class="col-lg-11">
            <div class="col-xs-12">
              <textarea name="explanation" class="form-control" rows="5" placeholder="소개하고 싶은 내용을 자유롭게 적어주세요." required></textarea>
            </div>
          </div>
        </article>

      </section><!-- 한 줄짜리 영역 end -->

      <!-- 등록 버튼 -->
      <button class="btn btn-lg btn-block okbtn" type="submit">등록하기</button>

    </form><!-- 매물등록 양식 outer 영역 end -->
  </main><!-- /container -->

  <!-- footer -->
  <jsp:include page="../common/footer.jsp" />

  <!-- script -->
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="/findMyRoom/resources/js/roomInsertForm.js"></script>

</body>

</html>