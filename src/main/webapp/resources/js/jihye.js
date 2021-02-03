$(document).ready(function(){
	
	$("#cs_write_btn").click(function(){
		if($("#btitle").val() == ""){
			alert("제목을 입력해주세요:) ");
			$("#btitle").focus();
			return false;
		}else if($("#bcontent").val() == ""){
			alert("내용을 입력해주세요:) ");
			$("#bcontent").focus();
			return false;
		}else if($("#bsecret").is(":checked")){
			if($("#bpass").val() == ""){
				alert("비밀번호를 입력해주세요 :)");
				$("#bpass").focus();
				return false;
			}
		}
	});
	
	$("#cs_update_btn").click(function(){
		if($("#btitle").val() == ""){
			alert("제목을 입력해주세요:) ");
			$("#btitle").focus();
			return false;
		}else if($("#bcontent").val() == ""){
			alert("내용을 입력해주세요:) ");
			$("#bcontent").focus();
			return false;
		}else if($("#bsecret").is(":checked")){
			if($("#bpass").val() == ""){
				alert("비밀번호를 입력해주세요 :)");
				$("#bpass").focus();
				return false;
			}
		}
	});
	
	
	$("#product_update_btn").click(function(){
			if($("#pcat").val() == "선택"){
				alert("카테고리를 선택해주세요");
				$("#pcat").focus();
				return false;
			}else if($("#sname").val() == ""){
				alert("작가명을 입력해주세요");
				$("#sname").focus();
				return false;
			}else if($("#sid").val() == ""){
				alert("아이디를 입력해주세요");
				$("#sid").focus();
				return false;
			}else if($("#ptitle").val() == ""){
				alert("제목을 입력해주세요");
				$("#ptitle").focus();
				return false;
			}else if($("#pcontent").val() == ""){
				alert("내용을 입력해주세요");
				$("#pcontent").focus();
				return false;
			}else if($("#pprice").val() == ""){
				alert("상품가격을 입력해주세요");
				$("#pprice").focus();
				return false;
			}else if($("#pdelivery").val() == ""){
				alert("배송비 기준을 입력해주세요");
				$("#pdelivery").focus();
				return false;
			}else if($("#opt1").val() == ""){
				alert("옵션명을 입력해주세요");
				$("#opt1").focus();
				return false;
			}else if($("#opt1_price").val() == ""){
				alert("옵션 가격을 입력해주세요");
				$("#opt1_price").focus();
				return false;
			}else if($("label[for='file1']").attr("id") == ""){
				alert("이미지를 선택해주세요");
				$("#file1").focus();
				return false;
			}else{
				alert("성공적으로 수정되었습니다:)");
				product_update_form.submit();
			}
		});
		
	$("#product_regist_btn").click(function(){
		if($("#pcat").val() == "선택"){
			alert("카테고리를 선택해주세요");
			$("#pcat").focus();
			return false;
		}else if($("#sname").val() == ""){
			alert("작가명을 입력해주세요");
			$("#sname").focus();
			return false;
		}else if($("#sid").val() == ""){
			alert("아이디를 입력해주세요");
			$("#sid").focus();
			return false;
		}else if($("#ptitle").val() == ""){
			alert("제목을 입력해주세요");
			$("#ptitle").focus();
			return false;
		}else if($("#pcontent").val() == ""){
			alert("내용을 입력해주세요");
			$("#pcontent").focus();
			return false;
		}else if($("#pprice").val() == ""){
			alert("상품가격을 입력해주세요");
			$("#pprice").focus();
			return false;
		}else if($("#pdelivery").val() == ""){
			alert("배송비 기준을 입력해주세요");
			$("#pdelivery").focus();
			return false;
		}else if($("#opt1").val() == ""){
			alert("옵션명을 입력해주세요");
			$("#opt1").focus();
			return false;
		}else if($("#opt1_price").val() == ""){
			alert("옵션 가격을 입력해주세요");
			$("#opt1_price").focus();
			return false;
		}else if($("#file1").val() == ""){
			alert("이미지를 선택해주세요");
			$("#file1").focus();
			return false;
		}else{
			alert("성공적으로 등록되었습니다:)");
			product_regist_form.submit();
		}
	});
	
	$("#product_all_delete_chk").click(function(){
		if($("#product_all_delete_chk").is(":checked")){
			$(".product_chk").prop("checked", true);
		}else{
			$(".product_chk").prop("checked", false);
		}
		
	});
	
	$("#product_all_delete").click(function(){
		
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result){
			$(location).attr('href', "product_mng_list_del.do?del_list=all");
		}
		
		
		
	});
	
	$("#product_select_delete").click(function(){
		var del_list = "";
		
		$("input[class='product_chk']:checked").each(function(index){
			del_list += $(this).attr("value") + ", ";
		});
		
		if(del_list == ""){
			alert("선택된 상품이 없습니다");
		}else{
			var result = confirm("정말 삭제하시겠습니까?");
			if(result){
				$(location).attr("href", "http://localhost:9000/sistproject3/product_mng_list_del.do?del_list="+del_list);	
			}
		}
	});
	
	$("#review_all_delete_chk").click(function(){
		if($("#review_all_delete_chk").is(":checked")){
			$(".review_chk").prop("checked", true);
		}else{
			$(".review_chk").prop("checked", false);
		}
		
	});
	
	$("#review_all_delete").click(function(){
		var del_list = "";
		
		$("input[class='review_chk']").each(function(index){
			del_list += $(this).attr("value") + ", ";
		});
		
		confirm(del_list + "정말 삭제하시겠습니까?");
		
	});
	
	$("#review_select_delete").click(function(){
		var del_list = "";
		
		$("input[class='review_chk']:checked").each(function(index){
			del_list += $(this).attr("value") + ", ";
		});
		
		if(del_list == ""){
			alert("선택된 리뷰가 없습니다");
		}else{
			confirm(del_list + "정말 삭제하시겠습니까?");
		}
	});
	
	$("#user_all_delete_chk").click(function(){
		if($("#user_all_delete_chk").is(":checked")){
			$(".user_chk").prop("checked", true);
		}else{
			$(".user_chk").prop("checked", false);
		}
		
	});
	
	$("#user_all_delete").click(function(){
		var result = confirm("정말 삭제하시겠습니까?");
		
		if(result){
			$(location).attr('href', "user_mng_list_del.do?user_list=all");
		}
		
	});
	
	$("#user_select_delete").click(function(){
		var user_list = "";
		
		$("input[class='user_chk']:checked").each(function(index){
			user_list += $(this).attr("value") + ", ";
		});
		
		if(user_list == ""){
			alert("선택된 회원이 없습니다");
		}else{
			var result = confirm(user_list + "를 정말 삭제하시겠습니까?");
			if(result){
				$(location).attr("href", "user_mng_list_del.do?user_list="+user_list);
			}
		}
	});
	
	
	
	
});
