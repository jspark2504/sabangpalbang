<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		(function(){
			const successCode = "${ requestScope.successCode }";
			
			var successMessage = "";
			var movePath = "";
			
			switch(successCode){
				case "insertMember" :
					successMessage = "회원 가입에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/index.jsp";
					break;
				case "updateMember" :
					successMessage = "회원 정보 변경에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/member/update"; 
					break;
				case "deleteMember" :
					successMessage = "회원 탈퇴에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/member/delete"; 
					break;
				case "deleteInfoBoard" :
					successMessage = "정보게시판 삭제에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/infoboard/list";
					break;
				case "insertInfoBoard" :
					successMessage = "정보게시판 등록에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/infoboard/list";
					break;
				case "updateInfoBoard" :
					successMessage = "정보게시판 수정 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/infoboard/list";
					break;
				case "deleteFreeBoard" :
					successMessage = "자유게시판 게시물 삭제 성공!";
					movePath = "${ pageContext.servletContext.contextPath }/freeboard/list";
					break;
				case "insertFreeBoard" :
					successMessage = "자유게시판 게시물 등록 성공!";
					movePath = "${ pageContext.servletContext.contextPath }/freeboard/list";
					break;
				case "updateFreeBoard" :
					successMessage = "자유게시판 게시물 수정 성공!";
					movePath = "${ pageContext.servletContext.contextPath }/freeboard/list";
					break;
				case "insertDocument" :
					successMessage = "서류 등록 성공!";
					movePath = "${ pageContext.servletContext.contextPath }/document/list";
					break;
			}
			
			alert(successMessage);
			
			location.replace(movePath);
		})();
	</script>
</body>
</html>







