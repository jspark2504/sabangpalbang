<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .btns {
    position: relative;
	background: rgb(255, 210, 51);
	color: black;
	border: hidden;
	}
	.btns:hover {
	background: rgb(81, 75, 55);
	color: white;
	transition-duration: 0.3s;
	}
    </style>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
    <div class="container">
        <h1 class="text">회원관리</h1>
      <form id="form" action="${ pageContext.servletContext.contextPath }/manage/list" method="post">
      <table class="table table-striped table-hover">
			<thead>
		 		   <tr>
		 		   	  <th style="text-align: center;">회원번호</th>
		 		   	  <th style="text-align: center;">회원아이디</th>
		              <th style="text-align: center;">이름</th>
					  <th style="text-align: center;">이메일</th>
					  <th style="text-align: center;">전화번호</th>
				      <th style="text-align: center;">회원구분</th>
					  <th style="text-align: center;">가입신청일</th>
					  <th style="text-align: center;">가입승인</th>
					  <th style="text-align: center;">승인여부</th>
					  <th style="text-align: center;">회원등록일</th>
					  <th style="text-align: center;">회원상태</th>
					  <th style="text-align: center;">회원정지</th>
		           </tr>
		    </thead>
			<tbody>
           		 <c:forEach var="member" items="${ requestScope.manageList }">
	               <tr>
	                  <td align="center"><c:out value="${ member.no }"/></td>
	                  <td align="center"><c:out value="${ member.id }"/></td>
	                  <td align="center"><c:out value="${ member.nickname }"/></td>
	                  <td align="center"><c:out value="${ member.email }"/></td>
	                  <td align="center"><c:out value="${ member.phone }"/></td>
	                  <td align="center"><c:out value="${ member.role }"/></td>
	                  <td align="center"><c:out value="${ member.applyDate }"/></td>
	                  <td align="center"><c:out value="${ member.approval }"/></td>
	                  <td align="center"><button value="${ member.no }" name="no" class="btns" onclick="postRequest('approvalOffice')">승인</button>
	                  <button value="${ member.no }" name="no" class="btns" onclick="postRequest('rejectOffice')">거부</button></td>
	                  <td align="center"><c:out value="${ member.enrollDate }"/></td>
	                  <td align="center"><c:out value="${ member.status }"/></td>
	                  <td align="center"><button value="${ member.no }" name="no" class="btns" onclick="postRequest('pauseMember')">정지</button>
	                  <button value="${ member.no }" name="no" class="btns" onclick="postRequest('restoreMember')">복구</button></td>
	               </tr>
            	</c:forEach>
            </tbody>
       </table>
       </form>
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
		<form id="searchForm" action="${ pageContext.servletContext.contextPath }/manage/search" method="get">
			<div class="container-1" align="center">
				<c:choose>
				<c:when test="${ !empty requestScope.searchValue }">
				<select id="searchCondition" name="searchCondition">
					<option value="userId" <c:if test="${requestScope.searchCondition eq 'id' }">selected</c:if>>아이디</option>
					<option value="nickName" <c:if test="${requestScope.searchCondition eq 'nickname' }">selected</c:if>>회원이름</option>
					<option value="email" <c:if test="${requestScope.searchCondition eq 'email' }">selected</c:if>>이메일</option>
					<option value="phone" <c:if test="${requestScope.searchCondition eq 'phone' }">selected</c:if>>전화번호</option>
					<option value="userRoll" <c:if test="${requestScope.searchCondition eq 'role' }">selected</c:if>>회원구분</option>
					<option value="applyDate" <c:if test="${requestScope.searchCondition eq 'applyDate' }">selected</c:if>>가입신청일</option>
					<option value="approval" <c:if test="${requestScope.searchCondition eq 'approval' }">selected</c:if>>승인여부</option>
					<option value="enrollDate" <c:if test="${requestScope.searchCondition eq 'enrollDate' }">selected</c:if>>회원등록일</option>
					<option value="userStatus" <c:if test="${requestScope.searchCondition eq 'status' }">selected</c:if>>회원상태</option>
				</select>
				<input type="search" id="searchValue" name="searchValue" value="${requestScope.searchValue}">
				</c:when>
				<c:otherwise>
				<select id="searchCondition" name="searchCondition">
					<option value="userId">회원아이디</option>
					<option value="nickName">회원이름</option>
					<option value="email">이메일</option>
					<option value="phone">전화번호</option>
					<option value="userRoll">회원구분</option>
					<option value="applyDate">가입신청일</option>
					<option value="approval">승인여부</option>
					<option value="enrollDate">회원등록일</option>
					<option value="userStatus">회원상태</option>
				</select>
				<input type="search" id="searchValue" name="searchValue">
				</c:otherwise>
				</c:choose>
				<span class="icon"><i class="fa fa-search"></i></span> 
				<button type="submit" id="submitBtn"><i class="fa fa-search"></i></button>
			</div>
		</form>
	
	<script>
		const link = "${ pageContext.servletContext.contextPath }/manage/list";
		const searchLink = "${ pageContext.servletContext.contextPath }/manage/search";
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
	      	}
		  } 
		/* 정지와 복구 기능을 위한 함수 처리 */
		function postRequest(intent){
			var $form = document.getElementById("form");
			
			requestPath = "<%=request.getContextPath()%>";
			
			switch(intent){
			case "pauseMember" : requestPath += "/manage/pause"; break;
			case "restoreMember" : requestPath += "/manage/restore"; break;
			case "approvalOffice" : requestPath += "/manage/approval"; break;
			case "rejectOffice" : requestPath += "/manage/reject"; break;
			}
			$form.action = requestPath;
			$form.submit();
		}
		  
	</script>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>