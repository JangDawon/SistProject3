<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 고객센터</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
</head>
<body id="user_mng_list" class="admin">

	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div class="jihye_content">

	<!-- aside -->
	<jsp:include page="../admin.jsp"></jsp:include>
	
	<a href="user_mng_list.do" class="h2_user"><h2 class="txt">회원 관리</h2></a>
	<table class="cs_table" id="user_list">
		<tr>
			<td colspan="6">
				<button type="button" class="btn_style" id="user_select_delete">선택 삭제</button>
				<button type="button" class="btn_style" id="user_all_delete">전체 삭제</button>
			</td>
		</tr>
		<tr>
			<th><input type="checkbox" id="user_all_delete_chk"></th>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>가입일자</th>
		</tr>
		<tr class="cs_row">
			<td><input type="checkbox" class="user_chk" value=1></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">1</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">jihye</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">최지혜</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">2021.01.14</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">2021.01.14</td>
		</tr>
		<tr class="cs_row">
			<td><input type="checkbox" class="user_chk" value=2></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">2</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">jihye</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">최지혜</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">2021.01.14</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">2021.01.14</td>
		</tr>
		<tr class="cs_row">
			<td><input type="checkbox" class="user_chk"  value=3></td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">3</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">jihye</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">최지혜</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">2021.01.14</td>
			<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do'">2021.01.14</td>
		</tr>
		<tr>
			<td colspan="6" id="ampaginationsm"><< 1 2 3 4 5 >></td>
		</tr>
	</table>
	</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>