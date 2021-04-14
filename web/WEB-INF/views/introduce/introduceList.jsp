<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- introduce 추가 css -->
<link rel="stylesheet" href="/findMyRoom/resources/css/introduceList.css">
<!-- favicon & title -->
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<title>구해줘! 내 방</title>
</head>
<body>
  <!-- header include -->
  <jsp:include page="../common/header.jsp" />

  <!-- introduce -->
  <section class="container introduce">
    <h3>
      소개할게요
     </h3>
    <hr>
    <!-- mhn -->
    <article class="office">
      <!-- info -->
      <div class="office-info">
        <div class="office-info-title">
          <img alt="mhn" src="/findMyRoom/resources/image/mhn.png">
          <p>
            402 공인중개소
          </p>
        </div>
        <ul class="office-info-list">
          <li>
            대표
          </li>
          <li>
            대표번호
          </li>
          <li>
            소재지
          </li>
          <li>
            중개 전문 분야
          </li>
        </ul>
        <ul class="office-info-content">
          <li>
            나문휘 (92460000-08541)
          </li>
          <li>
            02-151-5488
          </li>
          <li>
            서울 관악구 신림동 123-12
          </li>
          <li>
            원룸
          </li>
        </ul>
      </div>
      <!-- review -->
      <div class="office-review">
        <div class="office-star">
          <span class="star-score">
              4.9
          </span>
          <span class="glyphicon glyphicon-star" aria-hidden="true">
          </span>
          <span class="glyphicon glyphicon-star" aria-hidden="true">
          </span>
          <span class="glyphicon glyphicon-star" aria-hidden="true">
          </span>
          <span class="glyphicon glyphicon-star" aria-hidden="true">
          </span>
          <span class="glyphicon glyphicon-star" aria-hidden="true">
          </span>
        </div>
        <div class="show-review">
          <a href="${ pageContext.servletContext.contextPath }/introduce/detail1">
            리뷰 보기 >
          </a>
        </div>
      </div>
    </article>

    <hr>

    <!-- sjl -->
    <article class="office">
      <!-- info -->
      <div class="office-info">
        <div class="office-info-title">
          <img alt="mhn" src="/findMyRoom/resources/image/sjl.png">
          <p>
            짱조아 공인중개소
          </p>
        </div>
        <ul class="office-info-list">
          <li>
            대표
          </li>
          <li>
            대표번호
          </li>
          <li>
            소재지
          </li>
          <li>
            중개 전문 분야
          </li>
        </ul>
        <ul class="office-info-content">
          <li>
            이숭재 (92861000-05811)
          </li>
          <li>
            02-732-6546
          </li>
          <li>
            서울 관악구 봉천동 456-78
          </li>
          <li>
            원룸
          </li>
        </ul>
      </div>
      <!-- review -->
      <div class="office-review">
        <div class="office-star">
          <span class="star-score">
              4.0
          </span>
          <span class="glyphicon glyphicon-star" aria-hidden="true">
          </span>
          <span class="glyphicon glyphicon-star" aria-hidden="true">
          </span>
          <span class="glyphicon glyphicon-star" aria-hidden="true">
          </span>
          <span class="glyphicon glyphicon-star" aria-hidden="true">
          </span>
          <span class="glyphicon glyphicon-star empty" aria-hidden="true">
          </span>
        </div>
        <div class="show-review">
          <a href="${ pageContext.servletContext.contextPath }/introduce/detail2">
            리뷰 보기 >
          </a>
        </div>
      </div>
    </article>
  <hr>
  </section>

  <!-- footer include -->
  <jsp:include page="../common/footer.jsp" />

  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
  </script>
</body>
</html>