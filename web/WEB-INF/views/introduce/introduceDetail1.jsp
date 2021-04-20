<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- introduce 추가 css -->
<link rel="stylesheet" href="/findMyRoom/resources/css/introduceDetail.css">
<!-- favicon & title -->
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<title>구해줘! 내 방</title>
</head>
<body>
  <!-- header include -->
  <jsp:include page="../common/header.jsp" />

  <!-- introduce detail -->
  <main class="container introduce-detail">
    <section class="introduce-title">
      <h3>
        리뷰 내역
      </h3>
    <hr>
    </section>
    <!-- mhn introduce all -->
    <section class="introduce-list-all">
      <!-- mhn info -->
      <article class="office-info-all">
          <div class="office-info-title">
            <img alt="mhn" src="/findMyRoom/resources/image/mhn.png">
            <p>
              402 공인중개소
            </p>
          </div>
          <div class="office-info">
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
          </div> <!-- office-info fin. -->
      </article> <!-- office-info-all fin. -->

      <!-- mhn review -->
      <article class="review-list-all">
        <div class="review-list">
          <span class="review-star">
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
          	<span class="review-date">
          		2021/04/16
          	</span>
          </span>
            <ul class="review-content">
              <li>
                제목 &nbsp; : &nbsp; 넘조아용
              </li>
              <li>
                내용 &nbsp; : &nbsp; 진짜 너.무.좋.아.요
             </li>
            </ul>
        </div> <!-- review-list fin. -->
        <hr>
        <div class="review-list">
          <span class="review-star">
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
          	<span class="review-date">
          		2021/03/27
          	</span>
          </span> <!-- review-star fin. -->
            <ul class="review-content">
              <li>
                제목 &nbsp; : &nbsp; 대만족!!!!!!!
              </li>
              <li>
                내용 &nbsp; : &nbsp; 너무 깔끔하고 조용하고 진짜 대만족입니다!!!! 중개사님도 너무 친절하세요
              </li>
            </ul>
        </div> <!-- review-list fin. -->
        <hr>
        <div class="review-list">
          <span class="review-star">
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
          	<span class="review-date">
          		2021/03/22
          	</span>
          </span> <!-- review-star fin. -->
            <ul class="review-content">
              <li>
                제목 &nbsp; : &nbsp; 살만합니다
              </li>
              <li>
                내용 &nbsp; : &nbsp; 채광도 좋고 넓고 깔끔해요!!
              </li>
            </ul>
        </div> <!-- review-list fin. -->
        <hr>
        <div class="review-list">
          <span class="review-star">
          	<span class="glyphicon glyphicon-star" aria-hidden="true">
          	</span>
          	<span class="glyphicon glyphicon-star" aria-hidden="true">
          	</span>
          	<span class="glyphicon glyphicon-star" aria-hidden="true">
          	</span>
          	<span class="glyphicon glyphicon-star empty" aria-hidden="true">
          	</span>
          	<span class="glyphicon glyphicon-star empty" aria-hidden="true">
          	</span>
          	<span class="review-date">
          		2021/03/05
          	</span>
          </span> <!-- review-star fin. -->
            <ul class="review-content">
              <li>
                제목 &nbsp; : &nbsp; 다 좋은데 조금 ㅠㅠ
              </li>
              <li>
                내용 &nbsp; : &nbsp; 진짜 다 좋은데 벌레가 나왔네요 첫날부터 ㅠㅠㅠ 중개사님도 친절하시고 다 좋았는데 ㅠㅠ 아쉬워요...
              </li>
            </ul>
        </div> <!-- review-list fin. -->
        <hr>
      </article> <!-- review-list-all fin. -->
    </section> <!-- introduce-list-all fin. -->
  </main> <!-- container introduce-detail fin. -->

  <!-- footer include -->
  <jsp:include page="../common/footer.jsp" />

  <!-- bootstrap js -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
  </script>
  	<script src="/findMyRoom/resources/js/sticky.js"></script>
  
</body>
</html>