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
			<canvas id="myChart" style="width: 500px; height: 400px;"></canvas>
		</div>
		<div>
		
		</div>
	<form id="form" action="${ pageContext.servletContext.contextPath }/chart/infoboard" method="get">
		<input id="charts1" type="hidden" name="categoryChart1" value="${ requestScope.categoryList1.name }">
		<input id="charts1_1" type="hidden" name="categoryChart1" value="${ requestScope.categoryList1.viewNo }">
		<input id="charts2" type="hidden" name="categoryChart2" value="${ requestScope.categoryList2.name }">
		<input id="charts2_1" type="hidden" name="categoryChart2" value="${ requestScope.categoryList2.viewNo }">
		<input id="charts3" type="hidden" name="categoryChart3" value="${ requestScope.categoryList3.name }">
		<input id="charts3_1" type="hidden" name="categoryChart3" value="${ requestScope.categoryList3.viewNo }">
	</form>
	
<%--
 		<div align="center" >
      <table style="width: 500px;" class="table table-striped table-hover">
		 		   <tr>
		 		   	  <th style="text-align: center;"> 카테고리 번호</th>
					  <th style="text-align: center;"> 카테고리 이름</th>
				      <th style="text-align: center;"> 카테고리별 조회수</th>
		           </tr>
           		 <c:forEach var="categoryChart" items="${ categoryList }">
	               <tr>
	                  <td id="no" align="center"><c:out value="${ categoryChart.no }"/></td>
	                  <td id="names" align="center"><c:out value="${ categoryChart.name }"/></td>
	                  <td id="viewNo" align="center"><c:out value="${ categoryChart.viewNo }"/></td>
	               </tr>
          		 </c:forEach>
       </table>		
		</div> 
--%>

	
	<jsp:include page="../common/footer.jsp" />

<script>

    var chart1 = $( "#charts1" ).val();
        console.log(chart1);
    var chart2 = $( "#charts2" ).val();
        console.log(chart2);
    var chart3 = $( "#charts3" ).val();
        console.log(chart3);
    var chart1_1 = $( "#charts1_1" ).val();
        console.log(chart1_1);
    var chart2_1 = $( "#charts2_1" ).val();
        console.log(chart2_1);
    var chart3_1 = $( "#charts3_1" ).val();
        console.log(chart3_1);

/* 
var names = {name_0:"", name_1:"", name_2:""}
var viewNo = {viewNo_0:"", viewNo_1:"", viewNo_2:""} 
*/

/* 
for (i = 0; i < chart.length; i++) {
 	chart.push(chart[i].name)
	chart.push(chart[i].viewNo) 
	names["name_" + i] = chart[i].name
	names["viewNo_" + i] = chart[i].viewNo
}
 */

var ctx = document.getElementById('myChart');
var charts = document.getElementById("charts");
var data = [{name: chart1 , viewNo: chart1_1}, {name: chart2, viewNo: chart2_1}, {name: chart3, viewNo: chart3_1}];
var  myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        datasets: [{
            label: '# of 카테고리 차트',
            data: data , parsing: {
            	xAxisKey: 'name',
                yAxisKey: 'viewNo',
            },
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)'
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