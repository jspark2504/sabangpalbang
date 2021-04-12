<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="outer outer-board-insert">
		<br>
		<h2 align="center">게시판 작성</h2>
		<div class="table-area">
			<form action="${ pageContext.servletContext.contextPath }/board/insert" method="post">
				<table>
					<tr>
						<td>분야</td>
						<td>
							<select name="category">
								<option value="1">계약시주의사항</option>
								<option value="2">청년전세대출</option>
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
							<textarea name="body" cols="60" rows="15" style="resize:none;"></textarea>
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









