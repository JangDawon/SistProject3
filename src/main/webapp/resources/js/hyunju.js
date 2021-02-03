$(document).ready(function(){
	let cnt = 1;
	let total = 0;
	
	$("#product_option").change(function(){
			if($(this).val() != "선택"){
				$(".tab_style").css("display","block");
			}
	});
		
	$(".downBtn").click(function(){
			if($(".#p1_amt").val() == 1) {
				alert("최소 주문수량은 1개 이상입니다.");
				return;
			} else {
				$(".#p1_amt").val() = $(".#p1_amt").val() - 1;
				$(".#p1_amt").text(cnt);
				//$("#itemNm").val($(this).val());
				total = price * cnt;
				$("#opPrice").text(comma(total+" 원"));
				$("#total_price span").text(comma(total+" 원"));
			}
	});
		
	$(".upBtn").click(function(){
		cnt = cnt + 1;
		$(".cnt").text(cnt);
			total = price * cnt;
		$("#opPrice").text(comma(total+" 원"));
		$("#total_price span").text(comma(total+" 원"));
	});
		
	$("#opDelete").click(function(){
		$(".add_content").css("display","none");	
			triggerChange();
			cnt = 1;
		$(".cnt").text(cnt);
			total = price * cnt;
		$("#opPrice").text(comma(total+" 원"));
		$("#total_price span").text("0원");
	});
		
	$("#payBtn").click(function(){
		if($("#product_option option:selected").val() == "선택"){	
			alert("주문 옵션을 선택해주세요.");
			return;
		} else {
				alert("주문 페이지로 이동합니다.");		
		}
	});
	
	
});
function triggerChange(){
	    $("#product_colors").val('선택').trigger('change');
	}
	
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }