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
		
		$("button").click(function(){
			var obj_name = $(this).attr("name");   //+, -구분
			var obj_id = $(this).attr("id");      //p1, p2, p3 아이디 구분
			var vname = "#" + obj_id + "_amt"      //p1_amt, p2_amt ...
			var p1_value = parseInt($("#p1_amt").val());   //$(p1_amt).val()
			var p2_value = parseInt($("#p2_amt").val());   //$(p2_amt).val()
			var p3_value = parseInt($("#p3_amt").val());   //$(p3_amt).val()
			
			//수량 변경 시 적립금, 가격 수정
			var p1_price = parseInt($("#p1_price").text());   //(기본가격+옵션가격)*수량
     		var p1_one_price = p1_price/p1_value;         //(기본가격+옵션가격)
			var p2_price = parseInt($("#p2_price").text()); //(기본가격+옵션가격)*수량
			var p2_one_price = p2_price/p2_value;         //(기본가격+옵션가격)
			var p3_price = parseInt($("#p3_price").text()); //(기본가격+옵션가격)*수량
			var p3_one_price = p3_price/p3_value;         //(기본가격+옵션가격)
			
			if(obj_name == "plus") {
				var count = parseInt($(vname).val())+1;
		        $(vname).val(count);
		         
		        if(obj_id == "p1"){
		        	$("#"+ obj_id +"_price").text("").append(p1_price + p1_one_price);
		        }else if(obj_id == "p2"){
		        	$("#"+ obj_id +"_price").text("").append(p2_price + p2_one_price);
		        }else if(obj_id == "p3"){
		            $("#"+ obj_id +"_price").text("").append(p3_price + p3_one_price);
		        }
		        $("#price_total").text("").append(parseInt($("#p2_price").text())+parseInt($("#p3_price").text()));
		        $("#all_price_total").text("").append(parseInt($("#p2_price").text())+parseInt($("#p3_price").text()));
		       
			 }else if(obj_name == "minus") {
		         //선택한 아이디의 값만 1일 때 경고창
		        if($(vname).val() == 1) {
					alert("최소 주문 수량은 1개입니다.");
		        }else {
		            var count = parseInt($(vname).val())-1;
		            $(vname).val(count);
		            
		            if(obj_id == "p1"){
		               $("#"+ obj_id +"_price").text("").append(p1_price - p1_one_price);
		            }else if(obj_id == "p2"){
		               $("#"+ obj_id +"_price").text("").append(p2_price - p2_one_price);
		            }else if(obj_id == "p3"){
		               $("#"+ obj_id +"_price").text("").append(p3_price - p3_one_price);
		            }
				}
				$("#price_total").text("").append(parseInt($("#p2_price").text())+parseInt($("#p3_price").text()));
				$("#all_price_total").text("").append(parseInt($("#p2_price").text())+parseInt($("#p3_price").text()));
			}
			
		});
		
		
		
		cart_list();
		
		function cart_list(){
			$.ajax({
				url:"cart_list.do?uemail=${vo.uemail}",
				success:function(Result){
					var jdata = JSON.parse(result);
					
					var output = "";
					output += '<table class="cart_table"><tr class="cart_product">';
					
					for(var i in jdata.jlist){
						output += '<td rowspan="2" width=2%>';
						output += '<div class="cart_chk">';
						output += '<input type="checkbox" id="" class="cart_prod_chk" value="1">';
						output += '</div></td>';
						output += '<td rowspan="2" width=10%>';
						output += '<div class="cart_img">';
						output += '<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }">';
						output += '</div></td>';
						output += '<td colspan="4">';
						output += '<div class="cart_text"><a href="http://localhost:9000/sistproject3/product.do?pid="'+ jdata.jlist[i].pid +'>';
						output += '<label>상품이름</label></a>';
						output += '</div></td></tr>';
						output += '<tr class="cart_explain">';
						output += '<td width=53%><div class="cart_option">'+ jdata.jlist[i].p_opt +'</div></td>';
						output += '<td width=12%>';
						output += '<div class="cart_num">';
						output += '<button type="button" class="minus" name="minus" id="p1">-</button>';
						output += '<input type="text" class="price" value="'+ jdata.jlist[i].p_qty +'" id="p1_amt">';
						output += '<button type="button" class="plus" name="plus" id="p1">+</button>';
						output += '</div></td>';
						output += '<td width=11%>';
						output += '	<div class="cart_price"><span class="p1_price">'+ jdata.jlist[i].p_price +'</span>원</div>';
						output += '</td>';
						output += '<td>';
						output += '<div class="cart_update">';
						output += '<button type="button" class="cart_prod_update">수정</button>';
						output += '<button type="button" class="cart_prod_del">삭제</button>';
						output += '</div></td></tr>';
						output += '<tr class="cart_price_name">';
						output += '<td colspan="2"><div class="price_title">작품 가격</div></td>';
						output += '<td colspan="4">';
						output += '<div class="price_content"><span class="p1_price">총가격</span>원</div>';
						output += '</td></tr>';
						output += '<tr class="cart_price_del">';
						output += '<td colspan="2"><div class="price_title">배송비</div></td>';
						output += '<td colspan="4"><div class="price_content"><span>2600</span></div></td>';
						output += '</tr>';
					}
					
					output += '</table>';
					$(".cart_table").remove();
					$(".cart_content").append(output);
				}
			});
		}
		
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
				
				<c:if test="${vo.opt1_qty ne 'undefined'}">
				<tr class="cart_explain">
					<td></td>
					<td></td>
					<td width=53%>
						<div class="cart_option">${vo.opt1 }</div>
					</td>
					<td width=12%>
						<div class="cart_num">
							<button type="button" class="minus" name="minus" id="p1">-</button>
							<input type="text" class="price" value="${vo.opt1_qty }" id="p1_amt">
							<button type="button" class="plus" name="plus" id="p1">+</button>
						</div>
					</td>
					<td width=11%>
						<div class="cart_price"><span id="p1_price">${vo.pprice + vo.opt1_price }</span>원</div>
					</td>
					<td>
						<div class="cart_update">
							<button type="button" class="cart_prod_update">수정</button>
							<button type="button" class="cart_prod_del">삭제</button>
						</div>
					</td>
				</tr>
				</c:if>
				
				<c:if test="${vo.opt2_qty ne 'undefined'}">
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
						<div class="cart_price"><span id="p2_price">${vo.pprice +vo.opt2_price}</span>원</div>
					</td>
					<td>
						<div class="cart_update">
							<button type="button" class="cart_prod_update">수정</button>
							<button type="button" class="cart_prod_del">삭제</button>
						</div>
					</td>
				</tr>
				</c:if>
				
				<c:if test="${vo.opt3_qty ne 'undefined'}">
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
						<div class="cart_price"><span id="p3_price">${vo.pprice + vo.opt3_price }</span>원</div>
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
						<div class="price_content"><span id="price_total"></span>원</div>
					</td>
				</tr>
				<tr class="cart_price_del">
					<td colspan="2"><div class="price_title">배송비</div></td>
					<td colspan="4"><div class="price_content"><span id="del_price">2600</span></div></td>
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
						<td class="all_price2"><span id="all_price_total"></span>원</td>
						<td class="del2"><span>2,600</span>원</td>
						<td class="prod_total2"><span></span>원</td>
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