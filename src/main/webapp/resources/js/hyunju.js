$(document).ready(function(){
	$("#product_option").change(function(){
			if($(this).val() != "선택"){
				$(".tab_style").css("display","block");
			}
	});
	
	$("#product_option").change(function(){		
			var price = "<%= vo.getPprice()%>";	
			var opt1_price = "${vo.opt1_price }";
			var opt2_price = "${vo.opt2_price }";
			var opt3_price = "${vo.opt3_price }";
			let opt1_total = 0;
			let opt2_total = 0;
			let opt3_total = 0;
			
			
			if($("#product_option option:selected").val() != "선택"){				
				$(".tab_style").css("display","block");
				if("#product_option option:selected").val() == "opt1"){
						opt1_total = price * opt1_price;
						$(".sum_title").text(opt1_total+"원"); 
				}else if("#product_option option:selected").val() == "opt2"){
						opt2_total = price * opt2_price;
						$(".sum_title").text(opt2_total+"원"); 
				}else if("#product_option option:selected").val() == "opt3"){
						opt3_total = price * opt3_price;
						$(".sum_title").text(opt3_total+"원"); 
				}
					
			} else {
				$(".sum_title").text("0원"); 
			}
			
		});
	
		
	$(".minus").click(function(){
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
		
	$(".plus").click(function(){
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
    
    
    
    
    
					
					/* if("#product_option option:selected").val() == "opt1"){
							$(".tab_style").css("display","block");
							//opt1_total = price + opt1_price;
							$(".sum").text(price+"원"); 
					}else if("#product_option option:selected").val() == "opt2"){
							//opt2_total = price + opt2_price;
							$(".sum").text(opt2_total+"원"); 
					}else if("#product_option option:selected").val() == "opt3"){
							//opt3_total = price + opt3_price;
							$(".sum").text(opt3_total+"원"); 
					} else {
						$(".sum").text("0원"); 
					} */
					
					
					/* if($("#product_option option:selected").val() != "선택"){				
						$(".tab_style").css("display","block");
						if("#product_option option:selected").val() == "opt1"){
							//opt1_total = price + opt1_price;
							$(".sum").text(opt1_total+"원"); 
						}else if("#product_option option:selected").val() == "opt2"){
							//opt2_total = price + opt2_price;
							$(".sum").text(opt2_total+"원"); 
						}else if("#product_option option:selected").val() == "opt3"){
							//opt3_total = price + opt3_price;
							$(".sum").text(opt3_total+"원"); 
						}
					} else {
						$(".sum").text("0원"); 
					} */
					
				