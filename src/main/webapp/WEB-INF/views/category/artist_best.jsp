<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>인기작가 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/carousel.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<style>
			div.carousel-inner {
				margin-left:-18px;
				margin-top:-15px;
			}
		</style>
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
				<table class="artist_info">
					<tr>
						<td class="artist_img">
							<a href=""><img src="http://localhost:9000/sistproject3/images/artist_img.png"></a>
						</td>
						<td>
							<a href=""><div class="artist_info_title">소유템♥ 폰케이스</div></a>
							<div class="ui_rating">
								<img src="images/star.png">
								<img src="images/star.png">
								<img src="images/star.png">
								<img src="images/star.png">
								<img src="images/star.png">
							</div>
							<div class="artist_info_cont">
								<p>real handmade item - 소유하고 싶은 아이템 작가의 아이디어가 폭팔했어요😉 직접 디자인하고 만드는 감각적인 쇼핑몰 폰케이스/에어팟</p>
							</div>
							<div class="artist_fav">
								<button type="button" class="fav_artist">♡작가로 추가</button>
								<button type="button" class="home_artist">작가 홈</button>
								<button type="button" class="msg_artist">메시지 보내기</button>
							</div>
						</td>
						<td>
							<div id="demo" class="carousel slide" data-ride="carousel">
								<ul class="carousel-indicators">
									<li data-target="#demo" data-slide-to="0" class="active"></li>
									<li data-target="#demo" data-slide-to="1"></li>
								</ul>
								<div class="carousel-inner" >
									<ul>
										<li class="carousel-item active">
											<img src="http://localhost:9000/sistproject3/images/artist1.jpg" width=210px, height=210px>
											<img src="http://localhost:9000/sistproject3/images/artist2.jpg" width=210px, height=210px>
											<img src="http://localhost:9000/sistproject3/images/artist3.jpg" width=210px, height=210px>
										</li>
										<li class="carousel-item">
											<img src="http://localhost:9000/sistproject3/images/artist4.jpg" width=210px, height=210px>
											<img src="http://localhost:9000/sistproject3/images/artist5.jpg" width=210px, height=210px>
											<img src="http://localhost:9000/sistproject3/images/artist6.jpg" width=210px, height=210px>
										</li>
									</ul>
								</div>
								<a class="carousel-control-prev" href="#demo" data-slide="prev">
									<span class="carousel-control-prev-icon"></span>
								</a>
								<a class="carousel-control-next" href="#demo" data-slide="next">
									<span class="carousel-control-next-icon"></span>
								</a>
							</div>
						</td>
					</tr>
				</table>
			</div>
			
		</section>
	 	
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>
