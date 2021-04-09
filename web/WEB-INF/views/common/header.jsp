<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/findMyRoom/resources/css/header.css">
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<title>구해줘! 내 방</title>
<script src="https://kit.fontawesome.com/11694e3acf.js"></script>
<script src="/findMyRoom/resources/js/header.js" defer></script>
</head>
<body>
	<header>
		<div class="navbar-contents">
			<div class="navbar_logo">
				<a href="#"><img
					src="/findMyRoom/resources/image/findmyroom.png" alt=""></a>
			</div>
			<ul class="navbar_menu">
				<li><a href="#">원룸</a></li>
				<li><a href="#">1.5룸</a></li>
				<li><a href="#">투룸</a></li>
				<li><a href="#">쓰리룸</a></li>
			</ul>
			<div class="btn-gr">
				<button type="button" class="drop-menu-btn"
					onclick="location.href='${ pageContext.servletContext.contextPath }/member/regist'">로그인/회원가입
				</button>
				<a href="#" class="navbar_toggleBtn"><i class="fas fa-bars"></i></a>

			</div>
		</div>
		<hr>
	</header>
</body>
</html>