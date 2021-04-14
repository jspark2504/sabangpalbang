<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지상세</title>
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
    }
    #box1{ margin-top: 218px; }
    #box2{ margin-top: 30px;}
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
    <form class="form-write">
        <div id="box1">
        	<input readonly value="${ requestScope.notice.writer.nickname }">
            <label for="input-title" ></label>
            <input readonly value="${ requestScope.notice.title }">
        </div>
        <div id="rectangle">
            
        </div>
        <div id="box2"><p><textarea readonly ><c:out value="${ requestScope.notice.content }"/></textarea></p>
        </div>
        
        <button class="btn" type="reset" id="btn1"
        onclick="location.href='${ pageContext.servletContext.contextPath}/notice/list'"
        >취소</button>
        
  		<c:if test="${ sessionScope.loginMember.role eq 'ADMIN' }">
        <button class="btn" type="submit" id="btn2"
        onclick="location.href='${ pageContext.servletContext.contextPath}/notice/update?no=${ requestScope.notice.noticeNo }'"
        >수정</button>
        </c:if>
    </form>
    
</div>   


</html>