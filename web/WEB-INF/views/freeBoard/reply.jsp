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
		#deleteReply{
			background:rgb(81, 75, 55);
			width:21px;
			color:white;
			position:relative;
			bottom:50px;
			border:none;
			border-radius:5px;
		}
		#deleteReply:hover{
			background:red;
			transition-duration: 0.3s;
		}
		
	</style>
</head>
<body>
	<div class="listReply">
		<c:forEach items="${listReply }" var="reply">
		<hr>
 		<form action="${ pageContext.servletContext.contextPath}/reply/delete" method="post">
		<i class="fa fa-user-o" aria-hidden="true"></i>&nbsp;&nbsp; ${reply.writer.nickname }
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		<i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;&nbsp; ${reply.createDate }
		<br><br>
		<i class="fa fa-comments" aria-hidden="true"></i>&nbsp;&nbsp; ${reply.content }
		<input type="hidden" id="replyNo" name="replyNo" value="${reply.no }">
		<input type="hidden" id="postNo" name="postNo" value="${reply.postNo }">
		<c:if test="${ sessionScope.loginMember.no eq reply.userNo || sessionScope.loginMember.role eq 'ADMIN'}">
		&nbsp;&nbsp;&nbsp;&nbsp;<button class="pull-right" id="deleteReply" onclick="location.href='${ pageContext.servletContext.contextPath}/reply/delete'" onClick="window.location.reload()">X</button>
		</c:if>
		</form>
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