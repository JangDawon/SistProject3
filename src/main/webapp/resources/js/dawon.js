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
	        var btnId = "#" + obj_id;
	        var vname = "#" + obj_id + "_amt"; //#c_51p1_amt == vname
	        var vprice = "#" + obj_id + "_price";
	        var p1_value = parseInt($("#p1_amt").val());
	        var p2_value = parseInt($("#p2_amt").val());
	        var p3_value = parseInt($("#p3_amt").val());

			
			//수량 변경 시 적립금, 가격 수정
			var p1_price = parseInt($("#p1_price").text());
     		var p1_one_price = p1_price/p1_value;
			var p2_price = parseInt($("#p2_price").text());
			var p2_one_price = p2_price/p2_value;
			var p3_price = parseInt($("#p3_price").text());
			var p3_one_price = p3_price/p3_value;
			
			if(obj_name == "plus") {
				var count = parseInt($(vname).val())+1;
		        $(vname).val(count);
		         
		        if(obj_id == "p1"){
		        	$("#"+ obj_id +"_price").text("").append(p1_price + p1_one_price);
		        }else if(obj_id == "p2"){
		        	$("#"+ obj_id +"_price").text("").append(p2_price + p2_one_price);
		        }else if(obj_id == "p3"){
		            $("#"+ obj_id +"_price").text("").append(p3_price + p3_one_price);
		        }
			 }else if(obj_name == "minus") {
		        if($(vname).val() == 1) {
					alert("최소 주문 수량은 1개입니다.");
		        }else {
		            var count = parseInt($(vname).val())-1;
		            $(vname).val(count);
		            
		            if(obj_id == "p1"){
		               $("#"+ obj_id +"_price").text("").append(p1_price - p1_one_price);
		            }else if(obj_id == "p2"){
		               $("#"+ obj_id +"_price").text("").append(p2_price - p2_one_price);
		            }else if(obj_id == "p3"){
		               $("#"+ obj_id +"_price").text("").append(p3_price - p3_one_price);
		            }
				}
			}
		});
		
	
		
	});
	
	
	
	
	
	
	
	
	
	
	
		