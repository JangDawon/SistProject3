<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 마이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<style>
dl.bookmark_list{margin:8px; }
</style>
</head>
<body>
	<!-- aside -->
	<jsp:include page="../header.jsp" />
	

	<div class="mypage_content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"><jsp:param name="psfile" value="${psfile }" /></jsp:include>
		<h2>즐겨찾기</h2>
		<c:forEach var="vo" items="${list}">
		<dl class="bookmark_list">
			<dt>
				<img class="preview"
					src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }">
			</dt>
			
			<dt>${vo.ptitle }</dt>
			<dt>${vo.pprice }</dt>
			<dt>
				<span class="star">★</span><span>${vo.rscore }</span>
			</dt>
		</dl>
		</c:forEach>
	</div>
	<!-- footer-->
	<jsp:include page="../footer.jsp" />
</body>
</html>