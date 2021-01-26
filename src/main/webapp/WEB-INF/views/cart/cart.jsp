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
					var del_list = "";
					
					$(".cart_prod_chk:checked").each(function(index){
						del_list += $(this).attr("value") + ", ";
					});
					
					if(del_list == ""){
						alert("선택된 상품이 없습니다");
					}else{
						confirm(del_list + "선택된 상품을 주문합니다.");
					}
				});
				
				$("#cart_select_del").click(function(){
					var del_list = "";
					
					$(".cart_prod_chk:checked").each(function(index){
						del_list += $(this).attr("value") + ", ";
					});
					
					if(del_list == ""){
						alert("선택된 리뷰가 없습니다");
					}else{
						confirm(del_list + "정말 삭제하시겠습니까?");
					}
				});
				
				$("#cart_all_chk").click(function(){
					if($("#cart_all_chk").is(":checked")){
						$(".artist_name_chk").prop("checked", true);
						$(".cart_prod_chk").prop("checked", true);
					}else{
						$(".artist_name_chk").prop("checked", false);
						$(".cart_prod_chk").prop("checked", false);
					}
				});
				
				$(".artist_name_chk").click(function(){
					if($(".artist_name_chk").is(":checked")){
						$(".cart_prod_chk").prop("checked", true);
					}else{
						$(".cart_prod_chk").prop("checked", false);
					}
				});
				
				/** 수량 변경 **/
				$("button").click(function(){
					var obj_name = $(this).attr("name");
					var obj_id = $(this).attr("id");
					var vname = "#" + obj_id + "_amt"
					var obj_value = parseInt($(vname).val());
					
					//수량 변경 시 적립금, 가격 수정
					var price1 = parseInt($("#" + obj_id + "_price1").text());
					var price2 = parseInt($("#" + obj_id + "_price2").text());
					var one_price1 = price1/obj_value;
					var one_price2 = price2/obj_value;
					
					if(obj_name == "plus") {
						if(obj_value == 5) {
							alert("최대 주문 수량은 5개입니다.");
						}else {
							$(vname).val(obj_value+1);
							$("#"+obj_id+"_price1").text(price1 + one_price1);
							$("#"+obj_id+"_price2").text(price2 + one_price2);
						}
					}else if(obj_name == "minus") {
						if(obj_value == 1) {
							alert("최소 주문 수량은 1개입니다.");
						}else {
							$(vname).val(obj_value-1);
							$("#"+obj_id+"_price1").text(price1 - one_price1);
							$("#"+obj_id+"_price2").text(price2 - one_price2);
						}
					}
				});
				
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
					<tr class="cart_title">
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
					</tr>
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
							<div class="cart_option">향 : 헤스페리데스 / 쇼핑백 : 쇼핑백추가 : 1,000원</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" name="minus" id="p1">-</button>
								<input type="text" value="1" id="p1_amt">
								<button type="button" name="plus" id="p1">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span>9,400원</span></div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button">수정</button>
								<button type="button" class="cart_prod_del">삭제</button>
							</div>
						</td>
					</tr>
					<!-- <tr class="cart_textfield">
						<td colspan="5">
							<textarea placeholder="주문 요청사항을 입력해주세요."></textarea>
						</td>
					</tr> -->
					<tr class="cart_price_name">
						<td colspan="2"><div class="price_title">작품 가격</div></td>
						<td colspan="4"><div class="price_content"><span>9,400원</span></div></td>
					</tr>
					<tr class="cart_price_del">
						<td colspan="2"><div class="price_title">배송비</div></td>
						<td colspan="4"><div class="price_content"><span>2,600원</span></div></td>
					</tr>
				</table>
				
				<table>
					<tr class="cart_title">
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
					</tr>
					<tr class="cart_product">
						<td rowspan="2" width=2%>
							<div class="cart_chk">
								<input type="checkbox" class="cart_prod_chk" value="2">
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
							<div class="cart_option">향 : 헤스페리데스 / 쇼핑백 : 쇼핑백추가 : 1,000원</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" name="minus" id="p1">-</button>
								<input type="text" value="1" id="p1_amt">
								<button type="button" name="plus" id="p1">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span>9,400원</span></div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button">수정</button>
								<button type="button" class="cart_prod_del">삭제</button>
							</div>
						</td>
					</tr>
					<!-- <tr class="cart_textfield">
						<td colspan="5">
							<textarea placeholder="주문 요청사항을 입력해주세요."></textarea>
						</td>
					</tr> -->
					<tr class="cart_price_name">
						<td colspan="2"><div class="price_title">작품 가격</div></td>
						<td colspan="4"><div class="price_content"><span>9,400원</span></div></td>
					</tr>
					<tr class="cart_price_del">
						<td colspan="2"><div class="price_title">배송비</div></td>
						<td colspan="4"><div class="price_content"><span>2,600원</span></div></td>
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