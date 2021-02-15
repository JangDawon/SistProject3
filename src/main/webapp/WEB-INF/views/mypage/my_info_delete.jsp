<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 마이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
</head>
<body id="cs_delete">
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	<!-- content -->
	<h2 class="txt">회원탈퇴</h2>
	<table class="cs_table" id="cs_delete_table">
		<tr>
			<th>정말 탈퇴하시겠습니까?</th>
		</tr>
		<tr>
			<td><img src="http://localhost:9000/sistproject3/images/logo.jpg" id="delete_img"></td>
		</tr>
		<tr>
			<td>
				<a href="my_info_delete_proc.do?uemail=${uemail}"><button type="button" class="btn_style">회원탈퇴</button></a>		
				<a href="http://localhost:9000/sistproject3/my_info.do"><button type="button" class="btn_style">취소</button></a>
			</td>
		</tr>
	</table>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>