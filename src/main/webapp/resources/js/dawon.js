$(document).ready(function(){
      sum_price();
      
      function sum_price(){
         var p1_price = $("#p1_price").text();
         var p2_price = $("#p2_price").text();
         var p3_price = $("#p3_price").text();
         var sum = 0;
         
         if(p1_price != ""){
            var total = parseInt($("#p1_price").text());
            sum += total;
            $(".sum").text("").append(sum+"원");
         }else if(p2_price != ""){
            var total = parseInt($("#p2_price").text());
            sum += total;
            $(".sum").text("").append(sum+"원");
         }else if(p3_price != ""){
            var total = parseInt($("#p3_price").text());
            sum += total;
            $(".sum").text("").append(sum+"원");
         }
      }
      
      $("#cart_order").click(function(){
         var order_list = "";
         
         $(".cart_prod_chk:checked").each(function(index){
            order_list += $(this).attr("id") + ", ";
         });
         
         if(order_list == ""){
            alert("선택된 상품이 없습니다.");
         }else{
            confirm(order_list + "선택된 상품을 주문합니다.");
            
            $(location).attr("href", "http://localhost:9000/sistproject3/cart_order.do?uemail=${sessionScope.svo.uemail}&order_list="+order_list);
         }
      });
      
      /* $(".cart_prod_del").click(function(){
         var chk = confirm("옵션을 삭제하시겠습니까?");
         if(chk){
            var del_chk = $(this).attr("id"); //cid값
         }
         $(location).attr("href", "http://localhost:9000/sistproject3/cart/opt_del?")
         
      }); */
      
      $("#cart_select_del").click(function(){
         var choice = confirm("정말로 삭제하시겠습니까?");
         if(choice) {
            var chk_list = new Array();
            $("input[type=checkbox]:checked").each(function(i){
               chk_list[i] = $(this).attr("id");
            });
            
            //삭제할 페이지로 전송
            $(location).attr("href", "http://localhost:9000/sistproject3/cart_list_del.do?chklist="+chk_list);
         }
      });
      
      
      $("#cart_all_chk").click(function(){
         if($("#cart_all_chk").is(":checked")){
            $(".cart_prod_chk").prop("checked", true);
         }else{
            $(".cart_prod_chk").prop("checked", false);
         }
      });
      
      
      $(".cart_prod_chk").click(function(){
         if($(".cart_prod_chk").is(":checked")){
            alert("111");
         }else{
            alert("222");
         }
      });
      
       
       
      $("button").click(function(){
         var obj_name = $(this).attr("name");
         var obj_id = $(this).attr("id");
         var vname = "#" + obj_id + "_amt";
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
                 var total = parseInt($(".sum").text());
                 total += p1_one_price;
                 $(".sum").text("").append(total+"원");
              }else if(obj_id == "p2"){
                 $("#"+ obj_id +"_price").text("").append(p2_price + p2_one_price);
                 var total = parseInt($(".sum").text());
               total += p2_one_price;
               $(".sum").text("").append(total+"원");
              }else if(obj_id == "p3"){
                  $("#"+ obj_id +"_price").text("").append(p3_price + p3_one_price);
                  var total = parseInt($(".sum").text());
               total += p3_one_price;
               $(".sum").text("").append(total+"원");
              }
              
          }else if(obj_name == "minus") {
              if($(vname).val() == 1) {
               alert("최소 주문 수량은 1개입니다.");
              }else {
                  var count = parseInt($(vname).val())-1;
                  $(vname).val(count);
                  
                  if(obj_id == "p1"){
                  $("#"+ obj_id +"_price").text("").append(p1_price - p1_one_price);
                  var total = parseInt($(".sum").text());
                  total = total-p1_one_price;
                  $(".sum").text("").append(total+"원");
               }else if(obj_id == "p2"){
                  $("#"+ obj_id +"_price").text("").append(p2_price - p2_one_price);
                  var total = parseInt($(".sum").text());
                  total -= p2_one_price;
                  $(".sum").text("").append(total+"원");
               }else if(obj_id == "p3"){
                  $("#"+ obj_id +"_price").text("").append(p3_price - p3_one_price);
                  var total = parseInt($(".sum").text());
                  total -= p3_one_price;
                  $(".sum").text("").append(total+"원");
               }
            }
         }
      });
   });