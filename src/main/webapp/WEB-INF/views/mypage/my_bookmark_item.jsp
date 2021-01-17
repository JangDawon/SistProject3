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
				<div><img class="profile_img"src="http://localhost:9000/sistproject3/images/profile.PNG"></div>
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
		<h2>즐겨찾기(★)</h2>
		<dl class="bookmark_list">
			<dt>
				<img class="preview"
					src="http://localhost:9000/sistproject3/images/bookmark_item.PNG">
			</dt>
			<dt>
				<a href="#">희스무드(heesmood)</a>
			</dt>
			<dt>인기폭발 커플기념일</dt>
			<dt>30000원</dt>
			<dt><span class ="star">★★★★★</span><span>(210)</span></dt>
		</dl>
		</div>
	<!-- footer-->
	<jsp:include page="../footer.jsp" />
</body>
</html>