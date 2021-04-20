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
   <link rel="stylesheet" href="/findMyRoom/resources/css/error404.css">      
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
	
	<section class="error404page">
		<h3 class="error404Text">페이지를 찾을 수 없습니다(404)</h3>
		<h3>페이지 경로를 확인 해주세요</h3>
	</section>
	
 	<script>
	function refresh(){
		location.href = location.href;
	}
	</script>
	
	<jsp:include page="../common/footer.jsp" />
	<script src="/findMyRoom/resources/js/sticky.js"></script>
</body>
</html>





