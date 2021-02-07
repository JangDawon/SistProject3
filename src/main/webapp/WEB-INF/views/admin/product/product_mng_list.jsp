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
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/am-pagination.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,
			totals : '${dbCount}',
			pageSize : '${pageSize}',
			page : '${ reqPage }',
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',
			
			btnSize : 'sm'
		});
		
		jQuery("#ampaginationsm").on('am.pagination.change', function(e){
			$(location).attr('href','http://localhost:9000/sistproject3/product_mng_list.do?rpage=' + e.page);
		});
	});
</script>
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
			<th><input type="checkbox" id="product_all_delete_chk"></th>
			<th>작가명</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>이미지</th>
			<th>가격</th>
		</tr>
		<c:forEach var="vo" items="${list }">
		<tr>
			<td><input type="checkbox" class="product_chk" value="${vo.pid }"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do?id=${vo.pid}'"><div>${vo.sname }</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do?id=${vo.pid}'">${vo.pcat }</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do?id=${vo.pid}'"><div>${vo.ptitle }</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do?id=${vo.pid}'"><img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }" style="height:100px; height:100px;"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do?id=${vo.pid}'">${vo.pprice_char }원</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6"><div id="ampaginationsm"></div></td>
		</tr>
	</table>
	</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>