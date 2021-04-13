<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구해줘! 내 방</title>

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardDetail.css">
	<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<body>
	<div class="outer outer-notice-insert">
		<br>
		<h2 align="center">정보게시판 수정</h2>
		<div class="table-area">
			<form id="form" action="${ pageContext.servletContext.contextPath }/infoboard/update" method="post">
				<input type="hidden" name="no" value="${requestScope.boardList.no }">
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" size="50" name="title" value="${requestScope.boardList.title }"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" value="${ sessionScope.loginMember.nickname }" name="writeUser" readonly>
						</td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>		
					<tr>
						<td colspan="2">
							<textarea name="content" cols="60" rows="15" style="resize:none;" required><c:out value="${requestScope.boardList.content }"/></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
           			<button onclick="location.href='${ pageContext.servletContext.contextPath}/infoboard/list'">목록</button>
					<button type="submit">수정하기</button>
					<button type="button" onclick="postRequest('deleteInfoBoard')" >삭제</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		function postRequest(intent){
			var $form = document.getElementById("form");
			
			requestPath = "<%=request.getContextPath()%>";
			
			switch(intent){
			case "deleteInfoBoard" : requestPath += "/infoboard/delete"; break;
			}
			$form.action = requestPath;
			$form.submit();
		}
	</script>
</body>
</html>