<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>판매중인 작품 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
	</head>
	<body class="artist">
		<!-- header -->
		<jsp:include page="../header.jsp" />
		
		<section class="artist_home">
			<!-- aside -->
		 	<jsp:include page="artist_menu.jsp" />
	 	
			<div class="artist_main">
				<h3>판매중인 작품</h3>
				<div class="prod_search">
					<input type="text" name="prod_search" class="prod_search" placeholder="작가님의 작품 검색">
					<button type="button" class="prod_search_btn">검색</button>
				</div>
				<div class="artist_product">
					<div class="artist_prod">
						<a href="">
							<div>
								<div class="artist_prod_img">
									<div>
										<button class="favorite_btn">
											<img src="http://localhost:9000/sistproject3/images/favorite.png">
										</button>
									</div>
									<div>
										<img src="http://localhost:9000/sistproject3/images/interior1.png">
									</div>
								</div>
								<div class="artist_prod_info">
									<div class="prod_info_name">희다 heeda</div>
									<div class="prod_info_title">[선물세트] 치즈곰캔들+빅치즈캔들 SET</div>
								</div>
							</div>
						</a>
					</div>
					<div class="artist_prod">
						<a href="">
							<div>
								<div class="artist_prod_img">
									<div>
										<button class="favorite_btn">
											<img src="http://localhost:9000/sistproject3/images/favorite.png">
										</button>
									</div>
									<div>
										<img src="http://localhost:9000/sistproject3/images/interior1.png">
									</div>
								</div>
								<div class="artist_prod_info">
									<div class="prod_info_name">희다 heeda</div>
									<div class="prod_info_title">[선물세트] 치즈곰캔들+빅치즈캔들 SET</div>
								</div>
							</div>
						</a>
					</div>
					<div class="artist_prod">
						<a href="">
							<div>
								<div class="artist_prod_img">
									<div>
										<button class="favorite_btn">
											<img src="http://localhost:9000/sistproject3/images/favorite.png">
										</button>
									</div>
									<div>
										<img src="http://localhost:9000/sistproject3/images/interior1.png">
									</div>
								</div>
								<div class="artist_prod_info">
									<div class="prod_info_name">희다 heeda</div>
									<div class="prod_info_title">[선물세트] 치즈곰캔들+빅치즈캔들 SET</div>
								</div>
							</div>
						</a>
					</div>
					<div class="artist_prod">
						<a href="">
							<div>
								<div class="artist_prod_img">
									<div>
										<button class="favorite_btn">
											<img src="http://localhost:9000/sistproject3/images/favorite.png">
										</button>
									</div>
									<div>
										<img src="http://localhost:9000/sistproject3/images/interior1.png">
									</div>
								</div>
								<div class="artist_prod_info">
									<div class="prod_info_name">희다 heeda</div>
									<div class="prod_info_title">[선물세트] 치즈곰캔들+빅치즈캔들 SET</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</section>
		
		
		
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>
