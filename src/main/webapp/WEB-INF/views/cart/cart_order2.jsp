<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
<style>
	div.order_ptitle {width:250px;overflow:hidden; text-overflow: ellipsis;  white-space: nowrap;}
</style>
<script>
	$(document).ready(function(){
		$("#order_btn").click(function(){
			if(!$("input[name='payment']").is(":checked")){
				alert("결제방법을 클릭해 주세요:) ");
				return false;
			}else{
				var clist = "";
				<c:forEach var="item" items="${cid_list}">	
					clist += "${item}, ";
				</c:forEach>
				
				$(location).attr("href","order_success.do?clist="+clist+"&del_price=${del_price }&total_price=${total_price + del_price }&uemail=${sessionScope.svo.uemail}&rname="+$("#rname").val()+"&cp="+$("#cp").val()+"&addr="+$("#addr1").val()+" "+$("#addr2").val()+" "+$("#addr3").val());
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
						<span class="order_title">주문고객</span><span class="customer">${vo.uname }(${vo.cp })</span>
					</div>
				</div>
				
				<div class="order_addr">
					<div class="order_title">
						<span class="order_title">주소(배송지)</span>
					</div>
					<div class="order_content_body">
						<div class="order_content"><label><em class="asterisk_red">*</em>받는분</label><input type="text" class="input_info" id="rname" value="${vo.uname }"></div>
						<div class="order_content"><label><em class="asterisk_red">*</em>전화번호</label><input type="text" class="input_info" id="cp" value="${vo.cp }"></div>
						<div class="order_content"><label><em class="asterisk_red">*</em>주소</label><input type="text" placeholder="기본 주소" id="addr1" class="input_info" value="${vo.addr1 }">
						<input type="text" placeholder="나머지 주소" class="input_info" id="addr2" value="${vo.addr2 }"><input type="text" placeholder="나머지 주소" id="addr3" class="input_info" value="${vo.addr3 }"></div>
					</div>
				</div>
				
				<div class="order_info">
					<div class="order_title" id="order_title_info">
						<span class="order_title">주문 작품 정보</span><span class="customer"><em class="order_product_name">${fn:length(cart_list)}건</em><i class="fas fa-caret-down" id="icon"></i></span>
					</div>
					<c:forEach var="vo" items="${cart_list }">
						<div class="order_content_body_hidden" id="order_hidden">
							<div class="content_hidden"><label>${vo.sname }</label></div>
							
							<div class="content_hidden">
								<div>
									<div class="hidden_img"><img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1}"></div><div class="hidden_product_name"><label style="font-size:12px;"><div class="order_ptitle">${vo.ptitle }</div></label></div>
								</div>
								<div>
									<c:if test="${vo.opt1_qty ne 0}">
									<ul class="hidden_ul">
										<li><label>${vo.opt1 }</label><label class="price"><fmt:formatNumber value="${(vo.pprice + vo.opt1_price) * vo.opt1_qty }" type="currency" currencySymbol="" />원</label></li>
										<li><label>수량 : ${vo.opt1_qty}개</label></li>
									</ul>
									</c:if>
									<c:if test="${vo.opt2_qty ne 0}">
									<ul class="hidden_ul">
										<li><label>${vo.opt2 }</label><label class="price"><fmt:formatNumber value="${(vo.pprice + vo.opt2_price) * vo.opt2_qty }" type="currency" currencySymbol="" />원</label></li>
										<li><label>수량 : ${vo.opt2_qty}개</label></li>
									</ul>
									</c:if>
									<c:if test="${vo.opt3_qty ne 0}">
									<ul class="hidden_ul">
										<li><label>${vo.opt3 }</label><label class="price"><fmt:formatNumber value="${(vo.pprice + vo.opt3_price) * vo.opt3_qty }" type="currency" currencySymbol="" />원</label></li>
										<li><label>수량 : ${vo.opt3_qty}개</label></li>
									</ul>
									</c:if>
								</div>
							</div>
							
							<div class="content_hidden"><label>총 가격</label><label class="price"><fmt:formatNumber value="${((vo.pprice + vo.opt1_price) * vo.opt1_qty) + ((vo.pprice + vo.opt2_price) * vo.opt2_qty) + ((vo.pprice + vo.opt3_price) * vo.opt3_qty)}" type="currency" currencySymbol="" />원</label></div>
						</div>
					</c:forEach>
				</div>

				<div class="order_payment">
					<div class="order_title">
						<span class="order_title">결제 수단</span>
					</div>
					<div class="order_content_body">
						<div class="order_content"><input type="radio" name="payment"><label>카드결제</label></div>
						<div class="order_content"><input type="radio" name="payment"><label>휴대폰결제</label></div>
						<div class="order_content"><input type="radio" name="payment"><label>네이버페이</label></div>
					</div>
				</div>
								
			</section>
			<section class="payment_info">
				<div class="info">
					<div class="info_title">결제 정보</div>
					<div class="info_body">
						<ul class="info_body">
							<li><label>작품금액</label><label id="total_price" class="price"><fmt:formatNumber value="${total_price }" type="currency" currencySymbol="" />원</label></li>
							<li><label>배송비</label><label class="price"><fmt:formatNumber value="${del_price }" type="currency" currencySymbol="" />원</label></li>
						</ul>
					</div>
					<div class="info_body2">
						<ul>
							<li><label>최종 결제 금액</label><label class="price"><fmt:formatNumber value="${total_price + del_price }" type="currency" currencySymbol="" />원</label></li>
							<li><input type="checkbox" class="cb"><label>작가님을 후원합니다.</label></li>
						</ul>
					</div>
					<div>
						<button id="order_btn"><fmt:formatNumber value="${total_price + del_price }" type="currency" currencySymbol="" />원 결제하기</button>
					</div>
				</div>
			</section>
		</div>
	</section>
				
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>