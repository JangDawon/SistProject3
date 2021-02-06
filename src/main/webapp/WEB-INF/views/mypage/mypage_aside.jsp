<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
</head>
<body id="admin" class="admin">

	<!-- aside -->
	<aside class="mypage_info">
		<div class="mypage_menu">
			<div class="admin_profile">
				<img src="http://localhost:9000/sistproject3/images/logo.jpg">
				<p>${sessionScope.svo.uname}</p>
			</div>
			<p class="am">MY MENU</p>
			<nav>
				<b>
					<span>주문배송</span>
				</b>
				<a href="my_order.do">주문내역</a><br>
				<a href="my_cancel.do">취소/환불내역</a>
				<hr class="h">
				<b>
					<span>나의 구매후기</span>
				</b>
				<a href="my_review.do">내가 쓴 구매후기</a>
				<hr class="h">
				<b>
					<span>관심리스트</span>
				</b>
				<a href="my_bookmark_item.do">즐겨찾기</a><br>
				<a href="my_bookmark_writer.do">좋아하는 작가</a>
				<hr class="h">
				<b>
					<span>내 정보</span>
				</b>
				<a href="my_info.do">회원정보관리</a>
			</nav>
		</div>
	</aside>
	
</body>
</html>