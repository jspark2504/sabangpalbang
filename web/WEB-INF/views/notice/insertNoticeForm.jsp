<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구해줘! 내 방</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardInsert.css">

    <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    
	<style>
	.select {
	position: relative;
    width: 150px; /* 원하는 너비설정 */
    padding: 7px; /* 여백으로 높이 설정 */
    border: 1px solid #999;
    border-radius: 5px; 
	}
	</style>

</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div class="container">
		<form action="${ pageContext.servletContext.contextPath }/notice/insert" method="post">

			</select>
			<input type="text" class="title" name="title" placeholder="회원님들에게 알리고 싶은 좋은 소식!">
			<textarea class="content" name="content" placeholder="내용을 입력해주세요."></textarea>		
			<button type="submit" class="btn post pull-right">등록</button>
          	<button type="reset" class="btn cancel pull-left" onclick="location.href='${ pageContext.servletContext.contextPath}/notice/list'">목록</button>
		</form>
	</div>
<jsp:include page="../common/footer.jsp" />		
</body>
</html>