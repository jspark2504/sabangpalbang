<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardDetail.css">

</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div class="container">
	<form action="${pageContext.servletContext.contextPath }/freeBoard/update" method="post" id="form">
	<input type="hidden" name="boardNo" value="${requestScope.board.no }">
			<table class="nickname pull-right">
			 	<tr>
                    <th>nickname</th>
                    <td><p><c:out value="${ requestScope.board.writer.nickname }" /></p></td>
                </tr>
			</table>
				<input type="text" class="title" name="title" value="${ requestScope.board.title }">
				<textarea style="resize:none" class="content" name="body"><c:out value="${ requestScope.board.body }" /></textarea>
				
				<button type="button" class="btn cancel pull-left" onclick="location.href='${ pageContext.servletContext.contextPath}/freeboard/list'">목록</button>
				<button type="submit" class="btn post pull-right">수정</button>
				<button type="button" class="btn delete pull-right" onclick="postRequest('deleteFreeBoard')" >삭제</button>
			</form>
			</div>
			<script>
		function postRequest(intent){
			var $form = document.getElementById("form");
			
			requestPath = "<%=request.getContextPath()%>";
			
			switch(intent){
			case "deleteFreeBoard" : requestPath += "/freeBoard/delete"; break;
			}
			$form.action = requestPath;
			$form.submit();
		}
	</script>
</body>
</html>