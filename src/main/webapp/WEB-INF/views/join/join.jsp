<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/login.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/join.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class = login_content>
		<section class = login_section1 id=join_section1>
			<div>
				<a href="#"><img class="login_logo" src="http://localhost:9000/sistproject3/images/login_images/login_logo.png"></a>
			</div>
		</section>
			
		<section class = join_section>
			<div>
				<form name="joinForm" action="#" method="post" class="join">
				<ul>
					<li><hr>&nbsp;&nbsp;정말 간단한 회원가입하기 &nbsp;&nbsp;<hr></li>
					<li><div>1</div><hr><div>2</div></li>
					<li><label>가입 정보 입력하기</label></li>
				</ul>
				<div class="join_form_block">
					<label class="join_form_block_head"><em class="asterisk red">*</em>이메일</label>
					<div class="join_form_block_body"><input type="text" placeholder="이메일을 입력해주세요."></div>
				</div>
				<div class="join_form_block">
					<label class="join_form_block_head"><em class="asterisk red">*</em>비밀번호</label>
					<div class="join_form_block_body"><input type="password" placeholder="비밀번호 (영문+숫자+특수문자 8자 이상)"></div>
					<div class="join_form_block_body"><input type="password" placeholder="비밀번호 확인"></div>
				</div>
				<div class="join_form_block">
					<label class="join_form_block_head"><em class="asterisk red">*</em>이름</label>
					<div class="join_form_block_body"><input type="text" placeholder="이름을 입력해주세요."></div>
				</div>
				<div class="join_form_block">
					<label class="join_form_block_head"><em class="asterisk red">*</em>전화번호</label>
					<div class="join_form_block_body"><input type="text" placeholder="010-1234-5678"></div>
				</div>
				<div class="join_form_block">
					<div class="join_form_block_body"><input type="checkbox"><label>모두 동의합니다.</label></div>
					<hr>
					<div class="join_form_block_body"><input type="checkbox"><label>이용약관 필수 동의</label></div>
					<div class="join_form_block_body"><input type="checkbox"><label>개인정보 처리방침 필수 동의</label></div>
					<div class="join_form_block_body"><input type="checkbox"><label>쿠폰 / 이벤트 알림 선택 동의</label></div>
										<div class="join_form_block_body"><label>SMS, 이메일을 통해 쿠폰 및 이벤트 정보를 받아보실 수 있습니다.</label></div>
					<hr>
				</div>
				
				</form>
			</div>
		</section>
	</div>
</body>
</html>