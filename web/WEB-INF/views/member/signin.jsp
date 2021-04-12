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

<title>구해줘! 내 방 로그인</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/findMyRoom/resources/css/signin.css">

</head>

<body>
	<jsp:include page="../common/header.jsp"/>
	<div class="container">
	<c:if test="${empty sessionScope.loginMember }">
		<form class="form-signin" id="loginForm" action="${pageContext.servletContext.contextPath}/member/login" method="post">
			<img src="/findMyRoom/resources/image/logIn.PNG" class="logo">
			<!-- <h2 class="form-signin-heading">Please sign in</h2> -->
			<!-- <label for="inputId" class="sr-only">ID</label> -->
			<!-- <label for="inputPassword" class="sr-only">Password</label> -->
			<input type="text" name="userId" class="form-control" placeholder="아이디를 입력해주세요." required autofocus> 
			<input type="password" name="userPwd" class="form-control" placeholder="비밀번호를 입력해주세요." required>
			<div class="checkbox">
				<label> 
				<input type="checkbox" value="remember-me" id="idSaveCheck"> 아이디 저장
				</label>
			</div>
			<button type="button" class="findId">아이디찾기</button>
			<button type="button" class="findPwd">비밀번호찾기</button>
			<button type="button" class="signUp" onclick="location.href='${ pageContext.servletContext.contextPath }/member/regist'">회원가입</button>
			<button class="btn btn-lg btn-block" type="submit" id="login">시작하기</button>
		</form>
		</c:if>
	</div>
	<!-- /container -->

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<!-- <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->
	<!-- <script>

    $(document).ready(function () {

      // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
      var key = getCookie("key");
      $("input[name=memberId]").val(key);

      if ($("input[name=memberId]").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
      }

      $("#idSaveCheck").change(function () { // 체크박스에 변화가 있다면,
        if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
          setCookie("key", $("input[name=memberId]").val(), 7); // 7일 동안 쿠키 보관
        } else { // ID 저장하기 체크 해제 시,
          deleteCookie("key");
        }
      });

      // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
      $("input[name=memberId]").keyup(function () { // ID 입력 칸에 ID를 입력할 때,
        if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
          setCookie("key", $("input[name=memberId]").val(), 7); // 7일 동안 쿠키 보관
        }
      });
    });

    function setCookie(cookieName, value, exdays) {
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
      var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
      document.cookie = cookieName + "=" + cookieValue;
    }

    function deleteCookie(cookieName) {
      var expireDate = new Date();
      expireDate.setDate(expireDate.getDate() - 1);
      document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    function getCookie(cookieName) {
      cookieName = cookieName + '=';
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cookieName);
      var cookieValue = '';
      if (start != -1) {
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if (end == -1) end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
    }
  </script> -->
</body>

</html>