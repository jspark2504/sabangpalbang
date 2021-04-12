<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    <title>구해줘! 내 방</title>

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- 아이콘 -->
    <script src="https://kit.fontawesome.com/11694e3acf.js"></script>

    <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


    <!-- 뒤로가기로 회원가입 페이지 보는 것을 방지하기 위한 스크립트 -->
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

           .form-signup .input-group {
               margin: 10px auto;
           }

           .form-signup input:not(#inputNickname) {
               text-transform: lowercase;
           }

		   .form-signup .input-group-addon {
		       background: white;
		   }

           .okbtn {
               margin-top: 50px;
               background-color: #ffd233;
               color: white;
           }

           .container {
               margin-top: 20px;
           }
       </style>
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
    <section class="container">
        <!-- 회원가입 양식 outer 영역 -->
        <form class="form-signup" action="${ pageContext.servletContext.contextPath }/member/regist" method="post">
            <h4 align="center" class="form-signup-heading">간편하게 가입하고<br>다양한 서비스를 이용하세요.</h4>
            <!-- id -->
            <div class="input-group input-id">
                <input type="text" name="userId" id="inputId" class="form-control" placeholder="아이디" required autofocus>
                <span class="input-group-addon input-id-addon">
                	<i class="fas fa-check"></i>
                </span>
            </div>
			<!-- password -->
            <label for="inputPassword" class="sr-only">비밀번호</label>
            <input type="password" name="userPwd" id="inputPassword" class="form-control" placeholder="영문, 숫자 포함 8자 이상" required>
            <label for="inputPasswordCheck" class="sr-only">비밀번호 재입력</label>
            <input type="password" id="inputPasswordCheck" class="form-control" placeholder="비밀번호 재입력" required>
            <!-- nickname -->
            <label for="inputNickname" class="sr-only">닉네임</label>
            <input type="text" name="nickname" id="inputNickname" class="form-control" placeholder="닉네임" required>
            <!-- email -->
            <div class="input-group input-email">
	            <input type="email" name="email" id="inputEmail" class="form-control" placeholder="이메일" required>
            	<span class="input-group-addon input-email-addon">
            		<i class="fas fa-check"></i>
            	</span>
            </div>
            <!-- phone -->
            <label for="inputPhone" class="sr-only">전화번호</label>
            <input type="tel" name="phone" id="inputPhone" class="form-control" placeholder="전화번호" required>

            <button class="btn btn-lg btn-block okbtn" type="submit">확인</button>
        </form> <!-- /form-signup -->

    </section> <!-- /container -->

	<!-- 자바스크립트 -->
	<script src="/findMyRoom/resources/js/signup.js"></script>

</body>

</html>