<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역</title>
<style>
	#paymentListBox{
		border:1px solid rgba(0,0,0,0.2);
		border-radius:10px;
		width:750px;
		height:180px;
		margin:70px auto;
		position:relative;
		top:20px;
	}
	#membershipIcon{
		position:relative;
		top:18px;
		left:40px;
	}
	#membershipName{
		font-weight:bolder;
		text-align:center;
		position:relative;
		right:165px;
		top:70px;
	}
	#paymentDate{
		font-weight:bolder;
		text-align:center;
		position:relative;
		right:30px;
		bottom:54px;
	}
	#paymentIcon{
		position:relative;
		left:320px;
		bottom:50px;
	}
	#expirationDate{
		font-weight:bolder;
		text-align:center;
		position:relative;
		left:125px;
		bottom:112px;
	}
	#expirationIcon{
		position:relative;
		left:465px;
		bottom:108px;
	}
	#cost{
		font-weight:bolder;
		text-align:center;
		position:relative;
		left:270px;
		bottom:171px;
	}
	#wonIcon{
		position:relative;
		left:608px;
		bottom:169px;
	}
</style>
</head>
<link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
<br>
<br>
<h3>결제 내역</h3>
<br>
<hr>
<c:forEach items="${paymentList }" var="payment">
	<div id="paymentListBox">
		<h4 id="membershipName">기본 이용권</h4>
		<img src="/findMyRoom/resources/image/membership.png" id="membershipIcon">
		<h4 id="paymentDate">결제일</h4>
		<i class="fa fa-calendar-check-o" aria-hidden="true" id="paymentIcon">&nbsp;&nbsp;${payment.paymentDate }</i>
		<h4 id="expirationDate">유효기간</h4>
		<i class="fa fa-calendar-minus-o" aria-hidden="true" id="expirationIcon">&nbsp;&nbsp;${payment.expirationDate }</i>
		<h4 id="cost">결제 금액</h4>
		<i class="fa fa-krw" aria-hidden="true" id="wonIcon">&nbsp;&nbsp;198,000</i>
	</div>
</c:forEach>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>