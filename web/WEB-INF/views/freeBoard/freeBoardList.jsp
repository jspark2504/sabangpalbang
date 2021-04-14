<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">

<title>자유게시판</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="/findMyRoom/resources/css/free_board.css?">

</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div class="container">
		<h1 class="text">자유게시판</h1>
			<c:if test="${!empty sessionScope.loginMember }">
				<button onclick="location.href='${ pageContext.servletContext.contextPath}/freeBoard/insert'" class="btn pull-right">글쓰기</button>
			</c:if>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th style="width: 73px; text-align: center;">번호</th>
					<th style="width: 750px;">제목</th>
					<th style="width: 120px;">작성자</th>
					<th style="text-align: center;">작성일자</th>
					<th style="text-align: center;">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${ requestScope.boardList }">
					<tr>
						<td align="center"><c:out value="${ board.no }" /></td>
						<td><c:out value="${ board.title }" /></td>
						<td><c:out value="${ board.writer.nickname }" /></td>
						<td align="center"><c:out value="${ board.createDate }" /></td>
						<td align="center"><c:out value="${ board.count }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- table-area end -->

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
							<button disabled style="background: rgba(0, 0, 0, 0.4);"><c:out value="${ p }" /></button>
						</c:if>
						<c:if test="${ requestScope.pageInfo.pageNo ne p }">
							<button onclick="searchPageButtonAction(this.innerText);"><c:out value="${ p }" /></button>
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
				</c:if></li>
			<li><c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
					<c:if test="${ requestScope.pageInfo.pageNo eq p }">
						<button disabled style="background: rgba(0, 0, 0, 0.4);">
							<c:out value="${ p }" />
						</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo ne p }">
						<button onclick="pageButtonAction(this.innerText);">
							<c:out value="${ p }" />
						</button>
					</c:if>
				</c:forEach></li>
			<li><c:if
					test="${ requestScope.pageInfo.pageNo == requestScope.pageInfo.maxPage }">
					<button disabled>></button>
				</c:if> <c:if
					test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
					<button id="nextPage">></button>
				</c:if></li>
			<li><button id="maxPage">>></button></li>
			</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<!-- 페이지 처리 -->

	<!-- 검색 폼 -->
	<form id="searchForm"
		action="${pageContext.servletContext.contextPath }/freeBoard/search"
		method="get">
		<div class="container-1" align="center">
		<c:choose>
			<c:when test="${ !empty requestScope.searchValue }">
			<select id="searchCondition" name="searchCondition">
				<option value="title" <c:if test="${requestScope.searchCondition eq 'title' }">selected</c:if>>제목</option>
				<option value="content" <c:if test="${requestScope.searchCondition eq 'content' }">selected</c:if>>내용</option>
				<option value="writer" <c:if test="${requestScope.searchCondition eq 'writer' }">selected</c:if>>작성자</option>
			</select> 
			<input type="text" id="searchValue" name="searchValue" value="${requestScope.searchValue}" />
			</c:when>
			
			<c:otherwise>
			<select id="searchCondition" name="searchCondition">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>  
			<input type="text" id="searchValue" name="searchValue" placeholder="검색어를 입력해주세요."/>
			</c:otherwise>
			</c:choose>
			<span class="icon"><i class="fa fa-search"></i></span> 
			<button type="submit" id="submitBtn"><i class="fa fa-search"></i></button>
		</div>
	</form>


	<script>
		const link = "${ pageContext.servletContext.contextPath }/freeboard/list";
		const searchLink = "${ pageContext.servletContext.contextPath }/freeBoard/search";
		
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
		if(document.getElementsByTagName("td")) {
			const $tds = document.getElementsByTagName("td");
			for(var i = 0 ; i < $tds.length ; i++) {
				
				$tds[i].onmouseenter = function() {
					this.parentNode.style.cursor = "pointer";
				}
				
				$tds[i].onclick = function() {
					const no = this.parentNode.children[0].innerText;
					location.href = "${pageContext.servletContext.contextPath}/freeBoard/detail?no=" + no;
					/* 게시물 번호까지 알아 냈으니 게시물 상세보기는 공지사항 상세보기를 참조하여 작성 */ 
				}
			}
		} 
		
		
	</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>