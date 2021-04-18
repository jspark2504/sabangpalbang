<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>Insert title here</title>
  <link rel='stylesheet' href='/findMyRoom/resources/css/carousel.css' />
</head>
<body>
   <div class='container'>
	<div class='carousel'>
		<input type='radio' id='carousel-1' name='carousel[]' >
		<input type='radio' id='carousel-2' name='carousel[]'>
        <input type='radio' id='carousel-3' name='carousel[]'>
		<input type='radio' id='carousel-4' name='carousel[]'>
		<input type='radio' id='carousel-5' name='carousel[]'>
		<ul class='carousel__items'>
			<li class='carousel__item'><img src='/findMyRoom/resources/image/room1.png' alt=''></li>
			<li class='carousel__item'><img src='/findMyRoom/resources/image/room2.png' alt=''></li>
			<li class='carousel__item'><img src='/findMyRoom/resources/image/room3.png' alt=''></li>
			<li class='carousel__item'><img src='/findMyRoom/resources/image/room4.png' alt=''></li>
			<li class='carousel__item'><img src='/findMyRoom/resources/image/room3.png' alt=''></li>
		</ul>
       <div class='carousel__prev'>
       	<label for='carousel-1'></label>
       	<label for='carousel-2'></label>
       	<label for='carousel-3'></label>
       	<label for='carousel-4'></label>
       	<label for='carousel-5'></label>
       </div>
       <div class='carousel__next'>
         <label for='carousel-1'></label>
         <label for='carousel-2'></label>
         <label for='carousel-3'></label>
         <label for='carousel-4'></label>
         <label for='carousel-5'></label>
       </div>
       <div class='carousel__nav'>
         <label for='carousel-1'></label>
         <label for='carousel-2'></label>
         <label for='carousel-3'></label>
         <label for='carousel-4'></label>
         <label for='carousel-5'></label>
     </div>
   </div>
 </div>
</body>
</html>
