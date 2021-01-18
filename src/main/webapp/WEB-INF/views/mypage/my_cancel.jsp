<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 페이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
</head>
<body>
<!-- aside -->
	<jsp:include page="../header.jsp" />
	

	<div class="content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"></jsp:include>
	<h2>취소/환불 내역</h2>
	<table class="my_order">
		<tr>
			<td colspan=3>취소완료 : 2021-01-12<span></span>주문일자 : 2021-01-12</td>
			<td colspan=2>50000원</td>
		</tr>

		<tr>
			<td rowspan=2><img
				src="http://localhost:9000/sistproject3/images/item_img.PNG"></td>
			<td rowspan=2><b>♥[입점할인]뚠뚠이 캐릭터 그림 일러스트 초상화</b><br> <span>인원
					1명/그림게시 : 인스타/아이디어스 가능해요/매후기이벤트 : 후기 쓸께요/상세설명을 필독하였습니다.</span></td>
			<td width="100" rowspan=2>리을이네
				<button type="button">문의하기</button>
			</td>
			<td width="100" rowspan=2><button type="button">취소정보</button></td>
		</tr>
	</table>
			</div>

		<jsp:include page="../footer.jsp" />
</body>
</html>