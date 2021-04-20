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
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

   <title>공지 상세</title>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   
   <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
   <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardDetail.css">
   
   <style>
   .writer{
           position: relative;
    left: 15px;
    width: 200px; /* 원하는 너비설정 */
    padding: 7px; /* 여백으로 높이 설정 */
    border-radius: 5px; 
   
   }
   .views{
    position: relative;
    left: 110px;
    width: 200px; /* 원하는 너비설정 */
    padding: 7px; /* 여백으로 높이 설정 */
    border-radius: 5px; 
         
   
   }
	.noticetitle{
		margin-bottom:50px;
	}
	#listbtn{
		
		left:10px;
	}
	#updatebtn{
		
		right:8px;
	}
    
   </style>

</head>
<body>
   <jsp:include page="../common/header.jsp"/>
   	<div align="center" class="container">
       		<h4 class="noticetitle"><c:out value="${ requestScope.noticeList.title }"/></h4> 
      		<table class="writer pull-left">
      			<tr>
               		<th>작성자 : <c:out value="${ requestScope.noticeList.writer.nickname }"/></th> 
               	</tr>	
          	</table>
          	<table  class="views pull-right">
              
            </table>
          	<div>  
                  <textarea style="resize:none;" class="content" readonly><c:out value="${ requestScope.noticeList.content }"/></textarea>
			</div>

         <div align="center">
            <button class="btn cancel pull-left" id="listbtn" onclick="location.href='${ pageContext.servletContext.contextPath}/notice/list'">목록</button>
            <c:if test="${ sessionScope.loginMember.role eq 'ADMIN' }">
               <button class="btn post pull-right" id="updatebtn" onclick="location.href='${pageContext.servletContext.contextPath}/notice/update?no=${ requestScope.noticeList.noticeNo }'">
               수정
               </button>
            </c:if>
         </div>
      </div>
  	  <jsp:include page="../common/footer.jsp" />
</body>
</html>