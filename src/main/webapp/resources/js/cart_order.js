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
	$("#btnOrder").click(function(){
		OrderForm.submit();
	});
	$("#rname").focusout(function(){
		var rname = $("#rname").val();
		$("#rname1").val(rname);
	});
	$("#raddr").focusout(function(){
		var raddr = $("#raddr").val();
		$("#raddr1").val(raddr);
	});
	$("#rcp").focusout(function(){
		var rcp = $("#rcp").val();
		$("#rcp1").val(rcp);
	});
});