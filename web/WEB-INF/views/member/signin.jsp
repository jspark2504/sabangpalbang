<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">

<title>구해줘! 내 방 로그인</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/findMyRoom/resources/css/signin.css">

</head>

<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container">
	<c:if test="${empty sessionScope.loginMember }">
	<div class="form-signin" style="height:450px;">
		<form id="loginForm" action="${pageContext.servletContext.contextPath}/member/login" method="post">
			<br>
			<img src="/findMyRoom/resources/image/logIn.PNG" class="logo">
			<br>
			<!-- <h2 class="form-signin-heading">Please sign in</h2> -->
			<!-- <label for="inputId" class="sr-only">ID</label> -->
			<!-- <label for="inputPassword" class="sr-only">Password</label> -->
			<input type="text" name="userId" class="form-control" placeholder="아이디를 입력해주세요." required autofocus> 
			<input type="password" name="userPwd" class="form-control" placeholder="비밀번호를 입력해주세요." required>
			<br>
			<button type="button" class="findId" onclick="location.href='${ pageContext.servletContext.contextPath }/member/findId'">아이디찾기</button>
			<button type="button" class="findPwd" onclick="location.href='${ pageContext.servletContext.contextPath }/member/findPw'">비밀번호찾기</button>
			<button type="button" class="signUp" onclick="location.href='${ pageContext.servletContext.contextPath }/member/regist'">회원가입</button>
			<br><br>
			<button class="btn btn-lg btn-block" type="submit" id="login">시작하기</button>
		</form>
		</div>
		</c:if>
	</div>
  <jsp:include page="../common/footer.jsp" />
</body>

</html>