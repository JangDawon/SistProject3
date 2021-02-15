<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>최신작품 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				var uemail = "${sessionScope.svo.uemail}";
				product_new();
				
				function product_new(){
					$.ajax({
						url:"product_new_ajax.do?uemail=${sessionScope.svo.uemail}",
						success:function(result){
							var jdata = JSON.parse(result);
							var output = "";
							
							for(var i in jdata.jlist){
								output += '<div class="new_prod">';
								output += '<div class="new_prod_img">';
								output += '<div>';
								output += '<button class="favorite_btn" value="' + jdata.jlist[i].pid + '">';
								var n = 0;
								for(var j in jdata.jlist2){
									if(jdata.jlist[i].pid == jdata.jlist2[j].pid){
										output += '<img src="http://localhost:9000/sistproject3/images/star2.png" id="'+jdata.jlist[i].pid+'"_star">';
										n=1;
									}
								}
								if(n!=1){
									output += '<img src="http://localhost:9000/sistproject3/images/favorite.png" id="'+jdata.jlist[i].pid+'"_star">';
								}
								output += '</button>';
								output += '</div>';
								output += '<a href="http://localhost:9000/sistproject3/product.do?pid='+ jdata.jlist[i].pid +'">';
								output += '<div class="psfile_img">';
								output += '<img src="http://localhost:9000/sistproject3/resources/upload/'+ jdata.jlist[i].psfile1 +'">';
								output += '</div>';
								output += '<div class="new_prod_info">';
								output += '<div class="prod_info_name">'+ jdata.jlist[i].sname +'</div>';
								output += '<div class="prod_info_title">'+ jdata.jlist[i].ptitle +'</div>';
								output += '</div>';
								output += '<div class="new_prod_info_review">';
								output += '<div class="rv">';
								output += '<img src="http://localhost:9000/sistproject3/images/star2.png">';
								output += '<span> 4.5</span>';
								output += '</div>';
								output += '<div class="rv2">사진보다 실물이 훨씬 이쁘고...</div>';
								output += '</div>';
								output += '</a>';
								output += '</div>';
								output += '</div>';
							}//for
							
							$(".product_content").text("").append(output);
						}//success
					});//ajax
				}//product_new
				
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
								 
								}
							});//ajax
						}
					}else {
						alert("로그인을 먼저 진행해 주세요!");
						location.href='http://localhost:9000/sistproject3/login.do';
					}
				});
			});//ready
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
			<%-- <div class="new_prod">
				<div class="new_prod_img">
					<div>
						<button class="favorite_btn">
							<img src="http://localhost:9000/sistproject3/images/favorite.png">
						</button>
					</div>
					
					<a href="http://localhost:9000/sistproject3/product.do?pid=${vo.pid }">
						<div class="psfile_img">
							<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1}">
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
					</a>
				</div>
			</div> --%>
		</section>
		
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>