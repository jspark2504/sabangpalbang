<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardInsert.css">
    
    <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div class="container">
			<form action="${pageContext.servletContext.contextPath }/freeBoard/insert" method="post">
			    
				<input type="text" class="title" name="title" placeholder="회원님들에게 알리고 싶은 좋은 소식!">
				<textarea class="content" name="body" placeholder="내용을 입력해주세요."></textarea>		
				<button type="submit" class="btn post pull-right">등록</button>
            	<button type="button" class="btn cancel pull-left">취소</button>
			</form>
		</div>
</body>
</html>