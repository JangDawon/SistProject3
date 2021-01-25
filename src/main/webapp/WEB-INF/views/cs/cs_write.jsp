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
<body id="cs_write">
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	<!-- content -->
	<h2 class="txt">공지사항 및 1:1문의</h2>
	<form name="cs_wirte_form" action="cs_write_proc.do" method="post" enctype="multipart/form-data">
		<!-- <input type="hidden" name="user_id">
		<input type="hidden" name="name"> -->
		<table class="cs_table" id="cs_write_table" >
			<tr>
				<td>
					<span class="board_title">제목</span>
					<input type="text" name="btitle" id="btitle" placeholder="제목을 입력해주세요 :)">
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">내용</span>
					<textarea name="bcontent" id="bcontent"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">파일</span>
					<input name="file1" type="file" id="file1">
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">비밀글</span>
					<input type="checkbox" name="bsecret">
					
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">비밀번호</span>
					<input type="password" name="bpass" >
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn_style" id="cs_write_btn">작성</button>
					<a href="cs.do"><button type="button" class="btn_style">취소</button></a>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>