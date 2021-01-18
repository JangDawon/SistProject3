<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
</head>
<body>
<jsp:include page="../header.jsp" />
<div class = "mypage">
	<div  class="mypage_menu">
				<div><img class="profile_img"
					src="http://localhost:9000/sistproject3/images/profile.PNG"></div>
				<div>등급</div>
				<div>닉네임</div>
				<div>MY MENU</div>
				<div class="bold">주문배송</div>
				<div><a href="my_order.do">주문내역</a></div>
				<div><a href="my_cancel.do">취소/환불 내역</a></div>
				<div class="bold">나의 구매후기</div>
				<div><a href="my_review_write.do">후기 쓰기</a></div>
				<div><a href="my_review.do">내가 쓴 후기</a></div>
				<div class="bold">관심리스트</div>
				<div><a href="my_bookmark_item.do">즐겨찾기(★)</a></div>
				<div><a href="my_bookmark_writer.do">좋아하는 작가(♥)</a></div>
				<div class="bold">내 정보</div>
				<div><a href="my_grade.do">회원 등급</a></div>
				<div><a href="my_info.do">회원 정보 관리</a></div>
				<div><a href=" my_address.do">주소(배송지) 관리</a></div>
	</div>

	<h2>나의 구매후기</h2>
		<div class="caution">
		여러분들이 작성해주시는 솔직한 구매후기는 핸드메이드 작품 선택을 고민하는 분들에게 선택의 도움을 줄 수 있답니다.<br>
		구매하신 작품마다 1회의 구매후기 작성과 1회의 수정이 가능합니다.<br> 단, 작성하신 구매후기를 삭제하면 다시
		작성할 수 없으니 신중히 평가해 주세요.<br> 해당 작품과 무관한 내용이나 비방, 욕설 등 부적합한 내용의
		구매후기는 서비스 이용 약관이나 관련 법률에 의해 제재를 받을 수 있습니다.
		</div>
			<table class="review_menu">
				<tr>
					<td><a href="my_review_write.do">구매후기쓰기</a></td>
					<td><a href="my_review.do">내가 쓴 구매 후기</a></td>
				</tr>
			</table>

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