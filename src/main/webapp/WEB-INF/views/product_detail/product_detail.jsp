<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>제품상세페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/carousel.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	var one=1;
	var two=1;
	var three=1;
	var sum = 0;
	var uemail = "${sessionScope.svo.uemail}";
	
	$(document).on("click",".optDelete",function(){
		var id = $(this).val();
		var pid = "#"+id+"_tab_style";
		var name = "#"+id+"_price";
		var pprice = parseInt($(name).text());
		sum = parseInt($(".sum").text()) - pprice;
		$("div.sum").text(sum+"원");
		$(pid).remove();
		
		if(id == "p1"){
			one = 1;
		}else if(id == "p2"){
			two = 1;
		}else if(id == "p3"){
			three =1;
		} 
	});
	
	$(document).on("click","button",function(){
		var obj_name = $(this).attr("name");	//+, -구분
		var obj_id = $(this).attr("id");		//p1, p2, p3 아이디 구분
		var vname = "#" + obj_id + "_amt"		//p1_amt, p2_amt ...
		var p1_value = parseInt($("#p1_amt").val());	//$(p1_amt).val()
		var p2_value = parseInt($("#p2_amt").val());	//$(p2_amt).val()
		var p3_value = parseInt($("#p3_amt").val());	//$(p3_amt).val()
		
		//수량 변경 시 적립금, 가격 수정
		var p1_price = parseInt($("#p1_price").text());	//(기본가격+옵션가격)*수량
		var p1_one_price = p1_price/p1_value;			//(기본가격+옵션가격)
		var p2_price = parseInt($("#p2_price").text()); //(기본가격+옵션가격)*수량
		var p2_one_price = p2_price/p2_value;			//(기본가격+옵션가격)
		var p3_price = parseInt($("#p3_price").text()); //(기본가격+옵션가격)*수량
		var p3_one_price = p3_price/p3_value;			//(기본가격+옵션가격)
		
		if(obj_name == "plus") {
			var count = parseInt($(vname).val())+1;
			$(vname).val(count);
			//p2, p3없을때 확인해보기
			if(obj_id == "p1"){
				$("#"+ obj_id +"_price").text("").append(p1_price + p1_one_price+"원");
				var total = parseInt($(".sum").text());
				total += p1_one_price;
				$(".sum").text("").append(total+"원");
			}else if(obj_id == "p2"){
				$("#"+ obj_id +"_price").text("").append(p2_price + p2_one_price+"원");
				var total = parseInt($(".sum").text());
				total += p2_one_price;
				$(".sum").text("").append(total+"원");
			}else if(obj_id == "p3"){
				$("#"+ obj_id +"_price").text("").append(p3_price + p3_one_price+"원");
				var total = parseInt($(".sum").text());
				total += p3_one_price;
				$(".sum").text("").append(total+"원");
			}
			
			
		}else if(obj_name == "minus") {
			//선택한 아이디의 값만 1일 때 경고창
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
	
	
	$("#product_option").change(function(){		
		var price = "${vo.pprice }";	
		var opt1_price = "${vo.opt1_price }";
		var opt2_price = "${vo.opt2_price }";
		var opt3_price = "${vo.opt3_price }";
		var opt1_total = parseInt(price) + parseInt(opt1_price);
		var opt2_total = parseInt(price) + parseInt(opt2_price);
		var opt3_total = parseInt(price) + parseInt(opt3_price);
		var output = "";

		if($(this).val() != "선택"){
			if($(this).val() == "opt1" && one == 1){
				output += "<div class='tab_style' id='p1_tab_style'>";
				output += "<div class='option'>"+ $("#product_option option:selected").text() +"</div>";
				output += "<button type='button' class='optDelete' id='p1_del_btn' value='p1'>X</button>";
				output += "<div class='product_qty_price'>";
				output += "<div class='product_num'>";
				output += "<button  type='button' class='minus' name='minus' id='p1'>-</button>";
				output += "<input type='text' class='price' value='1' id='p1_amt' disabled>";
				output += "<button type='button' class='plus' name='plus' id='p1'>+</button>";
				output += "</div>";
				output += "<div class='price' id='p1_price'>"+ opt1_total +"원</div>";
				output += "</div>";
				output += "</div>";
				
				sum = parseInt($(".sum").text());
				sum += opt1_total; 
				one++;
				$(".product_option_div").after(output);
			}else if($(this).val() == "opt1"){
				var count = parseInt($("#p1_amt").val())+1;
				$("#p1_amt").val(count);
				$("#p1_price").text("").append(opt1_total*count+"원");
				sum = parseInt($(".sum").text());
				sum += opt1_total;
			}else if($(this).val() == "opt2" && two == 1){
				output += "<div class='tab_style' id='p2_tab_style'>";
				output += "<div class='option'>"+ $("#product_option option:selected").text() +"</div>";
				output += "<button type='button' class='optDelete' id='p2_del_btn' value='p2'>X</button>";
				output += "<div class='product_qty_price'>";
				output += "<div class='product_num'>";
				output += "<button  type='button' class='minus' name='minus' id='p2'>-</button>";
				output += "<input type='text' class='price' value='1' id='p2_amt' disabled>";
				output += "<button type='button' class='plus' name='plus' id='p2'>+</button>";
				output += "</div>";
				output += "<div class='price' id='p2_price'>"+ opt2_total +"원</div>";
				output += "</div>";
				output += "</div>";
				
				sum = parseInt($(".sum").text());
				sum += opt2_total;
				two++;
				$(".product_option_div").after(output);
			}else if($(this).val() == "opt2"){
				var count = parseInt($("#p2_amt").val())+1;
				$("#p2_amt").val(count);
				$("#p2_price").text("").append(opt2_total*count+"원");
				sum = parseInt($(".sum").text());
				sum += opt2_total;
			}else if($(this).val() == "opt3" && three == 1){
				output += "<div class='tab_style' id='p3_tab_style'>";
				output += "<div class='option'>"+ $("#product_option option:selected").text() +"</div>";
				output += "<button type='button' class='optDelete' id='p3_del_btn' value='p3'>X</button>";
				output += "<div class='product_qty_price'>";
				output += "<div class='product_num'>";
				output += "<button  type='button' class='minus' name='minus' id='p3'>-</button>";
				output += "<input type='text' class='price' value='1' id='p3_amt' disabled>";
				output += "<button type='button' class='plus' name='plus' id='p3'>+</button>";
				output += "</div>";
				output += "<div class='price' id='p3_price'>"+ opt3_total +"원</div>";
				output += "</div>";
				output += "</div>";
				
				sum = parseInt($(".sum").text());
				sum += opt3_total; 
				
				three++;
				$(".product_option_div").after(output);
			}else if($(this).val() == "opt3"){
				var count = parseInt($("#p3_amt").val())+1;
				$("#p3_amt").val(count);
				$("#p3_price").text("").append(opt3_total*count+"원");
				sum = parseInt($(".sum").text());
				sum += opt3_total;
			}
			
			$(".sum").text(sum+"원");
			
		}
			
	});//product_option.change	
	
	$("#cartBtn").click(function(){
		if($("#product_option").val() == '선택'){
			alert("옵션을 선택해 주세요.");
			return;
		} else {
			if(uemail !="") {
				var p1_amt = 0;
				var p2_amt = 0;
				var p3_amt = 0;
				if($("#p1_amt").val() == undefined){
					p1_amt = 0;
				}else{
					p1_amt = parseInt($("#p1_amt").val());
				}
				if($("#p2_amt").val() == undefined){
					p2_amt = 0;
				}else{
					p2_amt = parseInt($("#p2_amt").val());
				}
				if($("#p3_amt").val() == undefined){
					p3_amt = 0;
				}else{
					p3_amt = parseInt($("#p3_amt").val());
				}
				$.ajax({
					url:"cart_insert.do?uemail=${sessionScope.svo.uemail}&pid=${vo.pid }&opt1_qty=" + p1_amt + "&opt2_qty="+ p2_amt +"&opt3_qty="+p3_amt,
					success:function(result){
						if(result) {
							var count = confirm("장바구니 페이지로 이동할까요?");
							
							if(count){
								location.href='http://localhost:9000/sistproject3/cart2.do';
							}
						}
					}
				}); 
			}else {
				alert("로그인을 먼저 진행해 주세요!");
				location.href='http://localhost:9000/sistproject3/login.do';
			}
		}
        
     });
	
	$("#payBtn").click(function(){
		if($("#product_option").val() == '선택'){
			alert("옵션을 선택해 주세요.");
			return;
		} else {
			if(uemail !="") {
				alert("주문페이지로 이동합니다.");
				$.ajax({
					url:"cart_ins.do?uemail=${sessionScope.svo.uemail}&pid=${vo.pid }&opt1_qty=" + $("#p1_amt").val() + "&opt2_qty="+ $("#p2_amt").val() +"&opt3_qty="+$("#p3_amt").val(),
					success:function(result){
						if(result) {
							location.href='http://localhost:9000/sistproject3/purchase.do?uemail=${sessionScope.svo.uemail}&pid=${vo.pid }';
						}
					}
				});
			}else {
				alert("로그인을 먼저 진행해 주세요!");
				location.href='http://localhost:9000/sistproject3/login.do';
			}
		}
	});
	
});//ready
</script>
</head>
<body>
   <!-- header -->
    <jsp:include page="../header.jsp" />
    
    <!-- content -->
    <div class="product_detail_content"> 
       <div class="detail_wrapper">
          <div class="content-left">
          	<section class="img-section">
          	<div id="demo" class="carousel slide" data-ride="carousel">
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>

						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }"
									width="560" height="560">
							</div>
							<c:if test="${vo.psfile2 ne null }">
							<div class="carousel-item">
								<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile2 }"
									width="560" height="560">
							</div>
							</c:if>
							<c:if test="${vo.psfile3 ne null }">
							<div class="carousel-item">
								<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile3 }"
									width="560" height="560">
							</div>
							</c:if>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
			</div> 
          	 </section>
          	 <nav class="detail_nav_style">
          	 	<a href="#PD_product-info">작품정보</a>
          	 	<a href="#PD_product_delivery">배송/교환/환불</a>
          	 	<a href="#PD_product_review">구매후기</a>
          	 </nav>
          	 <section class="product-info" id="PD_product-info">
          	 	<p>
					${vo.pcontent }
          	 	</p>
          	 	<div class="hashtag-box">
          	 		<div class="hashtag-box-txt">
          	 			<span>Category & Keyword</span>
          	 			<a href="">
          	 				<strong>${vo.pcat }</strong>
          	 			</a>
          	 		</div>
          	 	</div>
          	 	<div class="tab-style">
          	 		<div class="tab_split"></div>
          	 		<div class="tab_split"></div>
          	 		<div class="tab_split"></div>
          	 	</div>
          	 </section>
          	 <section class="product_delivery" id="PD_product_delivery">
          	 	<div class="title-style-sub-delivery">
          	 		<h3>배송/교환/환불 안내</h3>
          	 	</div>
          	 	<div>
          	 		<div style="display:flex;">
          	 			<div class="product_delivery_th">
          	 				<p>배송비</p>
          	 			</div>
          	 			<div class="product_delivery_td">
          	 				<p>기본료 : 2,600원</p>
          	 				<p>배송비 무료 조건 : 50,000원</p>
          	 			</div>
          	 		</div>
          	 		<div style="display:flex;">
          	 			<div class="product_delivery_th">
          	 				<p>제작 / 배송</p>
          	 			</div>
          	 			<div class="product_delivery_td">
          	 				<p>7일 이내</p>
          	 				<p>주문 후 제작에 들어가는 작품입니다.</p>
          	 			</div>
          	 		</div>
          	 		<div style="display:flex;">
          	 			<div class="product_delivery_th">
          	 				<p>교환 / 환불</p>
          	 			</div>
          	 			<div class="product_delivery_td">
          	 				<p>불가</p>
          	 				<p>주문 전 판매 작가님과 연락하여 확인해주세요.</p>
          	 			</div>
          	 		</div>
          	 	</div>
          	 </section>
          	 <section class="product_review" id="PD_product_review">
          	 	<div class="title-style-sub">
          	 		<h3>구매후기</h3>
          	 	</div>
          	 	<ul class="PD_list-style-review">
          	 		<li>
          	 			<div class="PD_review_user">
          	 				<div>
          	 					<div class="PD_review_user_img">
          	 						<img src="http://localhost:9000/sistproject3/images/icon_review_user.jpg">
          	 					</div>
          	 					<div class="PD_review_user_txtbox">
          	 						<p>user</p>
          	 						<p  style="color: #999;">2021년 1월 24일</p>
          	 					</div>
          	 					<div class="PD_review_rating">
          	 						<span class="span_ui_rating">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
				          				<img src="http://localhost:9000/sistproject3/images/star2.png">
									</span>	
          	 					</div>
          	 				</div>
          	 				<span></span>
          	 			</div>
          	 			<div class="PD_review_txt_area">
          	 				<div class="PD_review_cell">
          	 					<img src="http://localhost:9000/sistproject3/images/제품상세1.jpg">
          	 				</div>
          	 				<div class="PD_review_cell_txt">
          	 					<span>
          	 					달지 않고 크림치즈는 진짜 맛있고 초코도 달지 않고 진짜 짱이에요. 하나 더 지금 시키려구 해요.
          	 					예쁘고 깨진곳 없이와서 좋 아요!
								지정발송일 다음날에 바로와서
								친구생일에 딱맞춰서 줬어요b
          	 					</span>
          	 				</div>
          	 			</div>
          	 		</li>
          	 	</ul>
          	 </section>
          </div>
          
			<div class="product_sidebar">
				<div class="artist_card">
          				<a href="" class="artist_card_link" style="width: 100%;">
          					<span class="artist_card_label">${vo.sname } ></span>
          				</a>
          		</div>
          	
          		<h2 class="aside_product-title" name="ptitle">${vo.ptitle }</h2>
          		<div class="aside_product-info">
          			<div class="price_tag_detail">
          				<span class="price_tag_strong">
          					<strong name="pprice">${vo.pprice_char }</strong>원
          				</span>
          			</div>
          			
          			<div class="product-define-info">
	          			<div>
	          				<span class="span-title-txt">구매후기</span>
	          				<a href="">
		          				<span class="span_ui_rating">
			          				<img src="http://localhost:9000/sistproject3/images/star2.png">
			          				<span>4.5</span>
								</span>	
							</a>
	          			</div>
	          			<div>
	          				<span class="span-title-txt">배송비</span>
	          				<span class="bold-txt">2,600원</span>
	          			</div>
	          			<div>
	          				<span class="span-title-txt">배송 시작</span>
	          				<span class="bold-txt">최대 7일 이내</span>
	          			</div>
	          			<div>
	          				<span class="span-title-txt">수량</span>
	          				<span class="bold-txt">주문시 제작</span>
	          			</div>
	          			<div class="product_option_div">
							<select name="product_option" id="product_option" >
						  		<option value="선택">[필수] 옵션을 선택해주세요</option>
						  		<option value="opt1">${vo.opt1 } (+${vo.opt1_price }원)</option>
						  		<c:if test="${vo.opt2 ne null }">
						  			<option value="opt2">${vo.opt2 } (+${vo.opt2_price }원)</option>
						  		</c:if>
						  		<c:if test="${vo.opt3 ne null }">
						  			<option value="opt3">${vo.opt3 } (+${vo.opt3_price }원)</option>
						  		</c:if>
						  	</select>
					  	</div>
          			</div>
          		</div>
	          	
	          	<table class="price_sum">
	          		<tr>
	          			<td>
	          				<div class="sum_title">총 작품금액</div>
	          			</td>
	          			<td>
	          				<div class="sum">0원</div>
	          			</td>
	          		</tr>
	          	</table>
	          	<div>
	          		<table class="btn_box">
	          			<tr>
		          			<button type="button" class="btn_cart" id="cartBtn">장바구니</button>
		          			<%-- <a href="http://localhost:9000/sistproject3/purchase.do?pid=${vo.pid }"> --%>
		          				<button type="button" class="btn_buy" id="payBtn">구매하기</button>
		          			<!-- </a> -->
		          		</tr>
	          		</table>
	          	</div>
			</div>
		</div>
	</div>
    
    
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>