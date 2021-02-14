<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
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
<script language="javascript">
	function goPopup(){
		window.name= "jusoPopup";
		var pop = window.open("http://localhost:9000/sistproject3/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		
		$("#raddr").val(roadFullAddr);
		//document.getElementById('raddr').value = roadFullAddr.value;
		//document.form.raddr.value = roadFullAddr;		
	}
</script>
</head>
<body class="category">
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<form name="OrderForm" action="cart_order_proc.do" method="post" class="order">
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
						<span class="order_title">주문고객</span><span class="customer">${sessionScope.svo.uname}(${result})</span>
					</div>
				</div>
				
				<div class="order_addr">
					<div class="order_title">
						<span class="order_title">주소(배송지)</span>
					</div>
					<div class="order_content_body">
						<div class="order_content"><label><em class="asterisk_red">*</em>받는분</label><input type="text" class="input_info" id="rname" ></div>
						<div class="order_content"><label><em class="asterisk_red">*</em>전화번호</label><input type="text" class="input_info" id="rcp" ></div>
						<div class="order_content"><label><em class="asterisk_red">*</em>주소</label><input type="text"  class="input_info" id="raddr" ></div>
						<div class="order_content"><button type="button" onclick="goPopup()">주소 찾기</button></div>
					</div>
				</div>
				
				<div class="order_info">
					<div class="order_title" id="order_title_info">
						<span class="order_title">주문 작품 정보</span><span class="customer"><em class="order_product_name">${ptitle } 외 ${count}개</em><i class="fas fa-caret-down" id="icon"></i></span>
					</div>
				
					<div class="order_content_body_hidden" id="order_hidden">
					<input type="hidden" name="uemail" value="${sessionScope.svo.uemail }">

					<c:forEach var="vo" items="${list}" varStatus="status">
						<input type="hidden" name="idusOrderVOList[${status.index}].rname" value="" id="rname1">
						<input type="hidden" name="idusOrderVOList[${status.index}].rcp" value="" id="rcp1">
						<input type="hidden" name="idusOrderVOList[${status.index}].raddr" value="" id="raddr1">
						<input type="hidden" name="idusOrderVOList[${status.index}].pid" value="${vo.pid }">
						<input type="hidden" name="idusOrderVOList[${status.index}].p1_amt" value="${vo.p1_amt }">
						<input type="hidden" name="idusOrderVOList[${status.index}].p2_amt" value="${vo.p2_amt }">
						<input type="hidden" name="idusOrderVOList[${status.index}].p3_amt" value="${vo.p3_amt }">
						<input type="hidden" name="idusOrderVOList[${status.index}].p1_price" value="${vo.p1_price }">
						<input type="hidden" name="idusOrderVOList[${status.index}].p2_price" value="${vo.p2_price }">
						<input type="hidden" name="idusOrderVOList[${status.index}].p3_price" value="${vo.p3_price }">
						<input type="hidden" name="idusOrderVOList[${status.index}].del_price" value="${vo.del_price }">
						<input type="hidden" name="idusOrderVOList[${status.index}].t_price" value="${vo.t_price }">
						<div class="content_hidden" id="content_hidden_first"><label>${vo.sname }</label></div>
						<div class="content_hidden">
							<div>
								<div class="hidden_img"><img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }"></div><div class="hidden_product_name"><label>${vo.ptitle}</label></div>
							</div>
							<div>
								<c:if test="${vo.p1_amt ne '0' }">
								<ul class="hidden_ul">
									<li><label>${vo.opt1 }</label><label class="price">${vo.p1_price }원</label></li>
									<li><label>수량 : ${vo.p1_amt }개</label></li>
								</ul>
								</c:if>
								<c:if test="${vo.p2_amt ne '0' }">
								<ul class="hidden_ul">
									<li><label>${vo.opt2 }</label><label class="price">${vo.p2_price }원</label></li>
									<li><label>수량 : ${vo.p2_amt }개</label></li>
								</ul>
								</c:if>
								<c:if test="${vo.p3_amt ne '0' }">
								<ul class="hidden_ul">
									<li><label>${vo.opt3 }</label><label class="price">${vo.p3_price }원</label></li>
									<li><label>수량 : ${vo.p3_amt }개</label></li>
								</ul>
								</c:if>
							</div>
						</div>
						<c:choose>
						<c:when test="${vo.del_price ne '무료' }">						
						<div class="content_hidden" id="content_hidden_last"><label>배송비</label><label class="price">${vo.del_price }원</label></div>
						</c:when>
						<c:otherwise>
						<div class="content_hidden" id="content_hidden_last"><label>배송비</label><label class="price">${vo.del_price }</label></div>
						</c:otherwise>
						</c:choose>
					</c:forEach>
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
							<c:forEach var="vo" items="${list}">
							<li><label>${vo.ptitle}</label><label class="price">${vo.t_price }원</label></li>
							</c:forEach>
							<li><label>배송비</label><label class="price">${total_del_price }원</label></li>
						</ul>
					</div>
					<div class="info_body2">
						<ul>
							<li><label>최종 결제 금액</label><label class="price">${total_price }원</label></li>
						</ul>
					</div>
					<div>
						<button type="submit" class="order" id="btnOrder">${total_price }원 결제하기</button>
					</div>
				</div>
			</section>
		</div>
	</section>
	</form>			
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>