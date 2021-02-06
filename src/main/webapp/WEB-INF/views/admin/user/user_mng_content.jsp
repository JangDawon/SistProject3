<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 회원관리</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
</head>
<body id="user_mng_content" class="admin">

	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div class="jihye_content">

	<!-- aside -->
	<jsp:include page="../admin.jsp"><jsp:param name="psfile" value="${psfile }" /></jsp:include>
	
	<a href="user_mng_list.do" class="h2_user"><h2 class="txt">회원 관리</h2></a>
	<table id="admin_user_table">
		<tr>
			<td rowspan="4">
				<c:choose>
					<c:when test="${vo.psfile ne null }">
						<img src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile}">
					</c:when>
					<c:otherwise>
						<img src="http://localhost:9000/sistproject3/images/logo.jpg">
					</c:otherwise>
				</c:choose>
			</td>
			<th>아이디</th>
			<td>${vo.uemail }</td>
			<th>성명</th>
			<td>${vo.uname}</td>
		</tr>
		<tr>
			<th>HP</th>
			<td>${vo.cp }</td>
			<th>가입일자</th>
			<td>${vo.udate }</td>
		</tr>
		<tr>
			<th colspan="2">마케팅 수신동의</th>
			<td colspan="2">
				<c:choose>
					<c:when test="${vo.aggrsms eq 'on'}">
						<input type="checkbox" checked>전화
					</c:when>
					<c:otherwise>
						<input type="checkbox">전화
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${vo.aggremail eq 'on'}">
						<input type="checkbox" checked>E-mail
					</c:when>
					<c:otherwise>
						<input type="checkbox">E-mail
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="4">${vo.addr1 } ${vo.addr2 } ${vo.addr3}</td>
		</tr>
		<tr>
			<td colspan="5">
				<a href="user_mng_list.do"><button type="button" class="btn_style" id="user_cancel_btn">목록</button></a>
				<button type="button" class="btn_style" id="user_delete_btn" value="${vo.uemail }">삭제</button>
			</td>
		</tr>
	</table>
	
	</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>