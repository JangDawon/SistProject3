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
		cart_ajax_list();
		product_price();
		
		function product_price(){
			$.ajax({
				url:"cart_ajax_list.do?uemail=${sessionScope.svo.uemail}",
				success:function(result){
					var jdata = JSON.parse(result);
					
					for(var i in jdata.jlist){ 
						var pid = jdata.jlist[i].pid;
						var psum = 0;
						if(!isNaN(parseInt($("#"+ pid +"_p1_price").text()))){
				        	psum += parseInt($("#"+ pid +"_p1_price").text());
				        }
				        if(!isNaN(parseInt($("#"+ pid +"_p2_price").text()))){
				        	psum += parseInt($("#"+ pid +"_p2_price").text());
				        }
				        if(!isNaN(parseInt($("#"+ pid +"_p3_price").text()))){
				        	psum += parseInt($("#"+ pid +"_p3_price").text());
				        }
				        $("#" + pid + "_price_total").text("").append(psum);
				        
				        if(psum >= 50000){
				        	$("#" + pid + "_del_price").text("").append(0);
						}else{
							$("#" + pid + "_del_price").text("").append(2600);
						}
					}
						
						
				}
			});
		}
		
		$("#cart_all_chk").click(function(){
			if($("#cart_all_chk").is(":checked")){
				$(".cart_prod_chk").prop("checked", true);
			}else{
				$(".cart_prod_chk").prop("checked", false);
			}
		});
		
		function total_price_change(){
			var total = 0;
			var count = 0;
			$("input[class='cart_prod_chk']:checked").each(function(index){
				var pid = $(this).val();
				var p1 = "#"+pid+"_p1_amt";
				var p1_price = "#"+pid+"_p1_price";
				var p2 = "#"+pid+"_p2_amt";
				var p2_price = "#"+pid+"_p2_price";
				var p3 = "#"+pid+"_p3_amt";
				var p3_price = "#"+pid+"_p3_price";
				count ++;
				total +=  parseInt($("#" + pid + "_price_total").text());
			});
			$("#all_price_total").text("").append(total);
			
			if(total >= 50000 && count != 0){
				$("#prod_total2").text("").append(total);
				$("#prod_total_delivery").text("").append(0);
			}else if(total < 50000 && count != 0){
				$("#prod_total2").text("").append(total+2600);
				$("#prod_total_delivery").text("").append(2600);
			}
		}
		
		$(document).on('click','input[type="checkbox"]', function(){
			var count = 0;
			var total = 0;
			$("input[class='cart_prod_chk']:checked").each(function(index){
				var pid = $(this).val();
				count ++;
				total +=  parseInt($("#" + pid + "_price_total").text());
			});
			
			
			$("#all_price_total").text("").append(total);
			
			if(total >= 50000 && count != 0){
				$("#prod_total2").text("").append(total);
				$("#prod_total_delivery").text("").append(0);
			}else if(total < 50000 && count != 0){
				$("#prod_total2").text("").append(total+2600);
				$("#prod_total_delivery").text("").append(2600);
			}else{
				$("#prod_total2").text("").append(0);
				$("#prod_total_delivery").text("").append(0);
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
				var del_fee = $("#prod_total_delivery").text();
				var t_price = $("#prod_total2").text();
				purchase_list += "&del_price=" + del_fee +"&total_price=" + t_price + "&uemail=${sessionScope.svo.uemail}";
				$(location).attr("href","cart_order2.do?purchase_list="+purchase_list);
			}else{
				alert("상품을 선택해주세요");
			}
			
		});
		
		$(document).on('click','button', function(){
			total =0;
			var psum = 0;
			var obj_name = $(this).attr("name");   //+, -구분
			var pid = $(this).val();   				//pid 값만 ex)p_1
			var obj_id = $(this).attr("id");      //p_1_p1, p_1_p2, p_1_p3 아이디 구분
			var vname = "#" + obj_id + "_amt"      //p_1_p1_amt, p_1_p2_amt ...
			var select_p1_value = parseInt($("#" + pid + "_p1_amt").val());   //$(p_1_p1_amt).val()
			var select_p2_value = parseInt($("#" + pid + "_p2_amt").val());   //$(p_1_p2_amt).val()
			var select_p3_value = parseInt($("#" + pid + "_p3_amt").val());   //$(p_1_p3_amt).val()
			
			//수량 변경 시 적립금, 가격 수정
			var select_p1_price = parseInt($("#" + pid + "_p1_price").text());   //(기본가격+옵션가격)*수량
     		var select_p1_one_price = select_p1_price/select_p1_value;         //(기본가격+옵션가격)
			var select_p2_price = parseInt($("#" + pid + "_p2_price").text()); //(기본가격+옵션가격)*수량
			var select_p2_one_price = select_p2_price/select_p2_value;         //(기본가격+옵션가격)
			var select_p3_price = parseInt($("#" + pid + "_p3_price").text()); //(기본가격+옵션가격)*수량
			var select_p3_one_price = select_p3_price/select_p3_value;         //(기본가격+옵션가격)
			
			if(obj_name == "plus") {
				var count = parseInt($(vname).val())+1;
		        $(vname).val(count);
		        if(obj_id.indexOf("p1") != -1){
		        	$("#"+ obj_id +"_price").text("").append(select_p1_price + select_p1_one_price);
		        }else if(obj_id.indexOf("p2") != -1){
		        	$("#"+ obj_id +"_price").text("").append(select_p2_price + select_p2_one_price);
		        }else if(obj_id.indexOf("p3") != -1){
		            $("#"+ obj_id +"_price").text("").append(select_p3_price + select_p3_one_price);
		        }
		        
		        if(!isNaN(parseInt($("#"+ pid +"_p1_price").text()))){
		        	psum += parseInt($("#"+ pid +"_p1_price").text());
		        }
		        if(!isNaN(parseInt($("#"+ pid +"_p2_price").text()))){
		        	psum += parseInt($("#"+ pid +"_p2_price").text());
		        }
		        if(!isNaN(parseInt($("#"+ pid +"_p3_price").text()))){
		        	psum += parseInt($("#"+ pid +"_p3_price").text());
		        }
		        $("#" + pid + "_price_total").text("").append(psum);
		        
		        if(psum >= 50000){
		        	$("#" + pid + "_del_price").text("").append(0);
				}else{
					$("#" + pid + "_del_price").text("").append(2600);
				}
		       
			 }else if(obj_name == "minus") {
		         //선택한 아이디의 값만 1일 때 경고창
		        if($(vname).val() == 1) {
					alert("최소 주문 수량은 1개입니다.");
		        }else {
		            var count = parseInt($(vname).val())-1;
		            $(vname).val(count);
		           
		            if(obj_id.indexOf("p1") != -1){
			        	$("#"+ obj_id +"_price").text("").append(select_p1_price - select_p1_one_price);
			        }else if(obj_id.indexOf("p2") != -1){
			        	$("#"+ obj_id +"_price").text("").append(select_p2_price - select_p2_one_price);
			        }else if(obj_id.indexOf("p3") != -1){
			            $("#"+ obj_id +"_price").text("").append(select_p3_price - select_p3_one_price);
			        }
		            
				}
		        if(!isNaN(parseInt($("#"+ pid +"_p1_price").text()))){
		        	psum += parseInt($("#"+ pid +"_p1_price").text());
		        }
		        if(!isNaN(parseInt($("#"+ pid +"_p2_price").text()))){
		        	psum += parseInt($("#"+ pid +"_p2_price").text());
		        }
		        if(!isNaN(parseInt($("#"+ pid +"_p3_price").text()))){
		        	psum += parseInt($("#"+ pid +"_p3_price").text());
		        }
		        $("#" + pid + "_price_total").text("").append(psum);
		        if(psum >= 50000){
		        	$("#" + pid + "_del_price").text("").append(0);
				}else{
					$("#" + pid + "_del_price").text("").append(2600);
				}
			}
			
		});
		
		$(document).on('click','.minus', function(){
			total_price_change();
		});
		
		$(document).on('click','.plus', function(){
			total_price_change();
		});
		
		$("#cart_select_del").click(function(){
			var del_list = "";
			
			$("input[class='cart_prod_chk']:checked").each(function(index){
				del_list += $(this).attr("id") + ", ";
			});
			
			if(del_list == ""){
				alert("선택된 상품이 없습니다");
			}else{
				var result = confirm(del_list + "를 정말 삭제하시겠습니까?");
				if(result){
					$(location).attr("href", "cart_list_select_del.do?del_list="+del_list);
				} 
			}
		});
		
		$(document).on('click','.cart_prod_update', function(){
			var st = $(this).val().split("_");
			var cid = $(this).attr("id");
			var opt = st[2];
			var name = "#" + $(this).val() + "_amt";
			
			$.ajax({
				url:"cart_list_opt_update.do?cid="+cid+"&opt="+opt+"&opt_qty="+$(name).val(),
				success:function(result){
					if(result > 0){
						alert("수량이 수정되었습니다.");
						cart_ajax_list();
						product_price();
					}
				}
			});
		});
		
		$(document).on('click','.cart_prod_del', function(){
			var st = $(this).val().split("_");
			var cid = $(this).attr("id");
			var opt = st[2];
			
			$.ajax({
				url:"cart_list_opt_update.do?cid="+cid+"&opt="+opt+"&opt_qty=0",
				success:function(result){
					if(result > 0){
						alert("옵션이 삭제되었습니다.");
						cart_ajax_list();
						product_price();
					}
				}
			});
		});
		
		
		function cart_ajax_list(){
			$.ajax({
				url:"cart_ajax_list.do?uemail=${sessionScope.svo.uemail}",
				success:function(result){
					var jdata = JSON.parse(result);
					var output = "";
					
					for(var i in jdata.jlist){
						output += '<table>';
						output += '<tr class="cart_product">';
						output += '<td width=2%>';
						output += '<div class="cart_chk">';
						output += '<input type="checkbox" id="'+ jdata.jlist[i].cid +'" class="cart_prod_chk" value="'+ jdata.jlist[i].pid +'">';
						output += '</div>';
						output += '</td>';
						output += '<td width=10%>';
						output += '<div class="cart_img">';
						output += '<img src="http://localhost:9000/sistproject3/resources/upload/'+ jdata.jlist[i].psfile1 +'">';
						output += '</div>';
						output += '</td>';
						output += '<td colspan="4">';
						output += '<div class="cart_text"><a href="http://localhost:9000/sistproject3/product.do?pid='+ jdata.jlist[i].pid +'">';
						output += '<label>'+ jdata.jlist[i].ptitle +'</label></a>';
						output += '</div>';
						output += '</td>';
						output += '</tr>';
						if(jdata.jlist[i].opt1_qty != 0){
							output += '<tr class="cart_explain">';
							output += '<td></td>';
							output += '<td></td>';
							output += '<td width=53%>';
							output += '<div class="cart_option">'+ jdata.jlist[i].opt1 +'</div>';
							output += '</td>';
							output += '<td width=12%>';
							output += '<div class="cart_num">';
							output += '<button type="button" class="minus" name="minus" id="'+ jdata.jlist[i].pid +'_p1" value="'+ jdata.jlist[i].pid +'">-</button>';
							output += '<input type="text" class="price" value="'+ jdata.jlist[i].opt1_qty +'" id="'+ jdata.jlist[i].pid +'_p1_amt" >';
							output += '<button type="button" class="plus" name="plus" id="'+ jdata.jlist[i].pid +'_p1" value="'+ jdata.jlist[i].pid +'">+</button>';
							output += '</div>';
							output += '</td>';
							output += '<td width=11%>';
							output += '<div class="cart_price"><span id="'+ jdata.jlist[i].pid +'_p1_price">'+ ((jdata.jlist[i].pprice + jdata.jlist[i].opt1_price) * jdata.jlist[i].opt1_qty) +'</span>원</div>';
							output += '</td>';
							output += '<td>';
							output += '<div class="cart_update">';
							output += '<button type="button" id='+ jdata.jlist[i].cid +' class="cart_prod_update" value="'+ jdata.jlist[i].pid +'_p1">수정</button>';
							output += '<button type="button" id='+ jdata.jlist[i].cid +' class="cart_prod_del" value="'+ jdata.jlist[i].pid +'_p1">삭제</button>';
							output += '</div>';
							output += '</td>';
							output += '</tr>';
						}
						if(jdata.jlist[i].opt2_qty != 0){
							output += '<tr class="cart_explain">';
							output += '<td></td>';
							output += '<td></td>';
							output += '<td width=53%>';
							output += '<div class="cart_option">'+ jdata.jlist[i].opt2 +'</div>';
							output += '</td>';
							output += '<td width=12%>';
							output += '<div class="cart_num">';
							output += '<button type="button" class="minus" name="minus" id="'+ jdata.jlist[i].pid +'_p2" value="'+ jdata.jlist[i].pid +'">-</button>';
							output += '<input type="text" class="price" value="'+ jdata.jlist[i].opt2_qty +'" id="'+ jdata.jlist[i].pid +'_p2_amt" >';
							output += '<button type="button" class="plus" name="plus" id="'+ jdata.jlist[i].pid +'_p2" value="'+ jdata.jlist[i].pid +'">+</button>';
							output += '</div>';
							output += '</td>';
							output += '<td width=11%>';
							output += '<div class="cart_price"><span id="'+ jdata.jlist[i].pid +'_p2_price">'+ ((jdata.jlist[i].pprice + jdata.jlist[i].opt2_price) * jdata.jlist[i].opt2_qty) +'</span>원</div>';
							output += '</td>';
							output += '<td>';
							output += '<div class="cart_update">';
							output += '<button type="button" id='+ jdata.jlist[i].cid +' class="cart_prod_update" value="'+ jdata.jlist[i].pid +'_p2">수정</button>';
							output += '<button type="button" id='+ jdata.jlist[i].cid +' class="cart_prod_del" value="'+ jdata.jlist[i].pid +'_p2">삭제</button>';
							output += '</div>';
							output += '</td>';
							output += '</tr>';
						}
						if(jdata.jlist[i].opt3_qty != 0){
							output += '<tr class="cart_explain">';
							output += '<td></td>';
							output += '<td></td>';
							output += '<td width=53%>';
							output += '<div class="cart_option">'+ jdata.jlist[i].opt3 +'</div>';
							output += '</td>';
							output += '<td width=12%>';
							output += '<div class="cart_num">';
							output += '<button type="button" class="minus" name="minus" id="'+ jdata.jlist[i].pid +'_p3" value="'+ jdata.jlist[i].pid +'">-</button>';
							output += '<input type="text" class="price" value="'+ jdata.jlist[i].opt3_qty +'" id="'+ jdata.jlist[i].pid +'_p3_amt" >';
							output += '<button type="button" class="plus" name="plus" id="'+ jdata.jlist[i].pid +'_p3" value="'+ jdata.jlist[i].pid +'">+</button>';
							output += '</div>';
							output += '</td>';
							output += '<td width=11%>';
							output += '<div class="cart_price"><span id="'+ jdata.jlist[i].pid +'_p3_price">'+ ((jdata.jlist[i].pprice + jdata.jlist[i].opt3_price) * jdata.jlist[i].opt3_qty) +'</span>원</div>';
							output += '</td>';
							output += '<td>';
							output += '<div class="cart_update">';
							output += '<button type="button" id='+ jdata.jlist[i].cid +' class="cart_prod_update" value="'+ jdata.jlist[i].pid +'_p3">수정</button>';
							output += '<button type="button" id='+ jdata.jlist[i].cid +' class="cart_prod_del" value="'+ jdata.jlist[i].pid +'_p3">삭제</button>';
							output += '</div>';
							output += '</td>';
							output += '</tr>';
						}
						output += '<tr class="cart_price_name">';
						output += '<td colspan="2"><div class="price_title">작품 가격</div></td>';
						output += '<td colspan="4">';
						output += '<div class="price_content"><span id="'+jdata.jlist[i].pid+'_price_total"></span>원</div>';
						output += '</td>';
						output += '</tr>';
						output += '<tr class="cart_price_del">';
						output += '<td colspan="2"><div class="price_title">배송비</div></td>';
						output += '<td colspan="4"><div class="price_content"><span id="'+jdata.jlist[i].pid+'_del_price">2600</span>원</div></td>';
						output += '</tr>';
						output += '</table>';
					} 
					
						$(".cart_content").text("").append(output);
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
			
		</div>
		
		<div class="cart_prod_order">
			<div class="prod_choice">
				<input type="checkbox" id="cart_all_chk"><span class="rchk">전체선택</span>
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
						<td class="all_price2"><span id="all_price_total">0</span>원</td>
						<td class="del2"><span id="prod_total_delivery">0</span>원</td>
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