<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>인기작품 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
		<script>
			$(document).ready(function(){
				<c:forEach items="${list}" var="vo">
					var output = '<div class="best_prod">';
					output += '<a href="http://localhost:9000/sistproject3/product.do?pid=${vo.pid }">';
					output += '<div>';
					output += '<div class="best_prod_img">';
					output += '<div>';
					output += '<button class="favorite_btn">';
					output += '<img src="http://localhost:9000/sistproject3/images/favorite.png">';
					output += '</button>';
					output += '</div>';
					output += '<div>';
					output += '<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1}">';
					output += '</div>';
					output += '</div>';
					output += '<div class="best_prod_info">';
					output += '<div class="prod_info_name">${vo.sname }</div>';
					output += '<div class="prod_info_title">${vo.ptitle }</div>';
					output += '</div>';
					output += '<div class="best_prod_info_review">';
					output += '<div class="rv">';
					output += '<img src="http://localhost:9000/sistproject3/images/star2.png">';
					output += '<span> 4.5</span>';
					output += '</div>';
					output += '<div class="rv2">사진보다 실물이 훨씬 이쁘고...</div>';
					output += '</div></div></a></div>';
						
					<c:if test="${vo.pcat=='음식'}"> 
						$("#food_here").before(output);
					</c:if>
					<c:if test="${vo.pcat=='악세사리'}">
						$("#accessory_here").before(output);
					</c:if>
					<c:if test="${vo.pcat=='패션, 잡화'}">
						$("#living_here").before(output);
					</c:if>
					<c:if test="${vo.pcat=='인테리어 소품'}">
						$("#interior_here").before(output);
					</c:if>
					<c:if test="${vo.pcat=='기타'}">
						$("#etc_here").before(output);
					</c:if>
				</c:forEach>
			});
		</script>
	</head>
	<body class="category">
		<!-- header -->
		<jsp:include page="../header.jsp" />
		
		<div class="banner_title">
			<h1>인기 작품</h1>
			<p>아이디어스에서 가장 인기있는 작품들이에요</p>
		</div>
		
		<section class="product_content">
			<div class="best_prod_title" id="food">
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=음식">음식</a>
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=음식">더보기<i class="idus-icon-arrow-right"></i></a>
			</div> 
			<span id="food_here"></span>
		</section>
		
		<section class="product_content">
			<div class="best_prod_title" id="accessory">
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=악세사리">악세사리</a>
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=악세사리">더보기<i class="idus-icon-arrow-right"></i></a>
			</div>
			<span id="accessory_here"></span> 
		</section>
		
		<section class="product_content">
			<div class="best_prod_title" id="living">
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=패션, 잡화">패션, 잡화</a>
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=패션, 잡화">더보기<i class="idus-icon-arrow-right"></i></a>
			</div>
			<span id="living_here"></span> 
		</section>
		
		<section class="product_content">
			<div class="best_prod_title" id="interior">
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=인테리어 소품">인테리어 소품</a>
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=인테리어 소품">더보기<i class="idus-icon-arrow-right"></i></a>
			</div>
			<span id="interior_here"></span> 
		</section>
		
		<section class="product_content">
			<div class="best_prod_title" id="etc">
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=기타">기타</a>
				<a href="http://localhost:9000/sistproject3/category_list.do?pcat=기타">더보기<i class="idus-icon-arrow-right"></i></a>
			</div>
			<span id="etc_here"></span> 
		</section>

		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>