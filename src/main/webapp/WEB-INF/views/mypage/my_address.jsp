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
</body>
</html>