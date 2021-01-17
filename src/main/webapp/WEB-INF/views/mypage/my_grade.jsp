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
	
		<h2>회원등급</h2>
	<div>
	<table class ="my_grade">
		<tr>
			<td><img src ="http://localhost:9000/sistproject3/images/grade_baby.PNG"></td>
			<td><div>아기손</div>
					<div>작품 구매시 적립률 0.5%</div>
			</td>
		</tr>
	</table>
	
	<h4>등급별 혜택 알아보기</h4>
	<table class ="grade_info">
		<tr>
			<td><img src ="http://localhost:9000/sistproject3/images/grade_gold.PNG"><div class = "hand">금손</div></td>
			<td >
				<div>작품 구매시 적립률</div>
				<div class ="orange">2.0%</div>
				<div>등급조건</div>
				<div>60만원이상 구매</div>
			</td>
			<td><img src ="http://localhost:9000/sistproject3/images/grade_silver.PNG"><div  class = "hand">은손</div></td>
			<td>
				<div>작품 구매시 적립률</div>
				<div class ="orange">1.5%</div>
				<div>등급조건</div>
				<div>30만원 이상, 60만원 미만 구매시</div>
			</td>
		</tr>	
		
		<tr>
			<td><img src ="http://localhost:9000/sistproject3/images/grade_bear.PNG"><div  class = "hand">곰손</div></td>
			<td >
				<div>작품 구매시 적립률</div>
				<div class ="orange">1.0%</div>
				<div>등급조건</div>
				<div>10만원 이상, 30만원 미만 구매시</div>
			</td>
			<td><img src ="http://localhost:9000/sistproject3/images/grade_baby.PNG"><div  class = "hand">아기손</div></td>
			<td>
				<div>작품 구매시 적립률</div>
				<div class ="orange">0.5%</div>
				<div>등급조건</div>
				<div>10만원 미만 구매시</div>
			</td>
		</tr>
	</table>
	</div>
			</div>

		<jsp:include page="../footer.jsp" />
</body>
</html>