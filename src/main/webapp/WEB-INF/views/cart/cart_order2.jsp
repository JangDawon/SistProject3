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
<script src="https://use.fontawesome.com/releases/v5.0.0/js/all.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	div.order_ptitle {width:250px;overflow:hidden; text-overflow: ellipsis;  white-space: nowrap;}
</style>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[id=addr1]").val(data.zonecode);
           $("[id=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}

	$(document).ready(function(){
		$("#order_title_info").click(function(){
			
			if($(".order_content_body_hidden").css("display")=="none"){
				$(".order_content_body_hidden").show();
				$("#icon").attr("data-icon", "caret-up");
			}else{
				$(".order_content_body_hidden").hide();
				$("#icon").attr("data-icon", "caret-down");
			}
		});
		
		$("#order_btn").click(function(){
			if($("#addr1").val() == ""){
				alert("우편번호를 입력해주세요 :) ");
				$("#addr1").focus();
				return false;
			}else if($("#addr3").val() == ""){
				alert("상세 주소를 입력해주세요 :) ");
				$("#addr3").focus();
				return false;
			}else if(!$("input[name='payment']").is(":checked")){
				alert("결제방법을 클릭해 주세요:) ");
				return false;
			}else{
				var clist = "";
				<c:forEach var="item" items="${cid_list}">	
					clist += "${item}, ";
				</c:forEach>
				
				$(location).attr("href","order_success.do?clist="+clist+"&del_price=${del_price }&total_price=${total_price + del_price }&uemail=${sessionScope.svo.uemail}&rname="+$("#rname").val()+"&cp="+$("#cp").val()+"&addr_num="+$("#addr1").val()+"&addr="+$("#addr2").val()+" "+$("#addr3").val());
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
						<div class="order_content"><label><em class="asterisk_red">*</em>주소</label>
						<input type="text" placeholder="우편 번호" id="addr1" readonly="readonly" style="width:125px; height:30px; margin:0px 20px 20px 55px;">
						<button type="button" class="btn_style" onclick="execPostCode();" style="height:35px; width:100px; ">주소 검색</button>
						<input type="text" placeholder="도로명 주소" class="input_info" id="addr2" value="${vo.addr1} ${vo.addr2 } ${vo.addr3}" style="width:350px;"><input type="text" placeholder="상세 주소" id="addr3" class="input_info" style="width:350px;"></div>
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