<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 마이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/am-pagination.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
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
			$(location).attr('href','http://localhost:9000/sistproject3/my_review.do?rpage=' + e.page);
		});
	});
</script>
<style>
table.review{border-collpase:collapse;border:1px solid rgb(217,217,217);}
img.review_image{width:80px;height:80px;float:left;margin-right:10px;}
img.review_product{width:120px;height:140px;}
span.review_star{padding-right:100px;color:rgb(255,200,1);}
td.td_indent{text-indent:5px;border-bottom:1px solid rgb(217,217,217)}
</style>
</head>
<body>
	<!-- aside -->
	<jsp:include page="../header.jsp" />


	<div class="mypage_content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"></jsp:include>

		<h2>나의 구매후기</h2>
		<div class="caution">
			여러분들이 작성해주시는 솔직한 구매후기는 핸드메이드 작품 선택을 고민하는 분들에게 선택의 도움을 줄 수 있답니다.<br>
			구매하신 작품마다 1회의 구매후기 작성과 1회의 수정이 가능합니다.<br> 단, 작성하신 구매후기를 삭제하면 다시
			작성할 수 없으니 신중히 평가해 주세요.<br> 해당 작품과 무관한 내용이나 비방, 욕설 등 부적합한 내용의
			구매후기는 서비스 이용 약관이나 관련 법률에 의해 제재를 받을 수 있습니다.
		</div>
		<c:forEach var="vo" items="${list}" >
		<table  class = "review">
		<tr>
			<td>
				<input type = "hidden" name = "rid" value = "${vo.rid }">
				<input type = "hidden" name = "pid" value = "${vo.pid }">
			</td>
		</tr>		
			<tr>
				<td rowspan =3><img class = "review_product"src ="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }"></td>
				<td class = "td_indent" width=380><span class = "review_title">${vo.ptitle }</span></td>
				<td class = "td_indent">${vo.rdate }</td>
			</tr>
			
		<tr>
			<td colspan= 2 class = "td_indent"><span class ="review_star">★${vo.rscore }</span></td>
		</tr>
			
			<tr>
				<td colspan =2><img class = "review_image" src ="http://localhost:9000/sistproject3/resources/upload/${vo.rsfile }"><span class = "review_comment">${vo.rcontent }</span></td>
			</tr>
			
		</table>
		</c:forEach>

	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>