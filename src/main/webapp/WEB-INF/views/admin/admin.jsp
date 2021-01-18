<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 관리자</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
</head>
<body id="admin" class="admin">

	<!-- aside -->
	<aside class="admin_info">
		<div class="admin_menu">
			<div class="admin_profile">
				<img src="http://localhost:9000/sistproject3/images/logo.jpg">
				<p>관리자</p>
			</div>
			<p class="am">Admin Menu</p>
			<nav>
				<b>
					<span>회원</span>
				</b>
				<a href="user_mng_list.do">회원 관리</a>
				<hr class="h">
				<b>
					<span>상품</span>
				</b>
				<a href="product_mng_list.do">상품 관리</a>
				<hr class="h">
				<b>
					<span>리뷰</span>
				</b>
				<a href="review_mng_list.do">리뷰 관리</a>
				<hr class="h">
			</nav>
		</div>
	</aside>
	
</body>
</html>