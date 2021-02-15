<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 고객센터</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/am-pagination.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,
			totals : "${dbCount}",
			pageSize : "${pageSize}",
			page : "${reqPage}",
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',
			
			btnSize : 'sm'
		});
		
		jQuery("#ampaginationsm").on('am.pagination.change', function(e){
			$(location).attr('href','http://localhost:9000/sistproject3/user_mng_list.do?rpage=' + e.page);
		});
	});
</script>
</head>
<body id="user_mng_list" class="admin">

	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div class="jihye_content">

	<!-- aside -->
	<jsp:include page="../admin.jsp"><jsp:param name="psfile" value="${psfile }" /></jsp:include>
	
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
			<th>전화번호</th>
			<th>가입일자</th>
		</tr>
		<c:forEach var="vo" items="${list}" >
			<tr class="cs_row">
				<td><input type="checkbox" class="user_chk" value="${vo.uemail }"></td>
				<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do?uid=${vo.uemail}'">${vo.rno }</td>
				<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do?uid=${vo.uemail}'">${vo.uemail }</td>
				<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do?uid=${vo.uemail}'">${vo.uname }</td>
				<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do?uid=${vo.uemail}'">${vo.cp }</td>
				<td onclick="location.href='http://localhost:9000/sistproject3/user_mng_content.do?uid=${vo.uemail}'">${vo.udate }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6"><div id="ampaginationsm"></div></td>
		</tr>
	</table>
	</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>