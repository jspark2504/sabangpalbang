<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
        IMP.init('imp84302971'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '구해줘! 내 방 이용권 결제',
            amount : 1,
            buyer_userNo : ${sessionScope.loginMember.no},
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
        	if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                location.href='${pageContext.servletContext.contextPath}/payment/list';
            } else {
            	msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href='${pageContext.servletContext.contextPath}';
                alert(msg);
            }
            alert(msg);
                    
        });
        
    });
    </script>
 
</body>
</html>
