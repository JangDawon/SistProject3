<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 고객센터</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
</head>
<body id="user_mng_list" class="admin">

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
	
	<a href="user_mng_list.do" class="h2_user"><h2 class="txt">회원 관리</h2></a>
	<table class="cs_table" id="user_list">
		<tr>
			<td colspan="6">
				<button type="button" class="btn_style" id="user_select_delete">선택 삭제</button>
				<button type="button" class="btn_style" id="user_all_delete">전체 삭제</button>
			</td>
		</tr>
		<tr>
			<th><input type="checkbox"></th>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>가입일자</th>
		</tr>
		<tr class="cs_row" onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">
			<td><input type="checkbox"></tdh>
			<td>1</td>
			<td>jihye</td>
			<td>최지혜</td>
			<td>2021.01.14</td>
			<td>2021.01.14</td>
		</tr>
		<tr class="cs_row" onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">
			<td><input type="checkbox"></tdh>
			<td>2</td>
			<td>jihye</td>
			<td>최지혜</td>
			<td>2021.01.14</td>
			<td>2021.01.14</td>
		</tr>
		<tr class="cs_row" onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">
			<td><input type="checkbox"></tdh>
			<td>3</td>
			<td>jihye</td>
			<td>최지혜</td>
			<td>2021.01.14</td>
			<td>2021.01.14</td>
		</tr>
		<tr>
			<td colspan="6" id="ampaginationsm"><< 1 2 3 4 5 >></td>
		</tr>
	</table>
</body>
</html>