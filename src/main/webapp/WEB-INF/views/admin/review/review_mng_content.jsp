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
<body id="review_mng_content" class="admin">
	
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	
	<!-- aside -->
	<jsp:include page="../admin.jsp"></jsp:include>
	
	<a href="review_mng_list.do" class="h2_user"><h2 class="txt">리뷰 관리</h2></a>
	<table class="cs_table" id="admin_review_content_table">
		<tr>
			<td rowspan="3"><img src="http://localhost:9000/sistproject3/images/content2.jpg" style="width:150px; height:150px;"></td>
			<th>아이디</th>
			<td>jihye</td>
			<th>주문번호</th>
			<td>2020011508182949182</td>
		</tr>
		<tr>
			<th>주문상품</th>
			<td>[시즌 한정]생딸기망개떡</td>
			<th>주문일자</th>
			<td>2021.01.14</td>
		</tr>
		<tr>
			<th>평점</th>
			<td>⭐⭐⭐⭐⭐</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="4"><div>정말 맛있어요!!👍ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅋㅎㅋㅎㅋㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ쫀맛쫀맛ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</div></td>
		</tr>
		<tr>
			<td colspan="5">
				<a href="review_mng_list.do"><button type="button" class="btn_style" id="review_delete_btn">삭제</button></a>
				<a href="review_mng_list.do"><button type="button" class="btn_style" id="review_cancel_btn">취소</button></a>
			</td>
		</tr>
	</table>
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>