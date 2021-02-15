<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/login.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/join.css">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>회원가입</title>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class = login_content>
		<section class = login_section1 id=join_success_section1>
			<div>
				<a href="http://localhost:9000/sistproject3/index.do"><img class="login_logo" src="http://localhost:9000/sistproject3/images/login_images/login_logo.png"></a>
				<img class="login_coupon" src="http://localhost:9000/sistproject3/images/login_images/login_coupon.png">
			</div>
		</section>
			
		<section class = join_success_section>
			<div>
				<div class=join_success><label>${vo.uname } 님의</label></div>
				<div class=join_success><label>가입을 축하드립니다!</label></div>
				<div class=join_success><a href="http://localhost:9000/sistproject3/index.do"><button>메인 화면으로</button></a><a href="http://localhost:9000/sistproject3/login.do"><button>로그인하기</button></a></div>
			</div>
		</section>
	</div>
</body>
</html>