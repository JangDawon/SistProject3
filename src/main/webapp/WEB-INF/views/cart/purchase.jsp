<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>장바구니 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
		<script>
			$(document).ready(function(){
				sum_price();
				
				function sum_price(){
					var sum = 0;
					
					if($("#p1_price").text() != ""){
		                sum += parseInt($("#p1_price").text());
		            }
					if($("#p2_price").text() != ""){
		                sum += parseInt($("#p2_price").text());
		           	}
					if($("#p3_price").text() != ""){
	                  	sum += parseInt($("#p3_price").text());
					}
					$(".price_total").text("").append(sum);
					
					if(sum >= 50000){
						$(".del_price").text("").append(0);
					}else {
						$(".del_price").text("").append(2600);
					}
				}
				
				$("#cart_all_chk").click(function(){ 
					if($("#cart_all_chk").is(":checked")){
						$(".cart_prod_chk").prop("checked", true);
						var prod_sum = parseInt($(".price_total").text());
						
						if(prod_sum >= 50000){
							$(".prod_total_delivery").text("").append(0);
						}else {
							$(".prod_total_delivery").text("").append(2600);
						}
						
						var prod_del = parseInt($(".prod_total_delivery").text());
						var total = prod_sum+prod_del;
						
						$(".all_price_total").text("").append(prod_sum);
						$("#prod_total2").text("").append(total);
					}else{
						$(".cart_prod_chk").prop("checked", false);
						$(".all_price_total").text("").append(0);
						$("#prod_total2").text("").append(0);
					}
				});
				
				
				$(".cart_prod_chk").click(function(){
					if($(".cart_prod_chk").is(":checked")){
						var prod_sum = parseInt($(".price_total").text());
						
						if(prod_sum >= 50000){
							$(".prod_total_delivery").text("").append(0);
						}else {
							$(".prod_total_delivery").text("").append(2600);
						}
						
						var prod_del = parseInt($(".prod_total_delivery").text());
						var total = prod_sum+prod_del;
						
						$(".all_price_total").text("").append(prod_sum);
						$("#prod_total2").text("").append(total);
					}else{
						$(".all_price_total").text("").append(0);
						$("#prod_total2").text("").append(0);
					}
				});
				
				$("#cart_order").click(function(){
					var count = 0;
					var purchase_list = "";
					$("input[class='cart_prod_chk']:checked").each(function(index){
						var pid = $(this).val();
						var cid = $(this).attr("id");
						count ++;
						purchase_list += "cid="+cid +", ";
					});
					
					if(count != 0){
						var del_fee = $(".prod_total_delivery").text();
						var t_price = $(".all_price_total").text();
						purchase_list += "&del_price=" + del_fee +"&total_price=" + t_price + "&uemail=${sessionScope.svo.uemail}";
						$(location).attr("href","cart_order2.do?purchase_list="+purchase_list);
					}else{
						alert("상품을 선택해주세요");
					}
				});
				
				$("#cart_select_del").click(function(){
					var choice = confirm("정말로 삭제하시겠습니까?");
					if(choice) {
						var chk_list = new Array();
						$("input[type=checkbox]:checked").each(function(i){
							chk_list[i] = $(this).attr("id");
						});
						
						$(location).attr("href", "http://localhost:9000/sistproject3/pur_list_del.do?chklist="+chk_list);
					}
				});
				
				$(".cart_prod_update").click(function(){
					//alert($(this).val());
					var cid = $(this).attr("id"); //cid
					var opt = $(this).val();		//p1/p2/p3
					var qty = "#" + $(this).val() + "_amt";	//#p1_amt/#p2_amt/#p3_amt
					$.ajax({
						url:"pur_list_update.do?cid="+cid+"&opt="+opt+"&opt_qty="+$(qty).val(),
						success:function(result){

						}//success
					});//ajax
				});//update_click
				
				$(".cart_prod_del").click(function(){
					//alert($(this).attr("value"));
					var cid = $(this).attr("id"); //cid
					var opt = $(this).val();		//p1/p2/p3
					//var qty = "#" + $(this).val() + "_amt";	//#p1_amt/#p2_amt/#p3_amt
					$.ajax({
						url:"pur_list_update.do?cid="+cid+"&opt="+opt+"&opt_qty=0",
						success:function(result){

						}//success
					});//ajax
				});//del_click
				
				$("button").click(function(){
					var total = 0;
					var obj_name = $(this).attr("name");
					var obj_id = $(this).attr("id");
					var vname = "#" + obj_id + "_amt";
					var p1_value = parseInt($("#p1_amt").val());
					var p2_value = parseInt($("#p2_amt").val());
					var p3_value = parseInt($("#p3_amt").val());
					
					//수량 변경 시 적립금, 가격 수정
					var p1_price = parseInt($("#p1_price").text());
		     		var p1_one_price = p1_price/p1_value;
					var p2_price = parseInt($("#p2_price").text());
					var p2_one_price = p2_price/p2_value;
					var p3_price = parseInt($("#p3_price").text());
					var p3_one_price = p3_price/p3_value;
					
					if(obj_name == "plus") {
						var count = parseInt($(vname).val())+1;
				        $(vname).val(count);
				         
				        if(obj_id == "p1"){
				        	$("#"+ obj_id +"_price").text("").append(p1_price + p1_one_price);
				        	var total = parseInt($(".price_total").text());
				        	total += p1_one_price;
				        	$(".price_total").text("").append(total);
				        }else if(obj_id == "p2"){
				        	$("#"+ obj_id +"_price").text("").append(p2_price + p2_one_price);
				        	var total = parseInt($(".price_total").text());
							total += p2_one_price;
							$(".price_total").text("").append(total);
				        }else if(obj_id == "p3"){
				            $("#"+ obj_id +"_price").text("").append(p3_price + p3_one_price);
				            var total = parseInt($(".price_total").text());
							total += p3_one_price;
							$(".price_total").text("").append(total);
				        }
				        
				        if(total >= 50000){
							$(".del_price").text("").append(0);
						}else {
							$(".del_price").text("").append(2600);
						}
				        
					}else if(obj_name == "minus") {
				        if($(vname).val() == 1) {
							alert("최소 주문 수량은 1개입니다.");
				        }else {
				            var count = parseInt($(vname).val())-1;
				            $(vname).val(count);
				            
				            if(obj_id == "p1"){
								$("#"+ obj_id +"_price").text("").append(p1_price - p1_one_price);
								var total = parseInt($(".price_total").text());
								total = total-p1_one_price;
								$(".price_total").text("").append(total);
							}else if(obj_id == "p2"){
								$("#"+ obj_id +"_price").text("").append(p2_price - p2_one_price);
								var total = parseInt($(".price_total").text());
								total -= p2_one_price;
								$(".price_total").text("").append(total);
							}else if(obj_id == "p3"){
								$("#"+ obj_id +"_price").text("").append(p3_price - p3_one_price);
								var total = parseInt($(".price_total").text());
								total -= p3_one_price;
								$(".price_total").text("").append(total);
							}
				            
				            if(total >= 50000){
								$(".del_price").text("").append(0);
							}else {
								$(".del_price").text("").append(2600);
							}
						}
					}
				});//button click
				
				
			});
		</script>
	</head>
	<body class="category">
		<!-- header -->
		<jsp:include page="../header.jsp" />
	 
		<section class="cart">
			<div class="cart_title">
				<h2>바로구매</h2>
				<ul class="page_location">
					<li><span>1. 바로구매</span><span> ></span></li>
					<li><span>2. 주문결제</span><span> ></span></li>
					<li><span>3. 주문완료</span></li>
				</ul>
			</div>
			
			<div class="cart_content">
				<table>
					<tr class="cart_product">
						<td width=2%>
							<div class="cart_chk">
								<input type="checkbox" id="${vo.cid}" class="cart_prod_chk" value="${vo.pid }" style="width:15px;height:15px;">
							</div>
						</td>
						<td width=10%>
							<div class="cart_img">
								<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }">
							</div>
						</td>
						<td colspan="4">
							<div class="cart_text"><a href="http://localhost:9000/sistproject3/product.do?pid=${vo.pid }">
								<label>${vo.ptitle }</label></a>
							</div>
						</td>
					</tr>
					
					<c:if test="${vo.opt1_qty ne ''}">
					<tr class="cart_explain">
						<td></td>
						<td></td>
						<td width=53%>
							<div class="cart_option">${vo.opt1}</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" class="minus" name="minus" id="p1">-</button>
								<input type="text" class="price" value="${vo.opt1_qty}" id="p1_amt" name="opt1_qty">
								<button type="button" class="plus" name="plus" id="p1">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p1_price">${(vo.pprice + vo.opt1_price)*vo.opt1_qty}</span>원</div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button" class="cart_prod_update" id="${vo.cid}" value="p1">수정</button>
								<button type="button" class="cart_prod_del" id="${vo.cid}" value="p1">삭제</button>
							</div>
						</td>
					</tr>
					</c:if>
					
					<c:if test="${vo.opt2_qty ne ''}">
					<tr class="cart_explain">
						<td></td>
						<td></td>
						<td width=53%>
							<div class="cart_option">${vo.opt2}</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" class="minus" name="minus" id="p2">-</button>
								<input type="text" class="price" value="${vo.opt2_qty}" id="p2_amt" name="opt2_qty">
								<button type="button" class="plus" name="plus" id="p2">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p2_price">${(vo.pprice + vo.opt2_price)*vo.opt2_qty}</span>원</div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button" class="cart_prod_update" id="${vo.cid}" value="p2">수정</button>
								<button type="button" class="cart_prod_del" id="${vo.cid}" value="p2">삭제</button>
							</div>
						</td>
					</tr>
					</c:if>
					
					<c:if test="${vo.opt3_qty ne ''}">
					<tr class="cart_explain">
						<td></td>
						<td></td>
						<td width=53%>
							<div class="cart_option">${vo.opt3 }</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" class="minus" name="minus" id="p3">-</button>
								<input type="text" class="price" value="${vo.opt3_qty }" id="p3_amt" name="opt3_qty">
								<button type="button" class="plus" name="plus" id="p3">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p3_price">${(vo.pprice + vo.opt3_price)*vo.opt3_qty}</span>원</div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button" class="cart_prod_update" id="${vo.cid}" value="p3">수정</button>
								<button type="button" class="cart_prod_del" id="${vo.cid}" value="p3">삭제</button>
							</div>
						</td>
					</tr>
					</c:if>
					
					<tr class="cart_price_name">
						<td colspan="2"><div class="price_title">작품 가격</div></td>
						<td colspan="4">
							<div class="price_content"><span class="price_total">0</span>원</div>
						</td>
					</tr>
					<tr class="cart_price_del">
						<td colspan="2"><div class="price_title">배송비</div></td>
						<td colspan="4">
							<div class="price_content"><span class="del_price">0</span>원</div>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="cart_prod_order">
				<div class="prod_choice">
					<input type="checkbox" id="cart_all_chk" style="width:15px;height:15px;"><span class="rchk">전체선택</span>
					<button type="button" id="cart_select_del">선택 삭제</button>
				</div>
				<div class="all_price">
					<table class="total_price">
						<tr>
							<td class="all_price">작품금액</td>
							<th rowspan="2">+</th>
							<td class="del">배송비</td>
							<th rowspan="2">=</th>
							<td class="prod_total">결제 예정금액</td>
						</tr>
						<tr>
							<td class="all_price2"><span class="all_price_total">0</span>원</td>
							<td class="del2"><span class="prod_total_delivery">0</span>원</td>
							<td class="prod_total2"><span id="prod_total2">0</span>원</td>
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
		</section>
		
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>