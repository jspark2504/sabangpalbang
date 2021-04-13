<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>구해줘! 내 방</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  
    <link rel="stylesheet" href="/findMyRoom/resources/css/freeBoardInsert.css">
    
    <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div align="center" class="outer outer-board-insert">
		<br>
		<h2 align="center">게시판 작성</h2>
		<div class="table-area">
			<form action="${ pageContext.servletContext.contextPath }/infoboard/insert" method="post">
				<table>
					<tr>
						<td>분야</td>
						<td>
							<select name="category">
								<option value="1">계약시주의사항</option>
								<option value="2">청년정책</option>
								<option value="3">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3"><input type="text" name="title" style="width:400px;"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>