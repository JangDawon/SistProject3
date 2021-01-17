<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>악세사리 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/dw.css">
	</head>
	<body class="category">
		<!-- header -->
		<jsp:include page="header.jsp" />
	 
		<section class="cart">
			<div class="cart">
				<h2>장바구니</h2>
				 <ol class="page-location fr">
                    <li>
                        <em class="icon-num">1.</em>
                        <span>장바구니</span>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li class="active">
                        <em class="icon-num">2.</em>
                        <span>주문결제</span>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li>
                        <em class="icon-num">3.</em>
                        <span>주문완료</span>
                    </li>
                </ol>
			</div>	
		</section>
		
		<!-- footer -->
		<jsp:include page="footer.jsp" />
	</body>
</html>