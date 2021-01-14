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
<body id="user_mng_content" class="admin">

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
	<table id="admin_user_table">
		<tr>
			<td rowspan="4"><img src="http://localhost:9000/sistproject3/images/logo.jpg"></td>
			<th>성명</th>
			<td>최지혜</td>
			<th>생년월일</th>
			<td>2021.01.14</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>여</td>
			<th>가입일자</th>
			<td>2021.01.14</td>
		</tr>
		<tr>
			<th>HP</th>
			<td>010-1234-5678</td>
			<th>마케팅 수신동의</th>
			<td>
				<input type="checkbox">전화
				<input type="checkbox">E-mail
			</td>
		</tr>
		<tr>
			<th>E-mails</th>
			<td colspan="3">gildong@gmail.com</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="4">서울특별시 ~~~~~~</td>
		</tr>
		<tr>
			<td colspan="5">
				<a href="user_mng_list.do"><button type="button" class="btn_style" id="user_delete_btn">삭제</button></a>
			</td>
		</tr>
	</table>
</body>
</html>