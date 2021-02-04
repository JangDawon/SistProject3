<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>로그인 | 아이디 비밀번호 찾기</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/login.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/join.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/join.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class = login_content>
		<section class = login_section1>
			<div>
				<a href="http://localhost:9000/sistproject3/index.do"><img class="login_logo" src="http://localhost:9000/sistproject3/images/login_images/login_logo.png"></a>
				<img class="login_coupon" src="http://localhost:9000/sistproject3/images/login_images/login_coupon.png">
			</div>
		</section>
		
		<section class = join_section id=login_check_result>
				<div>
					<ul>
						<li><hr>&nbsp;&nbsp;아이디 / 비밀번호 찾기&nbsp;&nbsp;<hr></li>
						<c:forEach var="vo" items="${list }">
						<li>아이디 : ${vo.uemail }</li>	
						<li>비밀번호 : ${vo.upass }</li>
						</c:forEach>
					</ul>
					<div class=join_success ><a href="http://localhost:9000/sistproject3/index.do"><button>메인 화면으로</button></a>
					<a href="http://localhost:9000/sistproject3/login.do"><button>로그인하기</button></a></div>
				</div>
		</section>
	</div>
</body>
</html>