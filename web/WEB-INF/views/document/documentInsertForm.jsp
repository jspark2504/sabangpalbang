<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서류 등록</title>
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
	button.btn{
		background:rgb(255, 210, 51);
		position:relative;
		right:65px;
	}
	button.btn:hover{
		background: rgb(81, 75, 55);
		color: white;
		transition-duration: 0.3s;
	}
</style>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
	<br>
	<h3>&nbsp;&nbsp;서류 등록</h3>
	<hr>
	<br>
	<form action="${pageContext.servletContext.contextPath }/document/insert" method="post" encType="multipart/form-data">
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
	<div>
		<input type="file" id="documentImg1" name="documentImg1" onchange="loadImg(this,1)">
		<input type="file" id="documentImg2" name="documentImg2" onchange="loadImg(this,2)">
		<input type="file" id="documentImg3" name="documentImg3" onchange="loadImg(this,3)">
		<input type="file" id="documentImg4" name="documentImg4" onchange="loadImg(this,4)">
		<input type="file" id="documentImg5" name="documentImg5" onchange="loadImg(this,5)">
		<input type="file" id="documentImg6" name="documentImg6" onchange="loadImg(this,6)">
		<input type="file" id="documentImg7" name="documentImg7" onchange="loadImg(this,7)">
		<input type="file" id="documentImg8" name="documentImg8" onchange="loadImg(this,8)">
	</div>

	<button id="submitBtn" class="btn pull-right" type="submit">등록하기</button>
	</form>
</div>
<jsp:include page="../common/footer.jsp" />
<script>
			const $area1 = document.getElementById("area1");
			const $area2 = document.getElementById("area2");
			const $area3 = document.getElementById("area3");
			const $area4 = document.getElementById("area4");
			const $area5 = document.getElementById("area5");
			const $area6 = document.getElementById("area6");
			const $area7 = document.getElementById("area7");
			const $area8 = document.getElementById("area8");
			
			$area1.onclick = function() {
				document.getElementById("documentImg1").click();
			}
			$area2.onclick = function() {
				document.getElementById("documentImg2").click();
			}
			$area3.onclick = function() {
				document.getElementById("documentImg3").click();
			}
			$area4.onclick = function() {
				document.getElementById("documentImg4").click();
			}
			$area5.onclick = function() {
				document.getElementById("documentImg5").click();
			}
			$area6.onclick = function() {
				document.getElementById("documentImg6").click();
			}
			$area7.onclick = function() {
				document.getElementById("documentImg7").click();
			}
			$area8.onclick = function() {
				document.getElementById("documentImg8").click();
			}
			
			/* 이미지 파일 미리보기 */
			function loadImg(value, num) {
				if(value.files && value.files[0]) {
					const reader = new FileReader();
					
					reader.onload = function(e) {
						switch(num) {
							case 1: document.getElementById("document1").src = e.target.result;
									break;
							case 2: document.getElementById("document2").src = e.target.result;
									break;
							case 3: document.getElementById("document3").src = e.target.result;
									break;
							case 4: document.getElementById("document4").src = e.target.result;
									break;
							case 5: document.getElementById("document5").src = e.target.result;
									break;
							case 6: document.getElementById("document6").src = e.target.result;
									break;
							case 7: document.getElementById("document7").src = e.target.result;
									break;
							case 8: document.getElementById("document8").src = e.target.result;
									break;
						}
					}
					/* readAsDataURL은 Blob이나 file에서 읽어오는 역할을 함 */
					/* Blob(Binary Large Object) : 바이너리 형태의 큰 객체(이미지, 사운드, 비디오같은 멀티미디어 객체) */
					/* 우리가 이미지를 브라우저에 뿌려주기 위해서는 base64 encoded string으로 변환해 주어야 한다. */
					reader.readAsDataURL(value.files[0]);
				}
			}
			if(document.getElementsByTagName("img")) {
				const $tds = document.getElementsByTagName("img");
				for(var i = 0 ; i < $tds.length ; i++) {
					
					$tds[i].onmouseenter = function() {
						this.parentNode.style.cursor = "pointer";
					}

				}
			}
			$ (document).ready ( function(){
			    $('#submitBtn').attr('disabled',true);
			    $('input:file').change(
			        function(){
			            if ($(this).val()){
			                $('#submitBtn').removeAttr('disabled'); 
			            }
			            else {
			                $('#submitBtn').attr('disabled',true);
			            }
			        });
			});   
		</script>
</body>
</html>