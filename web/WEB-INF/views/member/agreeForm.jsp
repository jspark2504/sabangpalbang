<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/findMyRoom/resources/image/favicon.ico">
    <title>구해줘! 내 방</title>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <style>

        .form-signin {
            max-width: 380px;
            padding: 15px;
            margin: 40px auto;
            border: 1px solid #e1e1e1;
            border-radius: 5px;
        }

        .form-signin .checkbox {
            font-weight: normal;
        }

        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input:not(#inputId) {
            margin: 10px auto;
        }

        .acceptBtn {
            background-color: #ffd233;
            color: white;
            margin: 20px auto;
        }

        .startBtn {
            margin-top: 50px;
            background-color: #bcbcbc;
            color: white;
        }

        .check p {
            color: #a6a6a6;
        }

        .container {
            margin-top: 20px;
        }
    </style>
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
    <section class="container">
        <form class="form-signin" action="${ pageContext.servletContext.contextPath }/member/insert" method="post">

            <input type="hidden" name="userId" value="${ requestScope.member.id }" />
            <input type="hidden" name="userPwd" value="${ requestScope.member.pwd }" />
            <input type="hidden" name="nickname" value="${ requestScope.member.nickname }" />
            <input type="hidden" name="email" value="${ requestScope.member.email }" />
            <input type="hidden" name="phone" value="${ requestScope.member.phone }" />

            <h3 align="center" class="form-signin-heading">환영합니다.</h3>
            <p align="center" class="form-signin-heading">원활한 서비스 이용을 위해 동의해주세요.</p>

            <button class="btn btn-lg btn-block acceptBtn" type="button">V 모두 동의하기</button>

            <div class="check">
                <input type="checkbox" id="check1" name="accept" required>
                <label for="check1">만 14세 이상입니다 (필수)</label>
            </div>
            <div class="check">
                <input type="checkbox" id="check2" name="accept" required>
                <label for="check2">서비스 이용약관 동의 (필수)</label>
                <p><b>본 약관에는 마케팅 정보 수신에 대한 동의에 관한 내용</b>이 포함되어 있으며, '설정'에서 수신 거부로 변경할 수 있습니다.</p>
            </div>
            <div class="check">
                <input type="checkbox" id="check3" name="accept" required>
                <label for="check3">개인정보 수집 및 이용 동의 (필수)</label>
                <p>서비스 이용과 관련하여 수집 이용하는 개인정보를 안내해드립니다.</p>
            </div>
            <div class="check">
                <input type="checkbox" id="check4" name="accept" required>
                <label for="check4">개인정보 제3자 제공 동의 (필수)</label>
                <p>구해줘내방 외 제3자에게 전달될 수 있는 개인정보와 전달 목적을 안내해드립니다.</p>
            </div>

            <button class="btn btn-lg btn-block startBtn" type="submit" disabled>시작하기</button>

        </form> <!-- <article class="form-signin"> -->
    </section> <!-- /container -->

    <script>
        $('.acceptBtn').click(function () {
            $('input[name=accept]').prop('checked', true);
            checkedChange();
        });

        $("input:checkbox").change(checkedChange);

        function checkedChange() {
            if ($("#check1").prop("checked") && $("#check2").prop("checked") && $("#check3").prop("checked") && $("#check4").prop("checked")) {
                $('.acceptBtn')
                    .css('background', 'white')
                    .css('color', '#ffd233')
                    .css('border', 'solid 1px #ffd233')
                    .prop('disabled', true);
                $('.startBtn')
                    .css('background', '#ffd233')
                    .prop('disabled', false);
            } else {
                $('.acceptBtn')
                    .css('background', '#ffd233')
                    .css('color', 'white')
                    .prop('disabled', false);
                $('.startBtn')
                    .css('background', '#bcbcbc')
                    .prop('disabled', true);
            }
        }

    </script>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>