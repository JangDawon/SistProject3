<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>장바구니 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
		<!-- <script src="http://localhost:9000/sistproject3/js/dawon.js"></script> -->
		<script>
		$(document).ready(function(){
			
			$("#cart_order").click(function(){
				var order_list = "";
				
				$(".cart_prod_chk:checked").each(function(index){
					order_list += $(this).attr("id") + ", ";
				});
				
				if(order_list == ""){
					alert("선택된 상품이 없습니다.");
				}else{
					confirm(order_list + "선택된 상품을 주문합니다.");
					
					$(location).attr("href", "http://localhost:9000/sistproject3/cart_order.do?uemail=${sessionScope.svo.uemail}&order_list="+order_list);
				}
			});
			
			
			$("#cart_select_del").click(function(){
				var choice = confirm("정말로 삭제하시겠습니까?");
				if(choice) {
					var chk_list = new Array();
					$("input[type=checkbox]:checked").each(function(i){
						chk_list[i] = $(this).attr("id");
					});
					
					//삭제할 페이지로 전송
					$(location).attr("href", "http://localhost:9000/sistproject3/cart/cart_list_del.do?chklist="+chk_list);
				}
			});
			
			
			$("#cart_all_chk").click(function(){
				if($("#cart_all_chk").is(":checked")){
					$(".cart_prod_chk").prop("checked", true);
				}else{
					$(".cart_prod_chk").prop("checked", false);
				}
			});
			
			$(".cart_prod_chk").click(function(){
		    	$("#cart_all_chk").prop("checked", false);
		    });
			
			$(".cart_proc_chk").click(function(){
				if($(".cart_proc_chk").is(":checked")){
					var total = parseInt($(".cart_total").text());
	        		$(".cart_total").text("").append(total+"원");
				}
			}); 
			
			/* $(".cart_proc_chk").click(function(){
				var total = parseInt($(".cart_total").text());
	        	$(".cart_total").text("").append(total+"원"); 
			}); 
			
			function itemSum(){
	           var str = "";
	           var sum = 0;
	           var count = $(".cart_prod_chk").length;
	           for(var i=0; i < count; i++ ){
	               if( $(".cart_prod_chk")[i].checked == true ){
	                sum += parseInt($(".sum").text();
	               }
	           }
	           $(".cart_total").html(sum+" 원");
	        } */
			
			
			
		    
		    
			$("button").click(function(){
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
			        	var total = parseInt($(".sum").text());
			        	total += p1_one_price;
			        	$(".sum").text("").append(total+"원");
			        }else if(obj_id == "p2"){
			        	$("#"+ obj_id +"_price").text("").append(p2_price + p2_one_price);
			        	var total = parseInt($(".sum").text());
						total += p2_one_price;
						$(".sum").text("").append(total+"원");
			        }else if(obj_id == "p3"){
			            $("#"+ obj_id +"_price").text("").append(p3_price + p3_one_price);
			            var total = parseInt($(".sum").text());
						total += p3_one_price;
						$(".sum").text("").append(total+"원");
			        }
			        
				 }else if(obj_name == "minus") {
			        if($(vname).val() == 1) {
						alert("최소 주문 수량은 1개입니다.");
			        }else {
			            var count = parseInt($(vname).val())-1;
			            $(vname).val(count);
			            
			            if(obj_id == "p1"){
							$("#"+ obj_id +"_price").text("").append(p1_price - p1_one_price+"원");
							var total = parseInt($(".sum").text());
							total = total-p1_one_price;
							$(".sum").text("").append(total+"원");
						}else if(obj_id == "p2"){
							$("#"+ obj_id +"_price").text("").append(p2_price - p2_one_price+"원");
							var total = parseInt($(".sum").text());
							total -= p2_one_price;
							$(".sum").text("").append(total+"원");
						}else if(obj_id == "p3"){
							$("#"+ obj_id +"_price").text("").append(p3_price - p3_one_price+"원");
							var total = parseInt($(".sum").text());
							total -= p3_one_price;
							$(".sum").text("").append(total+"원");
						}
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
					<li><span>1. 장바구니</span><span> ></span></li>
					<li><span>2. 주문결제</span><span> ></span></li>
					<li><span>3. 주문완료</span></li>
				</ul>
			</div>
			
			<div class="cart_content">
				<c:forEach var="vo" items="${list }">
				<table>
					<tr class="cart_product">
						<td width=2%>
							<div class="cart_chk">
								<input type="checkbox" id="${vo.cid}" onClick="itemSum()" class="cart_prod_chk">
							</div>
						</td>
						<td width=10%>
							<div class="cart_img">
								<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1}">
							</div>
						</td>
						<td colspan="4">
							<div class="cart_text"><a href="http://localhost:9000/sistproject3/product.do?pid=${vo.pid }">
								<label>${vo.ptitle}</label></a>
							</div>
						</td>
					</tr>
					
					<c:if test="${vo.opt1_qty ne undefined}">
					<tr class="cart_explain">
						<td></td>
						<td></td>
						<td width=53%>
							<div class="cart_option">${vo.opt1 }</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" class="minus" name="minus" id="p1">-</button>
								<input type="text" class="price" value="${vo.opt1_qty}" id="p1_amt">
								<button type="button" class="plus" name="plus" id="p1">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p1_price">${pprice + vo.opt1_price}</span>원</div>
						</td>
						<td>
							<div class="cart_update">
								<button type="submit" class="cart_prod_update" id="updateBtn">수정</button>
								<button type="button" class="cart_prod_del">삭제</button>
							</div>
						</td>
					</tr>
					</c:if>
					
					<c:if test="${vo.opt2_qty ne undefined}">
					<tr class="cart_explain">
						<td></td>
						<td></td>
						<td width=53%>
							<div class="cart_option">${vo.opt2 }</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" class="minus" name="minus" id="p2">-</button>
								<input type="text" class="price" value="${vo.opt2_qty }" id="p2_amt">
								<button type="button" class="plus" name="plus" id="p2">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p2_price">${pprice + vo.opt2_price }</span>원</div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button" class="cart_prod_update">수정</button>
								<button type="button" class="cart_prod_del">삭제</button>
							</div>
						</td>
					</tr>
					</c:if>
					
					<c:if test="${vo.opt3_qty ne undefined}">
					<tr class="cart_explain">
						<td></td>
						<td></td>
						<td width=53%>
							<div class="cart_option">${vo.opt3 }</div>
						</td>
						<td width=12%>
							<div class="cart_num">
								<button type="button" class="minus" name="minus" id="p3">-</button>
								<input type="text" class="price" value="${vo.opt3_qty }" id="p3_amt">
								<button type="button" class="plus" name="plus" id="p3">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p3_price">${pprice + vo.opt3_price}</span></div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button" class="cart_prod_update">수정</button>
								<button type="button" class="cart_prod_del">삭제</button>
							</div>
						</td>
					</tr>
					</c:if>
					
					<tr class="cart_price_name">
						<td colspan="2"><div class="price_title">작품 가격</div></td>
						<td colspan="4">
							<div class="price_content"><div class="sum">${vo.pprice}원</div></div>
						</td>
					</tr>
					<tr class="cart_price_del">
						<td colspan="2"><div class="price_title">배송비</div></td>
						<td colspan="4"><div class="price_content"><span id="del_price">2,600</span>원</div></td>
					</tr>
				</table>
				</c:forEach>
			</div>
			
			<div class="cart_prod_order">
				<div class="prod_choice">
					<input type="checkbox" id="cart_all_chk" checked><span class="rchk">전체선택</span>
					<button type="button" id="cart_select_del">선택 삭제</button>
				</div>
				<div class="all_price">
					<table class="price_total">
						<tr>
							<td class="all_price">작품금액</td>
							<th rowspan="2">+</th>
							<td class="del">배송비</td>
							<th rowspan="2">=</th>
							<td class="prod_total">결제 예정금액</td>
						</tr>
						<tr>
							<td class="all_price2"><div class="cart_total"></div></td>
							<td class="del2"><div>2,600원</div></td>
							<td class="prod_total2"><div>0원</div></td>
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