<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
<style>
table.member_info tr:first-child td img {
	border-radius: 50%;
	width: 100px;
	height: 100px;
}

table.member_info tr td span.user_email {
	margin-left: 6px;
}
.filebox label {
  display: inline-block;
  color:black;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: white;
  cursor: pointer;
  border: 1px solid rgb(217,217,217);
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
  margin-left:30px;
  padding-right:8px;
}

.filebox label:hover {
  background-color: rgb(255,162,111);
}

.filebox label:active {
  background-color: rgb(255,92,4);
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding-left:0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
</style>
<body>
	<!-- aside -->
	<jsp:include page="../header.jsp" />


	<div class="mypage_content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"><jsp:param name="psfile" value="${vo.psfile }" /></jsp:include>

		<h2>회원 정보 관리</h2>
		<form name="myinfo_update_form" action="myinfo_update_proc.do"method="post" enctype="multipart/form-data">
		<input type="hidden" name="uemail" value="${vo.uemail }">
			<table class="member_info">

				<tr>
					<td class="grey">프로필 사진</td>
					<td><div class="filebox">
					<c:choose>
						<c:when test ="${vo.psfile eq null }">
							<img src="http://localhost:9000/sistproject3/images/logo.jpg">
						</c:when>
						<c:otherwise>
						<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile }"><br>
						</c:otherwise>
					</c:choose>
						<label for="ex_file">변경</label>
						<input type="file" id="ex_file" name="file1"></div>
					</td>
				</tr>
				
				<tr>
					<td class="grey">이름</td>
					<td><input type="text" value="${vo.uname }" id="uname"	name="uname"></td>
				</tr>
				
				<tr>
					<td class="grey">이메일</td>
					<td><span class="user_email">${vo.uemail }</span></td>

				</tr>
				
				<tr>
					<td rowspan=3 class="grey">배송지</td>
					<td><input type="text" value="${vo.addr1 }" id="addr1" name="addr1" placeholder="우편번호"></td>
				</tr>
				
				<tr>
					<td><input type="text" value="${vo.addr2 }" id="addr2"	name="addr2" placeholder="기본주소"></td>
				</tr>
				
				<tr>
					<td><input type="text" value="${vo.addr3 }" id="addr3" name="addr3" placeholder="상세주소"></td>
				</tr>
				
				<tr>
					<td class="grey">전화</td>
					<td><input type="text" value="${vo.cp }" id="cp" name="cp"
						placeholder="'-'없이 입력해주세요."> <br> <small>주문,
							배송시 등록된 번호로 SMS를 발송해 드립니다</small></td>
				</tr>

				<tr>
					<td class="grey">알림설정</td>
					<td class="alram">파격할인/이벤트/쿠폰 알림 등의 정보를 받아보시겠습니까?<br> 
						<input type="checkbox" name="agree" value="SMS"><span>SMS</span>
						<input type="checkbox" name="agree" value="이메일"><span>이메일</span>
					</td>
				</tr>

				<tr>
					<td colspan=2><button type="button" class="change">회원탈퇴</button></td>
					
				</tr>
				<tr>
					<td colspan=2 class="tdlast"><button type="submit"id="updateBtn">회원정보 수정하기</button></td>
				</tr>
			</table>
		</form>
	</div>

	<jsp:include page="../footer.jsp" />
</body>
</html>