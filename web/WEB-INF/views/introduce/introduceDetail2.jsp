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
    <!-- sjl introduce all -->
    <section class="introduce-list-all">
      <!-- sjl info -->
      <article class="office-info-all">
          <div class="office-info-title">
            <img alt="mhn" src="/findMyRoom/resources/image/sjl.png">
            <p>
              짱조아 공인중개소
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
          </div> <!-- office-info fin. -->
      </article> <!-- office-info-all fin. -->

      <!-- sjl review -->
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
                제목 &nbsp; : &nbsp; 너무 만족~
              </li>
              <li>
                내용 &nbsp; : &nbsp; 깔끔 조용 눈부심 그 자체.
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
                제목 &nbsp; : &nbsp; 완전 넓네요~
              </li>
              <li>
                내용 &nbsp; : &nbsp; 진짜 넓고 깔끔해요~~중개사님도 너무 잘생기셨어요ㅋㅋㅋ 공유인줄...
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
                제목 &nbsp; : &nbsp; 진짜 최고네용
              </li>
              <li>
                내용 &nbsp; : &nbsp; 뷰도 원룸치고 너무 좋고 곰팡이도 없고 화장실도 넓네요!! 잘 살겠습니다
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
          		2021/03/05
          	</span>
          </span> <!-- review-star fin. -->
            <ul class="review-content">
              <li>
                제목 &nbsp; : &nbsp; 이 가격에 이 퀄리티....
              </li>
              <li>
                내용 &nbsp; : &nbsp; 너무 좋은 거 아닙니까..? 옵션도 풀옵션이고 다 새거라서 기분이 좋네요! 무엇보다 중개사님 얼굴 존잘..
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