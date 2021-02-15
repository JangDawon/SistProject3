<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>메인페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/carousel.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		var uemail = "${sessionScope.svo.uemail}";
		ajax_index_best();
		ajax_index_new();
		
		$(document).on("click",".favorite_btn",function(){
			var btn_pid = $(this).val(); 
			var wish_img_id = "#"+btn_pid+"_star";
			var wish_new_img_id = "#"+btn_pid+"_star_new";
			var wish_img_attr = $(wish_img_id).attr("src"); 
			var wish_new_img_attr = $(wish_new_img_id).attr("src"); 
			if(uemail !="") {
				if(wish_img_attr == "http://localhost:9000/sistproject3/images/favorite.png" || wish_new_img_attr == "http://localhost:9000/sistproject3/images/favorite.png"){
					$(wish_img_id).attr('src','http://localhost:9000/sistproject3/images/star2.png');
					$(wish_new_img_id).attr('src','http://localhost:9000/sistproject3/images/star2.png');
					$.ajax({
						url:"wish_insert.do?uemail=${sessionScope.svo.uemail}&pid="+btn_pid,
						success:function(result){
							if(result == 1){
								ajax_index_best();
								ajax_index_new();
							}		 
						}
					});//ajax
				}else{
					$(wish_img_id).attr('src','http://localhost:9000/sistproject3/images/favorite.png');
					$(wish_new_img_id).attr('src','http://localhost:9000/sistproject3/images/favorite.png');
					$.ajax({
						url:"wish_delete.do?uemail=${sessionScope.svo.uemail}&pid="+btn_pid,
						success:function(result){
							ajax_index_best();
							ajax_index_new();
						}
					});//ajax
				}
			}else {
				alert("로그인을 먼저 진행해 주세요!");
				location.href='http://localhost:9000/sistproject3/login.do';
			}
		});
		
		
		function ajax_index_best(){
			$.ajax({
				url:"index_best_ajax.do?uemail=${sessionScope.svo.uemail}",
				success:function(result){
					var jdata = JSON.parse(result);
					var output = "";
					
					for(var i in jdata.jlist){ 
						output += '<div class="best_prod">';
						output += '<div>';
						output += '<div class="best_prod_img">';
						output += '<div>';
						var n = 0;
						for(var j in jdata.jlist2){
							if(jdata.jlist[i].pid == jdata.jlist2[j].pid){
								output += '<button class="favorite_btn" value="'+jdata.jlist[i].pid+'">';
								output += '<img src="http://localhost:9000/sistproject3/images/star2.png" id="'+jdata.jlist[i].pid+'_star">';
								output += '</button>';
								n = 1;
							}
						}
						if(n != 1){
							output += '<button class="favorite_btn" value="'+jdata.jlist[i].pid+'">';
							output += '<img src="http://localhost:9000/sistproject3/images/favorite.png" id="'+jdata.jlist[i].pid+'_star">';
							output += '</button>';
						}
						output += '</div>';
						output += '<a href="http://localhost:9000/sistproject3/product.do?pid='+jdata.jlist[i].pid+'">';
						output += '<div>';
						output += '<img src="http://localhost:9000/sistproject3/resources/upload/'+jdata.jlist[i].psfile1+'">';
						output += '</div>';
						output += '</a>';
						output += '</div>';
						output += '<a href="http://localhost:9000/sistproject3/product.do?pid='+jdata.jlist[i].pid+'">';
						output += '<div class="best_prod_info">';
						output += '<div class="prod_info_name">'+jdata.jlist[i].sname+'</div>';
						output += '<div class="prod_info_title">'+jdata.jlist[i].ptitle+'</div>';
						output += '</div>';
						output += '<div class="best_prod_info_review">';
						output += '<div class="rv">';
						output += '<img src="http://localhost:9000/sistproject3/images/star2.png">';
						output += '<span> 4.5</span>';
						output += '</div>';
						output += '<div class="rv2">사진보다 실물이 훨씬 이쁘고...</div>';
						output += '</div>';
						output += '</a>';
						output += '</div>';
						output += '</div>';
					}
					$("#product_content_best").text("").append(output);
				}
			});
		}
		
		function ajax_index_new(){
			$.ajax({
				url:"index_new_ajax.do?uemail=${sessionScope.svo.uemail}",
				success:function(result){
					var jdata = JSON.parse(result);
					var output = "";
					for(var i in jdata.jlist){ 
						output += '<div class="new_prod">';
						output += '<div>';
						output += '<div class="new_prod_img">';
						output += '<div>';
						var n = 0;
						for(var j in jdata.jlist2){
							if(jdata.jlist[i].pid == jdata.jlist2[j].pid){
								output += '<button class="favorite_btn" value="'+jdata.jlist[i].pid+'">';
								output += '<img src="http://localhost:9000/sistproject3/images/star2.png" id="'+jdata.jlist[i].pid+'_star_new">';
								output += '</button>';
								n = 1;
							}
						}
						if(n != 1){
							output += '<button class="favorite_btn" value="'+jdata.jlist[i].pid+'">';
							output += '<img src="http://localhost:9000/sistproject3/images/favorite.png" id="'+jdata.jlist[i].pid+'_star_new">';
							output += '</button>';
						}
						output += '</div>';
						output += '<a href="http://localhost:9000/sistproject3/product.do?pid='+jdata.jlist[i].pid+'">';
						output += '<div>';
						output += '<img src="http://localhost:9000/sistproject3/resources/upload/'+jdata.jlist[i].psfile1+'">';
						output += '</div>';
						output += '</a>';
						output += '</div>';
						output += '<a href="http://localhost:9000/sistproject3/product.do?pid='+jdata.jlist[i].pid+'">';
						output += '<div class="new_prod_info">';
						output += '<div class="prod_info_name">'+jdata.jlist[i].sname+'</div>';
						output += '<div class="prod_info_title">'+jdata.jlist[i].ptitle+'</div>';
						output += '</div>';
						output += '<div class="new_prod_info_review">';
						output += '<div class="rv">';
						output += '<img src="http://localhost:9000/sistproject3/images/star2.png">';
						output += '<span> 4.5</span>';
						output += '</div>';
						output += '<div class="rv2">사진보다 실물이 훨씬 이쁘고...</div>';
						output += '</div>';
						output += '</a>';
						output += '</div>';
						output += '</div>';
					}
					$("#product_content_new").text("").append(output);
				}
			});
		}
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp" />
	 
	<!-- content -->
	<div class="index_content">
		<div>
			<section class="index_section1">
				<div style="width: 100%; display: flex;justify-content: center;">
				<!-- 캐러셀 start -->
				<div id="demo" class="carousel slide" data-ride="carousel">
				
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <!-- <li data-target="#demo" data-slide-to="0" class="active"></li> -->
				    <li data-target="#demo" data-slide-to="0"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li> 
				    <li data-target="#demo" data-slide-to="3"></li>
				    <li data-target="#demo" data-slide-to="4"></li>
				    <li data-target="#demo" data-slide-to="5"></li>
				  </ul>
				  
				  <!-- The slideshow -->
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="images/c1.jpg" width="1920" height="480">
				    </div>
				    <div class="carousel-item">
				      <img src="images/c2.jpg"  width="1920" height="480">
				    </div>
				   <div class="carousel-item">
				      <img src="images/c3.jpg"  width="1920" height="480">
				    </div>
				    <div class="carousel-item">
				      <img src="images/c4.jpg"  width="1920" height="480">
				    </div>
				    <div class="carousel-item">
				      <img src="images/c5.jpg"  width="1920" height="480">
				    </div>
				    <div class="carousel-item">
				      <img src="images/c6.jpg"  width="1920" height="480">
				    </div>
				  </div>
				  
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev-index" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next-index" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
				</div>	
			
				<!-- 캐러셀 end -->
				</div>
			</section>
		</div>
		
		<section id="ranking" class="indexpage_section">
			<div class="ui_title">
                <a href="" class="ui_title__txt">
                    <span>인기작품</span>
                </a>
            </div>
	        <section class="product_content" id="product_content_best">
			</section>
			<a href="http://localhost:9000/sistproject3/product_best.do" class="ui_btn-large">인기작품  더보기</a>
		</section>	
		
		<section id="new_product" class="indexpage_section">
			<div class="ui_title">
                <a href="" class="ui_title__txt">
                    <span>최신작품</span>
                </a>
            </div>
		    <section class="product_content" id="product_content_new">
        		
				<a href="http://localhost:9000/sistproject3/product_new.do" class="ui_btn-large">최신작품  더보기</a>
			</section>
		</section>	
		
		<section id="popular_artist" class="indexpage_section">
			<div class="ui_title">
	                <a href="" class="ui_title__txt">
	                    <span>인기작가</span>
	                </a>
	       	</div>
	       	<div class="outer_frame">
		        	<div class="ui_artist_cols3" style="margin-top: 40px;">
			        	<div class="ui_artist_item">
							<a href="">
								<div class="bordering">
									<div class="split">
										<div class="img-wrapper">
										      <div class="background-image">
										      	<img src="http://localhost:9000/sistproject3/images/작가배경1.jpg">
										      </div>
										      <div class="profile-image">
										      	<img src="http://localhost:9000/sistproject3/images/작가1.jpg">
										      </div>
										</div>
									</div>
									<div class="split2">
										<div class="area-txt">
											<a href="" class="title">소유템💛폰케이스</a>
										</div>
										<div class="ui_rating">
											<img src="images/star.png">
											<img src="images/star.png">
											<img src="images/star.png">
											<img src="images/star.png">
											<img src="images/star.png">
										</div>	
										<div class="split2_p">
											<p>
												real handmade item            
												<br>- 소유하고 싶은 아이템
												<br>작가의 아이디어가 폭팔했어요😉...
											</p>
										</div>
										<div class="area-btns">
											<div class="col">
												<a href="" class="a_btn" style="color: #ff7b30;">♡ 작가로 추가</a>
											</div>
											<div class="col">
												<a href="" class="a_btn">작가 홈</a>
											</div>
											<div class="a_btn_last">
												<a href="">메시지 보내기</a>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="ui_artist_item">
							<a href="">
								<div class="bordering">
									<div class="split">
										<div class="img-wrapper">
										      <div class="background-image">
										      	<img src="http://localhost:9000/sistproject3/images/작가배경2.jpg">
										      </div>
										      <div class="profile-image">
										      	<img src="http://localhost:9000/sistproject3/images/작가2.jpg">
										      </div>
										</div>
									</div>
									<div class="split2">
										<div class="area-txt">
											<a href="" class="title">가율 박민 셰프</a>
										</div>
										<div class="ui_rating">
											<img src="images/star.png">
											<img src="images/star.png">
											<img src="images/star.png">
											<img src="images/star.png">
											<img src="images/star.png">
										</div>	
										<div class="split2_p">
											<p>
												❤2020 핸드메이드 어워드 수제반찬 최우수상❤
												<br>요리에 대한 오랜 애정으로 걸어온 셰프의 길.
												<br>이제 가율에서 정성을 담은 셰프의 한 끼를 만나보세요.
											</p>
										</div>
										<div class="area-btns">
											<div class="col">
												<a href="" class="a_btn" style="color: #ff7b30;">♡ 작가로 추가</a>
											</div>
											<div class="col">
												<a href="" class="a_btn">작가 홈</a>
											</div>
											<div class="a_btn_last">
												<a href="">메시지 보내기</a>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						<div class="ui_artist_item">
							<a href="">
								<div class="bordering">
									<div class="split">
										<div class="img-wrapper">
										      <div class="background-image">
										      	<img src="http://localhost:9000/sistproject3/images/작가배경3.jpg">
										      </div>
										      <div class="profile-image">
										      	<img src="http://localhost:9000/sistproject3/images/작가3.jpg">
										      </div>
										</div>
									</div>
									<div class="split2">
										<div class="area-txt">
											<a href="" class="title">규린이네 수제 과일청</a>
										</div>
										<div class="ui_rating">
											<img src="images/star.png">
											<img src="images/star.png">
											<img src="images/star.png">
											<img src="images/star.png">
											<img src="images/star.png">
										</div>	
										<div class="split2_p">
											<p>
											 	🎖아이디어스 핸드메이드 어워드🎖
												<br>
												<br>🔰2018년 우수신인 작가🎉
											</p>
										</div>
										<div class="area-btns">
											<div class="col">
												<a href="" class="a_btn" style="color: #ff7b30;">♡ 작가로 추가</a>
											</div>
											<div class="col">
												<a href="" class="a_btn">작가 홈</a>
											</div>
											<div class="a_btn_last">
												<a href="">메시지 보내기</a>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
						
					</div>
			</div>
	       	<a href="http://localhost:9000/sistproject3/artist_best.do" class="ui_btn-large">인기작가  더보기</a>
		</section>	
		
		<section id="all_category" class="indexpage_section">
			<div class="ui_title">
	                <a href="" class="ui_title__txt">
	                    <span>전체 카테고리</span>
	                </a>
	        </div>
	        <div class="outer_frame">
		        	<div class="ui_category_cols5" style="margin-top: 40px;">
			        	<div class="ui_category_item">
							<a href="http://localhost:9000/sistproject3/food.do">
								<div class="category_img">
										<img src="http://localhost:9000/sistproject3/images/음식.jpg">
								</div>
								<div class="category_info">
									<a href="">음식</a>
								</div>
							</a>
						</div>
						<div class="ui_category_item">
							<a href="http://localhost:9000/sistproject3/accessory.do">
								<div class="category_img">
										<img src="http://localhost:9000/sistproject3/images/악세사리.jpg">
								</div>
								<div class="category_info">
									<a href="">악세사리</a>
								</div>
							</a>
						</div>
						<div class="ui_category_item">
							<a href="http://localhost:9000/sistproject3/living.do">
								<div class="category_img">
										<img src="http://localhost:9000/sistproject3/images/패션.jpg">
								</div>
								<div class="category_info">
									<a href="">패션&잡화</a>
								</div>
							</a>
						</div>
						<div class="ui_category_item">
							<a href="http://localhost:9000/sistproject3/interior.do">
								<div class="category_img">
										<img src="http://localhost:9000/sistproject3/images/인테리어소품.png">
								</div>
								<div class="category_info">
									<a href="">인테리어 소품</a>
								</div>
							</a>
						</div>
						<div class="ui_category_item">
							<a href="http://localhost:9000/sistproject3/etc.do">
								<div class="category_img">
										<img src="http://localhost:9000/sistproject3/images/기타공예.jpg">
								</div>
								<div class="category_info">
									<a href="">기타</a>
								</div>
							</a>
						</div>
				</div>
			</div>
		</section>	
	</div> 
	
	<!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>