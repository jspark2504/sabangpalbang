<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <title>구해줘! 내 방</title>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 기기(디바이스)별 크기를 인식 하고 1.0으로 확대 및 축소 없이해서 보여줌 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    <link rel="stylesheet" href="/findMyRoom/resources/css/free_board.css?">

    <style>
    </style>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
    <div class="container">
        <h1 class="text">정보게시판</h1>
			<c:if test="${ sessionScope.loginMember.role eq 'ADMIN'}">
				<button onclick="location.href='${ pageContext.servletContext.contextPath}/infoboard/insert'" class="btn pull-right">글쓰기</button>
				<button onclick="location.href='${ pageContext.servletContext.contextPath}/chart/infoboard'" class="btn pull-right">통계보기</button>
			</c:if>
      <table class="table table-striped table-hover">
			<thead>
		 		   <tr>
		 		   	  <th style="width: 73px; text-align: center;">번호</th>
		              <th style="width: 100px; text-align: center;">카테고리</th>
					  <th style="width: 630px;">제목</th>
					  <th style="width: 60px;">작성자</th>
					  <th style="text-align: center;">작성일자</th>
				      <th style="text-align: center;">조회수</th>
		           </tr>
		    </thead>
			<tbody>
           		 <c:forEach var="board" items="${ requestScope.boardList }">
	               <tr>
	                  <td align="center"><c:out value="${ board.no }"/></td>
	                  <td align="center"><c:out value="${ board.category.name }"/></td>
	                  <td><c:out value="${ board.title }"/></td>
	                  <td><c:out value="${ board.writeUser.nickname }"/></td>
	                  <td align="center"><c:out value="${ board.createDate }"/></td>
	                  <td align="center"><c:out value="${ board.viewNo }"/></td>
	               </tr>
            </c:forEach>
            </tbody>
       </table>
	</div>
	<!-- table-area end -->
	<br><br><br>
	<%-- 페이지 처리 --%>
		<div class="text-center">
			<ul class="pagination">
				<c:choose>
				<c:when test="${ !empty requestScope.searchValue }">
				<li><button id="searchStartPage"><<</button></li>
			
				<li><c:if test="${ requestScope.pageInfo.pageNo == 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
						<button id="searchPrevPage"><</button>
					</c:if>
				</li>
				<li><c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
					<c:if test="${ requestScope.pageInfo.pageNo eq p }">
						<button disabled><c:out value="${ p }"/></button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo ne p }">
						<button onclick="searchPageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
					</c:if>
					</c:forEach>
				</li>
				<li>
					<c:if test="${ requestScope.pageInfo.pageNo == requestScope.pageInfo.maxPage }">
						<button disabled>></button>	
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
						<button id="searchNextPage">></button>
					</c:if>
				</li>
				<li><button id="searchMaxPage">>></button></li>
				</c:when>
				
				<c:otherwise>
				<li><button id="startPage"><<</button></li>
			
				<li><c:if test="${ requestScope.pageInfo.pageNo == 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
						<button id="prevPage"><</button>
					</c:if>
				</li>
				<li><c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
					<c:if test="${ requestScope.pageInfo.pageNo eq p }">
						<button disabled><c:out value="${ p }"/></button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo ne p }">
						<button onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
					</c:if>
					</c:forEach>
				</li>	
				<li><c:if test="${ requestScope.pageInfo.pageNo == requestScope.pageInfo.maxPage }">
						<button disabled>></button>	
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
						<button id="nextPage">></button>
					</c:if>
				</li>
				<li><button id="maxPage">>></button></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div><!-- pagingArea end -->


    
		<!-- 검색 폼 -->
		<form id="searchForm" action="${ pageContext.servletContext.contextPath }/infoboard/search" method="get">
			<div class="container-1" align="center">
				<c:choose>
				<c:when test="${ !empty requestScope.searchValue }">
				<select id="searchCondition" name="searchCondition">
					<option value="category" <c:if test="${requestScope.searchCondition eq 'category' }">selected</c:if>>카테고리</option>
					<option value="title" <c:if test="${requestScope.searchCondition eq 'title' }">selected</c:if>>제목</option>
					<option value="content" <c:if test="${requestScope.searchCondition eq 'content' }">selected</c:if>>내용</option>
				</select>
				<input type="search" id="searchValue" name="searchValue" value="${requestScope.searchValue}"/>
				</c:when>
				<c:otherwise>
				<select id="searchCondition" name="searchCondition">
					<option value="category">카테고리</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="search" id="searchValue" name="searchValue" placeholder="검색어를 입력해주세요."/>
				</c:otherwise>
				</c:choose>
				<span class="icon"><i class="fa fa-search"></i></span> 
				<button type="submit" id="submitBtn"><i class="fa fa-search"></i></button>
			</div>
		</form>
	
	<script>
		const link = "${ pageContext.servletContext.contextPath }/infoboard/list";
		const searchLink = "${ pageContext.servletContext.contextPath }/infoboard/search";
		/* 원하는 페이지 클릭시 실행되는 콜백 함수 */
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text;
		}
		function searchPageButtonAction(text) {
			location.href = searchLink + "?currentPage=" + text + "&searchCondition=${requestScope.searchCondition}&searchValue=${requestScope.searchValue}";
		}
		
		if(document.getElementById("searchStartPage")){
			const $searchStartPage = document.getElementById("searchStartPage");
			$searchStartPage.onclick = function(){
				location.href = searchLink + "?currentPage=1&searchCondition=${requestScope.searchCondition}&searchValue=${requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchMaxPage")){
			const $searchMaxPage = document.getElementById("searchMaxPage");
			$searchMaxPage.onclick = function(){
				location.href = searchLink + "?currentPage=${ requestScope.pageInfo.maxPage }&searchCondition=${requestScope.searchCondition}&searchValue=${requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchPrevPage")){
			const $searchPrevPage = document.getElementById("searchPrevPage");
			$searchPrevPage.onclick = function(){
				location.href = searchLink + "?currentPage=${ requestScope.pageInfo.pageNo - 1 }&searchCondition=${requestScope.searchCondition}&searchValue=${requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchNextPage")){
			const $searchNextPage = document.getElementById("searchNextPage");
			$searchNextPage.onclick = function(){
				location.href = searchLink + "?currentPage=${ requestScope.pageInfo.pageNo + 1 }&searchCondition=${requestScope.searchCondition}&searchValue=${requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("startPage")){
			const $startPage = document.getElementById("startPage");
			$startPage.onclick = function(){
				location.href = link + "?currentPage=1";
			}
		}
		
		if(document.getElementById("maxPage")){
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function(){
				location.href = link + "?currentPage=${ requestScope.pageInfo.maxPage }";
			}
		}
		
		if(document.getElementById("prevPage")){
			const $prevPage = document.getElementById("prevPage");
			$prevPage.onclick = function(){
				location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo - 1 }";
			}
		}
		
		if(document.getElementById("nextPage")){
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function(){
				location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo + 1 }";
			}
		}
		
		/* 게시글 관련 css 및 이벤트 처리(마우스 호버 및 클릭) */
	  	  function pageButtonAction(text) {
	  		  location.href = link + "?currentPage=" + text;
	  	  }
	  
		  if(document.getElementsByTagName("td")) {
	      const $tds = document.getElementsByTagName("td");
	      for(var i = 0 ; i < $tds.length ; i++) {
	         
	      $tds[i].onmouseenter = function() {
	         this.parentNode.style.cursor = "pointer";
	      }
	         
	      $tds[i].onclick = function() {
	    		  const no = this.parentNode.children[0].innerText;
	    	  	  location.href = "${ pageContext.servletContext.contextPath }/infoboard/detail?no=" + no;
	      	}   
	      }

		} 
		
	</script>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>