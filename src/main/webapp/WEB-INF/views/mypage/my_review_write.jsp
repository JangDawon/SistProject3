<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table.review_write {
	border:1px solid  rgb(217,217,217);
	}
	table.review_write img{
	width:100px;
	height:100px;
	}
	table.review_write textarea{
	width:340px;
	height:50px;
	}
	table.review_write button{
	padding:16px 10px;
	}
</style>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
</head>
<body>
	<!-- aside -->
	<jsp:include page="mypage_aside.jsp" />
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
	<form name = "review_write_form "action  ="review_write_proc" method="post">
	<input type="hidden" name="bid" value="">
	<table class = "review_write">
		<tr>
			<td rowspan =2><img src = "http://localhost:9000/sistproject3/images/item_img.PNG">
			<td colspan =2>
				<b>[입점할인]뚠뚠이 캐릭터 그림 일러스트 초상화</b><br>
				<span>2021-01-01</span>
				<select name="star" class="star">
					<option value="평점입력">평점입력</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					</select>
					<input type ="file" id = "rfile" name = "rfile">
			</td>

		</tr>
		
		<tr>
			<td><textarea></textarea></td>
			<td><button type = "button">등록하기</button></td>
		</tr>
	</table>
	</form>
<body>

</body>
</html>