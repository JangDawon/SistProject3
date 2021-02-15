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
				var uemail = "${sessionScope.svo.uemail}";
				ajax_best();
				
				/* <c:forEach items="${list}" var="vo">
					var output = '<div class="best_prod">';
					output += '<div>';
					output += '<div class="best_prod_img">';
					output += '<div>';
					<c:forEach var="wvo" items="${wishlist}">
						<c:choose>
						<c:when test="${vo.pid eq wvo.pid && sessionScope.svo.uemail eq wvo.uemail}">
							output += '<button class="favorite_btn" value="${vo.pid }">';
							output += '<img src="http://localhost:9000/sistproject3/images/star2.png" id="${vo.pid }_star">';
							output += '</button>';
						</c:when>
						<c:otherwise>
							output += '<button class="favorite_btn" value="${vo.pid }">';
							output += '<img src="http://localhost:9000/sistproject3/images/favorite.png" id="${vo.pid }_star">';
							output += '</button>';
						</c:otherwise> 
						</c:choose>
					</c:forEach>
					output += '</div>';
					output += '<a href="http://localhost:9000/sistproject3/product.do?pid=${vo.pid }">';
					output += '<div class="psfile_img">';
					output += '<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1}">';
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
					output += '</div>';
					output += '</a>';
				
					output += '</div>';
					output += '</div>';
						
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
				</c:forEach> */
				
				$(document).on("click",".favorite_btn",function(){
					var btn_pid = $(this).val(); 
					var wish_img_id = "#"+btn_pid+"_star";
					var wish_img_attr = $(wish_img_id).attr("src"); 
					if(uemail !="") {
						if(wish_img_attr == "http://localhost:9000/sistproject3/images/favorite.png"){
							$(wish_img_id).attr('src','http://localhost:9000/sistproject3/images/star2.png');
							$.ajax({
								url:"wish_insert.do?uemail=${sessionScope.svo.uemail}&pid="+btn_pid,
								success:function(result){
									if(result == 1){
										//$("div.category_content").text("");
										ajax_list();
									}		 
								}
							});//ajax
						}else{
							$(wish_img_id).attr('src','http://localhost:9000/sistproject3/images/favorite.png');
							$.ajax({
								url:"wish_delete.do?uemail=${sessionScope.svo.uemail}&pid="+btn_pid,
								success:function(result){
									ajax_list();
								}
							});//ajax
						}
					}else {
						alert("로그인을 먼저 진행해 주세요!");
						location.href='http://localhost:9000/sistproject3/login.do';
					}
				});
				
				function ajax_best(){
					$.ajax({
						url:"best_ajax.do?uemail=${sessionScope.svo.uemail}",
						success:function(result){
							var jdata = JSON.parse(result);
							var output = "";
							
							for(var i in jdata.jlist){ 
								output += '<div class="best_prod">';
								output += '<div>';
								output += '<div class="best_prod_img">';
								output += '<div>';
								var n = 0;
								for(var j in jdata.jlist2){
									if(jdata.jlist[i].pid == jdata.jlist2[j].pid){
										output += '<button class="favorite_btn" value="'+jdata.jlist[i].pid+'">';
										output += '<img src="http://localhost:9000/sistproject3/images/star2.png" id="'+jdata.jlist[i].pid+'_star">';
										output += '</button>';
										n = 1;
									}
								}
								if(n != 1){
									output += '<button class="favorite_btn" value="'+jdata.jlist[i].pid+'">';
									output += '<img src="http://localhost:9000/sistproject3/images/favorite.png" id="'+jdata.jlist[i].pid+'_star">';
									output += '</button>';
								}
								output += '</div>';
								output += '<a href="http://localhost:9000/sistproject3/product.do?pid='+jdata.jlist[i].pid+'">';
								output += '<div class="psfile_img">';
								output += '<img src="http://localhost:9000/sistproject3/resources/upload/'+jdata.jlist[i].psfile1+'">';
								output += '</div>';
								output += '</a>';
								output += '</div>';
								output += '<a href="http://localhost:9000/sistproject3/product.do?pid='+jdata.jlist[i].pid+'">';
								output += '<div class="best_prod_info">';
								output += '<div class="prod_info_name">'+jdata.jlist[i].sname+'</div>';
								output += '<div class="prod_info_title">'+jdata.jlist[i].ptitle+'</div>';
								output += '</div>';
								output += '<div class="best_prod_info_review">';
								output += '<div class="rv">';
								output += '<img src="http://localhost:9000/sistproject3/images/star2.png">';
								output += '<span> 4.5</span>';
								output += '</div>';
								output += '<div class="rv2">사진보다 실물이 훨씬 이쁘고...</div>';
								output += '</div>';
								output += '</a>';
								output += '</div>';
								output += '</div>';
								
								<c:forEach items="${list}" var="vo">
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
							}
								/* if(jdata.jlist[i].pcat == '음식'){
									$("#food_here").before(output);
								}else if(jdata.jlist[i].pcat == '악세사리'){
									$("#accessory_here").before(output);
								}else if(jdata.jlist[i].pcat == '패션, 잡화'){
									$("#living_here").before(output);
								}else if(jdata.jlist[i].pcat == '인테리어 소품'){
									$("#interior_here").before(output);
								}else if(jdata.jlist[i].pcat == '기타'){
									$("#etc_here").before(output);
								}  */
							
							
							 
							
						}//success
					}); //ajax
				}//function ajax_best()
				
				
				
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