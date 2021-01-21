<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 페이페이지</title>
<link rel="stylesheet"href="http://localhost:9000/sistproject3/css/sistproject3.css">
</head>
<body>
	<!-- aside -->
	<jsp:include page="../header.jsp" />
	

	<div class="content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"></jsp:include>
		<h2>즐겨찾기</h2>
		<dl class="bookmark_list">
			<dt>
				<img class="preview"
					src="http://localhost:9000/sistproject3/images/bookmark_item.PNG">
			</dt>
			<dt>
				<a href="#">희스무드(heesmood)</a>
			</dt>
			<dt>인기폭발 커플기념일</dt>
			<dt>30000원</dt>
			<dt>
				<span class="star">★★★★★</span><span>(210)</span>
			</dt>
		</dl>
	</div>
	<!-- footer-->
	<jsp:include page="../footer.jsp" />
</body>
</html>