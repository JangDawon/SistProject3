<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>제품상세페이지</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/carousel.css">
		<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
		<script src="http://localhost:9000/sistproject3/js/am-pagination.js"></script>
		<script src="http://localhost:9000/sistproject3/js/dawon.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
							<div class="carousel-item">
								<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile2 }"
									width="560" height="560">
							</div>
							<div class="carousel-item">
								<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile3 }"
									width="560" height="560">
							</div>
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
          					<strong name="pprice">${vo.pprice }</strong>원
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
	          			<div>
							<select name="product_option" id="product_option" >
						  		<option value="선택">[필수] 옵션을 선택해주세요</option>
						  		<option value="opt1">${vo.opt1 }</option>
						  		<option value="opt2">${vo.opt2 }</option>
						  		<option value="opt2">${vo.opt3 }</option>
						  	</select>
					  	</div>
          			</div>
          		</div>
          		
	          	<div class="tab_style">
	          		<div class="option">${vo.opt1 }</div>
	          		<div class="product_qty_price">
	          			<div class="product_num">
							<button type="button" class="minus" name="minus" id="p1">-</button>
							<input type="text" class="price" value="1" id="p1_amt">
							<button type="button" class="plus" name="plus" id="p1">+</button>
						</div>
						<div class="price"><span class="p1_price">${vo.pprice_char }</span>원</div>
	          		</div>
	          	</div>
	          	
	          	<table class="price_sum">
	          		<tr>
	          			<td>
	          				<div class="sum_title">총 작품금액</div>
	          			</td>
	          			<td>
	          				<div class="sum">
	          					<div class="whole_price">0원</div>
	          					<span id="whole_price">${vo.pprice_char}원</span>
	          				</div>
	          			</td>
	          		</tr>
	          	</table>
	          	<div>
	          		<div class="btn_box">
	          			<a href="cart.do"><button type="button" class="btn_cart" id="cartBtn">장바구니</button></a>
	          			<a href="purchase.do"><button type="button" class="btn_buy" id="payBtn">구매하기</button></a>
	          		</div>
	          	</div>
			</div>
		</div>
	</div>
    
    
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>