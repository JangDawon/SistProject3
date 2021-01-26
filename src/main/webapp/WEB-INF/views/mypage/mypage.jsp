<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 페이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/carousel.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<!-- aside -->
	<jsp:include page="../header.jsp" />
	

	<div class="mypage_content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"></jsp:include>
				
			<table class="myinfo">
			<tr>
				<th colspan=4>내 정보</th>
			</tr>
			<tr>
				<td>적립금</td>
				<td>할인쿠폰수</td>
				<td>작가발송완료</td>
				<td>취소/환불 완료</td>
			</tr>
		</table>
	
	<h2>주문 내역</h2>
	<table class="my_order">
		<tr>
			<td colspan=2>2021-01-12</td>
			<td colspan=1>50000원</td>
		</tr>

		<tr>
			<td rowspan=2><img
				src="http://localhost:9000/sistproject3/images/item_img.PNG"></td>
			<td rowspan=2>♥[입점할인]뚠뚠이 캐릭터 그림 일러스트 초상화<br> <span>인원
					1명/그림게시 : 인스타/아이디어스 가능해요/매후기이벤트 : 후기 쓸께요/상세설명을 필독하였습니다</span></td>
			<td width="100" rowspan=2>		<a href="review_write.do" onclick = "window.open(this.href, '_blank',' width=440,height= 600,  left=800 top =300 resizeable=no'); return false"><span>리뷰쓰기</span></a>
		</tr>
	</table>
	
		<h2>즐겨찾는 작품(★)</h2>
		<dl class="bookmark_list">
			<dt>
				<a href =""><img src="http://localhost:9000/sistproject3/images/bookmark_item.PNG"></a>
			</dt>
			<dt>
				<a href="#">희스무드(heesmood)</a>
			</dt>
			<dt>인기폭발 커플기념일</dt>
		</dl>
		
		<h2>좋아하는 작가(★)</h2>
		<table class="bookmark_writer">
			<tr>
				<td colspan=4><a href = "#">더보기></a></td>
			</tr>
			<tr>
				<td><img src="http://localhost:9000/sistproject3/images/bookmark_write.PNG"></td>
				<td width="250"><a href = "#">룬룬</a><br>★★★★★<br> 고퀄리티 자제제작 기프트샵, 룬룬
					소중한 여러분의 일상에 특별함을 선물해드리고 싶어요.<br>
					<button type="button">좋아하는 작가</button>
					<button type="button">작가홈</button>
					<button type="button">메시지</button>
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
					</div> <!-- 캐러셀 end -->
				</td>

			</tr>
		</table>
									</div>

		
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>