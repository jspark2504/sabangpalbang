<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>구해줘! 내 방</title>

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

   <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardDetail.css">
   <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">

   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <style>
   </style>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
   	<div class="container">
      		<table class="nickname pull-right">
      			<tr>
      				<td><i class="fa fa-user" aria-hidden="true">&nbsp;&nbsp;<c:out value="${ requestScope.boardList.writeUser.nickname }" /></i></td>
               	</tr>	
          	</table>
          	<input type="text" class="title" value="${ requestScope.boardList.title }" readonly>
            <textarea style="resize:none;" class="content" readonly><c:out value="${ requestScope.boardList.content }"/></textarea>
            <button type="button" class="btn cancel pull-left" onclick="location.href='${ pageContext.servletContext.contextPath}/infoboard/list'">목록</button>
            <c:if test="${ sessionScope.loginMember.role eq 'ADMIN' }">
	            <button class="btn post pull-right" onclick="location.href='${ pageContext.servletContext.contextPath}/infoboard/update?no=${ requestScope.boardList.no }'">수정</button>
            </c:if>
    </div>
  	  <jsp:include page="../common/footer.jsp" />
</body>
</html>