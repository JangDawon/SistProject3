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
		/* $("button").click(function(){
			var obj_name = $(this).attr("name");
			var obj_id = $(this).attr("id");
			alert(obj_name+" : " +obj_id);
		}); */
		
		
		
		$(document).on("click","#r_update_btn",function(){
			var text = $("#r_content").val();
			$(".rc").remove();
			$("#r_update_btn").css("display","none");
			$("#r_delete_btn").css("display","none");
			$(".rc_here").append("<textarea id='rcon_text' placeholder='댓글을 남겨주세요.(200자)' style='width:700px;'>" + text +"</textarea>");
			$(".rc_here").append("<button type='button' class='btn_style'>수정</button>")
		   });
		
		$(document).on("click","#r_delete_btn",function(){
			alert("삭제완료");
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
				<td colspan="6">${vo.btitle }</td>
			</tr>
			<tr>
				<th>작성자</th> 
				<td>${vo.uname }</td>
				<th>작성일</th> 
				<td>${vo.bdate }</td>
				<th>조회수</th>
				<td>${vo.bhits+1 }</td>
			</tr>
			<tr>
				<td colspan="6" id="content">
					${vo.bcontent }
					<c:if test="${vo.bsfile ne null }">	
						<br>
						<img src="http://localhost:9000/sistproject3/resources/upload/${vo.bsfile }" style="width:300px; height:300px;">
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<a href="cs_update.do?id=${vo.bid }"><button type="button" class="btn_style">수정</button></a>
					<a href="cs.do"><button type="button" class="btn_style">목록</button></a>
					<a href="cs_delete.do?id=${vo.bid }"><button type="button" name="r_delete" id="rd1"class="btn_style">삭제</button></a>
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