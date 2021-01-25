<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 페이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
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
		<div class="border">
			<table class="review_content">
				<tr>
					<td><img src="http://localhost:9000/sistproject3/images/item_img.PNG"></td>
					<td><span class="title">♥[입점할인]뚠뚠이 캐릭터 그림 일러스트 초상화</span><span class="star">★</span> 3</td>
				</tr>

				<tr>
					<td colspan=3>배송도 빠르고 재구매 의사 있어요</td>
				</tr>
			</table>
		</div>

		<div class="border">
			<table class="review_content">
				<tr>
					<td><img src="http://localhost:9000/sistproject3/images/item_img.PNG"></td>
					<td><span class="title">♥[입점할인]뚠뚠이 캐릭터 그림 일러스트 초상화</span><span class="star">★</span> 3</td>
				</tr>

				<tr>
					<td colspan=3>배송도 빠르고 재구매 의사 있어요</td>
				</tr>
			</table>
		</div>
</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>