<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>회원가입</title>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class = login_content>
		<section class = login_section1 id = join_choice_section1>
			<div>
				<a href="http://localhost:9000/sistproject3/index.do"><img class="login_logo" src="http://localhost:9000/sistproject3/images/login_images/login_logo.png"></a>
				<img class="login_coupon" src="http://localhost:9000/sistproject3/images/login_images/login_coupon.png">
			</div>
		</section>
			
		<section class = join_choice_section>
			<div>
				<ul>
					<li><hr>&nbsp;&nbsp;정말 간단한 회원가입하기 &nbsp;&nbsp;<hr></li>
					<li><div>1</div><hr><div>2</div></li>
					<li><label>회원가입 방법 선택하기</label></li>
					<li><a href="#"><button type=button id=btnKakaoJoin><img src="http://localhost:9000/sistproject3/images/login_images/login_kakao.jpg"><label>카카오톡으로 회원가입하기</label></button></a></li>
					<li><a href="http://localhost:9000/sistproject3/join.do"><button type=button id=btnEmailJoin>이메일로 회원가입하기</button></a></li>
					<li><label>이미 가입하셨다면 <a href="http://localhost:9000/sistproject3/login.do">바로 로그인하기</a></label></li>
				</ul>
			</div>
		</section>
	</div>
</body>
</html>