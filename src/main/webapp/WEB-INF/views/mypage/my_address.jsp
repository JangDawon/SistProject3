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
				
	
	
	<h2>주소(배송지) 관리</h2>
	<table class="my_address">
		<tr>
			<td colspan=4>배송지 1</td>
		</tr>

		<tr>
			<td><span class="red">*</span>받는분</td>
			<td colspan=3><input type = "text" value="홍길동"> </td>
		</tr>

		<tr>
			<td><span class="red">*</span>전화번호</td>
			<td colspan=3><input type = "text" value="01012345678"></td>
		</tr>

		<tr>
			<td rowspan=4><span class="red">*</span>주소</td>
			<td colspan=3><input type = "text" value="13980"></td>
		</tr>

		<tr>
			<td colspan=3><input type = "text" value="경기 안양시 만안구 박달로507번길 57 (박달동, 한신휴플러스 타운)"></td>
		</tr>
		<tr>
			<td colspan=3><input type = "text" value="301동 1308호"></td>
		</tr>
		<tr>
			<td colspan=3><button type="button" class="change">변경하기</button></td>
		</tr>
		</table>
		</div>
		<jsp:include page="../footer.jsp" />
</body>
</html>