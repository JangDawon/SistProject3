<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 관리자</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#product_all_delete_chk").click(function(){
			if($("#product_all_delete_chk").is(":checked")){
				$(".product_chk").prop("checked", true);
			}else{
				$(".product_chk").prop("checked", false);
			}
			
		});
		
		$("#product_all_delete").click(function(){
			var del_list = "";
			
			$("input[class='product_chk']").each(function(index){
				del_list += $(this).attr("value") + ", ";
			});
			
			confirm(del_list + "정말 삭제하시겠습니까?");
			
		});
		
		$("#product_select_delete").click(function(){
			var del_list = "";
			
			$("input[class='product_chk']:checked").each(function(index){
				del_list += $(this).attr("value") + ", ";
			});
			
			if(del_list == ""){
				alert("선택된 리뷰가 없습니다");
			}else{
				confirm(del_list + "정말 삭제하시겠습니까?");
			}
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
		<tr>
			<td><input type="checkbox" class="product_chk" value=1></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'"><div>321팩토리 321factory</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'">패션&잡화</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'"><div>1+1🔥블랙아이보리 클로버 나비 마스크스트랩/목걸이</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'"><img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'">17,800원</td>
		</tr>
		<tr>
			<td><input type="checkbox" class="product_chk" value=2></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'"><div>321팩토리 321factory</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'">패션&잡화</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'"><div>1+1🔥블랙아이보리 클로버 나비 마스크스트랩/목걸이</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'"><img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'">17,800원</td>
		</tr>
		<tr>
			<td><input type="checkbox" class="product_chk" value=3></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'"><div>321팩토리 321factory</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'">패션&잡화</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'"><div>1+1🔥블랙아이보리 클로버 나비 마스크스트랩/목걸이</div></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'"><img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;"></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/product_mng_content.do'">17,800원</td>
		</tr>
		<tr>
			<td colspan="6" id="ampaginationsm"><< 1 2 3 4 5 >></td>
		</tr>
	</table>
	</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>