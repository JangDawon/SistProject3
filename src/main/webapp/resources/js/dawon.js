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
			var obj_name = $(this).attr("name");   //+, -구분
			var obj_id = $(this).attr("id");      //p1, p2, p3 아이디 구분
			var vname = "#" + obj_id + "_amt"      //p1_amt, p2_amt ...
			var p1_value = parseInt($("#p1_amt").val());   //$(p1_amt).val()
			var p2_value = parseInt($("#p2_amt").val());   //$(p2_amt).val()
			var p3_value = parseInt($("#p3_amt").val());   //$(p3_amt).val()
			
			//수량 변경 시 적립금, 가격 수정
			var p1_price = parseInt($("#p1_price").text());   //(기본가격+옵션가격)*수량
     		var p1_one_price = p1_price/p1_value;         //(기본가격+옵션가격)
			var p2_price = parseInt($("#p2_price").text()); //(기본가격+옵션가격)*수량
			var p2_one_price = p2_price/p2_value;         //(기본가격+옵션가격)
			var p3_price = parseInt($("#p3_price").text()); //(기본가격+옵션가격)*수량
			var p3_one_price = p3_price/p3_value;         //(기본가격+옵션가격)
			
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
		        
		        $(".sum").text("").append((p1_one_price*$("#p1_amt").val())+(p2_one_price*$("#p2_amt").val())+(p3_one_price*$("#p3_amt").val())+"원");
			 }else if(obj_name == "minus") {
		         //선택한 아이디의 값만 1일 때 경고창
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
				$(".sum").text("").append((p1_one_price*$("#p1_amt").val())+(p2_one_price*$("#p2_amt").val())+(p3_one_price*$("#p3_amt").val())+"원");
			}
			
			
		});
		
		
		$(".cart_prod_update").click(function(){
			confirm("수량을 변경하시겠습니까?");
		});
		
		
		$(".cart_prod_del").click(function(){
			confirm("정말 삭제하시겠습니까?");
		});
		
		
		
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
		