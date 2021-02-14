$(document).ready(function(){
	$("#order_title_info").click(function(){
		
		if($("#order_hidden").css("display")=="none"){
			$("#order_hidden").show();
			$("#icon").attr("data-icon", "caret-up");
		}else{
			$("#order_hidden").hide();
			$("#icon").attr("data-icon", "caret-down");
		}
	});
});