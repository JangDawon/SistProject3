<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
	<!-- header -->
	<!-- 지혜 --> 
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
		        <div class="outer_frame">
		        	<div class="ui_grid_cols5">
		        		
			        	<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/마치.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">마치</div>
									<div class="prod_info_title">마치:비누 설날 선물세트</div>
								</div>
								<div class="ui_card_rating">
									<div class="ui_rating">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
										<img src="images/star.png">
									</div>	
									<div class="rv">선물이라 뜯어보지는 못했지만 일...</div>
								</div>
							</a>
						</div>
						
						
					</div>
				</div>
				 <a href="http://localhost:9000/sistproject3/product_best.do" class="ui_btn-large">인기작품  더보기</a>
		</section>	
		
		<section id="new_product" class="indexpage_section">
			<div class="ui_title">
	                <a href="" class="ui_title__txt">
	                    <span>최신작품</span>
	                </a>
	            </div>
		        <div class="outer_frame">
		        	<div class="ui_grid_cols5">
			        	<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
						<div class="ui_grid__item">
							<a href="">
								<div class="prod_img">
										<img src="http://localhost:9000/sistproject3/images/제이핸즈.jpg">
								</div>
								<div class="prod_info">
									<div class="prod_info_name">제이핸즈</div>
									<div class="prod_info_title">복주머니 수세미</div>
								</div>
							</a>
						</div>
					</div>
				</div>
				 <a href="http://localhost:9000/sistproject3/product_new.do" class="ui_btn-large">최신작품  더보기</a>
		
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