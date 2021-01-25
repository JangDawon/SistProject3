$(document).ready(function(){
		
		/**
		 * 회원가입 - 아이디 중복체크
		 */
		$("#idCheck").click(function(){
			if(!ruleCheck($("#id"))){
				return false;
			}else{
				//ajax를 활용한 서버 연동
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
				//서버 전송:폼이름.submit();
				loginForm.submit();
			}		
		});
		
		
		/**
		 * 회원가입 폼 체크
		 */
		$("#btnJoin").click(function(){
			if(!ruleCheck($("#email"))){			
				return false;
			}else if($("#pass").val() == ""){
				alert("패스워드를 입력해주세요");
				$("#pass").focus();
				return false;
			}else if($("#cpass").val() == ""){
				alert("패스워드 확인을 입력해주세요");
				$("#cpass").focus();
				return false;
			}else if($("#name").val() == ""){
				alert("성명을 입력해주세요");
				$("#name").focus();
				return false;
			}else if($("#hp").val() == "선택"){
				alert("전화번호를 선택해주세요");
				$("#hp").focus();
				return false;
			}else {
				//서버전송
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
					alert("인증번호가 전송되었습니다.") 
					$("#join_form_block_body_hpcheck").show();
					
					$.ajax({
						type : 'GET',
						url : 'join_certify.do',
						data : hp,
						success: function(res){
							$("#hp_certify").click(function(){
								if($("#hp_certify_check").val()==$.trim(res)) {
									System.out.println("12");
								}
							});
						}
					});
				}
			}
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
		}); //email focusout
		
		/**
		 * 비밀번호 체크
		 */
		$("#pass").focusout(function(){
			if($("#pass").val()=="") {
				$("#pass_msg").text("비밀번호를 입력해주세요.").css("color", "red");
				$("input[name=pass]").css("border", "1px solid red");
				return false;
				//패스워드를 입력해주세여
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
		}); //focusout
		
		/** 
		 *  인증번호 체크
		 **/
		$("#hp_check").focusout(function(){
			if($("#hp_check").val() == ""){	
				$("#hpcheck_msg").text("인증번호를 입력해주세요").css("color", "red");
				$("input[name=hp_check]").css("border", "1px solid red");
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
		}); //focusout
		
});

/**
*	이메일 정규식 체크
**/
function ruleCheck(obj){
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(obj.val() == ""){
		alert("이메일을 입력해주세요");
		obj.focus();
		return false;
	}else{
		if(regExp.test(obj.val())){
			return true;	//이메일 형식에 맞는 경우
		}else{
			alert("이메일 형식으로 입력해 주세요");
			obj.focus();
			return false;
		}
	}	

}//ruleCheck

function certifyCheck() {
	
}
