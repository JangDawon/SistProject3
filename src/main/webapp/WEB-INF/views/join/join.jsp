<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/login.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/join.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/join.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>회원가입</title>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class = login_content>
		<section class = login_section1 id=join_section1>
			<div>
				<a href="http://localhost:9000/sistproject3/index.do"><img class="login_logo" src="http://localhost:9000/sistproject3/images/login_images/login_logo.png"></a>
			</div>
		</section>
			
		<section class = join_section>
			<div>
				<form name="joinForm" action="join_proc.do" method="post" class="join">
					<ul>
						<li><hr>&nbsp;&nbsp;정말 간단한 회원가입하기 &nbsp;&nbsp;<hr></li>
						<li><div>1</div><hr><div>2</div></li>
						<li><label>가입 정보 입력하기</label></li>
					</ul>
					<div class="join_form_block">
						<label class="join_form_block_head"><em class="asterisk_red">*</em>이메일</label>
						<div class="join_form_block_body" id="join_form_block_body"><input type="text" placeholder="이메일을 입력해주세요." id="email" name="email"></div>
						<div class="msg" id="email_msg"></div>
						<div id="idcheck_result"></div>
					</div>
					<div class="join_form_block">
						<label class="join_form_block_head"><em class="asterisk_red">*</em>비밀번호</label>
						<div class="join_form_block_body" id="join_form_block_body"><input type="password" placeholder="비밀번호 (영문+숫자+특수문자 8자 이상)" id="pass" name="pass"></div>
						<div class="msg" id="pass_msg"></div>
						<div class="join_form_block_body" id="join_form_block_body"><input type="password" placeholder="비밀번호 확인" id="cpass" name="cpass"></div>
						<div class="msg" id="cpass_msg"></div>
					</div>
					<div class="join_form_block">
						<label class="join_form_block_head"><em class="asterisk_red">*</em>이름</label>
						<div class="join_form_block_body" id="join_form_block_body"><input type="text" placeholder="이름을 입력해주세요." id="name" name="name"></div>
						<div class="msg" id="name_msg"></div>
					</div>
					<div class="join_form_block" id="join_form_block_hp">
						<label class="join_form_block_head"><em class="asterisk_red">*</em>전화번호</label>
						<div class="join_form_block_body" id="join_form_block_body">
						<input type="text" placeholder="01012345678" id="hp" name="hp">
						<button type="button" id="hp_certify" class="hp_certify">인증요청</button>
						<div class="msg" id="hp_msg"></div>
						</div>
					</div>
					<div class="join_form_block" id="join_form_block_hpcheck">
					<div class="join_form_block_body" id="join_form_block_body_hpcheck">
						<input type="text" placeholder="인증번호를 입력해주세요." id="hp_check" name="hp_check">
						<button type="button" id="hp_certify_check" class="hp_certify">확인</button>
						<input type="hidden" id="hidden_certify">
						<div class="msg" id="hpcheck_msg"></div>
						</div>
					</div>					
					<div class="join_form_block">
						<div class="join_form_block_body" id="join_form_block_body_check"><input type="checkbox" id="checkbox_all"><label>모두 동의합니다.</label></div>
						<hr>
						<div class="join_form_block_body" id="join_form_block_body_check"><input type="checkbox" id="checkbox_1"><label>이용약관 필수 동의</label></div>
						<div class="join_form_block_body" id="join_form_block_body_check"><input type="checkbox" id="checkbox_2"><label>개인정보 처리방침 필수 동의</label></div>
						<div class="join_form_block_body" id="join_form_block_body_check"><input type="checkbox" id="checkbox_3"><label>쿠폰 / 이벤트 알림 선택 동의</label></div>
						<div class="join_form_block_body" id="join_form_block_body_check"><label class="etc">이메일을 통해 쿠폰 및 이벤트 정보를 받아보실 수 있습니다.</label></div>
						<hr>
					</div>
					<div class="join_form_block" id="block_button">
						<a href="http://localhost:9000/sistproject3/join_success.do"><button type="submit" class="join" id="btnJoin">회원가입하기</button></a>
						<label>단, 14세 미만은 회원가입할 수 없습니다.</label>
					</div>				
				</form>
			</div>
		</section>
	</div>
</body>
</html>