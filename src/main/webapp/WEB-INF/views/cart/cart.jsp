<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>장바구니 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
		<script>
			$(document).ready(function(){
				$("#cart_order").click(function(){
					var order_list = "";
					
					$("input[class='cart_prod_chk']").each(function(index){
						order_list += $(this).attr("value")+",";
					});
					
					if(order_list == "") {
						alert("선택된 상품이 없습니다.");
					}else {
						confirm(order_list + "선택 상품을 주문합니다.");
					}
				});
				
				/* $("#cart_select_del").click(function(){
					var del_list = "";
					
					$("input[class='cart_prod_chk']").each(function(index){
						del_list += $(this).attr("value") + ", ";
					});
					
					confirm(del_list + "정말 삭제하시겠습니까?");
					
				}); */
				
				/* $("#cart_order").click(function(){
					alert("ddd");
				}); */
				
			});
		</script>
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
					<tr>
						<td colspan="5">
							<div class="cart_artist">
								<input type="checkbox" class="artist_name_chk"><span class="rchk">호러블리 horror_vely 작가님</span>
							</div>
						</td>
					</tr>
					<tr class="cart_product">
						<td rowspan="2" width=13%>
							<div class="cart_img">
								<input type="checkbox" class="cart_prod_chk" value="1">
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
							<div class="cart_option">향 : 헤스페리데스 / 쇼핑백 : 쇼핑백추가 : 1,000원</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" class="decre">-</button>
								<div class="num">1</div>
								<button type="button" class="incre">+</button>
							</div>
						</td>
						<td width=10%>
							<div class="cart_price"><span>9,400원</span></div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button">수정</button>
								<button type="button" class="cart_prod_del">삭제</button>
							</div>
						</td>
					</tr>
					<tr class="cart_textfield">
						<td colspan="5">
							<textarea placeholder="주문 요청사항을 입력해주세요."></textarea>
						</td>
					</tr>
					<tr class="cart_price_name">
						<td><div class="price_title">작품 가격</div></td>
						<td colspan="4"><div class="price_content"><span>9,400원</span></div></td>
					</tr>
					<tr class="cart_price_del">
						<td><div class="price_title">배송비</div></td>
						<td colspan="4"><div class="price_content"><span>2,600원</span></div></td>
					</tr>
				</table>
				
				<div class="cart_product">
					<div class="prod_choice">
						<input type="checkbox" id="cart_all"><span class="rchk">전체선택</span>
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
								<td class="price2">9,400원</td>
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