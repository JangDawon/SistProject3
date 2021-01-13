<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 고객센터</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
</head>
<body id="cs_write">

	<!-- content -->
	<h2 class="txt">공지사항 및 1:1문의</h2>
	<form name="cs_wirte_form" action="cs_write_proc.do" method="post">
		<input type="hidden" name="user_id">
		<input type="hidden" name="name">
		<table class="cs_table" id="cs_write_table">
			<tr>
				<td>
					<span class="board_title">제목</span>
					<input type="text" name="btitle" placeholder="제목을 입력해주세요 :)">
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">내용</span>
					<textarea name="bcontent"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">파일</span>
					<input name="bfile" type="file">
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn_style">작성</button>
					<a href="cs.do"><button type="button" class="btn_style">취소</button></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>