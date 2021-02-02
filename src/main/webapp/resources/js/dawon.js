	$(document).ready(function(){
		$("#cart_order").click(function(){
			var del_list = "";
			
			$(".cart_prod_chk:checked").each(function(index){
				del_list += $(this).attr("value") + ", ";
			});
			
			if(del_list == ""){
				alert("선택된 상품이 없습니다.");
			}else{
				confirm(del_list + "선택된 상품을 주문합니다.");
			}
		});
		
		
		$("#cart_select_del").click(function(){
			var choice = confirm("정말로 삭제하시겠습니까?");
			if(choice) {
				var chk_list = new Array();
				$("input[type=checkbox]:checked").each(function(i){
					chk_list[i] = $(this).attr("id");
				});
				
				//삭제할 페이지로 전송
				$(location).attr("href", "http://localhost:9000/sistproject3/cart/cart_list_del.do?chklist="+chk_list);
			}
		});
		
		
		$("#cart_all_chk").click(function(){
			if($("#cart_all_chk").is(":checked")){
				$(".cart_prod_chk").prop("checked", true);
			}else{
				$(".cart_prod_chk").prop("checked", false);
			}
		});
		
		
		$("button").click(function(){
			var obj_name = $(this).attr("name");
			var obj_id = $(this).attr("id");
			var vname = "#" + obj_id + "_amt"
			var obj_value = parseInt($(vname).val());
			
			//수량 변경 시 적립금, 가격 수정
			var price = parseInt($("." + obj_id + "_price").text());
			var one_price = price/obj_value;
			
			if(obj_name == "plus") {
				$(vname).val(obj_value+1);
				$("."+obj_id+"_price").text(price + one_price);
			}else if(obj_name == "minus") {
				if(obj_value == 1) {
					alert("최소 주문 수량은 1개입니다.");
				}else {
					$(vname).val(obj_value-1);
					$("."+obj_id+"_price").text(price - one_price);
				}
			}
		});
		
		
		$(".cart_prod_update").click(function(){
			confirm("수량을 변경하시겠습니까?");
		});
		
		
		$(".cart_prod_del").click(function(){
			confirm("정말 삭제하시겠습니까?");
		});
		
		
		$("#product_option").change(function(){
			if($(this).val() != "선택"){
				$(".tab_style").css("display","block");
				$(".whole_price").css("display","none");
				$("#whole_price").css("display","block");
			}
		});
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
		