<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지리스트</title>

    <style>
        
        .table{
            /* max-width: 382px; */
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin: 0 auto;
            padding-top: 127px;
            padding-bottom: 40px;
      /* display: table-cell; */
      /* vertical-align: middle; */
        }
  

        thead{
            font-size: 16px;
        }
        tbody{
            font-size: 12px;
        }
        #day{
            text-align: right;
        }
        .btn{
            background: gray;
            color: white;
        }

    </style>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="js/bootstrap.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
<div class="container">
    <table class="table table-hover">
        <thead>
            <tr>
                <th colspan="2">공지사항</th>
            </tr>
            
        </thead>
        <tbody>
        	<c:forEach items="${ noticeList }" var="notice">
          	<tr> 
  			<%-- 	<td><c:out value="${ notice.no }"/></td> --%>
				<td><c:out value="${ notice.title }"/></td>
			<%-- 	<td><c:out value="${ notice.writer.nickname }"/></td> --%>
	<%-- 			<td><c:out value="${ notice.count }"/></td> --%>
				<td><c:out value="${ notice.createDate }"/></td>
          	</tr>
            </c:forEach>            
        </tbody>

    </table>
      
	<!-- 관리자인 경우에만 작성하기 버튼이 보여짐 -->
	<c:if test="${ sessionScope.loginMember.role eq 'ADMIN'}">
    	<a class="btn" >글쓰기</a>
    </c:if>
   
<!--     <div class="text-center">
        <ul class="pagination">
            <li><a href="#">1</a></li>

        </ul>
    </div> -->
       <!-- Bootstrap core CSS -->
    
</div>
</body>
</html>
    