<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

   <title>구해줘! 내 방</title>
   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">

</head>
<body>
   <jsp:include page="../common/header.jsp"/>
   <div class="outer outer-board-detail">
      <br>
      <h2 align="center">게시판 사항 내용</h2>
      <div class="table-area">
         <table align="center">
            <tr>
               <td>제목</td>
               <td colspan="3"><p><c:out value="${ requestScope.boardList.title }"/></p></td>
            </tr>   
            <tr>
               <td>작성자</td>
               <td><p><c:out value="${ requestScope.boardList.writeUser.nickname }"/></p></td>
               <td>조회수</td>
               <td><p><c:out value="${ requestScope.boardList.viewNo }"/></p></td>
            </tr>
            <tr>
               <td>내용</td>
               <td colspan="3">
                  <textarea style="resize:none; width:1000px; height:300px;" readonly><c:out value="${ requestScope.boardList.content }"/></textarea>
               </td>
            </tr>
         </table>
         <br>
         <div align="center">
            <button onclick="location.href='${ pageContext.servletContext.contextPath}/infoboard/list'">목록</button>
            <c:if test="${ sessionScope.loginMember.role eq 'ADMIN' }">
               <button class="btn post pull-right" onclick="location.href='${ pageContext.servletContext.contextPath}/infoboard/update?no=${ requestScope.boardList.no }'">
               수정하기
               </button>
            </c:if>
         </div>
      </div>
   </div>
</body>
</html>