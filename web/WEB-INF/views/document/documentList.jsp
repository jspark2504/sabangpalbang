<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 서류</title>
</head>
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
	[id*=area]{
		background:white;
		max-width:190px;
		height:250px; 
		margin:45px; 
		padding:0px auto;
		border:rgba(0,0,0,0.3); 
		border-radius:5px; 
		border-style:dashed;
		text-align:center;
		vertical-align:middle;
	}
	input[type=file] {
		display:none;
	}
	h3{
		color:rgba(0,0,0,0.6);
	}
</style>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
	<br>
	<h3>&nbsp;&nbsp;내 서류</h3>
	<hr>
	<br>
	<table>
		<tr>
			<td>
				<div id="area1">
					<img id="document1" width="183" height="244">
				</div>
			</td>
			<td>
				<div id="area2">
					<img id="document2" width="183" height="244">
				</div>
			</td>
			<td>
				<div id="area3">
					<img id="document3" width="183" height="244">
				</div>
			</td>
			<td>
				<div id="area4">
					<img id="document4" width="183" height="244">
				</div>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td>
				<div id="area5">
					<img id="document5" width="183" height="244">
				</div>
			</td>
			<td>
				<div id="area6">
					<img id="document6" width="183" height="244">
				</div>
			</td>
			<td>
				<div id="area7">
					<img id="document7" width="183" height="244">
				</div>
			</td>
			<td>	
				<div id="area8">
					<img id="document8" width="183" height="244">
				</div>
			</td>
		</tr>
	</table>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>