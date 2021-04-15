<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항 작성</title>
    
    <style>
    *{
        font-size: 18px;
        color: gray;
        
    }
    

    .form-write{
        position : absolute;
        /* background: chartreuse; */
        left: 50%;
        margin-left: -413px;
    }
    #btn1{
        margin-top: 23px;
        border-radius: 0px;
        background:#BCBCBC;
        color: white;
        margin-bottom: 204px;
        font-weight: bold;
    }
    #btn2{
        border-radius: 0px;
        background: rgb(255,210,51);
        margin-top: 23px;
        color: white;
        margin-left: 710px;
        margin-bottom: 204px;
        font-weight: bold;


    }
    
    #rectangle {
      margin-top: 17px ;
      width: 826px;
      height: 2px;
      background : gray;
    }
    textarea{
    
        resize: none;
        width: 826px;
        height: 797px;
        padding-top: 19px;
        padding-left: 13px;
    }
    #box1{ margin-top: 218px;  }
    #box2{ margin-top: 30px; }
    
    #input1{width: 820px;}
    #input2{width: 820px;}
    </style>
    
      <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="container">
    <form class="form-write" action="${ pageContext.servletContext.contextPath }/notice/insert" method="post">

        <div id="box1">
       		<input type="text" value="${ sessionScope.loginMember.nickname }" name="writer" readonly id="input1">
        	<br>
            <input type="text" class="title" name="title" placeholder="회원님들에게 알리고싶은 좋은 소식!" required id="input2"></div>
        <div id="rectangle"> </div>

        <textarea class="content" name="content"placeholder="내용을 입력하세요." id="box2"></textarea>
	<br>
        <button onclick="location.href='${ pageContext.servletContext.contextPath }/notice/list'" class="btn" type="button" id="btn1">취소</button>
        <button type="submit" class="btn" id="btn2">등록</button>
        
     
    </form>
    
</div>   


</body>
</html>