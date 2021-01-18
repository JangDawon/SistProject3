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