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
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
</head>
<body id="review_mng_content" class="admin">
	
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	
	<!-- aside -->
	<jsp:include page="../admin.jsp"><jsp:param name="psfile" value="${psfile }" /></jsp:include>
	
	<a href="review_mng_list.do" class="h2_user"><h2 class="txt">리뷰 관리</h2></a>
	<table class="cs_table" id="admin_review_content_table">
		<tr>
			<td rowspan="3">
			<c:choose>
				<c:when test="${vo.rsfile ne null }">
					<img src="http://localhost:9000/sistproject3/resources/upload/${vo.rsfile }" class="p_img" style="width:150px; height:150px;">
				</c:when>
				<c:otherwise>
					<img src="http://localhost:9000/sistproject3/images/logo.jpg" class="p_img" style="width:150px; height:150px;">
				</c:otherwise>
			</c:choose>
			</td>
			<th>아이디</th>
			<td>${vo.uemail }</td>
			<th>주문번호</th>
			<td>${vo.oid }</td>
		</tr>
		<tr>
			<th>주문상품</th>
			<td><div id="review_ptitle">${vo.ptitle }</div></td>
			<th>주문일자</th>
			<td>${vo.rdate }</td>
		</tr>
		<tr>
			<th>평점</th>
			<td>${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(vo.rscore, '1', '⭐'), '2', '⭐⭐'), '3', '⭐⭐⭐'), '4', '⭐⭐⭐⭐'), '5', '⭐⭐⭐⭐⭐') }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="4"><div>${vo.rcontent }</div></td>
		</tr>
		<tr>
			<td colspan="5">
				<a href="review_mng_list.do"><button type="button" class="btn_style" id="review_cancel_btn">목록</button></a>
				<button type="button" class="btn_style" id="review_delete_btn" value="${vo.rid }">삭제</button>
			</td>
		</tr>
	</table>
	</div>
	
	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>