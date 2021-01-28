<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>장바구니 | 아이디어스</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/cart_order.css">
</head>
<body class="category">
	<!-- header -->
	<jsp:include page="../header.jsp" />
 
	<section class="cart">
		<div class="cart_title">
			<h2>주문결제</h2>
			<ul class="page_location">
				<li>
					<span>1. 장바구니</span>
					<span>></span>
				</li>
				<li>
					<span>2. 주문결제</span>
					<span>></span>
				</li>
				<li>
					<span>3. 주문완료</span>
				</li>
			</ul>
		</div>
		<div class="payment">
			<section class="payment_order">
				<div class="order_customer">
					<div class="order_title">
						<span class="order_title">주문고객</span><span class="customer">홍길동(010-1234-5678)</span>
					</div>
				</div>
				
				<div class="order_addr">
					<div class="order_title">
						<span class="order_title">주소(배송지)</span>
					</div>
					<div class="order_content_body">
						<div class="order_content"><label>받는분</label><input type="text"></div>
						<div class="order_content"><label>전화번호</label><input type="text"></div>
						<div class="order_content"><label>주소</label><input type="text" placeholder="기본 주소"><input type="text" placeholder="나머지 주소"></div>
					</div>
				</div>
				
				<div class="order_info">
					<div class="order_title">
						<span class="order_title">주문 작품 정보</span><span>작품이름~~</span>
					</div>
				</div>

				<div class="order_payment">
					<div class="order_title">
						<span class="order_title">결제 수단</span>
					</div>
					<div class="order_content_body">
						<div class="order_content"><input type="radio">카드결제</div>
						<div class="order_content"><input type="radio">휴대폰결제</div>
						<div class="order_content"><input type="radio">네이버페이</div>
					</div>
				</div>
								
			</section>
			<section class="payment_info">
				<div class="info">
					<h3>결제 정보</h3>
					<div></div>
					<div></div>
				</div>
			</section>
		</div>
	</section>
				
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>