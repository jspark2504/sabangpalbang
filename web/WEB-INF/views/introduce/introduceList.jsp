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
<link rel="stylesheet" href="/findMyRoom/resources/css/introduce.css">
<!-- favicon & title -->
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<title>구해줘! 내 방</title>
</head>
<body>
	<!-- header include -->
	<jsp:include page="../common/header.jsp" />
	<main>
		<section class="introduce">
			<h3>
				소개할게요
			</h3>
			<hr>
			<article class="list01">
				<div class="nmh">
					<img alt="nmh" src="/findMyRoom/resources/image/mhn.png">
					<span>
						<ul>
							<li>
								402 공인중개소
							</li>
						</ul>
					</span>
				</div>

			</article>
		</section>
	</main>


	<!-- footer include -->
	<jsp:include page="../common/footer.jsp" />

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
	</script>
</body>
</html>