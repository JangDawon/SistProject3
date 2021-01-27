<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<body class="admin" id="product_mng_content">	

	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	

	<div class="jihye_content">
	<!-- aside -->
	<jsp:include page="../admin.jsp"></jsp:include>
	
	<a href="product_mng_list.do" class="h2_user"><h2 class="txt">상품 관리</h2></a>
	<table class="cs_table" id="admin_product_content">
		<tr>
			<th>제목</th>
			<td colspan="3">${vo.ptitle }</td>
		</tr>
		<tr>
			<th>작가명</th>
			<td>${vo.sname }</td>
			<th>등록일</th>
			<td>${vo.pdate }</td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td colspan="3">${vo.pcat }</td>
		</tr>
		<tr>
			<td colspan="4"><div>${vo.pcontent }
				<br><img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile2 }" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile3 }" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile4 }" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile5 }" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile6 }" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile7 }" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile8 }" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile9 }" style="height:100px; height:100px;">
			</div>
			</td>
		</tr>
		<tr>
			<th>옵션</th>
			<td colspan="3">
			<c:if test="${vo.opt1 ne null }"><div>${vo.opt1}(+${vo.opt1_price}원)</div></c:if>
			<c:if test="${vo.opt2 ne null }"><div>${vo.opt2}(+${vo.opt2_price}원)</div></c:if>
			<c:if test="${vo.opt3 ne null }"><div>${vo.opt3}(+${vo.opt3_price}원)</div></c:if>
			<c:if test="${vo.opt4 ne null }"><div>${vo.opt4}(+${vo.opt4_price}원)</div></c:if>
			<c:if test="${vo.opt5 ne null }"><div>${vo.opt5}(+${vo.opt5_price}원)</div></c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<a href="product_mng_update.do?id=${vo.pid}"><button type="button" class="btn_style" id="product_update">수정</button></a>
				<a href="product_mng_list.do"><button type="button" class="btn_style" id="product_cancel">취소</button></a>
			</td>
		</tr>
	</table>
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>