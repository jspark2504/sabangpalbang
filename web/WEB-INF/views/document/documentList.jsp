<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 서류</title>
</head>
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	[id*=area]{
		background:white;
		max-width:190px;
		height:250px; 
		margin:45px; 
		padding:10px auto;
		border:rgba(0,0,0,0.3); 
		border-radius:5px; 
		border-style:dashed;
		text-align:center;
		vertical-align:middle;
	}
	input[type=file] {
		display:none;
	}
	hr,h3{
		color:rgba(0,0,0,0.6);
		position:relative;
		left:35px;
		top:10px;
	}
	button.btn{
		background:rgb(255, 210, 51);
		position:relative;
		bottom:40px;
		right:90px;
	}
	button.btn:hover{
		background: rgb(81, 75, 55);
		color: white;
		transition-duration: 0.3s;
	}
	.checkbox{
		position:relative;
		bottom:25px;
	}
</style>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
	<br>
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;내 서류</h3>
	<button type="button" class="btn pull-right" onclick="location.href='${pageContext.servletContext.contextPath}/document/insert'">서류 등록</button>
	<hr>
	<br>
	<table>
		<tr>
			<td>
				<div id="area1">
					<img id="document1" src="${ pageContext.servletContext.contextPath }${ requestScope.documentList[0].thumbnailPath}" width="183" height="244" onError="this.style.visibility='hidden'">
				</div>
			</td>
			<td>
				<div id="area2">
					<img id="document2" src="${ pageContext.servletContext.contextPath }${ requestScope.documentList[1].thumbnailPath}" width="183" height="244" onError="this.style.visibility='hidden'">
				</div>
			</td>
			<td>
				<div id="area3">
					<img id="document3" src="${ pageContext.servletContext.contextPath }${ requestScope.documentList[2].thumbnailPath}" width="183" height="244" onError="this.style.visibility='hidden'">
				</div>
			</td>
			<td>
				<div id="area4">
					<img id="document4" src="${ pageContext.servletContext.contextPath }${ requestScope.documentList[3].thumbnailPath}" width="183" height="244" onError="this.style.visibility='hidden'">
				</div>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td>
				<div id="area5">
					<img id="document5" src="${ pageContext.servletContext.contextPath }${ requestScope.documentList[4].thumbnailPath}" width="183" height="244" onError="this.style.visibility='hidden'">
				</div>
			</td>
			<td>
				<div id="area6">
					<img id="document6" src="${ pageContext.servletContext.contextPath }${ requestScope.documentList[5].thumbnailPath}" width="183" height="244" onError="this.style.visibility='hidden'">
				</div>
			</td>
			<td>
				<div id="area7">
					<img id="document7" src="${ pageContext.servletContext.contextPath }${ requestScope.documentList[6].thumbnailPath}" width="183" height="244" onError="this.style.visibility='hidden'">
				</div>
			</td>
			<td>	
				<div id="area8">
					<img id="document8" src="${ pageContext.servletContext.contextPath }${ requestScope.documentList[7].thumbnailPath}" width="183" height="244" onError="this.style.visibility='hidden'">
				</div>
			</td>
		</tr>
	</table>
</div>
<jsp:include page="../common/footer.jsp" />
<script>
	if(document.getElementsByTagName("img")) {
		const $tds = document.getElementsByTagName("img");
		for(var i = 0 ; i < $tds.length ; i++) {
			$tds[i].onmouseenter = function() {
			this.parentNode.style.cursor = "pointer";
		}
	}
} 
</script>
</body>
</html>