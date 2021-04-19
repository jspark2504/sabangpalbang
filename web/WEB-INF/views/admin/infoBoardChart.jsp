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
   <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<!-- 차트에 대한 cdn 자바스크립트 -->   
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js" defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.min.js"></script>

	<style>
	</style>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
		<h3 align="center">관리자 통계</h3>
		<div align="center">
			<canvas id="myChart" style="width: 600px; height: 500px;"></canvas>
		</div>
		<form id="form" action="${ pageContext.servletContext.contextPath }/chart/infoboard" method="get">
			<input id="chartName1" type="hidden" name="categoryChart1" value="${ requestScope.categoryList1.name }">
			<input id="chartViewNo1" type="hidden" name="categoryChart1" value="${ requestScope.categoryList1.viewNo }">
			<input id="chartName2" type="hidden" name="categoryChart2" value="${ requestScope.categoryList2.name }">
			<input id="chartViewNo2" type="hidden" name="categoryChart2" value="${ requestScope.categoryList2.viewNo }">
			<input id="chartName3" type="hidden" name="categoryChart3" value="${ requestScope.categoryList3.name }">
			<input id="chartViewNo3" type="hidden" name="categoryChart3" value="${ requestScope.categoryList3.viewNo }">
		</form>
   <jsp:include page="../common/footer.jsp" />

<script>
    var chartName1 = $( "#chartName1" ).val();
    var chartName2 = $( "#chartName2" ).val();
    var chartName3 = $( "#chartName3" ).val();
    var chartViewNo1 = $( "#chartViewNo1" ).val();
    var chartViewNo2 = $( "#chartViewNo2" ).val();
    var chartViewNo3 = $( "#chartViewNo3" ).val();


var cht = document.getElementById('myChart');
var charts = document.getElementById("charts");
var data = [{name: chartName1 , viewNo: chartViewNo1}, {name: chartName2, viewNo: chartViewNo2}, {name: chartName3, viewNo: chartViewNo3}];
var  myChart = new Chart(cht, {
    type: 'bar',
    data: {
        datasets: [{
            label: '# of 정보게시판 카테고리별 조회수 차트',
            data: data 
            ,parsing: { xAxisKey: 'name', yAxisKey: 'viewNo'
            },
            backgroundColor: [ 'rgba(255, 99, 132, 0.6)', 'rgba(255, 206, 86, 0.6)', 'rgba(54, 162, 235, 0.6)'
            ],
            borderColor: [ 'rgba(255, 99, 132, 0.6)', 'rgba(255, 206, 86, 0.6)', 'rgba(54, 162, 235, 0.6)'
            ],
            borderWidth: 0
       }]
    },
    options: {
    responsive: false,
    legend: {
    	display:true,
    },	
   },
});

</script>
</body>
</html>