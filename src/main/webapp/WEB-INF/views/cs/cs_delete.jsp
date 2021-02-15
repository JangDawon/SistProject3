<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 고객센터</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
</head>
<body id="cs_delete">
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	<!-- content -->
	<h2 class="txt">공지사항 및 1:1문의</h2>
	<table class="cs_table" id="cs_delete_table">
		<tr>
			<th>정말 삭제 하시겠습니까?</th>
		</tr>
		<tr>
			<td><img src="http://localhost:9000/sistproject3/images/logo.jpg" id="delete_img"></td>
		</tr>
		<tr>
			<td>
				<a href="cs_delete_proc.do?id=${id }"><button type="button" class="btn_style">삭제</button></a>		
				<a href="http://localhost:9000/sistproject3/cs_content.do"><button type="button" class="btn_style">취소</button></a>
			</td>
		</tr>
	</table>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>