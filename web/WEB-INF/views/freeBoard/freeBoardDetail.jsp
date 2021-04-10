<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardDetail.css">

</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
			<table class="nickname pull-right">
			 	<tr>
                    <th>nickname</th>
                    <td><c:out value="${ requestScope.board.writer.nickname }" /></td>
                </tr>
			</table>
				<input type="text" class="title" value="${ requestScope.board.title }" readonly>
			<textarea style="resize:none" class="content" readonly><c:out value="${ requestScope.board.body }" /></textarea>
				<button type="button" class="btn cancel pull-left" onclick="location.href='${ pageContext.servletContext.contextPath}/freeBoard/list'">목록</button>
				<c:if test="${ sessionScope.loginMember.no eq requestScope.board.writerMemberNo }">
					<button class="btn post pull-right" onclick="location.href='${ pageContext.servletContext.contextPath}/freeBoard/update?no=${ requestScope.board.no }'">수정</button>
				</c:if>
			</div>
</body>
</html>