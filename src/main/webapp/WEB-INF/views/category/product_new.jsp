<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>최신작품 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<script>
			$(document).ready(function(){
				
				
			});
		</script>
	</head>
	<body class="category">
		<!-- header -->
		<jsp:include page="../header.jsp" />
	 
		<div class="banner_title">
			<h1>최신 작품</h1>
			<p>지금 새로 등록된 작품들이에요</p>
		</div>
		
		<section class="product_content">
			<c:forEach var="vo" items="${list}">
			<div class="new_prod">
				<a href="http://localhost:9000/sistproject3/product.do?pid=${vo.pid }">
					<div>
						<div class="new_prod_img">
							<div>
								<button class="favorite_btn">
									<img src="http://localhost:9000/sistproject3/images/favorite.png">
								</button>
							</div>
							<div>
								<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1}">
							</div>
						</div>
						<div class="new_prod_info">
							<div class="prod_info_name">${vo.sname }</div>
							<div class="prod_info_title">${vo.ptitle }</div>
						</div>
						<div class="new_prod_info_review">
							<div class="rv">
								<img src="http://localhost:9000/sistproject3/images/star2.png">
								<span> 4.5</span>
							</div>
							<div class="rv2">사진보다 실물이 훨씬 이쁘고...</div>
						</div>
					</div>
				</a>
			</div>
			</c:forEach>
		</section>
		
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>