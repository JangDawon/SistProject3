<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 페이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/carousel.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<!-- aside -->
	<jsp:include page="../header.jsp" />
	
	<div class="content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"></jsp:include>
	
	
	<h2>좋아하는 작가</h2>
			<table class="bookmark_writer">
			<tr>
				<td><img src="http://localhost:9000/sistproject3/images/bookmark_write.PNG"></td>
				<td width="250"><a href = "#">룬룬</a><br><span class ="star">★★★★★</span><br><span>고퀄리티 자제제작 기프트샵, 룬룬
					소중한 여러분의 일상에 특별함을 선물해드리고 싶어요.</span> <br>
					<button type="button" class="bookmark_button">좋아하는 작가</button>
					<button type="button" class ="home">작가홈</button><br>
					<button type="button" class ="message">메시지</button>
				</td>
				<td width="300">
					<!-- 캐러셀 start -->
					<div id="demo" class="carousel slide" data-ride="carousel">

						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>

						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="http://localhost:9000/sistproject3/images/carousel1.PNG"
									width="300" height="200">
							</div>
							<div class="carousel-item">
								<img src="http://localhost:9000/sistproject3/images/carousel2.PNG"
									width="300" height="200">
							</div>
							<div class="carousel-item">
								<img src="http://localhost:9000/sistproject3/images/carousel3.PNG"
									width="300" height="200">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</td>

			</tr>
		</table>
		</div>
	<!-- footer-->
	<jsp:include page="../footer.jsp" />
</body>
</html>