<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    <title>구해줘! 내 방</title>

    <style>

        .table{
            /* max-width: 382px; */
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin: 0 auto;

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
            position:relative;
            top:10px;
        }

        div.container.noticealign{
        	margin-top: 198px;
        	margin-bottom: 198px;
        }

    </style>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="js/bootstrap.js"></script>
     <link rel="stylesheet" href="/findMyRoom/resources/css/free_board.css?">
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

<div class="container noticealign">
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th colspan="3">공지사항</th>
            </tr>

        </thead>
        <tbody>
        	<c:forEach items="${ noticeList }" var="notice">
          	<tr>
  				<td><c:out value="${ notice.noticeNo }"/></td>
				<td><c:out value="${ notice.title }"/></td>
			<%-- 	<td><c:out value="${ notice.writer.nickname }"/></td> --%>
	<%-- 			<td><c:out value="${ notice.count }"/></td> --%>
				<td><c:out value="${ notice.creationDate }"/></td>
          	</tr>
            </c:forEach>
        </tbody>

    </table>

	<!-- 관리자인 경우에만 작성하기 버튼이 보여짐 -->
	<c:if test="${ sessionScope.loginMember.role eq 'ADMIN'}">
    	<button onclick="location.href='${ pageContext.servletContext.contextPath }/notice/insert'" class="btn">글쓰기</button>
    </c:if>




</div>
      <script>
  	/* 자바스크립트를 이용하는 경우 */

		 if(document.getElementsByTagName("td")) {
			const $tds = document.getElementsByTagName("td");
			for(var i = 0 ; i < $tds.length ; i++) {

				$tds[i].onmouseenter = function() {
					this.parentNode.style.cursor = "pointer";
				}

				$tds[i].onclick = function() {
					const no = this.parentNode.children[0].innerText;
					console.log(no);
					location.href = "${ pageContext.servletContext.contextPath }/notice/detail?no=" + no;
				}
			}
		}

      </script>

	<jsp:include page="../common/footer.jsp" />
	<script src="/findMyRoom/resources/js/sticky.js"></script>
</body>
</html>
