<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>장바구니 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
	</head>
	<body class="category">
		<!-- header -->
		<jsp:include page="../header.jsp" />
	 
		<section class="cart">
			<div class="cart_title">
				<h2>장바구니</h2>
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
			
			<div class="cart_content">
				<table>
					<tr>
						<td colspan="2">
							<div class="cart_artist">
								<input type="checkbox" name="artist_name"><span class="rchk">호러블리 horror_vely 작가님</span>
							</div>
						</td>
					</tr>
					<tr class="cart_product">
						<td>
							<div class="cart_img">
								<input type="checkbox" name="product">
								<img src="http://localhost:9000/sistproject3/images/cart_img.jpg">
							</div>
						</td>
						<td>
							<div class="cart_text">
								<a href="">
									<label>블랙소이7oz캔들/소이캔들</label>
								</a>
							</div>
						</td>
					</tr>
					<tr class="cart_explain">
						<td colspan="2">
							<ul>
								<li>
									<div class="cart_option">
										<div class="cart_opt">향 : 헤스페리데스 / 쇼핑백 : 쇼핑백추가 : 1,000원</div>
										<div class="cart_num">
											<button type="button" class="decre">-</button>
											<div>1</div>
											<button type="button" class="incre">+</button>
										</div>
									</div>
									<div class="cart_price">
										<span>9,400원</span>
										<div class="cart_update">
											<div>수정</div>
											<div>삭제</div>
										</div>
									</div>
								</li>
							</ul>
						</td>
					</tr>
					<tr class="cart_textfield">
						<td colspan="2">
							<textarea placeholder="주문 요청사항을 입력해주세요."></textarea>
						</td>
					</tr>
					<tr class="cart_prod_price">
						<td colspan="2">
							<div class="price_name">
								<div class="title">작품 가격</div>
								<div class="content"><span>9,400원</span></div>
							</div>
						</td>
					</tr>
					<tr class="cart_prod_del">
						<td colspan="2">
							<div class="price_del">
								<div class="title">배송비</div>
								<div class="content"><span>2,600원</span></div>
							</div>
						</td>
					</tr>
				</table>
				
				<div class="cart_product">
					<div class="prod_choice">
						<input type="checkbox" name="all"><span class="rchk">전체선택</span>
						<button type="button" name="del">선택 삭제</button>
					</div>
					<div class="all_price">
						<table class="price_sum">
							<tr>
								<td class="price">작품금액</td>
								<th rowspan="2">+</th>
								<td class="del">배송비</td>
								<th rowspan="2">=</th>
								<td class="sum">결제 예정금액</td>
							</tr>
							<tr>
								<td class="price2">9,400원</td>
								<td class="del2">2,600원</td>
								<td class="sum2">12,000원</td>
							</tr>
						</table>
					</div>
					<div class="order_btn">
						<div>주문하기</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>