<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/login.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/login.js"></script>
<script>
	<c:if test="${result ne null}">
		alert("${result}");
	</c:if>
</script>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>로그인</title>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class = login_content>
		<section class = login_section1>
			<div>
				<a href="http://localhost:9000/sistproject3/index.do"><img class="login_logo" src="http://localhost:9000/sistproject3/images/login_images/login_logo.png"></a>
				<img class="login_coupon" src="http://localhost:9000/sistproject3/images/login_images/login_coupon.png">
			</div>
			<div>
				<a href="http://localhost:9000/sistproject3/join_choice.do"><button type=button id=btnJoin>회원가입</button></a>
			</div>
		</section>
		
		<section class = login_section2>
			<div>
				<ul>
					<li><hr>&nbsp;&nbsp;로그인&nbsp;&nbsp;<hr></li>
					<li><button type=button id=btnEmailLogin>이메일로 로그인</button></li>
				</ul>
			</div>
		</section>
		<section class = login_section3>
			<div>
				<form name="loginForm" action="login_proc.do" method="post" class="login">
					<ul>
						<li><hr>&nbsp;&nbsp;이메일 로그인&nbsp;&nbsp;<hr></li>
						<li><input type="text" name="uemail" placeholder="이메일" id="id"></li>
						<li><input type="password" name="upass" placeholder="비밀번호" id="pass"></li>
						<li><a href="login_check.do"><span>아이디 / 비밀번호를 잊어버리셨나요?</span></a></li>
						<li><button type="submit" id="btnLogin">로그인</button></li>
					</ul>	
				</form>	
			</div>
		</section>
	</div>
</body>
</html>