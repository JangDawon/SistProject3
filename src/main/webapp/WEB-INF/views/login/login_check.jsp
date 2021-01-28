<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<section class = join_section>
			<form name="checkForm" action="login_check_result.do" method="post" class="check">
				<div>
					<ul>
						<li><hr>&nbsp;&nbsp;아이디 / 비밀번호 찾기 &nbsp;&nbsp;<hr></li>
					</ul>
					
					<div class="join_form_block" id="join_form_block_hp">
						<label class="join_form_block_head" id="login_check_head">회원 가입시 사용한 전화번호를 입력해주세요.</label>
						<div class="join_form_block_body" id="join_form_block_body">
						<input type="text" placeholder="01012345678" id="hp" name="hp">
						<button type="button" id="hp_certify" class="hp_certify">인증요청</button>
						<div class="msg" id="hp_msg"></div>
						</div>
					</div>
					<div class="join_form_block" id="join_form_block_hpcheck">
					<div class="join_form_block_body" id="join_form_block_body_hpcheck">
						<input type="text" placeholder="인증번호를 입력해주세요." id="hp_check" name="hp_check">
						<button type="button" id="hp_certify_check_ck" class="hp_certify">확인</button>
						<input type="hidden" id="hidden_certify">
						<div class="msg" id="hpcheck_msg"></div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
</body>
</html>