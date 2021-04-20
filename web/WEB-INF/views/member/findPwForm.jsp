<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    <title>구해줘! 내 방</title>
</head>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
     <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

	<style>
  .container {
	margin-top: 85px;
    margin-bottom:85px;
    background-color:white;
    /* display: table-cell; */
    /* vertical-align: middle;  */
  }
  .form-signin {
    max-width: 382px;
    padding: 15px;
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    height: 490px;
    margin: 0 auto;
    top: 50%;
    /* display: table-cell; */
    /* vertical-align: middle; */
  }
  .form-signin .form-signin-heading,
  .form-signin .checkbox {
    margin : 12px;
  }

  .form-signin .form-control {
    position: relative;
    height: auto;
    -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
            box-sizing: border-box;
    padding: 10px;
    font-size: 16px;
  }
  .form-signin .form-control:focus {
    z-index: 2;
  }
  .form-signin input[type="text"] {
    margin-bottom: -1px;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
    font-size: 0.9em;
  }

  #findId{
      border: rgba(255, 255, 255, 0);
      background: rgba(255, 255, 255, 0);
      color: rgba(0, 0, 0, 0.5);
      position: relative;
      left: 7px;
      top: 18px;
  }

  #signUp{
    border: rgba(255, 255, 255, 0);
    background: rgba(255, 255, 255, 0);
    color: rgba(0, 0, 0, 0.5);
    position: relative;
    left: 30px;
    top: 18px;
  }
  #btn{
      position: relative;
      top: 10px;
      background: rgb(255,210,51);
      font-weight: bold;
      position: relative;
      border-radius: 0px;
      margin-top: 268px;


  }
  #btn:hover{
      background: rgb(81, 75, 55);
      font-weight: bold;
      color: white;
      transition-duration: 0.3s;
      
  }
  #textbox{
    font-weight: bold;
    text-align: center;
    font-size: 16px;
  }
  
  
  </style>

<body>
	<jsp:include page="../common/header.jsp"/>
	 <div class="container">

    <form class="form-signin"  action="${pageContext.servletContext.contextPath}/member/findPw" method="post" >
      <br>
      <div id="textbox">
      <p>가입하신 이메일 주소를 입력해주세요.<br>임시 비밀번호를 보내드립니다.</p>
      <br>
      </div>
  
      <label for="inputEmail" class="sr-only">Email</label>
      <input type="text" id="inputEmail" class="form-control" placeholder="이메일 주소" name="email" >
      
      
      <button class="btn btn-lg btn-block" type="submit" id="btn">확인</button>
    </form>
  </div>
		<jsp:include page="../common/footer.jsp" />
		<script src="/findMyRoom/resources/js/sticky.js"></script>
</body>
</html>