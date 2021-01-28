$(document).ready(function(){
		/**
		 * 회원가입 - 아이디 중복체크
		 */
		$("#idCheck").click(function(){
			if(!ruleCheck($("#id"))){
				return false;
			}else{
				$.ajax({
					url:"idCheck.do?id="+$("#id").val(), 
					success:function(result){
						if(result == 1){
							$("#idcheck_result").text("이미 중복된 아이디가 존재합니다. 다시 입력해주세요")
							.css("color","red");
							$("#id").focus();
							return false;
						}else{
							$(".idcheck").css("display","none");
							$("#idcheck_result").text("사용가능한 아이디 입니다.")
							.css("color","blue");
							$("#pass").focus();
							return true;
						}
					}
				});
			}			
		});
		
		/**
		*	로그인 폼 체크
		**/
		$("#btnLogin").click(function(){
			if(!ruleCheck($("#id"))){
				return false;
			}else if($("#pass").val() == ""){
				alert("패스워드를 입력해주세요");
				$("#pass").focus();
				return false;
			}else{
				loginForm.submit();
			}		
		});
		
		/**
		 * 회원가입 폼 체크
		 */
		$("#btnJoin").click(function(){
			if(!emailCheck()){			
				return false;
			}else if(!passCheck()){
				return false;
			}else if(!cpassCheck()){
				return false;
			}else if(!nameCheck()){
				return false;
			}else if(!hpCheck()){
				return false;
			}else if(!hpCertifyCheck()){
				return false;
			}else if(!checkboxCheck()){
				return false;
			}else {
				joinForm.submit();
			}
		});
		
		/**
		 * 인증요청
		 */
		$("#hp_certify").click(function(){		
			var hp = {hp:$("#hp").val() } 
			var regExp = /^[0-9]+$/;
			if($("#hp").val()=="") {
				alert("번호가 입력되지 않았습니다.");
				return false;
			}else {
				if(!regExp.test($("#hp").val())){
					alert("휴대폰 번호를 다시 확인해주세요");
					return false;
				}else {
					$("#join_form_block_body_hpcheck").show();	
					$.ajax({
						type : 'GET',
						url : 'join_certify.do',
						data : hp,
						success: function(res){ 
								alert("인증번호가 전송되었습니다.");
								$("#hidden_certify").val(res);
						}
					});
				}
			}
		});
		
		/**
		 * 인증번호 체크 - 회원가입
		 */
		$("#hp_certify_check").click(function(){
			if($("#hidden_certify").val() == $("#hp_check").val()) {
				alert("인증 성공!!");
				$("input[name=hp_check]").css("border", "1px solid black");
				$("#hpcheck_msg").text("인증이 완료되었습니다.").css("color", "black");
			}else {
				alert("인증에 실패했습니다. 다시 확인해주세요");
				$("#hp_check").focus();
				
			}
		});
		
		/**
		 * 인증번호 체크 - 아이디/비밀번호 찾기
		 */
		$("#hp_certify_check_ck").click(function(){
			if($("#hidden_certify").val() == $("#hp_check").val()) {
				alert("인증 성공!!");
				$("input[name=hp_check]").css("border", "1px solid black");
				$("#hpcheck_msg").text("인증이 완료되었습니다.").css("color", "black");
				checkForm.submit();
			}else {
				alert("인증에 실패했습니다. 다시 확인해주세요");
				$("#hp_check").focus();
			}
		});
		
		/**
		 * 체크박스 전체 선택/해제
		 */
		$("#checkbox_all").click(function(){
			$("#checkbox_1").prop("checked", this.checked);
			$("#checkbox_2").prop("checked", this.checked);
			$("#checkbox_3").prop("checked", this.checked);
		});
		
		/** 
		 *  이메일 체크
		 **/
		$("#email").focusout(function(){
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if($("#email").val() == ""){	
				$("#email_msg").text("이메일을 입력해주세요.").css("color","red");
				$("input[name=email]").css("border", "1px solid red");
				return false;
			}else {
				if(regExp.test($("#email").val())){
					$("#email_msg").text("");
					$("input[name=email]").css("border", "1px solid black");
					return true;
				}else {
					$("#email_msg").text("이메일 형식이 맞지 않습니다.").css("color","red");
					$("input[name=email]").css("border", "1px solid red");
					return false;
				}
			}
		}); 
		
		/**
		 * 비밀번호 체크
		 */
		$("#pass").focusout(function(){
			if($("#pass").val()=="") {
				$("#pass_msg").text("비밀번호를 입력해주세요.").css("color", "red");
				$("input[name=pass]").css("border", "1px solid red");
				return false;
			}else {
				var regExp = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}/;
				if(regExp.test($("#pass").val())) {
					$("#pass_msg").text("");
					$("input[name=pass]").css("border", "1px solid black");
					return true;
				}else {
					$("#pass_msg").text("소문자, 대문자, 숫자 포함 8자이상 15자 이하로 만드세요.").css("color", "red");
					$("input[name=pass]").css("border", "1px solid red");
					return false;
				}
			}
		});
		
		/** 
		 *  비밀번호 확인 체크
		 **/
		$("#cpass").focusout(function(){
			if($("#cpass").val() == ""){	
				$("#cpass_msg").text("비밀번호 확인을 입력해주세요.").css("color", "red");
				$("input[name=cpass]").css("border", "1px solid red");
				return false;
			}else {
				if($("#pass").val() == $("#cpass").val()){					
					$("#cpass_msg").text("");
					$("input[name=cpass]").css("border", "1px solid black");
					return true; 
				}else{
					$("#cpass_msg").text("패스워드가 다릅니다. 다시 입력해주세요").css("color","red");
					$("input[name=cpass]").css("border", "1px solid red");
					return false;		
				}	
			}
		}); 
		
		/** 
		 *  이름 체크
		 **/
		$("#name").focusout(function(){
			if($("#name").val() == ""){	
				$("#name_msg").text("이름을 입력해주세요").css("color", "red");
				$("input[name=name]").css("border", "1px solid red");
				return false;
			}else {
				var regExp = /^[가-힣]{2,6}$/;
				if(regExp.test($("#name").val())){					
					$("#name_msg").text("");
					$("input[name=name]").css("border", "1px solid black");
					return true; 
				}else{
					$("#name_msg").text("이름을 다시 확인해주세요").css("color","red");
					$("input[name=name]").css("border", "1px solid red");
					return false;		
				}	
			}
		}); 
		
		/** 
		 *  전화번호 체크
		 **/
		$("#hp").focusout(function(){
			if($("#hp").val() == ""){	
				$("#hp_msg").text("휴대폰 번호를 입력해주세요").css("color", "red");
				$("input[name=hp]").css("border", "1px solid red");
				return false;
			}else {
				var regExp = /^[0-9]+$/;
				if(regExp.test($("#hp").val())){					
					$("#hp_msg").text("");
					$("input[name=hp]").css("border", "1px solid black");
					return true; 
				}else{
					$("#hp_msg").text("휴대폰 번호를 다시 확인해주세요").css("color","red");
					$("input[name=hp]").css("border", "1px solid red");
					return false;		
				}	
			}
		}); 
		
		/** 
		 *  인증번호 체크
		 **/
		$("#hp_check").focusout(function(){
			if($("#hp_check").val() == ""){	
				$("#hpcheck_msg").text("인증번호를 입력해주세요").css("color", "red");
				$("input[name=hp_check]").css("border", "1px solid red");
				return false;
			}else if($("#hidden_certify").val() == $("#hp_check").val()){
				return true;
			}else {
				$("#hpcheck_msg").text("인증번호를 다시 확인해주세요").css("color", "red");
				$("input[name=hp_check]").css("border", "1px solid red");
				return false;
			}
		}); 
});

/**
*	이메일 체크
**/
function emailCheck(){
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if($("#email").val() == ""){	
		alert("이메일을 입력해주세요.");
		$("#email").focus();
		return false;
	}else {
		if(regExp.test($("#email").val())){
			return true;
		}else {
			alert("이메일 형식이 맞지 않습니다.");
			$("#email").focus();
			return false;
		}
	}
}

/**
*	비밀번호 체크
**/
function passCheck(){
	if($("#pass").val()=="") {
		alert("비밀번호를 입력해주세요.");
		$("#pass").focus();
		return false;
	}else {
		var regExp = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}/;
		if(regExp.test($("#pass").val())) {
			return true;
		}else {
			alert("비밀번호는 소문자, 대문자, 숫자 포함 8자이상 15자 이하로 만드세요.");
			$("#pass").focus();
			return false;
		}
	}
}

/**
*	비밀번호 확인 체크
**/
function cpassCheck(){
	if($("#cpass").val() == ""){	
		alert("비밀번호 확인을 입력해주세요.");
		$("#cpass").focus();
		return false;
	}else {
		if($("#pass").val() == $("#cpass").val()){					
			return true; 
		}else{
			alert("패스워드가 다릅니다. 다시 입력해주세요");
			$("#cpass").focus();
			return false;		
		}	
	}
}

/**
*	이름 체크
**/
function nameCheck(){
	if($("#name").val() == ""){	
		alert("이름을 입력해주세요");
		$("#name").focus();
		return false;
	}else {
		var regExp = /^[가-힣]{2,6}$/;
		if(regExp.test($("#name").val())){					
			return true; 
		}else{
			alert("이름을 다시 확인해주세요");
			$("#name").focus();
			return false;		
		}	
	}
}

/**
*	전화번호 체크
**/
function hpCheck(){
	if($("#hp").val() == ""){	
		alert("휴대폰 번호를 입력해주세요");
		$("#hp").focus();
		return false;
	}else {
		var regExp = /^[0-9]+$/;
		if(regExp.test($("#hp").val())){					
			return true; 
		}else{
			alert("휴대폰 번호를 다시 확인해주세요");
			$("hp").focus();
			return false;		
		}	
	}
}

/**
*	인증번호 체크
**/
function hpCertifyCheck(){
	if($("#hp_check").val() == ""){	
		alert("인증번호를 입력해주세요");
		$("#hp_check").focus();
		return false;
	}else if($("#hidden_certify").val() == $("#hp_check").val()){
		return true;
	}else {
		alert("인증번호를 다시 확인해주세요.");
		$("#hp_check").focus();
	}
}

/**
*	체크박스 체크
**/
function checkboxCheck(){
	if($("#checkbox_1").is(":checked") == false){	
		alert("필수항목을 체크해주세요1");
		$("#checkbox_1").focus();
		return false;
	}else if($("#checkbox_2").is(":checked") == false){
		alert("필수항목을 체크해주세요2");
		$("#checkbox_2").focus();
		return false;
	}else {
		return true;
	}
}


