<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- favicon & title -->
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<title>구해줘! 내 방</title>
<!-- header css -->
<link rel="stylesheet" href="/findMyRoom/resources/css/header.css">
</head>
<body>
	<header>
		<div class="navbar-contents">
			<div class="navbar_logo">
				<a href="${ pageContext.servletContext.contextPath }">
					<img src="/findMyRoom/resources/image/findmyroom.png" alt="">
				</a>
			</div>
			<ul class="navbar_menu">
				<li>
					<a href="${ pageContext.servletContext.contextPath }/room/list">
						원룸
					</a>
				</li>
				<li>
					<a href="#">
						1.5룸
					</a>
				</li>
				<li>
					<a href="#">
						투룸
					</a>
				</li>
				<li>
					<a href="#">
						쓰리룸
					</a>
				</li>
			</ul>
			<div class="btn-gr">
			<!-- 로그인이 필요한 경우 -->
			<c:if test="${ empty sessionScope.loginMember }">
				<button type="button" class="drop-menu-btn" onclick="location.href='${ pageContext.servletContext.contextPath }/member/login'">
					로그인/회원가입
				</button>
			</c:if>
			<!-- 로그인이 되어 있는 경우 -->
			<c:if test="${ !empty sessionScope.loginMember }">
				<button type="button" class="drop-menu-btn" onclick="function()">
					<c:out value="${ sessionScope.loginMember.nickname }"/>
						님 ▼
				</button>
				<ul class="drop-menu">
					<li>
						<a href="${ pageContext.servletContext.contextPath }/member/logout">
							로그아웃
						</a>
					</li>
					<hr />
					<li>
						<a href="">
							찜한 매물
						</a>
					</li>
					<hr />
					<li>
						<a href="">
							내 서류
						</a>
					</li>
					<hr />
					<li>
						<a href="${ pageContext.servletContext.contextPath }/member/update">
							내 정보
						</a>
					</li>
				</ul>
			</c:if>
				<a href="#" class="navbar_toggleBtn">
					<i class="fas fa-bars">
					</i>
				</a>
			</div>
		</div>
		<hr class="hr-shadow">
	</header>
<!-- icon src -->
<script src="https://kit.fontawesome.com/11694e3acf.js">
</script>
<!-- header js -->
<script src="/findMyRoom/resources/js/header.js" defer>
</script>
</body>
</html>