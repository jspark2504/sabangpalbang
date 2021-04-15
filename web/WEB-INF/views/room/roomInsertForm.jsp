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
<link rel="stylesheet" href="/findMyRoom/resources/css/roomInsertForm.css">
<!-- favicon & title -->
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<title>구해줘! 내 방</title>
</head>
<body>
  <!-- header include -->
  <jsp:include page="../common/header.jsp" />

  <main class="container room-insert">
    <section class="room-insert-title">
      <h3>
        매물 등록
      </h3>
      <hr>
    </section>
    <section class="room-insert-info">
      <h4>
        기본 정보
      </h4>
      <article class="room-price-all">
        <h5 class="room-price-title">
          가격
        </h5>
        <ul>
          <li>
            보증금 <input type="text"> 만원
          </li>
          <li>
            관리비 <input type="text"> 만원
          </li>
        </ul>
      </article>
    </section>
  </main>

  <!-- footer include -->
  <jsp:include page="../common/footer.jsp" />

  <!-- bootstrap js -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
  </script>
</body>
</html>