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
   <link rel="stylesheet" href="/findMyRoom/resources/css/error403.css?">      
</head>
<body>
   <jsp:include page="../common/header.jsp"/>

	<section class="error403Page">
		<img class="error403Image" src="data:image/svg+xml;base64,PHN2ZyBpZD0iQ2FwYV8xIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA1MTIgNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGc+PHBhdGggZD0ibTUxMiAyMjVjMCA0MS40Ni0zNC41NCA3NS03NiA3NWgtMzQ2Yy00OS42MyAwLTkwLTQwLjM3LTkwLTkwIDAtMzguNjMgMjUuMzItNzIuNzQgNjEuNjgtODUuMTEgNS41MS00MC43NiA0My4zNC02OS4yNiA4Mi4zOC02NC4zOCAyNC45Ni0zNy41OCA2Ni45MS02MC41MSAxMTEuOTQtNjAuNTEgNTYuODIgMCAxMDcuOTYgMzUuODMgMTI3LjE0IDkwLjQgNDUuMTQtNC42IDg3LjcxIDI3LjM0IDk2LjA0IDczLjU3IDIwLjQyIDE0LjI0IDMyLjgyIDM3LjAxIDMyLjgyIDYxLjAzeiIgZmlsbD0iI2ZiZTAwMCIvPjxwYXRoIGQ9Im01MTIgMjI1YzAgNDEuNDYtMzQuNTQgNzUtNzYgNzVoLTE4MHYtMzAwYzU2LjgyIDAgMTA3Ljk2IDM1LjgzIDEyNy4xNCA5MC40IDQ1LjE0LTQuNiA4Ny43MSAyNy4zNCA5Ni4wNCA3My41NyAyMC40MiAxNC4yNCAzMi44MiAzNy4wMSAzMi44MiA2MS4wM3oiIGZpbGw9IiNmYWJlMmMiLz48cGF0aCBkPSJtMzYxIDI4NXY5MGgtNzV2LTkwYzAtMTYuNTQtMTMuNDYtMzAtMzAtMzBzLTMwIDEzLjQ2LTMwIDMwdjkwaC03NXYtOTBjMC01Ny45IDQ3LjEtMTA1IDEwNS0xMDVzMTA1IDQ3LjEgMTA1IDEwNXoiIGZpbGw9IiM2MTNkNWMiLz48cGF0aCBkPSJtMzYxIDI4NXY5MGgtNzV2LTkwYzAtMTYuNTQtMTMuNDYtMzAtMzAtMzB2LTc1YzU3LjkgMCAxMDUgNDcuMSAxMDUgMTA1eiIgZmlsbD0iIzRiMjc0NiIvPjxnPjxwYXRoIGQ9Im0xMjEgMzYwdjE1MmgyNzB2LTE1MnoiIGZpbGw9IiNmYWJlMmMiLz48L2c+PHBhdGggZD0ibTI1NiAzNjBoMTM1djE1MmgtMTM1eiIgZmlsbD0iI2ZmOTEwMCIvPjwvZz48L3N2Zz4=" />
		<h3 class="error403Text">요청 권한이 없는 페이지 입니다.</h3>
		<h3>다른 페이지로 이동해주세요</h3>
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










