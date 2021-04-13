<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- main 추가 css -->
<link rel="stylesheet" href="/findMyRoom/resources/css/main.css">
<!-- favicon & title -->
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<title>구해줘! 내 방</title>
</head>
<body>
	<!-- header include -->
		<jsp:include page="../common/header.jsp" />

	<!-- infoBoard -->
	<section class="container-fluid jumbo-container">
		<section class="main">
			<img class="banner" src="/findMyRoom/resources/image/banner.png" alt="...">
			<article class="search">
				<h1>
					<b>
						전세 어디까지 알고 계신가요?
					</b>
				</h1>
				<div class="col-lg-6">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="정보게시판에서 원하는 정보를 검색해보세요">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search">
									</i>
								</button>
							</span>
					</div>
				</div>
				<a class="all-info" href="${ pageContext.servletContext.contextPath }/infoboard/list">
					→ 모든 정보 보러가기
				</a>
			</article>
		</section>
	</section>

	<!-- introduce -->
	<section class="container-fluid" style="width: 80%; margin: auto;">
		<section class="row">
		</section>
			<article class="col-md-4 main-contents">
				<div class="introduce">
					<h4>
						<b>소개할게요</b>
					</h4>
					<a class="btn-sm" href="${ pageContext.servletContext.contextPath }/introduce/list">
						더보기
					</a>
				</div>
				<hr>
				<ul>
					<li class="item">
						<a href="#">
							<span class="img">
								<img src="/findMyRoom/resources/image/mhn.png" alt="..." class="img-circle">
							</span>
							<span class="info">
								<span class="name">
									나문휘
									<br>
								</span>
								<span class="star">
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
									<span class="review_no">
										후기 21개
									</span>
							</span>
							<span class="review_content">
								진짜 딱 맘에드는 곳들만 보여주셔서 너무 좋았어요.
							</span>
						    </span>
						</a>
					</li>
					<li class="item">
						<a href="#">
							<span class="img">
								<img src="/findMyRoom/resources/image/sjl.png" alt="..." class="img-circle">
							</span>
							<span class="info">
								<span class="name">
									이숭재
									<br>
								</span>
								<span class="star">
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
									<span class="review_no">
										후기 15개
									</span>
							</span>
							<span class="review_content">
								허위매물일까봐 걱정했는데 사진설명이랑 똑같았어요.
							</span>
							</span>
						</a>
					</li>
				</ul>
			</article>

			<!-- freeBoard -->
			<section class="col-md-4 main-contents">
				<article class="free_board">
					<h4>
						<b>
							자유게시판
						</b>
					</h4>
					<a class="btn-sm" href="${ pageContext.servletContext.contextPath }/freeboard/list" role="button">
						더보기
					</a>
				</article>
				<hr>
				<article class="board">
					<ul>
						<li class="title">
							<a href="#">
								방구들아 이거 집주인이 잘못한 거 맞지?
							</a>
						</li>
						<li class="title">
							<a href="#">
								우리집 인테리어 봐줄 사람 ㅋㅋㅋ
							</a>
						</li>
						<li class="title">
							<a href="#">
								니네 야식 뭐 먹었냐?
							</a>
						</li>
						<li class="title">
							<a href="#">
								나 큰일났음 낼 이사인데 아직도 못 자는 중;;
							</a>
						</li>
						<li class="title">
							<a href="#">
								신림역 근처 맛집 추천 좀
							</a>
						</li>
					</ul>
				</article>
			</section>

			<!-- notice -->
			<section class="col-md-4 main-contents">
				<article class="notice">
					<h4>
						<b>
							공지사항
						</b>
					</h4>
					<a class="btn-sm" href="${ pageContext.servletContext.contextPath }/notice/list" role="button">
						더보기
					</a>
				</article>
				<hr>
				<article class="board">
					<ul>
						<li class="title">
							<a href="#">
								[공지] 사방팔방 개인정보 처리방침(2021/04/19) 개정방안
							</a>
						</li>
						<li class="title">
							<a href="#">
								[공지] 사방팔방 개인정보 처리방침(2021/04/01) 개정방안
							</a>
						</li>
						<li class="title">
							<a href="#">
								[공지] 사방팔방 개인정보 처리방침(2021/03/28) 개정방안
							</a>
						</li>
						<li class="title">
							<a href="#">
								[공지] 사방팔방 개인정보 처리방침(2021/03/22) 개정방안
							</a>
						</li>
						<li class="title">
							<a href="#">
								[공지] 사방팔방 개인정보 처리방침(2021/03/10) 개정방안
							</a>
						</li>
					</ul>
			</article>
		</section>
	</section>

	<!-- ad -->
	<a href="https://ohou.se/">
		<img class="img-responsive center-block" src="/findMyRoom/resources/image/ad.png" alt=".." />
	</a>

	<!-- footer include -->
	<jsp:include page="../common/footer.jsp" />

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
	</script>
</body>
</html>