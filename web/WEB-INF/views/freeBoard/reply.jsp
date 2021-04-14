<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="listReply"
		style="border: 1px; max-width: 400px; mex-height: 50px; position:relative; left:285px; top:15px" >
		<c:forEach items="${listReply }" var="reply">
		<hr>
		댓글번호 : ${reply.no }<br>
		작성자 : ${reply.writer.nickname }<br>
		내용 : ${reply.content }<br>
		작성일 : ${reply.createDate }<br>
		<hr>
		</c:forEach>
	</div>
	<script>
	function listReply() {
		var boardNo = "${requestScope.board.no}"; //게시물 번호
		$.ajax({
			url:"${ pageContext.servletContext.contextPath}/reply/list", //컨트롤러에 있는 list.do로 맵핑하고 게시판 번호도 같이 보낸다.
			type:"get", //get방식으로 자료를 전달한다
			data:{'boardNo' : boardNo},
			success : function(data) { //자료를 보내는것이 성  공했을때 출력되는
				$(".listReply").html(data);
			}
		});
	}
	</script>
</body>
</html>