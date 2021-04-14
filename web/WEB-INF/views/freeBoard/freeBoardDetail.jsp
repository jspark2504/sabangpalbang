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
  
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardDetail.css">
	<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
				<button type="button" class="btn cancel pull-left" onclick="location.href='${ pageContext.servletContext.contextPath}/freeboard/list'">목록</button>
				<c:if test="${ sessionScope.loginMember.no eq requestScope.board.writerMemberNo }">
					<button class="btn post pull-right" onclick="location.href='${ pageContext.servletContext.contextPath}/freeBoard/update?no=${ requestScope.board.no }'">수정</button>
				</c:if>
	<c:if test="${!empty sessionScope.loginMember}">
		<textarea style="border:1px solid rgba(0, 0, 0, 0.1); border-radius:5px; padding:10px; width:750px; height:60px; position:relative; top:50px; resize:none;"
		id="replytext" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
		<br>
		<button class="btn pull-right" style="position:relative; top:60px; right:20px; background-color:rgb(255, 210, 51);"
		type="submit" id="btnReply">댓글쓰기</button>
	</c:if>
</div>
<%@ include file="reply.jsp" %>
<jsp:include page="../common/footer.jsp" />
	<script>
	listReply();
	$("#btnReply").click(function() {
					var boardNo = "${requestScope.board.no}"; //게시물 번호
					var replytext = $("#replytext").val(); //댓글 내용
					var param = {
						"replytext" : replytext,
						"boardNo" : boardNo
					};
						$.ajax({
							type : "post", //데이터를 보낼 방식
							url : "${ pageContext.servletContext.contextPath}/reply/insert", //데이터를 보낼 url
							data : param, //보낼 데이터

							success : function() { //데이터를 보내는것이 성공했을시 출력되는 메시지
										alert("댓글이 등록되었습니다.");
										listReply(); //댓글 목록 출력
						}
				});
		});
	</script>
</body>
</html>