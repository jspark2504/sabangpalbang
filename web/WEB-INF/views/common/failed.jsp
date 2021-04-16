<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">${ requestScope.message }</h1>
	
	<button onclick="location.href='${ pageContext.servletContext.contextPath }'">홈으로 이동</button>
</body>
</html>