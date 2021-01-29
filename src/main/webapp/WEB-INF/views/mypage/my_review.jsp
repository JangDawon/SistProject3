<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost:9000/sistproject3/images/logo.jpg">
<title>아이디어스 - 페이페이지</title>
<link rel="stylesheet"
	href="http://localhost:9000/sistproject3/css/woohyun.css">
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
		
		<table  class = "review">
			<tr>
				<td rowspan =3><img class = "review_product"src ="http://localhost:9000/sistproject3/images/item_img.PNG"></td>
				<td class = "td_indent" width=380><span class = "review_title">뚠뚠이 캐릭터 그림 일러스트 초상화</span></td>
				<td class = "td_indent">2020-20-20</td>
			</tr>
			
		<tr>
			<td colspan= 2 class = "td_indent"><span class ="review_star">★5</span></td>
		</tr>
			
			<tr>
				<td colspan =2><img class = "review_image" src ="http://localhost:9000/sistproject3/images/악세사리.jpg"><span class = "review_comment">좋아요 맛있어요 다시 구매할래요 !<br>안녕히가세요</span></td>
			</tr>
			
		</table>

	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>