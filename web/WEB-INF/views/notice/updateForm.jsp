<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지수정</title>
    
    
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardDetail.css">
	<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    
    <style>
    *{
        font-size: 18px;
        color: gray;
    }
    
    #form{
        position : absolute;
        /* background: chartreuse; */
        left: 50%;
        margin-left: -413px;
        
    }
    #btn1{

        border-radius: 0px;
        background:#BCBCBC;
        color: white;
		margin-bottom: 204px;
        font-weight: bold;
    }
    #btn2{
        border-radius: 0px;
        background: rgb(255,210,51);
	    margin-bottom: 204px;
        color: white;

        font-weight: bold;
    }
    #btn3{
       border-radius: 0px;
       background: rgb(255,210,51);
	   margin-bottom: 204px;
       color: white;

       font-weight: bold;
    }    
    input{
        width: 820px;
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
        margin-top: 30px;
    }
    #box1{ margin-top: 218px; }

    </style>
 
</head>

<body>

<jsp:include page="../common/header.jsp"/>

<div class="container">
    <form id="form" action="${ pageContext.servletContext.contextPath }/notice/update" method="post">
			<input type="hidden" name="noticeNo" value="${requestScope.notice.noticeNo }">

    	
        <div id="box1">
    		<input type="text" value="${ sessionScope.loginMember.nickname }" name="writer" readonly>
            <input type="text" value="${ requestScope.notice.title }" name="title">
        </div>
        <div id="rectangle">
            
        </div>

       <textarea name="content" style="resize:none;" required><c:out value="${ requestScope.notice.content }"/></textarea>
        <br>
        <button onclick="location.href='${ pageContext.servletContext.contextPath}/notice/list'" class="btn" type="button" id="btn3">목록</button>
        <button class="btn" type="submit" id="btn2">수정</button>
       <button class="btn" type="button" id="btn1" onclick="postRequest('deleteNotice')">삭제</button>
        
    </form>
    
	</div>   
	<script>
		function postRequest(intent){
			var $form = document.getElementById("form");
			
			requestPath = "<%=request.getContextPath()%>";
			
			switch(intent){
			case "deleteNotice" : requestPath += "/notice/delete"; break;
			}
			$form.action = requestPath;
			$form.submit();
		}
	</script>

</body>
</html>