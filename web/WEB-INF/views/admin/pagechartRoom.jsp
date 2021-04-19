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
   <link rel="stylesheet" href="/findMyRoom/resources/css/free_board.css?">
   <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

   <!-- 차트에 대한 cdn 자바스크립트 -->   
   <script src="https://cdn.jsdelivr.net/npm/chart.js@3.1.0/dist/chart.min.js" defer></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.min.js"></script>

   <style>
   .btn{
   	top:10px;
   }
   </style>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
		<h1 align="center">관리자 통계</h1>
		<h4 align="center">매물 요일별 통계</h4>
		<div align="center">
			<canvas id="myChart" style="width: 900px; height: 500px;"></canvas>
		</div>
		<div align="center">
		<button onclick="location.href='${ pageContext.servletContext.contextPath}/pagecount/List'" class="btn">메인페이지통계</button>
		<button onclick="location.href='${ pageContext.servletContext.contextPath}/pagecount/infoboard'" class="btn">정보게시판통계</button>
		<button onclick="location.href='${ pageContext.servletContext.contextPath}/pagecount/freeboard'" class="btn">자유게시판통계</button>
		<button onclick="location.href='${ pageContext.servletContext.contextPath}/pagecount/notice'" class="btn">공지사항통계</button>
		</div>
		<form id="form" action="${ pageContext.servletContext.contextPath }/pagecount/List" method="get">
			<input id="chartName1" type="hidden" name="pageCountList1" value="${ requestScope.pageCountList29.category.name }">
			<input id="chartViewNo1" type="hidden" name="pageCountList1" value="${ requestScope.pageCountList29.pageView }">
			<input id="chartPageDay1" type="hidden" name="pageCountList1" value="${ requestScope.pageCountList29.pageDay }">

			<input id="chartViewNo2" type="hidden" name="pageCountList2" value="${ requestScope.pageCountList30.pageView }">
			<input id="chartPageDay2" type="hidden" name="pageCountList2" value="${ requestScope.pageCountList30.pageDay }">

			<input id="chartViewNo3" type="hidden" name="pageCountList3" value="${ requestScope.pageCountList31.pageView }">
			<input id="chartPageDay3" type="hidden" name="pageCountList3" value="${ requestScope.pageCountList31.pageDay }">

			<input id="chartViewNo4" type="hidden" name="pageCountList4" value="${ requestScope.pageCountList32.pageView }">
			<input id="chartPageDay4" type="hidden" name="pageCountList4" value="${ requestScope.pageCountList32.pageDay }">

			<input id="chartViewNo5" type="hidden" name="pageCountList5" value="${ requestScope.pageCountList33.pageView }">
			<input id="chartPageDay5" type="hidden" name="pageCountList5" value="${ requestScope.pageCountList33.pageDay }">

			<input id="chartViewNo6" type="hidden" name="pageCountList6" value="${ requestScope.pageCountList34.pageView }">
			<input id="chartPageDay6" type="hidden" name="pageCountList6" value="${ requestScope.pageCountList34.pageDay }">

			<input id="chartViewNo7" type="hidden" name="pageCountList7" value="${ requestScope.pageCountList35.pageView }">
			<input id="chartPageDay7" type="hidden" name="pageCountList7" value="${ requestScope.pageCountList35.pageDay }">
		</form>
   <jsp:include page="../common/footer.jsp" />
<script>
    var chartName1 = $( "#chartName1" ).val();
    var chartViewNo1 = $( "#chartViewNo1" ).val();
    var chartViewNo2 = $( "#chartViewNo2" ).val();
    var chartViewNo3 = $( "#chartViewNo3" ).val();
    var chartViewNo4 = $( "#chartViewNo4" ).val();
    var chartViewNo5 = $( "#chartViewNo5" ).val();
    var chartViewNo6 = $( "#chartViewNo6" ).val();
    var chartViewNo7 = $( "#chartViewNo7" ).val();
    var chartPageDay1 = $( "#chartPageDay1" ).val();
    var chartPageDay2 = $( "#chartPageDay2" ).val();
    var chartPageDay3 = $( "#chartPageDay3" ).val();
    var chartPageDay4 = $( "#chartPageDay4" ).val();
    var chartPageDay5 = $( "#chartPageDay5" ).val();
    var chartPageDay6 = $( "#chartPageDay6" ).val();
    var chartPageDay7 = $( "#chartPageDay7" ).val();


var cht = document.getElementById('myChart');
var charts = document.getElementById("charts");
var data = [{name: chartPageDay1 , viewNo: chartViewNo1}, {name: chartPageDay2, viewNo: chartViewNo2}, {name: chartPageDay3, viewNo: chartViewNo3}, {name: chartPageDay4, viewNo: chartViewNo4}
		  , {name: chartPageDay5, viewNo: chartViewNo5}, {name: chartPageDay6, viewNo: chartViewNo6}, {name: chartPageDay7, viewNo: chartViewNo7}];
var  myChart = new Chart(cht, {
    type: 'bar',
    data: {
        datasets: [{
            label:  '# of ' + chartName1 +' 차트',
            data: data 
            ,parsing: { xAxisKey: 'name', yAxisKey: 'viewNo'
            },
            backgroundColor: [ 'rgba(255, 99, 132, 0.6)', 'rgba(205, 135, 80, 0.6)', 'rgba(255, 206, 80, 0.6)', 'rgba(0, 215, 100, 0.6)', 'rgba(54, 162, 235, 0.6)', 'rgba(255, 160, 235, 0.6)', 'rgba(150, 30, 235, 0.6)'
            ],
            borderColor: [ 'rgba(255, 99, 132, 0.6)', 'rgba(205, 135, 80, 0.6)', 'rgba(255, 206, 80, 0.6)', 'rgba(0, 215, 100, 0.6)', 'rgba(54, 162, 235, 0.6)', 'rgba(255, 160, 235, 0.6)', 'rgba(150, 30, 235, 0.6)'
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