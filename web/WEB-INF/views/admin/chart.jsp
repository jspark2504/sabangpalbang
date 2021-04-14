<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">

   <title>구해줘! 내 방</title>
	<!--  부트스트랩 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<!-- 차트에 대한 cdn 자바스크립트 -->   
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js" defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.min.js"></script>

	<style>
	</style>
</head>
<body>

<!-- /chart/infoboard -->

   <jsp:include page="../common/header.jsp"/>
		<h3 align="center">관리자 통계</h3>
		<div align="center">
			<canvas id="myChart" style="width: 500px; height: 400px;"></canvas>
	
		</div>




	<jsp:include page="../common/footer.jsp" />

<script>

var  ctx = document.getElementById('myChart');
var  myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['월', '화', '수', '목', '금', '토', '일'],
        datasets: [{
            label: '# of Votes',
            data: [2, 3, 3, 5, 2, 3, 1],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
    responsive: false,
        scales: {
            y: {
                beginAtZero: true
            },
        }
   },
});
</script>
</body>
</html>