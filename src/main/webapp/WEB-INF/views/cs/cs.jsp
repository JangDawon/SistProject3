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
<body id="cs_board">

	<!-- content -->
	<h2 class="txt">공지사항 및 1:1문의</h2>
	<div>
		<select id="sname">
			<option value="all">전체</option>
			<option value="btitle">제목</option>
			<option value="bcontent">내용</option>
			<option value="user_id">아이디</option>
			<option value="name">작성자</option>
		</select>
		<input type="text" id="svalue" placeholder="검색할 단어를 입력해주세요 :)">
		<button type="button" id="search_btn" class="btn_style">검색</button>
	</div>
	<table id="cs_list_table" class="cs_table">
		<tr>
			<td colspan='2'><span id='cs_count'>게시글 4개</span></td>
			<td colspan='3'><a href="cs_write.do"><button type="button" id="cs_write_btn" class="btn_style">글쓰기</button></a></td>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<tr class="cs_row" onclick="location.href='http://localhost:9000/sistproject3/cs_content.do'">
			<th>1</th>
			<th>[오늘만 할인] 딱 24시간만 할인! 확인해보세요⏰</th>
			<th>관리자</th>
			<th>2021.01.13</th>
			<th>5</th>
		</tr>
		<tr class="cs_row" onclick="location.href='http://localhost:9000/sistproject3/cs_content.do'">
			<td>2</td>
			<td>로그인 오류</td>
			<td>최지혜</td>
			<td>2021.01.13</td>
			<td>1</td>
		</tr>
		<tr class="cs_row" onclick="location.href='http://localhost:9000/sistproject3/cs_content.do'">
			<td>3</td>
			<td>로그인 오류</td>
			<td>최지혜</td>
			<td>2021.01.13</td>
			<td>1</td>
		</tr>
		<tr class="cs_row" onclick="location.href='http://localhost:9000/sistproject3/cs_content.do'">
			<td>4</td>
			<td>로그인 오류</td>
			<td>최지혜</td>
			<td>2021.01.13</td>
			<td>1</td>
		</tr>
		<tr>
			<td colspan="5"><< 1 2 3 4 5 >><div id="ampaginationsm"></div></td>
		</tr>
	</table>

</body>
</html>