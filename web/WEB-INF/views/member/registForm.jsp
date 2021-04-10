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

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
    <section class="container">
        <!-- 회원가입 양식 outer 영역 -->
        <form class="form-signup" action="${ pageContext.servletContext.contextPath }/member/regist" method="post">
            <h4 align="center" class="form-signup-heading">간편하게 가입하고<br>다양한 서비스를 이용하세요.</h4>
            <div class="input-group">
                <input type="text" name="userId" id="inputId" class="form-control" placeholder="아이디" required
                    autofocus>
                <span class="input-group-btn">
                    <button class="btn initial idcheck" type="button"
                        style="background-color: #ffd233;">중복확인</button>
                </span>
            </div>

            <label for="inputPassword" class="sr-only">비밀번호</label>
            <input type="password" name="userPwd" id="inputPassword" class="form-control"
                placeholder="영문, 숫자 포함 8자 이상" required>
            <label for="inputPasswordCheck" class="sr-only">비밀번호 재입력</label>
            <input type="password" id="inputPasswordCheck" class="form-control" placeholder="비밀번호 재입력" required>
            <label for="inputNickname" class="sr-only">닉네임</label>
            <input type="text" name="nickname" id="inputNickname" class="form-control" placeholder="닉네임" required>
            <label for="inputEmail" class="sr-only">이메일</label>
            <input type="email" name="email" id="inputEmail" class="form-control" placeholder="이메일" required>
            <label for="inputPhone" class="sr-only">전화번호</label>
            <input type="tel" name="phone" id="inputPhone" class="form-control" placeholder="전화번호" required>

            <button class="btn btn-lg btn-block okbtn" type="submit">확인</button>
        </form> <!-- /form-signup -->

    </section> <!-- /container -->

</body>

</html>