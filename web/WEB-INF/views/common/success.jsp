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
					successMessage = "환영합니다! 로그인 후 다양한 서비스를 이용해 보세요.";
					movePath = "${ pageContext.servletContext.contextPath }/member/login";
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

				case "deleteDocument" :
					successMessage = "서류 삭제 성공!";
					movePath = "${ pageContext.servletContext.contextPath }/document/list";
					break;

				case "updateNotice" :
					successMessage = "공지사항 수정 성공!";
					movePath = "${ pageContext.servletContext.contextPath }/notice/list";
					break;

				case "deleteNotice" :
					successMessage = "공지사항 삭제 성공!";
					movePath = "${ pageContext.servletContext.contextPath }/notice/list";
					break;
					
				case "insertNotice" :
					successMessage = "공지사항 등록 성공!";
					movePath = "${ pageContext.servletContext.contextPath }/notice/list";
					break;

				case "insertRoom" :
					successMessage = "매물이 등록되었습니다."
					movePath = "${ pageContext.servletContext.contextPath }/room/management";
					break;

				case "updateRoom" :
					successMessage = "매물 정보가 수정되었습니다."
					movePath = "${ pageContext.servletContext.contextPath }/room/management";
					break;

				case "changeRoomStatusY" :
					successMessage = "중개 중인 매물로 변경되었습니다."
					movePath = "${ pageContext.servletContext.contextPath }/room/management";
					break;

				case "changeRoomStatusN" :
					successMessage = "해당 매물의 중개가 종료되었습니다."
					movePath = "${ pageContext.servletContext.contextPath }/room/management";
					break;
				case "pauseMember" :
					successMessage = "회원 정지에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/manage/list";
					break;
				case "restoreMember" :
					successMessage = "회원 복구에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/manage/list";
					break;
				case "approvalOffice" :
					successMessage = "중개사 승인에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/manage/approval";
					break;
				case "rejectOffice" :
					successMessage = "중개사 거부에 성공하셨습니다!";
					movePath = "${ pageContext.servletContext.contextPath }/manage/reject";
					break;
				case "loginFailed" :
					successMessage = "아이디 또는 비밀번호를 확인해주세요!";
					movePath = "${ pageContext.servletContext.contextPath }/member/login";
					break;
			}

			alert(successMessage);

			location.replace(movePath);
		})();
	</script>
</body>
</html>







