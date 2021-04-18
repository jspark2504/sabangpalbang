<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  
<title>아이디 뿌리기</title>
   <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type = "text/javascript" >
		setTimeout(function(){
	    	window.history.forward();
	    }, 0);	
<</script>
	
  <style>
   .container {
      padding-top: 270px;
      padding-bottom: 40px;
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
      font-size: 14px;
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
    #btn2{
        position: relative;
        top: 10px;
        background: rgb(255,210,51);
        font-weight: bold;
        position: relative;
        border-radius: 0px;
        margin-top: 260px;
        width: 46%;
     
    }
    #btn:hover{
        background: rgb(81, 75, 55);
        font-weight: bold;
        color: white;
        transition-duration: 0.3s;
        
    }
    #btn1{
        position:relative; 
        top : 10px;
        
        background: rgb(81, 75, 55);
        font-weight: bold;
        color: white;
        margin-top: 260px;
        border-radius: 0px;
        float: left;
    }
    #textbox{
      font-weight: bold;
      text-align: center;
      font-size: 16px;
    }
    a{
        position: relative;
        font-size: 14px;
        
    }
    
    </style>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
  	<div class="container">
  
      <form class="form-signin">
        <br>
        <div id="textbox">
        <p>에<br>연결된 아이디입니다.</p>
        <br>
        </div>
   
        <input type="text" id="inputId" class="form-control" required="" autofocus="" readonly>
        
        <button class="btn btn-lg" type="submit" id="btn1">임시 비밀번호 발급</button>
        <button class="btn btn-lg" type="submit" id="btn2">로그인</button>
    </form>
    </div> 
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  <script>
 	
  </script>
  

</body>
</html>