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
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function() {

		$("#updateBtn").click(function() {
			if ($("#name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			} else if ($("#email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			} else if ($("#addr1").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("#addr1").focus();
				return false;
			} else if ($("#addr2").val() == "") {
				alert("주소를 입력해주세요.");
				$("#addr2").focus();
				return false;
			} else if ($("#addr3").val() == "") {
				alert("상세주소를 입력해주세요.");
				$("#addr3").focus();
				return false;
			} else if ($("#cp").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#cp").focus();
				return false;
			} else if ($("#gender").val() == "") {
				alert("성별을 선택해주세요.");
				$("#cp").focus();
				return false;
			} else {
				myinfo_update_form.submit();
			}
		});
	});
</script>
<style>
table.member_info tr:first-child td img{border-radius:50%;width:100px; height:100px;}
</style>
<body>
	<!-- aside -->
	<jsp:include page="../header.jsp" />


	<div class="mypage_content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"></jsp:include>
		<h2>회원 정보 관리</h2>
		<form name="myinfo_update_form" action="myinfo_update_proc.do"
			method="post" enctype="multipart/form-data">
			<table class="member_info">
			
				<tr>
					<td class = "grey">프로필 사진</td>
					<td><img src="http://localhost:9000/sistproject3/images/logo.jpg"><br><input type ="file"></td>
				</tr>
				<tr>
					<td class="grey">이름</td>
					<td><input type="text" value="홍길동" id="name" name="name"></td>
				</tr>
				<tr>
					<td class="grey">이메일</td>
					<td><input type="text" value="example.google.com" id="email"
						name="email"></td>

				</tr>
				<tr>
					<td rowspan=3 class="grey">배송지</td>
					<td><input type="text" value="13980" id="addr1" name="addr1"placeholder ="우편번호"></td>
				</tr>
				<tr>
					<td><input type="text"
						value="경기 안양시 만안구 박달로507번길 57 (박달동, 한신휴플러스 타운)" id="addr2"
						name="addr2" placeholder ="기본주소"></td>
				</tr>
				<tr>
					<td><input type="text" value="301동 1308호" id="addr3"
						name="addr3" placeholder ="상세주소"></td>
				</tr>
				<tr>
					<td class="grey">전화</td>
					<td><input type="text" value="01012345678" id="cp" name="cp"placeholder ="'-'없이 입력해주세요.">
						<br>
					<small>주문, 배송시 등록된 번호로 SMS를 발송해 드립니다</small></td>
				</tr>


				

				<tr>
					<td class="grey">알림설정</td>
					<td class="alram">파격할인/이벤트/쿠폰 알림 등의 정보를 받아보시겠습니까?<br> <input
						type="checkbox" name="agree" value="SMS"><span> SMS</span>
						<input type="checkbox" name="agree" value="이메일"><span>이메일</span>
					</td>
				</tr>

				<tr>
					<td colspan=2><button type="button" class="change">회원탈퇴</button></td>
				</tr>
				<tr>
					<td colspan=2><button type="button" id="updateBtn">회원
							정보 수정하기</button></td>
				</tr>
			</table>
		</form>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>