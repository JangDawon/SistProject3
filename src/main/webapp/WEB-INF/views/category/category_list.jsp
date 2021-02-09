<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>${pcat} | 아이디어스</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		ajax_list("new");
		
		$("#selector").on('change',function(){
			var sname = $("#selector").val();
			
			ajax_list(sname);
			
		});
		
		function ajax_list(sname){
			$.ajax({
				url:"category_ajax_list.do?pcat=${pcat}&sname="+sname,
				success:function(result){
					var jdata = JSON.parse(result);
					
					var output = "";
					
					for(var i in jdata.jlist){ 
						output += "<div class='product'>";
						output += "<a href='http://localhost:9000/sistproject3/product.do?pid="+ jdata.jlist[i].pid +"'>";
						output += "<div class='prod_img'>";
						output += "<div>";
						output += "<button class='favorite_btn'>";
						output += "<img src='http://localhost:9000/sistproject3/images/favorite.png'>";
						output += "</button>";
						output += "</div>";
						output += "<div>";
						output += "<img src='http://localhost:9000/sistproject3/resources/upload/"+ jdata.jlist[i].psfile1 +"'>";
						output += "</div>";
						output += "</div>";
						output += "<div class='product_info'>";
						output += "<div class='prod_info_name'>"+ jdata.jlist[i].sname +"</div>";
						output += "<div class='prod_info_title'>"+ jdata.jlist[i].ptitle +"</div>";
						output += "<div class='prod_info_price'>"+ jdata.jlist[i].pprice_char +"</div>";
						output += "<div class='prod_info_review'>";
						output += "<div class='rv'>후기</div>";
						output += "<div class='rv2'>이야,,, 정말 좋네요.. 흠 뭐랄까...</div>";
						output += "</div>";
						output += "</div>";
						output += "</a>";
						output += "</div>";
					}
					
					$("div.category_content").text("").append(output);
				}
			});
		}
	});
</script>
</head>
<body class="category">
	<!-- header -->
	<jsp:include page="../header.jsp" />
 
	<section class="category_menu">
		<div class="category_top_menu">
			<h2>${pcat }</h2>
			<!-- <div class="filter_top">
				<ul>
					<li>
						<label>가격대</label>
						<input type="checkbox" name="price" value="1만원미만"><span class="rchk">1만원미만</span>
						<input type="checkbox" name="price" value="1만원대"><span class="rchk">1만원대</span>
						<input type="checkbox" name="price" value="2만원대"><span class="rchk">2만원대</span>
						<input type="checkbox" name="price" value="3만원대"><span class="rchk">3만원대</span>
						<input type="checkbox" name="price" value="4만원대"><span class="rchk">4만원대</span>
						<input type="checkbox" name="price" value="5만원 이상"><span class="rchk">5만원 이상</span>
					</li>
				</ul>
			</div>  -->
			
			<div class="filter_bottom">
				<div class="selector">
					<select id="selector">
						<option value="new">최신순(NEW)</option>
						<option value="purchase">판매수 많은 순</option>
						<option value="low">낮은 가격 순</option>
						<option value="high">높은 가격 순</option>
					</select>
				</div>
			</div>
		</div>
	</section>
	
	<section class="category_content">
		<div class="category_content">
		</div>
	</section>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>