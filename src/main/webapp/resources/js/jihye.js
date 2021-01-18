$(document).ready(function(){
	$("#cs_write_btn").click(function(){
		if($("#btitle").val() == ""){
			alert("제목을 입력해주세요:) ");
			return false;
		}
	});
});
