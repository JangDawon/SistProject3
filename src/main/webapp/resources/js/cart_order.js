$(document).ready(function(){
	$("#order_title_info").click(function(){
		
		if($(".order_content_body_hidden").css("display")=="none"){
			$(".order_content_body_hidden").show();
			$("#icon").attr("data-icon", "caret-up");
		}else{
			$(".order_content_body_hidden").hide();
			$("#icon").attr("data-icon", "caret-down");
		}
	});
	
});