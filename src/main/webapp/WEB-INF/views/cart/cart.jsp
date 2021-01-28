<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>장바구니 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
		<script src="http://localhost:9000/sistproject3/js/dawon.js"></script>
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
						<span> ></span>
					</li>
					<li>
						<span>2. 주문결제</span>
						<span> ></span>
					</li>
					<li>
						<span>3. 주문완료</span>
					</li>
				</ul>
			</div>
			
			<div class="cart_content">
				<table>
					<!-- <!-- <tr class="cart_title">
						<td>
							<div class="cart_artist_chk">
								<input type="checkbox" class="artist_name_chk">
							</div>
						</td>
						<td colspan="5">
							<div class="cart_artist">
								<span class="rchk">호러블리 horror_vely 작가님</span>
							</div>
						</td>
					</tr> --> -->
					<tr class="cart_product">
						<td rowspan="2" width=2%>
							<div class="cart_chk">
								<input type="checkbox" class="cart_prod_chk" value="1">
							</div>
						</td>
						<td rowspan="2" width=10%>
							<div class="cart_img">
								<img src="http://localhost:9000/sistproject3/images/cart_img.jpg">
							</div>
						</td>
						<td colspan="4">
							<div class="cart_text">
								<a href="">
									<label>블랙소이7oz캔들/소이캔들</label>
								</a>
							</div>
						</td>
					</tr>
					<tr class="cart_explain">
						<td width=53%>
							<div class="cart_option">향 : 헤스페리데스</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" class="minus" name="minus" id="p1">-</button>
								<input type="text" class="price" value="1" id="p1_amt">
								<button type="button" class="plus" name="plus" id="p1">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p1_price">9400</span>원</div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button" class="cart_prod_update">수정</button>
								<button type="button" class="cart_prod_del">삭제</button>
							</div>
						</td>
					</tr>
					<tr class="cart_price_name">
						<td colspan="2"><div class="price_title">작품 가격</div></td>
						<td colspan="4">
							<div class="price_content"><span id="p1_price">9400</span>원</div>
						</td>
					</tr>
					<tr class="cart_price_del">
						<td colspan="2"><div class="price_title">배송비</div></td>
						<td colspan="4"><div class="price_content"><span>2600원</span></div></td>
					</tr>
				</table>
				
				<div class="cart_prod_order">
					<div class="prod_choice">
						<input type="checkbox" id="cart_all_chk"><span class="rchk">전체선택</span>
						<button type="button" id="cart_select_del">선택 삭제</button>
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
								<td class="price2"><span id="p1_price">9400</span>원</td>
								<td class="del2">2,600원</td>
								<td class="sum2">12,000원</td>
							</tr>
						</table>
					</div>
					<div class="order">
						<div>
							<div class="order_btn">
								<button type="button" id="cart_order">주문하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>