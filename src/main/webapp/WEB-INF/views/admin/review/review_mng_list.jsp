<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 관리자</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/am-pagination.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,
			totals : "${dbCount}",
			pageSize : "${pageSize}",
			page : "${reqPage}",
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',
			
			btnSize : 'sm'
		});
		
		jQuery("#ampaginationsm").on('am.pagination.change', function(e){
			$(location).attr('href','http://localhost:9000/sistproject3/review_mng_list.do?rpage=' + e.page);
		});
	});
</script>
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
		<c:forEach var="vo" items="${list}" >
		<tr class="review_row">
			<td><input type="checkbox" class="review_chk" value="${vo.rid}"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do?rid=${vo.rid}'"><div>${vo.uemail}</div></td>
			<c:choose>
				<c:when test="${vo.rsfile ne null }">
					<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do?rid=${vo.rid}'"><img src="http://localhost:9000/sistproject3/resources/upload/${vo.rsfile }" class="p_img"></td>
				</c:when>
				<c:otherwise>
					<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do?rid=${vo.rid}'"><img src="http://localhost:9000/sistproject3/images/logo.jpg" class="p_img"></td>
				</c:otherwise>
			</c:choose>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do?rid=${vo.rid}'"><a href="http://localhost:9000/sistproject3/product.do?pid=${vo.pid }"><div>${vo.ptitle }</div></a></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do?rid=${vo.rid}'"><div>${vo.rcontent}</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/review_mng_content.do?rid=${vo.rid}'">${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(vo.rscore, '1', '⭐'), '2', '⭐⭐'), '3', '⭐⭐⭐'), '4', '⭐⭐⭐⭐'), '5', '⭐⭐⭐⭐⭐') }</td>
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