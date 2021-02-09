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
		<script src="http://localhost:9000/sistproject3/js/dawon.js"></script>
		<script>
		$(document).ready(function(){
			$(".cart_prod_chk").click(){
				var str = "";
				var sum = 0;
				var coutn = $(".cart_prod_chk").length;
				for(var i=0; i<count; i++){
					if($(".cart_prod_chk")[i].checked == true){
						sum += parseInt($(".cart_prod_chk")[i].value);
					}
				}  
				$("#all_price_total").html(sum+"원");
				$("#amout").val(sum);
			}
			
			$(".cart_prod_chk").click(function(){
				$("#cart_all_chk").prop("checked", false);
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
								<input type="checkbox" id="${vo.cid}" class="cart_prod_chk">
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
								<input type="text" class="price" value="${vo.opt1_qty }" id="p1_amt" name="opt1_qty">
								<button type="button" class="plus" name="plus" id="p1">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p1_price" name="op1_price">${vo.opt1_price }</span>원</div>
						</td>
						<td>
							<div class="cart_update">
								<button type="button" class="cart_prod_update">수정</button>
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
								<input type="text" class="price" value="${vo.opt2_qty }" id="p2_amt" name="opt2_qty">
								<button type="button" class="plus" name="plus" id="p2">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p2_price" name="op2_price">${vo.opt2_price }</span>원</div>
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
								<input type="text" class="price" value="${vo.opt3_qty }" id="p3_amt" name="opt3_qty">
								<button type="button" class="plus" name="plus" id="p3">+</button>
							</div>
						</td>
						<td width=11%>
							<div class="cart_price"><span id="p3_price" name="op3_price">${vo.opt3_price }</span>원</div>
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
							<div class="price_content"><span id="price_total">${vo.pprice + vo.opt1_price + vo.opt2_price + vo.opt3_price }</span>원</div>
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
					<input type="checkbox" id="cart_all_chk"><span class="rchk">전체선택</span>
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
							<td class="all_price2" id="all_price_total"></td>
							<td class="del2"><span>0</span>원</td>
							<td class="prod_total2"><span>0</span>원</td>
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