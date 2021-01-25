<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 고객센터</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script>
	$(document).ready(function(){
		$("input[type='file']").on('change', function(){
			if(window.FileReader){
				var fileName = $(this)[0].files[0].name;
				$("#bfile_label").text("").text(fileName);
			}
		});
	});
</script>
</head>
<body id="cs_update">
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="jihye_content">
	<!-- content -->
	<h2 class="txt">공지사항 및 1:1문의</h2>
	<form name="cs_update_form" action="cs_update_proc.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bid" value="${vo.bid}">
		<input type="hidden" name="uemail" value="${vo.uemail }">
		<input type="hidden" name="uname" value="${vo.uname }">
		<table class="cs_table" id="cs_update_table">
			<tr>
				<td>
					<span class="board_title">제목</span>
					<input type="text" name="btitle" id="btitle" placeholder="제목을 입력해주세요 :)" value="${vo.btitle }">
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">내용</span>
					<textarea name="bcontent" id="bcontent">${vo.bcontent }</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">파일</span>
					<c:choose>
						<c:when test="${vo.bsfile eq null }">
							<input name="file1" type="file" id="file1"><span id="bfile_label">선택된 파일 없음</span>
						</c:when>
						<c:otherwise>
							<input name="file1" type="file" id="file1"><span id="bfile_label">${vo.bfile }</span>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>
					<span class="board_title">비밀글</span>
					<c:choose>
						<c:when test="${vo.bsecret ne 'on' }">
							<input type="checkbox" name="bsecret">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="bsecret" checked>
						</c:otherwise> 
					</c:choose>
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
					<button type="submit" id="cs_update_btn" class="btn_style">수정</button>
					<a href="cs.do"><button type="button" id="cs_cancel_btn" class="btn_style">취소</button></a>
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>