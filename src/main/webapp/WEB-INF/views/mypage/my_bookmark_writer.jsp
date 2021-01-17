<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/carousel.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class = "mypage">
	<div  class="mypage_menu">
				<div><img class="profile_img"
					src="http://localhost:9000/sistproject3/images/profile.PNG"></div>
				<div>등급</div>
				<div>닉네임</div>
				<div>MY MENU</div>
				<div class="bold">주문배송</div>
				<div><a href="my_order.do">주문내역</a></div>
				<div><a href="my_cancel.do">취소/환불 내역</a></div>
				<div class="bold">나의 구매후기</div>
				<div><a href="my_review_write.do">후기 쓰기</a></div>
				<div><a href="my_review.do">내가 쓴 후기</a></div>
				<div class="bold">관심리스트</div>
				<div><a href="my_bookmark_item.do">즐겨찾기(★)</a></div>
				<div><a href="my_bookmark_writer.do">좋아하는 작가(♥)</a></div>
				<div class="bold">내 정보</div>
				<div><a href="my_grade.do">회원 등급</a></div>
				<div><a href="my_info.do">회원 정보 관리</a></div>
				<div><a href=" my_address.do">주소(배송지) 관리</a></div>
				</div>
	
	
	<h2>좋아하는 작가(♥)</h2>
	<div>
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
		</div>
	<!-- footer-->
	<jsp:include page="../footer.jsp" />
</body>
</html>