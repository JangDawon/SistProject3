<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 고객센터</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
</head>
<body id="cs_update">
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="content">
	<!-- content -->
	<h2 class="txt">공지사항 및 1:1문의</h2>
	<form name="cs_update_form" action="cs_update_proc.do" method="post">
		<input type="hidden" name="user_id">
		<input type="hidden" name="name">
		<table class="cs_table" id="cs_update_table">
			<tr>
				<td>
					<span class="board_title">제목</span>
					<input type="text" name="btitle" placeholder="제목을 입력해주세요 :)" value="로그인 오류">
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">내용</span>
					<textarea name="bcontent">해결해주세요</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">파일</span>
					<input name="bfile" type="file"><span id="bfile">선택된 파일 없음</span>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn_style">수정</button>
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