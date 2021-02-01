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
alert(${vo.uemail});
</script>
<style>
table.member_info tr:first-child td img{border-radius:50%;width:100px; height:100px;}
</style>
<body>
	<!-- aside -->
	<jsp:include page="../header.jsp" />


	<div class="mypage_content">
		<!-- aside -->
		<!-- aside -->
	<aside class="mypage_info">
		<div class="mypage_menu">
			<input type="hidden" name="uemail" value="${uemail}">
			<div class="admin_profile">
				<img src="http://localhost:9000/sistproject3/images/logo.jpg">
				<p>홍길동님</p>
			</div>
			<p class="am">MY MENU</p>
			<nav>
				<b>
					<span>주문배송</span>
				</b>
				<a href="my_order.do">주문내역</a><br>
				<a href="my_cancel.do">취소/환불내역</a>
				<hr class="h">
				<b>
					<span>나의 구매후기</span>
				</b>
				<a href="my_review.do">내가 쓴 구매후기</a>
				<hr class="h">
				<b>
					<span>관심리스트</span>
				</b>
				<a href="my_bookmark_item.do">즐겨찾기</a><br>
				<a href="my_bookmark_writer.do">좋아하는 작가</a>
				<hr class="h">
				<b>
					<span>내 정보</span>
				</b>
				<a href="my_info.do?uemail=${uemail }">회원정보관리</a>
			</nav>
		</div>
	</aside>
		<h2>회원 정보 관리</h2>
		<form name="myinfo_update_form" action="myinfo_update_proc.do" method="post">
		<input type="hidden" name="uemail" value="${vo.uemail}">
			<table class="member_info">
			
				<tr>
					<td class = "grey">프로필 사진</td>
					<td><img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile }"><br><input type ="file" id = "file1" name = "file1"></td>
				</tr>
				<tr>
					<td class="grey">이름</td>
					<td><input type="text" value="${vo.uname }" id="uname" name="uname"></td>
				</tr>
				<tr>
					<td class="grey">이메일</td>
					<td><input type="text" value="${vo.uemail }" id="uemail" name="uemail"></td>

				</tr>
				<tr>
					<td rowspan=3 class="grey">배송지</td>
					<td><input type="text" value="${vo.addr1 }" id="addr1" name="addr1"placeholder ="우편번호"></td>
				</tr>
				<tr>
					<td><input type="text" value="${vo.addr2 }" id="addr2" name="addr2" placeholder ="기본주소"></td>
				</tr>
				<tr>
					<td><input type="text" value="${vo.addr3 }" id = "addr2"	name="addr3" placeholder ="상세주소"></td>
						
				</tr>
				<tr>
					<td class="grey">전화</td>
					<td><input type="text" value="${addr.cp }" id="cp" name="cp"placeholder ="'-'없이 입력해주세요.">
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