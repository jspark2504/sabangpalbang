<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon -->
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- main 추가 css -->
<link rel="stylesheet" href="/findMyRoom/resources/css/main.css">

<title>구해줘! 내 방</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container-fluid jumbo-container">
		<div class="main">
			<img class="banner" src="/findMyRoom/resources/image/메인배너.png"
				alt="...">
			<h1 class="search">
				<b>전세 어디까지 알고 계신가요?</b>
			</h1>
		</div>
	</div>

	<section class="container-fluid" style="width: 80%; margin: auto;">
		<!-- Example row of columns -->
		<section class="row">
			<article class="col-md-4 main-contents">
				<div class="introduce">
					<h4>
						<b>소개할게요</b>
					</h4>
					<a class="btn-sm" href="#" role="button">더보기</a>
				</div>
				<hr>
				<ul>
					<li class="item"><a href="#">
							<span class="img">
								<img src="/findMyRoom/resources/image/나문휘.png" alt="..."
									class="img-circle">
							</span>
							<div class="info">
								<span class="name">나문휘<br></span>
								<div class="star">
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="review_no">후기 21개</span>
								</div>
								<span class="review_content">진짜 딱 맘에드는 곳들만 보여주셔서 너무 좋았어요.</span>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="img">
								<img src="/findMyRoom/resources/image/이숭재.png" alt="..."
									class="img-circle">
							</div>
							<div class="info">
								<span class="name">이숭재<br></span>
								<div class="star">
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									<span class="glyphicon glyphicon-star empty" aria-hidden="true"></span>
									<span class="review_no">후기 15개</span>
								</div>
								<span class="review_content">허위매물일까봐 걱정했는데 사진설명이랑 똑같았어요.</span>
							</div>
					</a></li>
				</ul>
			</article>
			<div class="col-md-4 main-contents">
				<div class="free_board">
					<h4>
						<b>자유게시판</b>
					</h4>
					<a class="btn-sm" href="#" role="button">더보기</a>
				</div>
				<hr>
				<div class="board">
					<ul>
						<li class="title"><a href="#">방구들아 이거 집주인이 잘못한 거 맞지?</a></li>
						<li class="title"><a href="#">우리집 인테리어 봐줄 사람 ㅋㅋㅋ</a></li>
						<li class="title"><a href="#">니네 야식 뭐 먹었냐?</a></li>
						<li class="title"><a href="#">나 큰일났음 낼 이사인데 아직도 못 자는 중;;</a></li>
						<li class="title"><a href="#">신림역 근처 맛집 추천 좀</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-4 main-contents">
				<div class="notice">
					<h4>
						<b>공지사항</b>
					</h4>
					<a class="btn-sm" href="#" role="button">더보기</a>
				</div>
				<hr>
				<div class="board">
					<ul>
						<li class="title"><a href="#">[공지] 사방팔방 개인정보
								처리방침(2021/04/19) 개정방안</a></li>
						<li class="title"><a href="#">[공지] 사방팔방 개인정보
								처리방침(2021/04/01) 개정방안</a></li>
						<li class="title"><a href="#">[공지] 사방팔방 개인정보
								처리방침(2021/03/28) 개정방안</a></li>
						<li class="title"><a href="#">[공지] 사방팔방 개인정보
								처리방침(2021/03/22) 개정방안</a></li>
						<li class="title"><a href="#">[공지] 사방팔방 개인정보
								처리방침(2021/03/10) 개정방안</a></li>
					</ul>
				</div>
			</div>
		</section>
	</section>
	<img class="img-responsive center-block"
		src="/findMyRoom/resources/image/AD1.png" alt="" />




	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>