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
			<td rowspan =3 class ="grey">배송지</td>
			<td><input type = "text" value="13980"></td>
		</tr>
		<tr>
			<td><input type = "text" value="경기 안양시 만안구 박달로507번길 57 (박달동, 한신휴플러스 타운)"></td>
		</tr>
		<tr>
			<td><input type = "text" value="301동 1308호"></td>
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