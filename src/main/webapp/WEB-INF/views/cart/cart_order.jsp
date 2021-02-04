<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>장바구니 | 아이디어스</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/cart_order.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/cart_order.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.0/js/all.js"></script>
</head>
<body class="category">
	<!-- header -->
	<jsp:include page="../header.jsp" />
 
	<section class="cart">
		<div class="cart_title">
			<h2>주문 결제하기</h2>
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
						<div class="order_content"><label><em class="asterisk_red">*</em>받는분</label><input type="text" class="input_info"></div>
						<div class="order_content"><label><em class="asterisk_red">*</em>전화번호</label><input type="text" class="input_info"></div>
						<div class="order_content"><label><em class="asterisk_red">*</em>주소</label><input type="text" placeholder="기본 주소" class="input_info">
						<input type="text" placeholder="나머지 주소" class="input_info"><input type="text" placeholder="나머지 주소" class="input_info"></div>
					</div>
				</div>
				
				<div class="order_info">
					<div class="order_title" id="order_title_info">
						<span class="order_title">주문 작품 정보</span><span class="customer"><em class="order_product_name">작품이름 외 @개</em><i class="fas fa-caret-down" id="icon"></i></span>
					</div>
				
					<div class="order_content_body_hidden" id="order_hidden">
						<div class="content_hidden"><label>작가명</label></div>
						
						<div class="content_hidden">
							<div>
								<div class="hidden_img"><img src="http://localhost:9000/sistproject3/images/마치.jpg"></div><div class="hidden_product_name"><label>작품이름</label></div>
							</div>
							<div>
								<ul class="hidden_ul">
									<li><label>주문한 제품의 종류</label><label class="price">가격</label></li>
									<li><label>수량 : @개</label></li>
								</ul>
							</div>
						</div>
						
						<div class="content_hidden"><label>배송비</label><label class="price">가격</label></div>
					</div>
				</div>

				<div class="order_payment">
					<div class="order_title">
						<span class="order_title">결제 수단</span>
					</div>
					<div class="order_content_body">
						<div class="order_content"><input type="radio"><label>카드결제</label></div>
						<div class="order_content"><input type="radio"><label>휴대폰결제</label></div>
						<div class="order_content"><input type="radio"><label>네이버페이</label></div>
					</div>
				</div>
								
			</section>
			<section class="payment_info">
				<div class="info">
					<div class="info_title">결제 정보</div>
					<div class="info_body">
						<ul class="info_body">
							<li><label>작품금액</label><label class="price">작품금액</label></li>
							<li><label>배송비</label><label class="price">배송비</label></li>
						</ul>
					</div>
					<div class="info_body2">
						<ul>
							<li><label>최종 결제 금액</label><label class="price">최종 가격</label></li>
							<li><input type="checkbox" class="cb"><label>작가님을 후원합니다.</label></li>
						</ul>
					</div>
					<div>
						<button>@@@@원 결제하기</button>
					</div>
				</div>
			</section>
		</div>
	</section>
				
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>