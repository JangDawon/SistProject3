<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>결제완료 | 아이디어스</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="order_success_content">
		<section class="osucess">
			<div>
				<ul>
					<li>
						<div>주문이 성공적으로 완료되었습니다 :) </div>
						<img src ="http://localhost:9000/sistproject3/images/checked.png">
					</li>
					<li>
						<a href="http://localhost:9000/sistproject3/index.do"><button type="button" class="btn_style">메인</button></a>
					</li>
				</ul>
			</div>
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>