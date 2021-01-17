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
	<h2>회원 정보 관리</h2>
	<table class="member_info">
		<tr>
			<td class="grey">이름</td>
			<td><input type="text" value="홍길동"></td>
		</tr>
		<tr>
			<td class="grey">이메일</td>
			<td><input type="text" value="example.google.com"></span>
		</tr>

		<tr>
			<td class="grey">전화</td>
			<td><input type="text" value="010-1234-5678">
				<br><small>주문, 배송시 등록된 번호로 SMS를 발송해 드립니다</small></td>
		</tr>

		<tr>
			<td class="grey">성별</td>
			<td><input type="radio" name="gender" value="여성"><span
				class="rchk">남자</span> <input type="radio" name="gender" value="남성"><span
				class="rchk">여자</span></td>
		</tr>

		<tr>
			<td class="grey">생일</td>
			<td><input type="text" style="width: 80px;"
				placeholder="2020-01-01"></td>
		</tr>

		<tr>
			<td class="grey">알림설정</td>
			<td class ="alram">파격할인/이벤트/쿠폰 알림 등의 정보를 받아보시겠습니까?<br> 
			<input type="checkbox" name="agree" value="SMS"><span> SMS</span>
			<input type="checkbox" name="agree" value="이메일"><span>이메일</span>
			</td>
		</tr>

		<tr>
			<td colspan=2><button type="button" class="change">회원탈퇴</button></td>
		</tr>
		<tr>
			<td colspan=2><button type="button">회원 정보 수정하기</button></td>
		</tr>
	</table>
			</div>

		<jsp:include page="../footer.jsp" />
</body>
</html>