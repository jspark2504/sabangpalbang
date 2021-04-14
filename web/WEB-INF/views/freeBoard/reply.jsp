<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.listReply{
			border:1px;
			max-width: 750px;
			position:relative;
			margin:0px auto;
			right:5px;
			bottom:20px;
		}
	</style>
</head>
<body>
	<div class="listReply">
		<c:forEach items="${listReply }" var="reply">
		<hr>
		<i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;&nbsp; ${reply.writer.nickname }
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		<i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;&nbsp; ${reply.createDate }
		<br><br>
		<i class="fa fa-comments" aria-hidden="true"></i>&nbsp;&nbsp; ${reply.content }
		<hr>
		</c:forEach>
	</div>
	<script>
	function listReply() {
		var boardNo = "${requestScope.board.no}"; 
		$.ajax({
			url:"${ pageContext.servletContext.contextPath}/reply/list", 
			type:"get", 
			data:{'boardNo' : boardNo},
			success : function(data) { 
				$(".listReply").html(data);
			}
		});
	}
	</script>
</body>
</html>