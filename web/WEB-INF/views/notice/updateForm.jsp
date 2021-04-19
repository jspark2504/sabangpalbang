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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardDetail.css">
	<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<body>
		<h2 align="center">공지사항 수정</h2>
	<div align="center" class="container">
		<div class="table-area">
			<form id="form" action="${ pageContext.servletContext.contextPath }/notice/update" method="post">
				   <input type="hidden" name="noticeNo" value="${requestScope.notice.noticeNo }">
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" size="25" name="title" value="${requestScope.notice.title }"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" size="25"value="${ sessionScope.loginMember.nickname }" name="writer" readonly>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<textarea class="content" name="content"><c:out value="${requestScope.notice.content }"/></textarea>				
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button class="btn post pull-right" type="submit">수정</button>
				</div>
			</form>
           			<button class="btn cancel pull-left" onclick="location.href='${ pageContext.servletContext.contextPath}/notice/list'">목록</button>
					<button class="btn post pull-right" type="button" onclick="postRequest('deleteNotice')" >삭제</button>
		</div>
	</div>
 <script>
      function postRequest(intent){
         var $form = document.getElementById("form");
         
         requestPath = "<%=request.getContextPath()%>";
         
         switch(intent){
         case "deleteNotice" : requestPath += "/notice/delete"; break;
         }
         $form.action = requestPath;
         $form.submit();
      }
   </script>

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>