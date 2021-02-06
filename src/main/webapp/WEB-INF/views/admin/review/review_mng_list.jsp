<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 관리자</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
</head>
<body id="review_mng_list" class="admin">
	
	<!-- header -->
	<jsp:include page="../../header.jsp"><jsp:param name="psfile" value="${psfile }" /></jsp:include>
	
	<div class="jihye_content">
	
	<!-- aside -->
	<jsp:include page="../admin.jsp"></jsp:include>
	
	<a href="review_mng_list.do" class="h2_user"><h2 class="txt">리뷰 관리</h2></a>
	<table class="cs_table" id="admin_review_list" >
		<tr>
			<td colspan="6">
				<button type="button" class="btn_style" id="review_select_delete">선택 삭제</button>
				<button type="button" class="btn_style" id="review_all_delete">전체 삭제</button>
			</td>
		</tr>
		<tr>
			<th><input type="checkbox" id="review_all_delete_chk"></th>
			<th>아이디</th>
			<th>이미지</th>
			<th>상품명</th>
			<th>내용</th>
			<th>평점</th>
		</tr>
		<tr class="review_row">
			<td><input type="checkbox" class="review_chk" value="1"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><div>jihye</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><img src="http://localhost:9000/sistproject3/images/content2.jpg" class="p_img"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><a href="http://localhost:9000/sistproject3/food.do"><div>[시즌 한정]생딸기망개떡</div></a></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><div>정말 맛있어요!!👍</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'">⭐⭐⭐⭐⭐</td>
		</tr>
		<tr class="review_row">
			<td><input type="checkbox" class="review_chk" value="2"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><div>jihye</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><img src="http://localhost:9000/sistproject3/images/content2.jpg" class="p_img"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><a href="http://localhost:9000/sistproject3/food.do"><div>[시즌 한정]생딸기망개떡</div></a></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><div>정말 맛있어요!!👍ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ쫀맛쫀맛ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'">⭐⭐⭐⭐⭐</td>
		</tr>
		<tr class="review_row">
			<td><input type="checkbox" class="review_chk" value="3"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><div>jihye</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><img src="http://localhost:9000/sistproject3/images/content2.jpg" class="p_img"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><a href="http://localhost:9000/sistproject3/food.do"><div>[시즌 한정]생딸기망개떡</div></a></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'"><div>별로...</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do'">⭐⭐</td>
		</tr>
		<tr>
			<td colspan="6" id="ampaginationsm"><< 1 2 3 4 5 >></td>
		</tr>
	</table>
	</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>