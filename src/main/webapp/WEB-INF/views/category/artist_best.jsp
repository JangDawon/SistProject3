<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>인기작가 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/dw.css">
	</head>
	<body class="category">
		<!-- header -->
		<jsp:include page="../header.jsp" />
	 
	 	<div class="banner_title">
			<h1>인기 작가</h1>
			<p>많은 사람들의 인기를 받고 있는 작가님을 소개합니다.</p>
		</div>
	 	
	 	<section class="product_content">
			<div class="best_artist_title">
				<a href="">인기작가</a>
			</div>
			
			<div class="best_artist">
				<a href="">
					<div>
						<div class="artist_img">
							<img src="http://localhost:9000/sistproject3/images/artist_img.png">
						</div>
						<div class="artist_intro">
							<div class="artist_info">
								<div class="artist_info_title">소유템♥ 폰케이스</div>
								<div class="artist_info_star">★★★★★</div>
								<div class="artist_info_cont">
									<p>real handmade item - 소유하고 싶은 아이템 작가의 아이디어가 폭팔했어요😉 직접 디자인하고 만드는 감각적인 쇼핑몰 폰케이스/에어팟</p>
								</div>
							</div>
							<div class="artist_fav">
								<div>♡작가로 추가</div>
								<div>작가 홈</div>
								<div>메시지 보내기</div>
							</div>
						</div>
					</div>
				</a>	
			</div>	
		</section>
	 	
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>