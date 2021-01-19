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
<body class="admin" id="product_mng_list">
	
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	<!-- aside -->
	<jsp:include page="../admin.jsp"></jsp:include>
	
	<a href="product_mng_list.do" class="h2_user"><h2 class="txt">상품 관리</h2></a>
	<table class="cs_table" id="admin_product_list">
		<tr>
			<td colspan="6">
				<a href="product_mng_regist.do"><button type="button" class="btn_style" id="product_regist">등록</button></a>
				<button type="button" class="btn_style" id="product_select_delete">선택 삭제</button>
				<button type="button" class="btn_style" id="product_all_delete">전체 삭제</button>
			</td>
		</tr>
		<tr>
			<th><input type="checkbox"></th>
			<th>작가명</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>이미지</th>
			<th>가격</th>
		</tr>
		<tr onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'">
			<td><input type="checkbox"></td>
			<td><div>321팩토리 321factory</div></td>
			<td>패션&잡화</td>
			<td><div>1+1🔥블랙아이보리 클로버 나비 마스크스트랩/목걸이</div></td>
			<td><img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;"></td>
			<td>17,800원</td>
		</tr>
		<tr onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'">
			<td><input type="checkbox"></td>
			<td><div>321팩토리 321factory</div></td>
			<td>패션&잡화</td>
			<td><div>1+1🔥블랙아이보리 클로버 나비 마스크스트랩/목걸이</div></td>
			<td><img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;"></td>
			<td>17,800원</td>
		</tr>
		<tr onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'">
			<td><input type="checkbox"></td>
			<td><div>321팩토리 321factory</div></td>
			<td>패션&잡화</td>
			<td><div>1+1🔥블랙아이보리 클로버 나비 마스크스트랩/목걸이</div></td>
			<td><img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;"></td>
			<td>17,800원</td>
		</tr>
		<tr>
			<td colspan="6" id="ampaginationsm"><< 1 2 3 4 5 >></td>
		</tr>
	</table>
	</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>