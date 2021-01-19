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
<script>
	$(document).ready(function(){
		$("#reply_write_btn").click(function(){
			if($("#r_content").val() == ""){
				alert("내용을 입력해주세요 :) ");
				return false;
			}else{
				alert("작성이 완료되었습니다:) ");
				var output = "";
				output += "<table id='cs_reply_table'>";
				output += "<tr>";
				output += "<td><img src='http://localhost:9000/sistproject3/images/logo.jpg' style='height:60px; width:60px;  border-radius:50%'></td>";
				output += "<td>최지혜</td>";
				output += "<td></td>";
				output += "<td><button type='button' class='btn_style' id='r_update_btn'>수정</button></td>";
				output += "<td><button type='button' class='btn_style' id='r_delete_btn'>삭제</button></td>"
				output += "<td>2021.01.19. 15:35:34</td>";
				output += "</tr>";
				output += "<tr>";
				output += "<td colspan='6'><div>" + $("#r_content").val() + "</div></td>";
				output += "</tr>";
				output += "</table>";
				$("#r_content").val("");
				$("#here").after(output);
			}
		});
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="jihye_content">
	<!-- content -->
	<h2 class="txt">공지사항 및 1:1문의</h2>
	<section id="cs_content">
		<table class="cs_table" id="cs_content_table">
			<tr>
				<td colspan="6">로그인 오류</td>
			</tr>
			<tr>
				<th>작성자</th> 
				<td> 최지혜</td>
				<th>작성일</th> 
				<td>20201.01.13</td>
				<th>조회수</th>
				<td>1</td>
			</tr>
			<tr>
				<td colspan="6" id="content">
					해결해주세요
					<%-- <% if(vo.getBcontent() != null){ %>
					<%= vo.getBcontent().replace("\r\n", "<br>") %><br>
					<% } %>
					<% if(vo.getBsfile() != null){ %>
						<img src="http://localhost:9000/MyPrSite/upload/<%= vo.getBsfile() %>">
					<% } %> --%>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<a href="cs_update.do"><button type="button" class="btn_style">수정</button></a>
					<a href="cs.do"><button type="button" class="btn_style">목록</button></a>
					<a href="cs_delete.do"><button type="button" class="btn_style">삭제</button></a>
					<%-- <% if(vo.getUser_id().equals(user_id)){ %>
						<a href="board_update.jsp?bid=<%= bid %>"><button type="button" class="btn_style">수정</button></a>
					<% } %>
					<a href="board_list.jsp"><button type="button" class="btn_style">목록</button></a>
					<% if(vo.getUser_id().equals(user_id)){ %>
						<a href="board_delete.jsp?bid=<%= bid %>"><button type="button" class="btn_style">삭제</button></a>
					<% } %> --%>
				</td>
			</tr>
			<tr>
				<td colspan="6" id="last">
					<div id="reply_form">
					<img src="http://localhost:9000/sistproject3/images/logo.jpg" id="user_img">
					<textarea id="r_content" placeholder="댓글을 남겨주세요.(200자)"></textarea>
					<button type="button" id="reply_write_btn" class="btn_style">작성</button>
					</div>
					<div id="here"></div>
					
					<%-- <input type="hidden" id="u_id" value="<%= user_id %>">
					<input type="hidden" id="bid" value="<%= bid %>">
					<br>
					<% if(pvo.getS_face_file() != null){ %>
						<img src="http://localhost:9000/MyPrSite/upload/<%= pvo.getS_face_file() %>" id="user_img">						
					<% }else{ %>
						<img src="http://localhost:9000/MyPrSite/images/circle.png" id="user_img">
					<% } %>
					<% if(user_id != null){ %>		
					<textarea id="r_content" placeholder="댓글을 남겨주세요.(200자)"></textarea>
					<% }else{ %>
					<textarea id="r_content" placeholder="로그인 이후에 작성할 수 있습니다 :)"></textarea>
					<% } %>
					<% if(user_id != null){ %>
					<button type="button" id="btn_send" class="btn_style">작성</button>
					<% } %>
					<br>
					<div id="here"></div> --%>
				</td>
			</tr>
		</table>
	</section>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>