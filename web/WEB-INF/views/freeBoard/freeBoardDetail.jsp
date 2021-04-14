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
    
 <!--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
		#replytext{
			border:1px solid rgba(0, 0, 0, 0.1);
			border-radius:5px; 
			padding:10px; 
			width:750px; 
			height:100px; 
			position:relative; 
			top:55px; 
			resize:none;
		}
		#replytext:focus{
			outline: none;
			box-shadow: 0px 0px 7px rgb(255, 210, 51);
		}
		#btnReply{
			position:relative;  
			right:35px; 
			background-color:rgba(0, 0, 0, 0.1);
		}
		#btnReply:hover{
			background-color: rgb(81, 75, 55);
      		color: white;
      		transition-duration: 0.3s;
		}
		#counter{
		 	position:relative;
		 	color : rgba(0, 0, 0, 0.3);
		 	text-align:right;
		 	right:50px;
		 	top:15px;
		}
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
			<table class="nickname pull-right">
			 	<tr>
                    <td><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;<c:out value="${ requestScope.board.writer.nickname }" /></td>
                </tr>
			</table>
				<input type="text" class="title" value="${ requestScope.board.title }" readonly>
			<textarea style="resize:none" class="content" readonly><c:out value="${ requestScope.board.body }" /></textarea>
				<button type="button" class="btn cancel pull-left" onclick="location.href='${ pageContext.servletContext.contextPath}/freeboard/list'">목록</button>
				<c:if test="${ sessionScope.loginMember.no eq requestScope.board.writerMemberNo }">
					<button class="btn post pull-right" onclick="location.href='${ pageContext.servletContext.contextPath}/freeBoard/update?no=${ requestScope.board.no }'">수정</button>
				</c:if>
	<c:if test="${!empty sessionScope.loginMember}">
		
		<textarea id="replytext" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
		<br>
		<button class="btn pull-right" type="submit" id="btnReply">확인</button>
	<div id="counter">(0 / 100)</div>
	</c:if>
</div>
<%@ include file="reply.jsp" %>
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
	$(document).ready(function() {
	    $('#replytext').on('keyup', function() {
	        $('#counter').html("("+$(this).val().length+" / 100)");
	 
	        if($(this).val().length > 100) {
	            $(this).val($(this).val().substring(0, 100));
	            $('#counter').html("(100 / 100)");
	        }
	    });
	});

	</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>