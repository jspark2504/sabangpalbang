<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <!-- 기기(디바이스)별 크기를 인식 하고 1.0으로 확대 및 축소 없이해서 보여줌 -->
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
   <title>구해줘! 내 방</title>

    <style>
    .h1{
      background: rgb(255,210,51);
    }
    .table {
      padding-top: 280px;
      padding-bottom: 80px;
    }
    .container {
      max-width: 700px;
      height: 500px;
      padding: 15px;
      margin: 0 auto;
      border: 1px solid rgba(0, 0, 0, 0.1);
    }
    button{
      max-width: 100px;
      background: rgb(255,210,51);
    }
    </style>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
  <section>
    <div class="container">
        <h1 align="center">정보게시판</h1>
      <table class="table table-bordered">
        <tr>
          <th>부동산 정책</th>  
          <th>정부 지원 정책</th>
          <th>이것만 알고 가자</th>
        </tr>
      </table>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>165</td>
            <td>부트스트랩 입니다!</td>
            <td>관리자</td>
            <td>2016/12/12</td>
            <td>2</td>
          </tr>
          <tr>
            <td>164</td>
            <td>붓흐스트랩 입니다2</td>
            <td>손님1</td>
            <td>2016/12/11</td>
            <td>1</td>
          </tr>
          <tr>
            <td>163</td>
            <td>부트스트랩 안녕</td>
            <td>업자</td>
            <td>2016/11/22</td>
            <td>5</td>
          </tr>
          <tr>
            <td>162</td>
            <td>부트스트랩 안녕</td>
            <td>부동산업자</td>
            <td>2016/11/12</td>
            <td>5</td>
          </tr>
        </tbody>
      </table>

      <button class="btn btn-block pull-right" type="submit">글쓰기</button>

      <div class="text-center">
        <ul class="pagination">
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
        </ul>
      </div>
    </div>   <!-- container end -->
  </section>
</body>
</html>