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
			</div>


	<c:if test="${!empty sessionScope.loginMember}">
		<input type="hidden" value="${ requestScope.board.no }" id="boardNo" name="boardNo">
		<textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성하세요"></textarea>
		<br>
		<button type="button" id="btnReply">댓글쓰기</button>
	</c:if>
	<div id="listReply" style="border:1px; width:100px; height:70px;">
		<%-- <c:forEach var="reply" items="${ requestScope.listReply }">
			<tr>
				<td align="center"><c:out value="${ reply.no }" /></td>
				<td><c:out value="${ reply.writer.nickname }" /></td>
				<td align="center"><c:out value="${ reply.createDate }" /></td>
				<td><c:out value="${reply.content }"/></td>
			</tr>
		</c:forEach> --%>
	</div>

	<script>
		$("#btnReply").click(function() {
			var replytext = $("#replytext").val(); //댓글 내용
			var boardNo = "${requestScope.board.no}"; //게시물 번호
			var param = {
				"replytext" : replytext,
				"boardNo" : boardNo
			};
			//var param="replytext="+replytext+"&bno="+bno;
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
		
		
		/* function listReply(){
		    $.ajax({
		        url: "${ pageContext.servletContext.contextPath}/reply/list", //컨트롤러에 있는 list.do로 맵핑하고 게시판 번호도 같이 보낸다.
		        type: "get", //get방식으로 자료를 전달한다
		        success: function(result){ //자료를 보내는것이 성  공했을때 출력되는 메시지
		            //result : responseText 응답텍스트(html)
		        	console.log(result);
		            $("#listReply").html(result);
		        }
		    });
		}  */
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>