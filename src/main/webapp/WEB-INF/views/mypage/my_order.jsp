<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 페이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<style>
span.write_button{
border:1px solid rgb(204, 204, 204);padding: 5px 12px;
text-decoration:none;
}
table.my_order a{
text-decoration:none;
color:black;}


</style>
</head>
<body>
<!-- aside -->
	<jsp:include page="../header.jsp" />
	

	<div class="mypage_content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"></jsp:include>
	<h2>주문 내역</h2>
	<table class="my_order">
		<tr>
			<td colspan=3>2021-01-12</td>
			<td colspan=2>50000원</td>
		</tr>

		<tr>
			<td rowspan=2><img
				src="http://localhost:9000/sistproject3/images/item_img.PNG"></td>
			<td rowspan=2>♥<b>[입점할인]뚠뚠이 캐릭터 그림 일러스트 초상화</b><br> <span>인원
					1명/그림게시 : 인스타/아이디어스 가능해요/매후기이벤트 : 후기 쓸께요/상세설명을 필독하였습니다.</span></td>
			<td width="100" rowspan=2>리을이네
				<button type="button">문의하기</button>
			</td>
			<td width="100" rowspan=2><a href="review_write.do" onclick = "window.open(this.href, '_blank',' width=460,height= 600,  left=800 top =150 resizeable=no'); return false"><span class = "write_button">리뷰쓰기</span></a>
		</tr>
	</table>
			</div>

		<jsp:include page="../footer.jsp" />
</body>
</html>