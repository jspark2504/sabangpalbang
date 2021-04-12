<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    <title>구해줘! 내 방</title>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
    <script type="text/javascript">
        setTimeout(function () {
            window.history.forward();
        }, 0);
    </script>

    <style>
		  .form-signup {
               max-width: 380px;
               padding: 15px;
               margin: 40px auto;
               border: 1px solid #e1e1e1;
               border-radius: 5px;
           }

           .form-signup .form-signup-heading,
           .form-signup .checkbox {
               padding: 10px;
               margin-bottom: 30px;
               line-height: 24px;
           }

           .form-signup .checkbox {
               font-weight: normal;
           }

           .form-signup .form-control {
               position: relative;
               height: auto;
               -webkit-box-sizing: border-box;
               -moz-box-sizing: border-box;
               box-sizing: border-box;
               padding: 10px;
               font-size: 16px;
           }

           .form-signup .form-control:focus {
               z-index: 2;
           }

           .form-signup input:not(#inputId) {
               margin: 10px auto;
           }

           .okbtn {
               margin-top: 50px;
               background-color: #ffd233;
               color: white;
           }
        /* .initial {
				all: initial;
		   } */
           .idcheck {
               color: white;
               background-color: #ffd233 !important;
               padding: 12px;
               border: 0px
           }

           .container {
               margin-top: 20px;
           }
       </style>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<section class="container">
		<h2 align="center">회원 정보 수정</h2>

		<!-- 회원 정보 수정 폼 -->
			<form class="form-signup" action="${pageContext.servletContext.contextPath}" method="post">	
				<div class="input-group">
				<article>
					<label for="inputId">아이디</label>
					<input class="form-control" maxlength="13" type="text" name="userId" id="inputId" readonly value="${ sessionScope.loginMember.id }">	
				</article>
				<article>
					<label for="inputPassword">비밀번호</label>
					<input class="form-control" type="password" maxlength="13" name="userPwd" value="${ sessionScope.loginMember.pwd }" required>	
           		</article>
           		<div>
           			<label for="inputNickname">닉네임</label>
					<input class="form-control" type="text" maxlength="6" name="nickname" required  value="${ sessionScope.loginMember.nickname }">
            	</div>
            	<div>
            		<label for="inputEmail">이메일</label>
					<input class="form-control" type="email" name="email" value="${ sessionScope.loginMember.email }">
          		</div>
          		<div>
          		    <label for="inputPhone">전화번호</label>
					<input class="form-control" type="tel" name="phone" value="${ sessionScope.loginMember.phone }">
				</div>	
						
				</div>
				<div class="btns" align="center">
					<input class="btn btn-lg btn-block okbtn" type="button" value="수정하기" class="btn btn-or" onclick="postRequest('updateMember')">
					<input class="btn btn-lg btn-block okbtn" type="button" value="탈퇴하기" class="pull-right" onclick="postRequest('deleteMember')">
				</div>
			</form>
	
	</section> <!-- container end -->
	
	<script>
		function postRequest(intent){
			var $form = document.getElementById("form");
			var passwordValue = document.getElementsByName("userPwd")[0].value;
			
			
			// "", null, indefined, 0, NaN에 해당되면 false || 값이 일치하는지 여부 
			if(!passwordValue || passwordValue === "") {	// 사용자가 비번 입력하지 않았을 때
				alert("비밀번호는 반드시 입력해야 합니다.");
				document.getElementsByName("userPwd")[0].focus();
			}			
			
			requestPath = "<%=request.getContextPath()%>";
			
			switch(intent){
			case "updateMember" : requestPath += "/member/update"; break;
			case "deleteMember" : requestPath += "/member/delete"; break;
			}
			
			/* 폼태그 액션과 서브밋 시키는 작업 */
			$form.action = requestPath;
			$form.submit();

		}
	</script>
</body>
</html>