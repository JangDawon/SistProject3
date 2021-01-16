<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
</head>
<body>
<!-- aside -->
	<jsp:include page="mypage_aside.jsp" />
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
</body>
</html>