<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용권 목록</title>
<style>
	#membershipBox{
		border:1px solid rgba(0,0,0,0.2);
		border-radius:10px;
		width:750px;
		height:160px;
		margin:110px auto;
		position:relative;
	}
	#membershipIcon{
		position:relative;
		top:45px;
		left:60px;
	}
	#wonIcon{
		position:relative;
		left:397px;
		bottom:46px;
	}
	h4{
		font-weight:bolder;
		text-align:center;
		position:relative;
		right:25px;
		bottom:22px;
	}
	h6{
		color:rgba(0,0,0,0.3);
		text-align:center;
		position:relative;
		right:40px;
		bottom:17px;
	}
	#paymentBtn{
		background:rgb(255, 210, 51);
		position:relative;
		bottom:70px;
		right:80px;
	}
	#paymentBtn:hover{
		background: rgb(81, 75, 55);
		color: white;
		transition-duration: 0.3s;		
	}
</style>
</head>
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
<jsp:include page="../common/header.jsp"/>
	<div class="container">
		<form action="${ pageContext.servletContext.contextPath}/payment" method="post">
		<br>
		<br>
		<h3>이용권 목록</h3>
		<br>
		<hr>
		<div id="membershipBox">
			<img src="/findMyRoom/resources/image/membership.png" id="membershipIcon">
			<h4>기본 이용권&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이용권 가격</h4>
			<h6>결제일로부터 30일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;198,000</h6>
			<img src="/findMyRoom/resources/image/won.png" id="wonIcon">
			<button type="submit" class="btn pull-right" id="paymentBtn">결제하기</button>
		</div>
		</form>
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>