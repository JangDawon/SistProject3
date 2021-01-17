<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!-- <link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">  -->

</head>
<body class="header_body">
	<header>
		<nav class="navbar">
			<div class="navbar1">
				<%-- <% if(svo != null){ %> 
				<ul>
					<li><a href="#">안녕하세요~ <%=svo.getName() %>님!!</a></li>
					<li><a href="http://localhost:9000/sistproject3/logout.do">로그아웃</a><div></div></li>
					<li><a href="#">고객센터</a><div></div></li>
					<% if(svo.getName().equals("관리자")){ %>
					<li><a href="#">Admin</a></li>
					<% } %>
				</ul>
				<% }else{ %> --%>
				<ul class="navbar_menu">
					<li><a href="http://localhost:9000/sistproject3/login.do">로그인</a></li>
					<li><a href="http://localhost:9000/sistproject3/join.do">회원가입</a></li>
					<li><a href="http://localhost:9000/sistproject3/cs.do">고객센터</a></li>
				</ul>
			</div>
			<div class="navbar2">
				<div class="navbar_logo">
					<a href="http://localhost:9000/sistproject3/index.do">
					<img src="http://localhost:9000/sistproject3/images/logo.png"></a>
				</div>
				<div class="navbar_search">
					<input type="text" name="se" id="header_search" placeholder="검색어를 입력해주세요.">
					<button type="button" id="search_btn">
					<img src="http://localhost:9000/sistproject3/images/search.png"></button>
				</div>
				<ul class="navbar_icons">
					<li><a href="http://localhost:9000/sistproject3/mypage.do">
					<img src="http://localhost:9000/sistproject3/images/user.png"></a></li>
					<li><a href="http://localhost:9000/sistproject3/cart.do">
					<img src="http://localhost:9000/sistproject3/images/cart.png"></a></li>
				</ul>
			</div>
			<div class="navbar3">
				<ul class="navbar_category">
<<<<<<< HEAD
					<li><a href="">카테고리</a></li>
					<li><a href="">홈</a></li>
					<li><a href="">오늘의 발견</a></li>
=======
					<li><a href="http://localhost:9000/sistproject3/food.do">음식</a></li>
					<li><a href="http://localhost:9000/sistproject3/accessory.do">악세사리</a></li>
					<li><a href="http://localhost:9000/sistproject3/living.do">패션&잡화</a></li>
					<li><a href="http://localhost:9000/sistproject3/interior.do">인테리어 소품</a></li>
					<li><a href="http://localhost:9000/sistproject3/etc.do">기타</a></li>
					<li><a href="http://localhost:9000/sistproject3/index.do">홈</a></li>
>>>>>>> refs/heads/master
					<li><a href="http://localhost:9000/sistproject3/product_best.do">인기 작품</a></li>
					<li><a href="http://localhost:9000/sistproject3/product_new.do">최신 작품</a></li>
					<li><a href="http://localhost:9000/sistproject3/artist_best.do">인기 작가</a></li>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>