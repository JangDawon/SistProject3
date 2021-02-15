<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 마이페이지</title>
<link rel="stylesheet"
	href="http://localhost:9000/sistproject3/css/woohyun.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<style>



</style>
<script>
	$(document).ready(function() {

		var rfileName = "";
		

	 	$("input[type=file]#file1").on('change', function() {
			if (window.FileReader) {
				rfileName = $(this)[0].files[0].name;
			}
		});
		$("#writeBtn").click(function() {
			if ($("#rscore").val() == "선택") {
				alert("별점을 선택해주세요.");
				$("#rscore").focus();
				return false;
			} else if ($("#rcontent").val() == "") {
				alert("후기를 작성해주세요.");
				$("#rcontent").focus();
				return false;
			} else if (rfileName == "") {
				alert("리뷰사진을 입력해주세요,");
				$("#file1").focus();
				return false;
			}else{
				var data = $("#reviewform")[0];
				var form = new FormData(data);
 				$.ajax({
				       type: "POST",
				       url: "/sistproject3/review_write_proc.do",
				       enctype: 'multipart/form-data',
				       processData: false,
				       contentType: false,
				       data: form,      
				         success: function (data) {
				          var result = data
				        	 //window.close();
				            window.opener.location.href="http://localhost:9000/sistproject3/my_order.do?result="+result;
				            self.close();
				        }
				}); 
			}
		});
	});
</script>

</head>
<body>
	<div class="review_content">
		<div class = "page_title">리뷰를 남겨주세요</div> 
		<form name="review_write_form" action="review_write_proc.do" method="post" enctype="multipart/form-data" id="reviewform">
			<input type = "hidden" name = "pid" value ="${vo.pid }">
			<input type = "hidden" name = "oid" value ="${oid }">
			<input type="hidden" name="uemail" value="${sessionScope.svo.uemail}">
			
			<table class="review_write" >
				<tr>
					<td width =145 class = "img_td"><img class = "p_img" src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }"></td>
					<td class = "title_td"><b>${vo.ptitle }</b></td>
				</tr>
				
				<tr>
					<td class = "choice_td">별점을 선택해주세요</td>
					<td class = "star_td">
						<select name="rscore" class="rscore" id="rscore">
							<option value="선택">선택</option>
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
						</select>
					</td>
				</tr>

				<tr>
					<td class = "content_td"colspan=2>어떤점이 좋았나요?</td>
				</tr>
				
				<tr>
					<td colspan=2><textarea id="rcontent"name="rcontent" cols=55 rows=10></textarea></td>
				</tr>
				
				<tr>
					<td colspan=2><input type="file" id="file1" name="file1"></td>
				</tr>
				
				<tr>
					<td  class ="button_td"colspan=2><button type="button" class="writeBtn" id="writeBtn">등록</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>