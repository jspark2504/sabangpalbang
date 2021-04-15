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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

  
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardInsert.css">
    <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    
	<style>

	.select {
	position: relative;
    left: 10px;
    width: 150px; /* 원하는 너비설정 */
    padding: 7px; /* 여백으로 높이 설정 */
    border: 1px solid #999;
    border-radius: 5px; 
	}
	</style>

</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div align="center" class="outer outer-board-insert">
		<br>
		<h2 align="center">게시판 작성</h2>
			<div class="container">
				
			<form action="${ pageContext.servletContext.contextPath }/infoboard/insert" method="post">
					<select  class="select pull-left" name="category">
						<option value="1">계약시주의사항</option>
						<option value="2">청년정책</option>
						<option value="3">기타</option>
					</select>
					<input type="text" class="title" name="title" placeholder="회원님들에게 알리고 싶은 좋은 소식!">
					<textarea class="content" name="content" placeholder="내용을 입력해주세요."></textarea>		
						
            		<button type="reset" class="btn cancel pull-left" onclick="location.href='${ pageContext.servletContext.contextPath}/infoboard/list'">목록</button>
					<button type="submit" class="btn post pull-right">등록</button>
			</form>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
		
</body>
</html>