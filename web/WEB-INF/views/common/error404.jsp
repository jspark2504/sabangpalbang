<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
   <title>구해줘! 내 방</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
   <link rel="stylesheet" href="/findMyRoom/resources/css/free_board.css?">      
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
	
	<br><br><br><br><br><br><br><br>
	<h1 align="center">페이지를 찾을 수 없습니다(404)</h1>
	<h3 align="center">페이지 경로를 확인 해주세요</h3>
	<br><br><br><br>
	<div align="center">
	<button onclick="location.href='${ pageContext.servletContext.contextPath}'" class="btn">홈으로</button>
	<button type="button" onclick="refresh();" class="btn">새로고침</button>
	</div>
	
 	<script>
	function refresh(){
		location.href = location.href;
	}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>





